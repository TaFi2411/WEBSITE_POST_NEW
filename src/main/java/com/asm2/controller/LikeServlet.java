package com.asm2.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asm2.dao.LikeDAO;
import com.asm2.dao.VideoDAO;
import com.asm2.entity.Like;
import com.asm2.entity.User;
import com.asm2.entity.Video;

@WebServlet({"/yeu-thich", "/them-yeu-thich", "/bo-yeu-thich"})
public class LikeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LikeServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();

        if (uri.contains("/them-yeu-thich")) {
            if (request.getSession().getAttribute("user") == null) {
                response.sendRedirect(request.getContextPath() + "/dang-nhap");
                return;
            }

            try {
                User user = (User) request.getSession().getAttribute("user");
                String videoId = request.getParameter("id");

                if (videoId != null) {
                    Video video = VideoDAO.findById(Integer.parseInt(videoId));
                    if (video != null) {
                        Like like = new Like();
                        like.setLikeDate(new Date());
                        like.setUser(user);
                        like.setVideo(video);
                        LikeDAO.insert(like);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            response.sendRedirect(request.getContextPath() + "/trang-chu");

        } else if (uri.contains("/bo-yeu-thich")) {
            if (request.getSession().getAttribute("user") == null) {
                response.sendRedirect(request.getContextPath() + "/dang-nhap");
                return;
            }

            try {
                User user = (User) request.getSession().getAttribute("user");
                String videoId = request.getParameter("id");

                if (videoId != null) {
                    Like like = LikeDAO.findByUserIdAndVideoId(user.getId(), Integer.parseInt(videoId));
                    if (like != null) {
                        LikeDAO.delete(like.getId());
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            response.sendRedirect(request.getContextPath() + "/yeu-thich");

        } else {
            if (request.getSession().getAttribute("user") == null) {
                response.sendRedirect(request.getContextPath() + "/dang-nhap");
                return;
            }

            try {
                User user = (User) request.getSession().getAttribute("user");
                List<Video> list = VideoDAO.findVideoByUserId(user.getId());
                request.setAttribute("list", list);
            } catch (Exception e) {
                e.printStackTrace();
            }

            request.getRequestDispatcher("/views/client/yeuthich.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
