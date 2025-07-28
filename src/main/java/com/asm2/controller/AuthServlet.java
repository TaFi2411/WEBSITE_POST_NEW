package com.asm2.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.asm2.entity.User;
import com.asm2.unitl.JpaUtil;
import com.asm2.dao.UserDAO;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;

/**
 * Servlet implementation class AuthServlet
 */
@WebServlet({"/dang-nhap", "/dang-ky","/quen-mat-khau","/dang-xuat","/doi-mat-khau"})
public class AuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uriString = request.getRequestURI();
		if (uriString.contains("dang-ky")) {
			request.getRequestDispatcher("/views/dangky.jsp").forward(request, response);
		}
		else if (uriString.contains("quen-mat-khau")) {
			request.getRequestDispatcher("/views/quenmatkhau.jsp").forward(request, response);
		}
		else if (uriString.contains("doi-mat-khau")) {
			request.getRequestDispatcher("/views/doimatkhau.jsp").forward(request, response);
		}
		else if (uriString.contains("dang-xuat")) {
			HttpSession session = request.getSession(false);
			if (session != null) {
	            session.invalidate();
	        }
			response.sendRedirect(request.getContextPath() + "/trang-chu");
		}
		
		else {
			request.getRequestDispatcher("/views/dangnhap.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String uriString = request.getRequestURI();
		System.out.println(uriString);
		if (uriString.contains("dang-ky")) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String repeatPassword = request.getParameter("repeatPassword");
			String fullName = request.getParameter("fullName");
			
			boolean hasError = false; 

		    if (email.trim().isEmpty()) {
		        request.setAttribute("eremail", "Email không được bỏ trống.");
		        hasError = true;
		    }
		    else {
		    	EntityManagerFactory factory = Persistence.createEntityManagerFactory("TaiLT_PC09570_ASM2");
				EntityManager entityManager = factory.createEntityManager();
				String jpql = "select o from User o where o.email = :email";
				TypedQuery<User> typedQuery = entityManager.createQuery(jpql, User.class);
				typedQuery.setParameter("email", email);
				List<User> users = typedQuery.getResultList();
				if (users.size()>0) {
					User user = users.get(0);
					if (user.getEmail().equals(email)) {
						request.setAttribute("ereqemail", "Email đã được đăng ký.");
				        hasError = true;
					}
				}
		    }

		    if (password.trim().isEmpty()) {
		        request.setAttribute("erpw", "Mật khẩu không được bỏ trống.");
		        hasError = true;
		    }

		    if (repeatPassword.trim().isEmpty()) {
		        request.setAttribute("errppw", "Xác nhận mật khẩu không được bỏ trống.");
		        hasError = true;
		    } else if (!repeatPassword.equals(password)) { 
		        request.setAttribute("errppw", "Xác nhận mật khẩu chưa đúng.");
		        hasError = true;
		    }

		    if (fullName.trim().isEmpty()) {
		        request.setAttribute("ername", "Tên tài khoản không được bỏ trống.");
		        hasError = true;
		    }

		    if (hasError) {
		    	request.setAttribute("userInput", new User(null, email, password, fullName, false, null, null));
		        request.getRequestDispatcher("/views/dangky.jsp").forward(request, response);
		        return; 
		    }
			
			User user = new User(null, email, password, fullName, false,null, null);
			dangKy(user);
			response.sendRedirect(request.getContextPath() + "/dang-nhap");
		
		}
		
		if(uriString.contains("dang-nhap")){
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			boolean hasError = false; 
			
			if(email.isEmpty()) {
				request.setAttribute("eremail", "Vui lòng nhập email.");
		        hasError = true;
			}
			
			if(password.isEmpty()) {
				request.setAttribute("erpwnull", "Vui lòng nhập mật khẩu.");
		        hasError = true;
			}
			
			if (hasError) {
				request.setAttribute("loginInput", new User(null, email, password, null, false, null, null));
		        request.getRequestDispatcher("/views/dangnhap.jsp").forward(request, response);
		        return; 
		    }
			
			User user = UserDAO.findByEmail(email);
			
			if (user == null) {
				request.setAttribute("ertk", "Tài khoản chưa được đăng ký.");
				hasError = true;
			}
			else if(!user.getPassword().equals(password)) {
				request.setAttribute("erpw", "Mật khẩu sai.");
				hasError = true;
			}
			
			if (hasError) {
				request.setAttribute("loginInput", new User(null, email, password, null, false, null, null));
		        request.getRequestDispatcher("/views/dangnhap.jsp").forward(request, response);
		        return; 
		    }
			
			request.getSession().setAttribute("user", user);
			
			
			
			String chuyenTrang = (String) request.getSession().getAttribute("chuyentrang");
			request.getSession().setAttribute("username", user.getFullName());

			if (chuyenTrang != null) {
			    response.sendRedirect(chuyenTrang);
			    
			} else {
			    response.sendRedirect(request.getContextPath() + "/trang-chu");
			    
			}
				
			
			
		}
	
		
		if (uriString.contains("doi-mat-khau")) {
		    String email = request.getParameter("email");
		    String password = request.getParameter("password");
		    String passwordNew = request.getParameter("passwordNew");
		    String repeatPasswordNew = request.getParameter("repeatPasswordNew");
		    boolean hasError = false;

		   
		    if (password.isEmpty()) {
		        request.setAttribute("erpwnull", "Vui lòng nhập mật khẩu.");
		        hasError = true;
		    }
		    if (passwordNew.isEmpty()) {
		        request.setAttribute("erpasswordNew", "Vui lòng nhập mật khẩu mới.");
		        hasError = true;
		    }
		    if (repeatPasswordNew.isEmpty()) {
		        request.setAttribute("errepeatPasswordNew", "Vui lòng nhập xác nhận mật khẩu mới.");
		        hasError = true;
		    }
		    if (!passwordNew.equals(repeatPasswordNew)) {
		        request.setAttribute("erpwnrppwn", "Xác nhận mật khẩu mới không khớp.");
		        hasError = true;
		    }

		    if (hasError) {
		    	request.setAttribute("loginInput", new User(null, email, password, null, false, null, null));
		    	request.setAttribute("loginPwn", passwordNew);
		        request.getRequestDispatcher("/views/doimatkhau.jsp").forward(request, response);
		        return;
		    }

		    // Tìm user
		    User user = UserDAO.findByEmail(email);


		    if (!user.getPassword().equals(password)) {
		    	request.setAttribute("loginInput", new User(null, email, password, null, false, null, null));
		    	request.setAttribute("loginPwn", passwordNew);
		    	request.setAttribute("loginRpPwn", repeatPasswordNew);
		        request.setAttribute("erpw", "Mật khẩu cũ không đúng.");
		        request.getRequestDispatcher("/views/doimatkhau.jsp").forward(request, response);
		        return;
		    }
		    
		   
		    user.setPassword(passwordNew);
		    UserDAO.update(user);


		    HttpSession session = request.getSession();
		    session.invalidate();

		    request.getRequestDispatcher("/views/dangnhap.jsp").forward(request, response);
		}
	
		
		
	}
	
	
	public User dangNhap(String email, String password) {
	
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("TaiLT_PC09570_ASM2");
	
		EntityManager entityManager = factory.createEntityManager();
		
		String jpql = "select o from User o where o.email = :email";
		TypedQuery<User> typedQuery = entityManager.createQuery(jpql, User.class);
		typedQuery.setParameter("email", email);
		List<User> users = typedQuery.getResultList();
		if (users.size()>0) {
			User user = users.get(0);
			if (user.getPassword().equals(password)) {
				return user;
				
			}
		}
		return null;
	}
	
	

	public void dangKy(User user) {
		
		EntityManager entityManager = JpaUtil.getEntityManager();
		//B3
		entityManager.getTransaction().begin();
		try {
			entityManager.persist(user);
			entityManager.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entityManager.getTransaction().rollback();
		}
		entityManager.close();
		

	}}


