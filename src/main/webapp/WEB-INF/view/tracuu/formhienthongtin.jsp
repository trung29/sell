<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Tra cứu đơn hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f1f4f9;
            padding: 40px;
        }

        .container {
            max-width: 1000px;
            margin: auto;
            background: white;
            /*border-radius: 10px;*/
            overflow: hidden;
            /*box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);*/
            display: flex;
            gap: 20px;
            padding: 20px;
        }

        .nav-tabs {
            flex-direction: column;
            width: 200px;
        }

        .nav-link {
            text-align: center;
            padding: 15px 0;
        }

        .nav-link.active {
            background-color: #007bff;
            color: white;
        }

        .tab-content {
            flex-grow: 1;
        }
    </style>
</head>
<body>
<%@include file="../../view/trangchinh/menu1.jsp"%>

<div class="container mt-3" style="background: #f1f4f9">
    <!-- Tabs Điều Hướng -->
    <ul class="nav nav-tabs" id="myTabs">
        <li class="nav-item">
            <a class="nav-link active" data-bs-toggle="tab" href="#donhang">📝 Đơn hàng đã mua</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" href="#thongtin">👤 Thông tin cá nhân</a>
        </li>
        <li class="nav-item" onclick="window.location.href='logout'">
            <a class="nav-link" data-bs-toggle="tab" href="/logout">🚪 Đăng xuất</a>
        </li>
    </ul>

    <!-- Nội dung Tabs -->
    <div class="tab-content" >
        <!-- Tab Điện thoại -->
        <div class="tab-pane fade show active" id="donhang" style="background: #fff">
            <div style="padding: 20px;">
                <h2 style="margin-left: 200px">Đơn hàng đã mua</h2>
                <c:if test="${empty danhsachhoadon}">
                    <div style="text-align: center; padding: 40px; border: 1px dashed #ccc; border-radius: 8px;">
                        <div style="font-size: 60px; color: #007bff;">🛍️</div>
                        <h3 style="margin: 20px 0 10px;">Rất tiếc, không tìm thấy đơn hàng nào phù hợp</h3>
                        <p style="margin-bottom: 20px; color: #666;">Vẫn còn rất nhiều sản phẩm đang chờ bạn</p>

                        <!-- Category buttons -->
                        <div>
                            <button class="btn btn-outline-primary m-1" onclick="window.location.href='/trangchu'">Điện thoại</button>
                            <button class="btn btn-outline-primary m-1" onclick="window.location.href='/trangchu'">Laptop</button>
                            <button class="btn btn-outline-primary m-1" onclick="window.location.href='/trangchu'">Tablet</button>
                            <button class="btn btn-outline-primary m-1" onclick="window.location.href='/trangchu'">Phụ kiện</button>
                            <button class="btn btn-outline-primary m-1" onclick="window.location.href='/trangchu'">Smartwatch</button>
                        </div>

                        <!-- Back to home -->
                        <div style="margin-top: 20px;">
                            <a href="/trangchu" style="color: #007bff;">← Về trang chủ</a>
                        </div>
                    </div>
                </c:if>
                <c:if test="${not empty danhsachhoadon}">
                    <table class="table table-hover table-bordered align-middle text-center">
                        <thead class="table-dark">
                        <tr>
                            <th>Khách hàng</th>
                            <th>Người bán</th>
                            <th>Ngày mua</th>
                            <th>Tổng tiền</th>
                            <th>Trạng thái</th>
                            <th>Hoạt động</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${danhsachhoadon}" var="m">
                            <tr>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty m.khachhangEN}">
                                            ${m.khachhangEN.name}
                                        </c:when>
                                        <c:otherwise>
                                            <em></em>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${m.nhanvienEN.name}</td>
                                <td>${m.order_date}</td>
                                <td><strong class="text-danger">${m.total_price}đ</strong></td>
                                <td>
                                    <span class="badge bg-success">${m.status}</span>
                                </td>
                                <td>
                                    <a class="btn btn-sm btn-outline-info" href="/hoadon-hoadonchitiet/${m.id}">
                                        Chi tiết
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>


        <div class="tab-pane fade" id="thongtin">
            <div style="padding: 20px;">
    <!-- Thông tin cá nhân -->
    <div class="bg-light p-4 rounded shadow-sm mb-4" style="background: #fff">
        <h5 class="mb-3">👤 Thông tin cá nhân</h5>
        <div class="d-flex justify-content-between align-items-center">
            <div>
                <p class="mb-1 fw-bold">Tên người dùng:</p>
                <p>${khachhangphone.name}</p>
                <p class="mb-1 fw-bold">Số điện thoại:</p>
                <p>${khachhangphone.phone}</p>
            </div>
            <a href="#" class="btn btn-outline-primary btn-sm">🖉 Sửa</a>
        </div>
    </div>

    <!-- Địa chỉ nhận hàng -->
    <div class="bg-light p-4 rounded shadow-sm" style="background: #fff">
        <h5 class="mb-3">📦 Địa chỉ nhận hàng</h5>
        <div class="d-flex justify-content-between align-items-center">
            <div>
                <p class="mb-1 fw-bold">Địa chỉ:</p>
                <p>${khachhangphone.address}</p>
                <span class="badge bg-success">Mặc định</span>
            </div>
            <a href="#" class="btn btn-outline-primary btn-sm">🖉 Sửa</a>
        </div>
        <hr>
        <a href="#" class="text-primary fw-bold">➕ Thêm địa chỉ nhận hàng</a>
    </div>

            </div>

        </div>

        <!-- Tab Phụ kiện -->
        <div class="tab-pane fade" id="accessory">
            <div style="padding: 20px;">
                <h3 class="text-primary">🎧 Phụ kiện</h3>
                <a>Phụ kiện</a><br>
                <a>Phụ kiện</a><br>
                <a>Phụ kiện</a><br>
                <a>Phụ kiện</a><br>
                <a>Phụ kiện</a><br>
                <a>Phụ kiện</a><br>
                <a>Phụ kiện</a><br>
                <a>Phụ kiện</a><br>
                <a>Phụ kiện</a><br>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>
