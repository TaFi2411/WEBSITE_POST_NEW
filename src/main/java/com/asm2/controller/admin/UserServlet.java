package com.asm2.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asm2.dao.UserDAO;
import com.asm2.dao.VideoDAO;
import com.asm2.entity.User;
import com.asm2.entity.Video;



/**
 * Servlet implementation class UserServlet
 */
@WebServlet({"/admin/user/list","/admin/user/delete","/admin/user/status"})
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uriString = request.getRequestURI();
	
		if (uriString.contains("delete")) {
		    String id = request.getParameter("id");
		    
		    User ssu = (User) request.getSession().getAttribute("user");

		    User user = UserDAO.findById(Integer.parseInt(id));

		    if (user.getAdmin() == true) {
		        request.setAttribute("erad", "Không thể xóa tài khoản admin!");
		    } else if (ssu != null && ssu.getId() == user.getId()) {
		        request.setAttribute("erdsd", "Không thể xóa tài khoản đang đăng nhập!");
		    } else {
		        UserDAO.delete(Integer.parseInt(id));
		        response.sendRedirect(request.getContextPath() + "/admin/user/list");
		        return;
		    }

		    
		    List<User> list = UserDAO.findAll();
		    request.setAttribute("list", list);
		    request.getRequestDispatcher("/views/admin/user/list.jsp").forward(request, response);
		}else {
				
				List<User> list = UserDAO.findAll();
				request.setAttribute("list", list);
				request.getRequestDispatcher("/views/admin/user/list.jsp").forward(request, response);
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
