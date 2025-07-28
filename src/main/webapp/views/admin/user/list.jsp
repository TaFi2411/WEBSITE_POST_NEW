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
        <a href="/TaiLT_PC09570_ASM2/admin/user/list" class="active"><i class="fa-solid fa-users"></i> Quản lý Người Dùng</a>
        <a href="/TaiLT_PC09570_ASM2/admin/video/list" ><i class="fa-solid fa-newspaper"></i> Quản lý Tin Tức</a>
        <a href="/TaiLT_PC09570_ASM2/dang-xuat"><i class="fa-solid fa-sign-out-alt"></i> Đăng Xuất</a>
    </div>
	
    
    <div class="content">
    	<h2 style="text-align: center; font-weight:bold; margin-top: 30px; margin-bottom: 30px">Danh sách người dùng</h2>
        
        <h3 class="text-danger">${erad}</h3>
         <h3 class="text-danger">${erdsd}</h3>
        <table class="table mt-3">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Email</th>
                    <th>Họ và Tên</th>
                    <th>Vai trò</th>
                    <th>Hành động</th>
                </tr>
            </thead>
           <tbody>
           <c:forEach items="${list}" var="user">
		    <tr>
		        <td>${user.id }</td>
		        <td>${user.email }</td>
		        <td>${user.fullName }</td>
		        <td>
		        <c:choose>
                    <c:when test="${user.admin}">
                        <span class="badge bg-danger">Quản lý</span>
                    </c:when>
                    <c:otherwise>
                        <span class="badge bg-primary">Người dùng</span>
                    </c:otherwise>
                </c:choose>
                </td>
		        <td>
		            <a class="btn btn-warning btn-sm btn-action"><i class="fa-solid fa-lock"></i> Khóa</a>
		            <a href="/TaiLT_PC09570_ASM2/admin/user/delete?id=${user.id}" class="btn btn-danger btn-sm btn-action"><i class="fa-solid fa-trash"></i> Xóa</a>
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
