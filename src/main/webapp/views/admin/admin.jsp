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
        <a href="/TaiLT_PC09570_ASM2/admin" class="active"><i class="fa-solid fa-chart-line"></i> Tổng quan</a>
        <a href="/TaiLT_PC09570_ASM2/admin/user/list"><i class="fa-solid fa-users"></i> Quản lý Người Dùng</a>
        <a href="/TaiLT_PC09570_ASM2/admin/video/list" id="tngchonqltt"><i class="fa-solid fa-newspaper"></i> Quản lý Tin Tức</a>
        <a href="/TaiLT_PC09570_ASM2/dang-xuat"><i class="fa-solid fa-sign-out-alt"></i> Đăng Xuất</a>
    </div>

    <!-- Nội dung trang admin -->
    <div class="content">
        <h2>Tổng quan</h2>
        <div class="row mt-4">
        
            <div class="col-md-4">
            <a href="/TaiLT_PC09570_ASM2/admin/user/list" style="text-decoration: none; color: black;">
                <div class="card p-3 text-center">
                    <h5><i class="fa-solid fa-users"></i> Tổng số người dùng</h5>
                    <h3>${countUsers}</h3>

                </div>
                </a>
            </div>
            <div class="col-md-4">
            <a href="/TaiLT_PC09570_ASM2/admin/video/list" style="text-decoration: none; color: black;">
                <div class="card p-3 text-center">
                    <h5><i class="fa-solid fa-newspaper"></i> Tổng số bài viết</h5>
                    <h3>${videoCount}</h3>

                </div>
                </a>
            </div>
            <div class="col-md-4">
                <div class="card p-3 text-center">
                    <h5><i class="fa-solid fa-chart-line"></i> Lượt truy cập</h5>
                    <h3>2005</h3>
                </div>
            </div>
        </div>
	
		<div class="mt-2">
			<img src="/TaiLT_PC09570_ASM2/images/bieudo.png" width="100%" height="600px">
		</div>
       
       <jsp:include page="/views/client/footer.jsp"></jsp:include>
	</div>
	
</body>
</html>
