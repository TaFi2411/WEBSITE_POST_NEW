package com.asm2.controller.admin;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.asm2.dao.LikeDAO;
import com.asm2.dao.VideoDAO;
import com.asm2.entity.Like;
import com.asm2.entity.User;
import com.asm2.entity.Video;




/**
 * Servlet implementation class VideoManagementServlet
 */

@MultipartConfig()
@WebServlet({"/admin/video/list", "/admin/video/add","/admin/video/insert", "/admin/video/edit","/admin/video/update", "/admin/video/delete","/admin/video/reset"})
public class NewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String uriString = request.getRequestURI();
		if (uriString.contains("add")) {
			request.getRequestDispatcher("/views/admin/video/add.jsp").forward(request, response);
		}else if (uriString.contains("edit")) {
			String id = request.getParameter("id");
			Video video = VideoDAO.findById(Integer.parseInt(id));
			request.setAttribute("video", video);
			request.getRequestDispatcher("/views/admin/video/edit.jsp").forward(request, response);
			
		}else if (uriString.contains("delete")) {
			
			String id = request.getParameter("id");
			VideoDAO.delete(Integer.parseInt(id));
			request.getSession().setAttribute("xoathanhcong", "Xóa thành công");
			response.sendRedirect(request.getContextPath() + "/admin/video/list");
					
		}else if (uriString.contains("reset")) {
			request.getRequestDispatcher("/views/admin/video/add.jsp").forward(request, response);
					
		
	    }else {
			List<Video> list = VideoDAO.findAll();
			
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("/views/admin/video/list.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uriString = request.getRequestURI();
		if (uriString.contains("insert")) {
			//insert
			int rs = 0;
			boolean hasError = false; 
			try {
				String title = request.getParameter("title");
				String urlVideo = request.getParameter("urlVideo");
				Part part = request.getPart("poster");
				String fileName = part.getSubmittedFileName();
				if (part == null || part.getSize() == 0) {
					request.setAttribute("erImage", "Ảnh không được bỏ trống.");
				    hasError = true;
				}else {
				
				String path = "images/" + fileName;
				String realPath = request.getServletContext().getRealPath(path);
				if(!Files.exists(Path.of(realPath))) {
					Files.createDirectories(Path.of(realPath));
				}
				part.write(realPath);
				}
				String description = request.getParameter("description");
				String active = request.getParameter("active");
				
				
				
				
				
				if (title.trim().isEmpty()) {
			        request.setAttribute("erTitle", "Tiêu đề không được bỏ trống.");
			        hasError = true;
			    }
				
				if (description.trim().isEmpty()) {
			        request.setAttribute("erDcrt", "Mô tả không được bỏ trống.");
			        hasError = true;
			    }
				
				if (hasError) {
				    Video video = new Video();
				    video.setTitle(title);
				    video.setUrlVideo(urlVideo);
				    video.setDescription(description);
				    video.setPoster(fileName); 
				    video.setActive(Boolean.valueOf(active));
				    
				    request.setAttribute("video", video);
				    request.getRequestDispatcher("/views/admin/video/add.jsp").forward(request, response);
				    return;
				}

				
				Video video = new Video();
				video.setTitle(title);
				video.setUrlVideo(urlVideo);
				video.setDescription(description);
				video.setPoster(fileName);
				video.setActive(Boolean.valueOf(active));
 
				rs = VideoDAO.insert(video);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if (rs > 0) {
				response.sendRedirect(request.getContextPath() + "/admin/video/list");
			}else {
				request.setAttribute("eradd", "Thêm video thất bại");
				request.getRequestDispatcher("/views/admin/video/add.jsp").forward(request, response);
			}
		}else {
		
			int rs = 0;
			String id = request.getParameter("id");
			try {
				String title = request.getParameter("title");
				String urlVideo = request.getParameter("urlVideo");
				String description = request.getParameter("description");
				String active = request.getParameter("active");
				Part part = request.getPart("poster");
				String fileName = "";
				if (!part.getSubmittedFileName().isEmpty()) {
					fileName = part.getSubmittedFileName();
					String path = "images/" + fileName;
					String realPath = request.getServletContext().getRealPath(path);
					if(!Files.exists(Path.of(realPath))) {
						Files.createDirectories(Path.of(realPath));
					}
					part.write(realPath);
				}
				//B2:
				Video video = VideoDAO.findById(Integer.parseInt(id));
				video.setTitle(title);
				video.setUrlVideo(urlVideo);
				video.setDescription(description);
				video.setActive(Boolean.valueOf(active));
				if (!fileName.isEmpty()) {
					video.setPoster(fileName);
				}
				//B3:
				rs = VideoDAO.update(video);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			//B4
			if (rs > 0) {
				request.getSession().setAttribute("capnhatthanhcong", "Cập nhật tin tức thành công thành công");
				response.sendRedirect(request.getContextPath() + "/admin/video/list");
			}else {
				response.sendRedirect(request.getContextPath() + "/admin/video/edit?id=" + id);
			}
			
		}
	}
	}
