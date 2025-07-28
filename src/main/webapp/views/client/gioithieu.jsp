<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giới Thiệu - Tin Tức Online</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
            padding-top: 70px;
        }
        .container {
            max-width: 900px;
            margin-top: 50px;
        }
        .section-title {
            font-size: 28px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }
        .icon {
            font-size: 40px;
            color: rgb(0, 123, 255);
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <jsp:include page="/views/client/header.jsp"></jsp:include>

    <div class="container">
        <div class="text-center">
            <h1 class="section-title">Chào mừng bạn đến với Tin Tức Online</h1>
            <p>Trang web cập nhật tin tức mới nhất, nhanh chóng và chính xác.</p>
        </div>
        
        <div class="row mt-5">
            <div class="col-md-6 text-center">
                <i class="fa-solid fa-newspaper icon"></i>
                <h3>Sứ Mệnh</h3>
                <p>Cung cấp tin tức đa dạng, chính xác và kịp thời đến <br> độc giả.</p>
            </div>
            <div class="col-md-6 text-center">
                <i class="fa-solid fa-users icon"></i>
                <h3>Đội Ngũ</h3>
                <p>Đội ngũ biên tập viên chuyên nghiệp, giàu kinh nghiệm.</p>
            </div>
        </div>
        
        <div class="row mt-4">
            <div class="col-md-6 text-center">
                <i class="fa-solid fa-bullhorn icon"></i>
                <h3>Độ Tin Cậy</h3>
                <p>Cam kết đưa tin trung thực, khách quan và minh bạch.</p>
            </div>
            <div class="col-md-6 text-center">
                <i class="fa-solid fa-hand-holding-heart icon"></i>
                <h3>Kết Nối</h3>
                <p>Tạo dựng cộng đồng độc giả sôi động, cập nhật xu hướng mới nhất.</p>
            </div>
        </div>
    </div>
    
    <jsp:include page="/views/client/footer.jsp"></jsp:include>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</html>
