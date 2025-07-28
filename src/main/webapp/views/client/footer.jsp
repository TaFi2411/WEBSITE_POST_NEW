<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<footer class="footer">
    <div class="container">
        <div class="row">
            <!-- Cột 1: Giới thiệu -->
            <div class="col-md-3">
                <h5>Về Tin Tức Online</h5>
                <p>Trang tin tức cập nhật nhanh chóng, chính xác về các sự kiện quan trọng trong nước và quốc tế.</p>
                <p><i class="fa-solid fa-phone"></i> Hotline: +84 123 456 789</p>
                <p><i class="fa-solid fa-envelope"></i> Email: contact@tintuc.com</p>
            </div>

            <!-- Cột 2: Tin tức nổi bật -->
            <div class="col-md-3">
                <h5>Tin Nổi Bật</h5>
                <p><a href="#">Chính trị - Xã hội</a><br><small>by Nguyễn Văn A</small></p>
                <p><a href="#">Kinh tế - Doanh nghiệp</a><br><small>by Trần B</small></p>
                <p><a href="#">Thể thao - Giải trí</a><br><small>by Lê C</small></p>
            </div>

            <!-- Cột 3: Chuyên mục phổ biến -->
            <div class="col-md-3">
                <h5>Chuyên Mục</h5>
                <ul class="list-unstyled">
                    <li><a href="#">Thế giới</a></li>
                    <li><a href="#">Công nghệ</a></li>
                    <li><a href="#">Sức khỏe</a></li>
                    <li><a href="#">Giáo dục</a></li>
                    <li><a href="#">Đời sống</a></li>
                </ul>
            </div>

            <!-- Cột 4: Liên hệ và bản đồ -->
            <div class="col-md-3">
                <h5>Trụ Sở Chính</h5>
                <iframe 
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.6565071627823!2d105.84150741535264!3d21.00545929385788!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab9a4c8b7f3d%3A0x23f2efb7f1351c64!2sFPT%20Polytechnic%20H%C3%A0%20N%E1%BB%99i!5e0!3m2!1sen!2s!4v1647708182391!5m2!1sen!2s"
                    width="100%" 
                    height="150" 
                    style="border:0; border-radius:10px;" 
                    allowfullscreen="" 
                    loading="lazy">
                </iframe>
            </div>
        </div>

        <!-- Dòng bản quyền & MXH -->
        <hr>
        <div class="text-center">
            <p>Bản quyền TaiLT_PC09570 © TIN TỨC ONLINE TAFI</p>
            <p>LIÊN HỆ: +84 34 665 0459 &nbsp;&nbsp; THEO DÕI CHÚNG TÔI  
                <a href="#"><i class="fa-brands fa-twitter"></i></a>
                <a href="#"><i class="fa-brands fa-facebook"></i></a>
                <a href="#"><i class="fa-brands fa-youtube"></i></a>
                <a href="#"><i class="fa-brands fa-instagram"></i></a>
            </p>
        </div>
    </div>
</footer>

<style>
    .footer {
        background: #222;
        color: #bbb;
        padding: 40px 0;
        font-size: 14px;
    }
    .footer h5 {
        color: #fff;
        font-weight: bold;
        margin-bottom: 15px;
        text-transform: uppercase;
    }
    .footer a {
        color: #bbb;
        text-decoration: none;
    }
    .footer a:hover {
        color: #fff;
    }
    .footer ul {
        padding: 0;
        list-style: none;
    }
    .footer hr {
        border-color: #444;
    }
    .footer .text-center {
        margin-top: 20px;
    }
    .footer .fa-brands {
        font-size: 18px;
        margin-left: 10px;
        color: #bbb;
        transition: 0.3s;
    }
    .footer .fa-brands:hover {
        color: #fff;
    }
</style>
