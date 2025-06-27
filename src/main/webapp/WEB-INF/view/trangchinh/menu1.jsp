<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<style>
    body {
        font-family: sans-serif;
        margin: 0;
        padding: 0;
    }

    .top-bar {
        background-color: #ffd400; /* Màu vàng đặc trưng */
        color: #000;
        padding: 10px 20px;
    }

    .top-bar-container {
        max-width: 1200px; /* Chiều rộng tối đa của nội dung */
        margin: 0 auto; /* Căn giữa container theo chiều ngang */
        display: flex;
        align-items: center;
        justify-content: space-between; /* Phân bố đều các phần tử con */
    }

    .logo img {
        height: 30px; /* Điều chỉnh kích thước logo */
    }

    .search-bar {
        width: 400px;
        height: 40px;
        display: flex;
        align-items: center;
        background-color: #fff;
        border-radius: 19px;
        padding: 5px;
    }

    .search-bar input[type="text"] {
        border: none;
        padding: 8px;
        outline: none;
        width: 300px; /* Điều chỉnh độ rộng thanh tìm kiếm */
    }

    .search-bar i {
        color: #ccc;
        margin-left: 5px;
    }

    .actions a {
        color: #000;
        text-decoration: none;
        margin-left: 20px;
        font-size: 14px;
    }

    .actions i {
        margin-right: 5px;
    }

    .main-menu {
        background-color: #ffd400;
        padding: 4px 20px;
        border-bottom: 1px solid #eee;
        position: sticky;
        top: 0;
        z-index: 999;
    }

    .main-menu-container {
        max-width: 1200px; /* Chiều rộng tối đa của menu */
        margin: 0 auto; /* Căn giữa container menu */
    }

    .main-menu ul {
        list-style: none;
        padding: 0;
        margin: 0;
        display: flex;
        align-items: center;
        max-width: 1200px;
        width: 100%;
    }

    .main-menu li {
        flex-shrink: 0;
        position: relative; /* Để định vị tuyệt đối cho dropdown-content */
    }

    .main-menu li a {
        display: flex;
        align-items: center;
        color: #333;
        text-decoration: none;
        padding: 4px 13px;
        font-size: 14px;
        white-space: nowrap;
    }

    .main-menu li a i {
        margin-right: 8px;
    }
    .dropdown {
        position: relative;
        z-index: 10;
    }
    /* CSS cho dropdown */
    .dropdown-content {
        display: none !important;
        position: absolute; /* Định vị tuyệt đối so với .dropdown */
        top: 100%; /* Hiển thị ngay bên dưới phần tử cha */
        left: 0;
        background-color: #f9f9f9;
        min-width: 150px; /* Điều chỉnh độ rộng menu con */
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1; /* Đảm bảo hiển thị trên các phần tử khác */
        padding: 0; /* Loại bỏ padding mặc định của ul */
    }

    .dropdown:hover .dropdown-content {
        display: block !important;
    }

    .dropdown-content li a {
        color: black;
        padding: 10px 15px;
        text-decoration: none;
        display: block; /* Mỗi liên kết trên một dòng */
        font-size: 14px;
    }

    .dropdown-content a:hover {
        background-color: #ddd; /* Hiệu ứng hover cho các mục con */
    }

    .dropdown a .fa-caret-down {
        margin-left: 5px;
    }
    .actions a {
        color: #000;
        text-decoration: none;
        margin-left: 20px;
        font-size: 14px;
    }

    /* Thêm CSS cho liên kết vị trí */
    .actions a:last-child {
        background-color: #fff59d; /* Thêm màu nền trắng để thấy rõ bo tròn */
        padding: 8px 12px; /* Thêm padding để có khoảng trống xung quanh chữ */
        border-radius: 20px; /* Thêm bo tròn góc */
    }

    .actions i {
        margin-right: 5px;
    }
</style>
<body>
<div class="top-bar">
    <div class="top-bar-container">
<%--        <div class="logo">--%>
<%--            <a href="/trangchu" style="color: black"><i class="fas fa-money-bill-wave"></i><i class="fas fa-money-bill-wave"></i><i class="fas fa-money-bill-wave"></i><i class="fas fa-money-bill-wave"></i><i class="fas fa-money-bill-wave"></i><i class="fas fa-money-bill-wave"></i><i class="fas fa-money-bill-wave"></i><i class="fas fa-money-bill-wave"></i><i class="fas fa-money-bill-wave"></i>--%>
<%--            </a>--%>
<%--        </div>--%>
        <div class="logo">
            <a href="/trangchu" style="color: black"><img src="../../../image/sss1.png">
            </a>
        </div>

            <div class="search-bar">
                <form class="d-flex me-3" action="/sanphamchitiet-search" method="get">
                <input type="text" name="keyword" placeholder="Bạn tìm gì..." style="height: 40px;width: 400px;border-radius: 19px;">
                </form>
            </div>



        <div class="actions">
            <a href="#">${sessionScope.nhanvienLogin.name}</a>


            <a href="/cart-list"><i class="fas fa-shopping-cart"></i> Giỏ hàng</a>
            <c:if test="${sessionScope.nhanvienLogin == null}">
                <a href="/login"><i class="fas fa-user"></i> Đăng nhập</a>
            </c:if>
            <c:if test="${sessionScope.nhanvienLogin != null }">
                <a href="/logout"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
            </c:if>
            <a href="#" id="locationLink">
                <i class="fas fa-map-marker-alt"></i> Đang xác định vị trí...
            </a>
        </div>
    </div>
</div>
<div class="main-menu">
    <div class="main-menu-container">
        <ul>
            <li><a href="/sanphamviewkh?type=dienthoai"><i class="fas fa-mobile-alt"></i> Điện thoại</a></li>
            <li><a href="/sanphamviewkh?type=laptop"><i class="fas fa-laptop"></i> Laptop</a></li>
            <li><a href="/sanphamviewkh?type=phukien"><i class="fas fa-headphones"></i> Phụ kiện</a></li>
            <li><a href="#"><i class="fas fa-clock"></i> Smartwatch</a></li>
            <li><a href="#"><i class="fas fa-tablet-alt"></i> Tablet</a></li>
            <li><a href="#"><i class="fas fa-tv"></i> TV</a></li>
            <li><a href="#"><i class="fas fa-bolt"></i> Gia dụng</a></li>
            <li><a href="#"><i class="fas fa-sim-card"></i> Sim, Thẻ cào</a></li>
            <li><a href="#"><i class="fas fa-wifi"></i> Mạng di động</a></li>
            <li><a href="/formnhapthongtin"><i class="fas fa-tools"></i> Tra cứu </a></li>
            <li class="dropdown" >
                <a href="#"><i class="fas fa-percent"></i> Quản lý dịch vụ <i class="fas fa-caret-down"></i></a>
                <ul class="dropdown-content" >
                    <c:if test="${sessionScope.nhanvienLogin ne null and sessionScope.nhanvienLogin.role eq 'Quản lý'}">
                    <li><a href="/nhanvien-list"><i class="fas fa-users"></i> Nhân viên</a></li>
                    </c:if>
                    <li><a href="/khachhang-list"><i class="fas fa-user-friends"></i> Khách hàng</a></li>
                    <li><a href="/hoadon-list"><i class="fas fa-file-alt"></i> Đơn hàng</a></li>
                    <li><a href="/sanphamchitiet-list"><i class="fas fa-file-alt"></i> Sản phẩm</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>

</body>

</html>