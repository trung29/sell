<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Đổi màu nền dropdown */
        .dropdown-menu {
            background-color: #343a40; /* Màu giống menu chính */
            border: none;
        }

        /* Đổi màu chữ trong dropdown */
        .dropdown-menu .dropdown-item {
            color: white;
        }

        /* Hiệu ứng khi hover vào từng mục */
        .dropdown-menu .dropdown-item:hover {
            background-color: #495057;
        }

        /* Giúp dropdown hiển thị ngay khi hover */
        .nav-item.dropdown:hover .dropdown-menu {
            display: block;
            margin-top: 0;
        }
        .carousel-item img {
            width: 100%;
            height: 448px; /* Đảm bảo ảnh có cùng kích thước */
            object-fit: cover; /* Căn chỉnh ảnh vừa với khung */
        }
    </style>
</head>
<body>

<!-- Menu chính -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top" >
    <div class="container-fluid">
        <a class="navbar-brand fw-bold text-warning" style="margin-left: 300px" href="/trangchu">Trang chủ</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
            <ul class="navbar-nav">
<%--                    <li class="nav-item"><a class="nav-link" href="/nhanvien-list">Nhân viên</a></li>--%>
<%--                <li class="nav-item"><a class="nav-link" href="/nhanvien-list">Nhân viên</a></li>--%>
                <li class="nav-item"><a class="nav-link" href="/khachhang-list">Khách hàng</a></li>

                <!-- Dropdown Hover -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="/sanphamchitiet-list" id="categoryDropdown" role="button">
                        Loại sản phẩm
                    </a>

                </li>
            <li class="nav-item"><a class="nav-link" href="/hoadon-list">Đơn hàng</a></li>
            </ul>

            <!-- Thanh tìm kiếm + Đăng nhập / Đăng ký -->
            <div class="d-flex align-items-center">
                <strong style="color: white;margin-right: 20px" >${sessionScope.nhanvienLogin.name}</strong>
                <a href="/cart-list" class="btn btn-warning position-relative" style="margin-right: 10px">
                    🛒
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                        ${cartSize}
                    </span>
                </a>
<%--                <a href="/cart-list">Giỏ hàng (Số lượng: ${cartSize})</a>--%>
                <form class="d-flex me-3" action="/sanphamchitiet-search" method="get">
                    <input class="form-control me-2" type="search" name="keyword" placeholder="Tìm kiếm..." aria-label="Search">
                    <button class="btn btn-warning" type="submit">🔍</button>
                </form>
                <div>
                    <c:if test="${sessionScope.nhanvienLogin == null}">
                        <a href="/login" class="btn btn-outline-light me-2">Đăng nhập</a>
                    </c:if>
                    <c:if test="${sessionScope.nhanvienLogin == null}">
                        <a href="/login" class="btn btn-outline-light me-2">Đăng ký</a>
                    </c:if>
                    <c:if test="${sessionScope.nhanvienLogin ne null and sessionScope.nhanvienLogin.role eq 'Quản lý'}">
                        <button class="btn btn-warning" type="submit"><a href="/nhanvien-list" style="list-style: none; text-decoration: none">👥</a></button>
                    </c:if>
                    <c:if test="${sessionScope.nhanvienLogin != null }">
                        <button class="btn btn-warning" type="submit"><a href="/logout" style="list-style: none; text-decoration: none">🚪</a></button>
                    </c:if>

                </div>
            </div>
        </div>
    </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
