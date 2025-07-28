<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm Tin Tức</title>
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
            padding: 20px;
            background: white;
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

        .btn-submit {
            width: 100%;
            padding: 10px;
            font-size: 18px;
            border-radius: 5px;
            background: #007bff;
            color: white;
            transition: 0.3s;
        }

        .btn-submit:hover {
            background: #0056b3;
        }
        
        .btn-reset {
		  	
		    font-size: 16px;
		    border-radius: 5px;
		    background: #6c757d;
		    color: white;
		    transition: 0.3s;
		    margin-left: 10px;
		    text-decoration: none;
		    display: inline-block;
		}
		
		.btn-reset:hover {
		    background: #5a6268;
		    color: white;
		    text-decoration: none;
		}
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
    <a href="/TaiLT_PC09570_ASM1/trang-chu" >
    		<img src="/TaiLT_PC09570_ASM2/images/logo.png" width="210px" height="80px">
    	</a>
        
        <hr>
        <a href="/TaiLT_PC09570_ASM2/admin" ><i class="fa-solid fa-chart-line"></i> Tổng quan</a>
        <a href="/TaiLT_PC09570_ASM2/admin/user/list"><i class="fa-solid fa-users"></i> Quản lý Người Dùng</a>
        <a href="/TaiLT_PC09570_ASM2/admin/video/list" class="active"><i class="fa-solid fa-newspaper"></i> Quản lý Tin Tức</a>
        <a href="logout"><i class="fa-solid fa-sign-out-alt"></i> Đăng Xuất</a>
    </div>

    <!-- Nội dung -->
    <div class="content">
        <h2 class="text-primary">Thêm Tin Tức</h2>
        <a href="/TaiLT_PC09570_ASM2/admin/video/list" class="btn btn-danger mb-3"><i class="fa-solid fa-arrow-left"></i> Trở về</a>
		<a href="/TaiLT_PC09570_ASM2/admin/video/reset" class="btn btn-reset mb-3"><i class="fa-solid fa-rotate-right"></i> Làm mới</a>


        <div class="card">
            <form action="/TaiLT_PC09570_ASM2/admin/video/insert" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label class="form-label">Tiêu đề:</label>
                    <input type="text" class="form-control" name="title" id="title" value="${video.title}" >
                    <span class="text-danger" id="erTitle">${erTitle}</span>
                </div>

                <div class="mb-3">
                    <label class="form-label">Link video:</label>
                    <input type="text" class="form-control" name="urlVideo" id="urlVideo" value="${video.urlVideo}">
                    <span class="text-danger" id="erurlVideo">${erurlVideo}</span>
                </div>

                <div class="mb-3">
                    <label class="form-label">Hình ảnh:</label>
                    <input type="file" class="form-control mb-3" id="poster" name="poster"  onchange="previewImage(event)">
                    <c:if test="${not empty video.poster}">
					    <img id="preview" alt="" src="/TaiLT_PC09570_ASM2/images/${video.poster}" width="200px" height="200px">
					</c:if>
					<c:if test="${empty video.poster}">
					    <img id="preview" alt="" src="#" style="display:none;" width="200px" height="200px">
					</c:if>

                    
                    <span class="text-danger" id="erImage">${erImage}</span>
                </div>

                <div class="mb-3">
                    <label class="form-label">Mô tả:</label>
                    <textarea class="form-control" name="description" rows="3">${video.description}</textarea>
                    <span class="text-danger" id="erDcrt">${erDcrt}</span>
                </div>

                <div class="mb-3">
					<label for="poster" class="form-label">Trạng thái: </label>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="active" id="active" value="true" checked>
					<label class="form-check-label" for="active">Hoạt động</label>
				</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="active" id="active2" value="false">
						<label class="form-check-label" for="active2">Không hoạt động</label>
					</div>
				</div>
				
                <button class="btn btn-submit" id="tngluutintuc"><i class="fa-solid fa-save"></i> Lưu Tin Tức</button>
                
            </form>
        </div>
    </div>

</body>
<script>
function previewImage(event) {
    var reader = new FileReader();
    reader.onload = function(){
        var output = document.getElementById('preview');
        output.src = reader.result;
        output.style.display = 'block';
    };
    reader.readAsDataURL(event.target.files[0]);
}
</script>
</html>
