	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
	<!DOCTYPE html>
	<html lang="vi">
	<head>
	    <meta charset="UTF-8">
	    <title>Quản Trị Hệ Thống</title>
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
	    <style>
	        body {
	            font-family: 'Arial', sans-serif;
	            background-color: #f8f9fa;
	        }
	
	        .sidebar {
	            width: 250px;
	            background: #343a40;
	            color: white;
	            min-height: 100vh;
	            padding-top: 10px;
	            position: fixed;
	        }
	
	        .sidebar a {
	            color: white;
	            text-decoration: none;
	            padding: 10px 20px;
	            display: block;
	            transition: 0.3s;
	        }
	
	        .sidebar a:hover {
	            background: #495057;
	        }
	
	        .content {
	            margin-left: 260px;
	            padding: 20px;
	        }
	
	        .card {
	            border-radius: 10px;
	            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	        }
	
	        .table thead {
	            background: #007bff;
	            color: white;
	        }
	
	        .btn-action {
	            font-size: 14px;
	        }
	        .active {
			    background: #007bff;
			    font-weight: bold;
			    color: white;
			}
	        
	    </style>
	</head>
	<body>
	
	    <!-- Sidebar -->
	    <div class="sidebar">
	       <a href="/TaiLT_PC09570_ASM2/trang-chu" >
	    		<img src="/TaiLT_PC09570_ASM2/images/logo.png" width="210px" height="80px">
	    	</a>
	        <hr>
	       <a href="/TaiLT_PC09570_ASM2/admin" ><i class="fa-solid fa-chart-line"></i> Tổng quan</a>
	        <a href="/TaiLT_PC09570_ASM2/admin/user/list"><i class="fa-solid fa-users"></i> Quản lý Người Dùng</a>
	        <a href="/TaiLT_PC09570_ASM2/admin/video/list" class="active"><i class="fa-solid fa-newspaper"></i> Quản lý Tin Tức</a>
	        <a href="/TaiLT_PC09570_ASM2/dang-xuat"><i class="fa-solid fa-sign-out-alt"></i> Đăng Xuất</a>
	    </div>
	
	    
	    <div class="content">
	        <h2 style="text-align: center; font-weight:bold; margin-top: 30px;">Danh sách tin tức</h2>
	        <a href="/TaiLT_PC09570_ASM2/admin/video/add" class="btn btn-success mb-3" id="tngbtnthem"><i class="fa-solid fa-plus"></i> Thêm Tin Tức</a>
	        
	        <c:if test="${not empty sessionScope.xoathanhcong}">
			    <div class="alert alert-danger alert-dismissible fade show" style="text-align: center; font-weight:bold;" id="baoxoathanhcong" role="alert">
			        ${sessionScope.xoathanhcong}
			        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			    </div>
			    <c:remove var="xoathanhcong" scope="session" />
			</c:if >
			
			<c:if test="${not empty sessionScope.capnhatthanhcong}">
			    <div class="alert alert-success alert-dismissible fade show" style="text-align: center; font-weight:bold;" id="capnhatthanhcong" role="alert">
			        ${sessionScope.capnhatthanhcong}
			        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			    </div>
			    <c:remove var="capnhatthanhcong" scope="session" />
			</c:if >
	        <table class="table table-bordered">
	            <thead>
	                <tr>
	                    <th>ID</th>
	                    <th class="text-center">Hình ảnh</th>
	                    <th>Tiêu đề</th>               
	                    <th>Lượt xem</th>
	                    
						<th>Trạng thái</th>					
	                    <th>Hành động</th>
	                </tr>
	            </thead>
	            <tbody>
	            <c:forEach items="${list}" var="video">
	                
	                <tr>
	                    <th>${video.id}</th>
	                    <td class="text-center"><img alt="" src="/TaiLT_PC09570_ASM2/images/${video.poster}" width="40px" height="40px"></td>
	                    <th style="white-space: normal; word-break: break-word; max-width: 280px;">${video.title}</th>
	                    <td>${video.views}</td>
	                
	                    <td>${video.active?'Hiển thị':'Ẩn'}</td>
	                    <td>
	                        <a href="/TaiLT_PC09570_ASM2/admin/video/edit?id=${video.id}" class="btn btn-primary btn-sm btn-action"><i class="fa-solid fa-edit"></i> Sửa</a>
	                        <a href="/TaiLT_PC09570_ASM2/admin/video/delete?id=${video.id}" class="btn btn-danger btn-sm btn-action" onclick="return confirm('Bạn có chắc chắn muốn xóa tin tức này không?')">
							   <i class="fa-solid fa-trash"></i> Xóa
							</a>
	                    </td>
	                </tr>
				</c:forEach>
	                
	            </tbody>
	        </table>
	        <div style="margin-top: 250px">
	        	<jsp:include page="/views/client/footer.jsp"></jsp:include>
	        </div>
	        
	    </div>
	
	</body>
	</html>
