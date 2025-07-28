<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<style>
    .header {
        background-color: white;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        padding: 8px 20px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    .search-bar {
        background-color: #f0f2f5;
        border-radius: 50px;
        padding: 5px 10px;
        width: 280px;
        display: flex;
        align-items: center;
    }
    .nav-center {
        flex: 1;
        display: flex;
        justify-content: center;
        gap: 60px; 
    }
    .nav-icon {
        font-size: 20px;
        color: gray;
        cursor: pointer;
        padding: 10px;
        text-decoration: none;
        display: flex;
        align-items: center;
        justify-content: center;
        width: 50px;
        height: 50px;
    }
    .nav-icon:hover {
        color: black;
        background-color: #f0f2f5;
        border-radius: 10px;
    }
    .right-icons {
        display: flex;
        justify-content: flex-end;
        align-items: center;
        padding-right: 60px;
    }
    .profile-pic {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        cursor: pointer;
    }
    .dropdown-menu {
        width: 300px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .dropdown-item i {
        width: 25px;
        text-align: center;
    }
    .x{
    	color:gray ;
    }
    
    
    .x :hover{
    	cursor:pointer;
    	color: black;
    }
    
    .timkiem{
    	color:gray ;
    	border: none;
    }
    
    
    .timkiem :hover{
    	cursor:pointer;
    	color: black;
    	
    }
</style>

</head>

<nav class="header fixed-top">
    <div class="d-flex align-items-center" style="width:376px;">
        <img src="/TaiLT_PC09570_ASM2/images/logo.png" width="80px" height="50px">

        
        <form action="/TaiLT_PC09570_ASM2/tim-kiem" method="get" class="search-bar ms-3">
            
            <input type="text" name="keyword" class="form-control border-0 bg-transparent ms-2" placeholder="Tìm kiếm" value="${keyword }">
            <a href="/TaiLT_PC09570_ASM2/trang-chu" class="x button" style="border: none; background:none;"><i class=" fa-solid fa-xmark "></i></a>
            <button class="timkiem "><i class=" fa-solid fa-magnifying-glass"></i></button> 
            
        </form>
    </div>

    <div class="nav-center">
        <a href="/TaiLT_PC09570_ASM2/trang-chu" class="nav-icon" title="Trang chủ"><i class="fa-solid fa-house"></i></a>
        <a href="/TaiLT_PC09570_ASM2/yeu-thich" class="nav-icon" title="Yêu thích"><i class="fa-solid fa-heart"></i></a>
        <a href="/TaiLT_PC09570_ASM2/gioi-thieu" class="nav-icon" title="Giới thiệu"><i class="fa-solid fa-circle-info"></i></a>
        <a href="/TaiLT_PC09570_ASM2/lien-he" class="nav-icon" title="Liên hệ"><i class="fa-solid fa-headset"></i></a>
    </div>

    <div class="right-icons" style="width:376px;">
        <div class="dropdown">
            <a href="#" class="nav-link dropdown-toggle" id="userDropdown" title="Tài khoản" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fa-solid fa-user-circle fa-2x text-dark"></i>
            </a>

            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                <c:if test="${sessionScope.user == null}">
                    <li class="px-3 py-2">
                        <strong>Chưa đăng nhập</strong>
                        <div class="text-muted">Đăng nhập để xem nhiều tin tức hơn.</div>
                    </li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a href="/TaiLT_PC09570_ASM2/dang-nhap" class="dropdown-item"><i class="fa-solid fa-right-to-bracket"></i> Đăng nhập</a></li>
                    <li><a href="/TaiLT_PC09570_ASM2/dang-ky"  class="dropdown-item"><i class="fa-solid fa-user-plus"></i> Đăng ký</a></li>
                    <li><a href="/TaiLT_PC09570_ASM2/quen-mat-khau" class="dropdown-item"><i class="fa-solid fa-key"></i> Quên mật khẩu</a></li>
                </c:if>

                <c:if test="${sessionScope.user != null}">
                    <li class="px-3 py-2">
                        <strong>${username}</strong>
                        <div class="text-muted">Xem thông tin cá nhân</div>
                    </li>
                    <li><hr class="dropdown-divider"></li>
                    <c:if test="${sessionScope.user != null && sessionScope.user.admin}">
                        <li><a class="dropdown-item" href="/TaiLT_PC09570_ASM2/admin" id="tngquanlyhethong"><i class="fa-solid fa-wrench"></i> Quản lý hệ thống</a></li>
                    </c:if>
                    <li><a class="dropdown-item" href="/TaiLT_PC09570_ASM2/doi-mat-khau"><i class="fa-solid fa-pen-to-square"></i> Đổi mật khẩu</a></li>
                    <li><a href="/TaiLT_PC09570_ASM2/dang-xuat" id="testdangxuat" class="dropdown-item"><i class="fa-solid fa-arrow-right-from-bracket"></i> Đăng xuất</a></li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>

<script>
document.addEventListener("DOMContentLoaded", function () {
    let currentPath = window.location.pathname;
    let navLinks = document.querySelectorAll(".nav-center a");

    navLinks.forEach(link => {
        if (link.getAttribute("href") === currentPath) {
            link.classList.add("text-primary");
        } else {
            link.classList.remove("text-primary");
        }
    });
});
</script>
