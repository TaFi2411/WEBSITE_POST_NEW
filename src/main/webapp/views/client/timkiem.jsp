<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<!-- Custom CSS -->
<style>
    body {
        background-color: #f8f9fa;
        padding-top: 70px;
    }

    .status-box {
        max-width: 800px;
        background: white;
        border-radius: 10px;
        padding: 15px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        font-family: Arial, sans-serif;
        margin: 20px auto;
    }

    .status-header {
        display: flex;
        align-items: center;
        gap: 10px;
        font-size: 20px;
        font-weight: bold;
    }

    .status-content {
        margin-top: 10px;
        font-size: 16px;
        color: #65676B;
    }

    /* Video Card */
    .video-card {
        max-width: 800px;
        margin: 20px auto;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        overflow: hidden;
        background: white;
    }

    .video-card img, .video-card iframe {
        width: 100%;
        height: 400px;
    }

    .video-card .card-body {
        padding: 15px;
    }

    .video-card .btn {
        border-radius: 5px;
    }
    
    .video-views {
    color: #6c757d; 
    font-size: 20px;
    font-weight:bold;
    margin-top: 4px;
}
</style>

</head>
<body>
    <jsp:include page="/views/client/header.jsp"></jsp:include>

    <%-- Ô nhập bài viết/video --%>
    <div class="status-box">
        <div class="status-header">
            <i class="fa-sharp fa-solid fa-globe"></i> 
            <span>Tin Tức Online</span>
        </div>
        <hr>
        <div class="status-content">
            <p>Cập nhật tin tức mới nhất mỗi ngày để không bỏ lỡ những sự kiện quan trọng!</p>
        </div>
    </div>

    <%-- Danh sách video --%>
    <div class="container">
        <div class="row">
        <c:if test="${not empty nonews}">
           <h2 style="text-align: center; margin:200px ; margin-left: 0px; margin-top: 160px;">${nonews}</h2>
           </c:if>
           <c:forEach items="${videosearch}" var="video">
           
		<div class="col-md-12">
		    <div class="card video-card">
		        <img src="./images/${video.poster}">
		        <div class="card-body">
		            <a href="/TaiLT_PC09570_ASM2/videos/chi-tiet?id=${video.id}"  style="text-decoration: none; color: black; font-weight: bold; font-size:22px ;">${video.title }</a>
		            <p class="align-middle text-truncate" style="max-width: 200px;">${video.description }</p>
		            <div class="d-flex justify-content-between">
		                <a href="/TaiLT_PC09570_ASM2/them-yeu-thich?id=${video.id}" class =" btn btn-danger "><i class="fa-solid fa-heart"></i> Yêu thích</a>
		                
		                <span class="video-views"><i class="fa-solid fa-eye"></i> ${video.views}</span>
		            </div>
		        </div>
		    </div>
		</div>
           </c:forEach>
            
        </div>
    </div>
<jsp:include page="/views/client/footer.jsp"></jsp:include>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</html>
