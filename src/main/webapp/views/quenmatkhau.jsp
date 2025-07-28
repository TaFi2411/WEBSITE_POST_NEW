<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quên Mật Khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
          
            color: white;
        }

        .forgot-container {
            max-width: 400px;
            margin: 100px auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }

        .forgot-title {
            text-align: center;
            font-size: 26px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #ff5e62;
        }

        .form-label {
            font-weight: bold;
            color: #333;
            display: flex;
            align-items: center;
        }

        .form-label i {
            margin-right: 8px;
            color: #ff5e62;
        }

        .form-control {
            border-radius: 6px;
            border: 1px solid #ff5e62;
            padding: 10px;
        }

        .btn-reset {
            width: 100%;
            padding: 12px;
            font-size: 18px;
            border-radius: 6px;
            background: #ff5e62;
            color: white;
            transition: 0.3s;
            font-weight: bold;
        }

        .btn-reset:hover {
            background: #e04a50;
            transform: scale(1.05);
        }

        .back-login {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }

        .back-login a {
            color: #ff5e62;
            font-weight: bold;
            text-decoration: none;
        }

        .back-login a:hover {
            text-decoration: underline;
        }
        .btn-outline-danger {
            width: 100%;
            padding: 12px;
            font-size: 18px;
            border-radius: 6px;
            font-weight: bold;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <jsp:include page="/views/client/header.jsp"></jsp:include>

    <div class="forgot-container">
        <h2 class="forgot-title">Quên Mật Khẩu</h2>
        <p class="text-center">Nhập email của bạn để nhận hướng dẫn đặt lại mật khẩu.</p>
        <form action="forgot-password" method="post">
            <div class="mb-3">
                <label class="form-label"><i class="fa-solid fa-envelope"></i> Email:</label>
                <input type="email" class="form-control" name="email" required placeholder="Nhập email của bạn">
            </div>

            <button type="submit" class="btn btn-reset"><i class="fa-solid fa-paper-plane"></i> Gửi Yêu Cầu</button>
        </form>

        <div class="back-login">
           <a href="dang-nhap" class="btn btn-outline-danger"> Trở về</a>
        </div>
    </div>

    <jsp:include page="/views/client/footer.jsp"></jsp:include>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</html>
