package com.asm2.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asm2.dao.VideoDAO;
import com.asm2.entity.Video;



/**
 * Servlet implementation class HomeServlet
 */
@WebServlet({"/trang-chu","/gioi-thieu","/lien-he","/tim-kiem","/reset-timkiem"})
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()a
     */
    public HomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uriString = request.getRequestURI();
		
		if (uriString.contains("gioi-thieu")){
			request.getRequestDispatcher("/views/client/gioithieu.jsp").forward(request, response);
		}
		else if (uriString.contains("lien-he")){
			request.getRequestDispatcher("/views/client/lienhe.jsp").forward(request, response);
		}else if(uriString.contains("tim-kiem")) {
			String keyword = request.getParameter("keyword");
	        
	        List<Video> videosearch;
	        if (keyword != null && !keyword.trim().isEmpty()) {
	        	videosearch = VideoDAO.searchByTitle(keyword);
	        	if (videosearch.isEmpty()) {
		            request.setAttribute("nonews", "Không có tin tức phù hợp với tìm kiếm");
		        }
	        } else {
	        	videosearch = VideoDAO.findAll(); 
	        }
	        
	        
	        request.setAttribute("videosearch", videosearch);
	        request.setAttribute("keyword", keyword); 
	        request.getRequestDispatcher("/views/client/timkiem.jsp").forward(request, response);
		}
		else {
			
			request.getSession().setAttribute("uriString", uriString);
			List<Video> list = VideoDAO.findAll();
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/client/home.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
