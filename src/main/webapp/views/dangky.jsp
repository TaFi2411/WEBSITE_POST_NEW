<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng Ký Tài Khoản</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            padding-top:60px;
        
            color: white;
        }

        .register-container {
            max-width: 420px;
            margin: 80px auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }

        .register-title {
            text-align: center;
            font-size: 26px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #1E90FF;
        }

        .form-label {
            font-weight: bold;
            color: #333;
            display: flex;
            align-items: center;
        }

        .form-label i {
            margin-right: 8px;
            color: #1E90FF;
        }

        .form-control {
            border-radius: 6px;
            border: 1px solid #1E90FF;
            padding: 10px;
        }

        .btn-register {
            width: 100%;
            padding: 12px;
            font-size: 18px;
            border-radius: 6px;
            background: #1E90FF;
            color: white;
            font-weight: bold;
        }
        
        .btn-outline-danger {
            width: 100%;
            padding: 12px;
            font-size: 18px;
            border-radius: 6px;
            font-weight: bold;
        }


        .text-danger {
            font-size: 14px;
        }
    </style>
</head>
<body>
    <jsp:include page="/views/client/header.jsp"></jsp:include>

    <div class="register-container">
        <h2 class="register-title">Đăng Ký</h2>
        <form action="/TaiLT_PC09570_ASM2/dang-ky" method="post">
        
        	<div class="mb-3">
                <label class="form-label"><i class="fa-solid fa-user"></i> Tên tài khoản:</label>
                <input type="text" class="form-control" name="fullName"  placeholder="Nhập tên tài khoản" value="${userInput.fullName}">
                <span class="text-danger" id="ername">${ername}</span>
            </div>
            
            <div class="mb-3">
                <label class="form-label"><i class="fa-solid fa-envelope"></i> Email:</label>
                <input type="email" class="form-control" name="email"  placeholder="Nhập email của bạn" value="${userInput.email}">
                <span class="text-danger" id="eremail">${eremail}</span>
                <span class="text-danger" id="ereqemail">${ereqemail}</span>
            </div>
			
            <div class="mb-3">
                <label class="form-label"><i class="fa-solid fa-lock"></i> Mật khẩu:</label>
                <input type="password" class="form-control" name="password"   placeholder="Nhập mật khẩu" value="${userInput.password}">
                <span class="text-danger" id="erpw">${erpw}</span>
            </div>
            
            <div class="mb-3">
				 <label for="repeatPassword" class="form-label"><i class="fa-solid fa-lock"></i>Xác nhận mật khẩu:</label>
				 <input type="password" class="form-control" id="repeatPassword" name="repeatPassword" placeholder="Xác nhận mật khẩu">
				 <span class="text-danger" id="errppw">${errppw}</span>
			</div>

            

            <button class="btn btn-register mb-2"><i class="fa-solid fa-user-plus" id="tngdangky"></i> Đăng Ký</button>
            
            <a href="dang-nhap" class="btn btn-outline-danger"> Trở về</a>
        </form>
    </div>

    <jsp:include page="/views/client/footer.jsp"></jsp:include>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</html>
