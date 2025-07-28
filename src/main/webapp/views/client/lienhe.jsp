<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Liên Hệ - Tin Tức Online</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
    font-family: 'Arial', sans-serif;
    padding-top:70px;
    background-color: #ffffff; /* Thay đổi nền thành sáng */
    color: #333; /* Màu chữ tối để dễ đọc */
}

.contact-container {
    max-width: 900px;
    margin: 50px auto;
    background: #ffffff; /* Nền sáng hơn */
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Giảm độ tối của bóng */
    color: #333; /* Màu chữ đen để dễ đọc */
}

.contact-title {
    text-align: center;
    font-size: 28px;
    font-weight: bold;
    margin-bottom: 20px;
    text-transform: uppercase;
    color: #007bff; /* Màu tiêu đề sáng hơn */
}

.contact-info i {
    font-size: 22px;
    margin-right: 10px;
    color: #007bff; /* Thay đổi màu của icon để sáng hơn */
}

.contact-info p {
    font-size: 16px;
    margin-bottom: 10px;
}

.form-control {
    background: rgba(255, 255, 255, 0.8); /* Nền sáng hơn cho các input */
    border: 1px solid #ddd; /* Thêm border sáng cho input */
    color: #333; /* Màu chữ tối */
}

.form-control::placeholder {
    color: rgba(0, 0, 0, 0.6); /* Màu placeholder sáng hơn */
}

.btn-send {
    width: 100%;
    padding: 12px;
    font-size: 18px;
    border-radius: 5px;
    background: #007bff; /* Nền nút sáng hơn */
    color: white;
    transition: 0.3s;
}

.btn-send:hover {
    background: #0056b3; /* Màu hover sáng hơn */
}

.map-container {
    margin-top: 30px;
    border-radius: 10px;
    overflow: hidden;
    background: #f8f9fa; /* Nền sáng cho bản đồ */
}

.map-container iframe {
    width: 100%;
    height: 350px;
    border: none;
}

    </style>
</head>
<body>

    <jsp:include page="/views/client/header.jsp"></jsp:include>

    <div class="contact-container">
        <h2 class="contact-title">Liên Hệ Với Chúng Tôi</h2>

        <!-- Thông tin liên hệ -->
        <div class="row contact-info">
            <div class="col-md-6">
                <p><i class="fa-solid fa-location-dot"></i> Địa chỉ: Xã Tân Phú huyện Thới Bình tỉnh Cà Mau</p>
                <p><i class="fa-solid fa-phone"></i> Điện thoại: 034 665 0459</p>
                <p><i class="fa-solid fa-envelope"></i> Email: thetai2411.ltt@gmail.com</p>
            </div>
            <div class="col-md-6">
                <p><i class="fa-solid fa-clock"></i> Giờ làm việc: 9:00 - 19:00 (Thứ 2 - Thứ 7)</p>
                <p><i class="fa-solid fa-facebook"></i> Facebook: <a href="#" target="_blank" style="color: blue;">fb.com/tintuc</a></p>
                <p><i class="fa-solid fa-instagram"></i> Instagram: <a href="#" target="_blank" style="color: blue;">@tintuc_official</a></p>
            </div>
        </div>

        <!-- Form liên hệ -->
        <form action="submitContact.jsp" method="post">
            <div class="mb-3">
                <label for="name" class="form-label">Họ và Tên</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Nhập họ và tên" required>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Nhập email của bạn" required>
            </div>

            <div class="mb-3">
                <label for="message" class="form-label">Nội dung</label>
                <textarea class="form-control" id="message" name="message" rows="4" placeholder="Nhập nội dung liên hệ" required></textarea>
            </div>

            <button type="submit" class="btn btn-send"><i class="fa-solid fa-paper-plane"></i> Gửi Tin Nhắn</button>
        </form>

        
        <div class="map-container mt-4">
            <h4 class="text-center">Vị trí của chúng tôi</h4>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.6804385131663!2d106.6809086741869!3d10.759922759496108!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752fc6a80b5d3b%3A0x19f6b8d038e7aaff!2zUXXhuq1uIDEsIFRIUC7EkOG7k25nIE1pbmgg!5e0!3m2!1svi!2s!4v1711555555555!5m2!1svi!2s" 
            allowfullscreen="" loading="lazy"></iframe>
        </div>
    </div>

    <jsp:include page="/views/client/footer.jsp"></jsp:include>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</html>
