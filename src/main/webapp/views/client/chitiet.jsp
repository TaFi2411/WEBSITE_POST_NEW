<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${video.title}</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<style>

.poster {
  width: 100%;
  height: auto;
  margin-bottom: 20px;
}

.description {
  font-size: 18px;
  line-height: 1.6;
  margin-top: 15px;
}

.col-lg-4 {
  border-left: 3px solid #ccc;
  padding-left: 16px;
}

.col-lg-4 h3 {
  font-weight: bold;
  margin-bottom: 10px;
}

/* Tin tức từng dòng */
.d-flex {
  align-items: flex-start;
}

/* Hình nhỏ bên phải */
.d-flex .imgnho {
  width: 60px;
  height: 60px;
  object-fit: cover;
}

/* Nội dung text bên cạnh ảnh */
.content {
  flex: 1;
}

/* Tiêu đề video nhỏ */
.content strong {
  display: block;
  font-size: 16px;
  margin-bottom: 5px;
}

/* Mô tả nhỏ, bị cắt nếu dài quá */
.content p {
  margin: 0;
  font-size: 14px;
  color: #666;
}

/* Đường gạch chân mỗi tin tức */
.d-flex + .d-flex {
  border-top: 1px solid #eee;
  padding-top: 10px;
}
.btn-more-news {
            display: inline-block;
            font-size: 18px;
            padding: 12px 24px;
            border-radius: 8px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
        }

        .btn-more-news i {
            margin-left: 8px;
        }

        .btn-more-news:hover {
            background-color: #0056b3;
            color: white;
        }
</style>
</head>

<body>
<jsp:include page="/views/client/header.jsp"></jsp:include>

<div class="container" style="margin-top: 100px;"> 
  <div class="row mb-5">
    <div class="col-lg-8">
    <a href="/TaiLT_PC09570_ASM2/trang-chu" class="btn btn-danger mb-3"><i class="fa-solid fa-arrow-left"></i> Trở về</a>
      <h3 style="font-weight: bold;">${video.title}</h3>
    	<hr>
      <c:choose>
        <c:when test="${not empty video.urlVideo}">
          <iframe width="100%" height="350px" 
              src="${video.urlVideo}" 
              frameborder="0" 
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
              allowfullscreen>
          </iframe>
        </c:when>
        <c:otherwise>
          <img alt="" src="/TaiLT_PC09570_ASM2/images/${video.poster}" width="100%" height="350px">
        </c:otherwise>
      </c:choose>
      
      <p class="description" style="white-space: pre-line;">${video.description}</p>
    </div>
    
    <div class="col-lg-4" style="border-left: 3px solid #ccc; padding-left: 16px;">
      <h3>Tin tức mới nhất</h3>
      <hr>
      <c:forEach items="${list}" var="video" varStatus="loop">
        <c:if test="${loop.index < 6}">
          <div class="d-flex mt-3">
            <img alt="" src="/TaiLT_PC09570_ASM2/images/${video.poster}" width="60px" height="60px" class="me-2 imgnho">
            <div class="content">
              <a href="/TaiLT_PC09570_ASM2/videos/chi-tiet?id=${video.id}" style="text-decoration: none; color: black; font-weight: bold; font-size:16px ;">${video.title}</a>
              <p class="align-middle text-truncate" style="max-width: 200px;" >${video.description}</p>
            </div>
          </div> 
        </c:if>
      </c:forEach>
    </div>

  </div>
</div>
		<div class="text-center  mb-5" style="margin-top: 120px">
            <a href="/TaiLT_PC09570_ASM2/trang-chu" class="btn-more-news">
                Xem thêm tin tức</i>
            </a>
        </div>

<jsp:include page="/views/client/footer.jsp"></jsp:include>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</html>
