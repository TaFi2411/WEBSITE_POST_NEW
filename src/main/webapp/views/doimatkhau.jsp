<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng Nhập</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
           
            color: white;
        }

        .login-container {
            max-width: 400px;
            margin: 100px auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }

        .login-title {
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

        .btn-login {
            width: 100%;
            padding: 12px;
            font-size: 18px;
            border-radius: 6px;
            background: #1E90FF;
            color: white;
            transition: 0.3s;
            font-weight: bold;
        }

        .btn-login:hover {
            background: #007BFF;
            transform: scale(1.05);
        }

        .forgot-password {
            text-align: right;
            margin-top: 10px;
        }

        .forgot-password a {
            color: #1E90FF;
            text-decoration: none;
            font-size: 14px;
        }

        .forgot-password a:hover {
            text-decoration: underline;
        }

        .register-link {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }

        .register-link a {
            color: #1E90FF;
            font-weight: bold;
            text-decoration: none;
        }

        .register-link a:hover {
            text-decoration: underline;
        }
        
    </style>
</head>
<body>
    <jsp:include page="/views/client/header.jsp"></jsp:include>

    <div class="login-container">
        <h2 class="login-title">Đổi mật khẩu</h2>
        <form action="/TaiLT_PC09570_ASM2/doi-mat-khau" method="post">
            <div class="mb-3">
                <label class="form-label"><i class="fa-solid fa-envelope"></i> Email:</label>
                <input type="text" class="form-control" name="email" placeholder="Nhập email của bạn" value="${sessionScope.user.email}" readonly>
                
            </div>

            <div class="mb-3">
                <label class="form-label"><i class="fa-solid fa-lock"></i> Mật khẩu hiện tại:</label>
                <input type="password" class="form-control" name="password"  placeholder="Nhập mật khẩu" value="${loginInput.password}">
               
                <span class="text-danger">${erpwnull}</span>
                <span class="text-danger">${erpw}</span>
                
            </div>
            
            <div class="mb-3">
				 <label for="repeatPassword" class="form-label"><i class="fa-solid fa-lock"></i>Mật khẩu mới:</label>
				 <input type="password" class="form-control" id="passwordNew" name="passwordNew" placeholder="Xác nhận mật khẩu" value="${loginPwn }">
				 <span class="text-danger">${erpasswordNew}</span>
			</div>
			
			<div class="mb-3">
				 <label for="repeatPassword" class="form-label"><i class="fa-solid fa-lock"></i>Xác nhận mật khẩu mới:</label>
				 <input type="password" class="form-control" id="repeatPasswordNew" name="repeatPasswordNew" placeholder="Xác nhận mật khẩu" value="${loginRpPwn }">
				 <span class="text-danger">${errepeatPasswordNew}</span>
				 <span class="text-danger">${erpwnrppwn}</span>
			</div>

            <button class="btn btn-login"><i class="fa-solid fa-sign-in-alt"></i> Đổi mật khẩu</button>
        </form>
    </div>

    <jsp:include page="/views/client/footer.jsp"></jsp:include>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</html>
