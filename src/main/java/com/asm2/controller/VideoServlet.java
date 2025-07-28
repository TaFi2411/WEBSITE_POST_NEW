package com.asm2.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asm2.dao.UserDAO;
import com.asm2.dao.VideoDAO;
import com.asm2.entity.Video;

@WebServlet({"/videos/list","/videos/chi-tiet"})
public class VideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public VideoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uriString = request.getRequestURI();
		request.getSession().setAttribute("uriString", uriString);

		String id = request.getParameter("id");
		
		if (uriString.contains("videos/chi-tiet")) {
			if (id != null) {
	            VideoDAO dao = new VideoDAO();
	            Video video = dao.findById(Integer.parseInt(id));
	            
	            video.setViews(video.getViews() + 1);
	            VideoDAO.update(video);
	            
	            if (video != null) {
	                String originalUrl = video.getUrlVideo();
	                String videoUrl = convertToEmbedUrl(originalUrl); 

	                video.setUrlVideo(videoUrl);
	                request.setAttribute("video", video);
	            }
	        }
			
			List<Video> list = VideoDAO.findAll();
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("/views/client/chitiet.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
	private String convertToEmbedUrl(String url) {
	    if (url == null || url.isEmpty()) {
	        return "";
	    }

	    if (url.contains("watch?v=")) {
	        
	        String videoId = url.substring(url.indexOf("watch?v=") + 8);
	        return "https://www.youtube.com/embed/" + videoId;
	    } else if (url.contains("youtu.be/")) {
	       
	        String videoId = url.substring(url.indexOf("youtu.be/") + 9);
	        return "https://www.youtube.com/embed/" + videoId;
	    } else if (url.contains("embed/")) {
	       
	        return url;
	    } else {
	        
	        return "";
	    }
	}
}
