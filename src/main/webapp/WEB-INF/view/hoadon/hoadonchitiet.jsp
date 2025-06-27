<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Hóa Đơn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="../trangchinh/menu1.jsp" %>

<div class="container mt-4">
    <h2 class="text-center">🧾 Chi Tiết Hóa Đơn</h2>

    <div class="card p-4">
        <h4>Thông tin hóa đơn</h4>
        <p><strong>Mã Hóa Đơn:</strong>     ${hoadon.code}</p>
        <p><strong>Khách Hàng:</strong>     ${hoadon.khachhangEN.name}</p>
        <p><strong>Người nhận hàng:</strong>     ${hoadon.ten_nguoi_nhan}</p>
        <p><strong>Ngày Đặt Hàng:</strong>     ${hoadon.order_date}</p>
        <p><strong>Tổng Tiền:</strong>     <fmt:formatNumber value="${hoadon.total_price}" type="number" groupingUsed="true"/>đ</p>
        <p><strong>Trạng Thái:</strong>     ${hoadon.status}</p>
    </div>

    <h4 class="mt-4">Danh sách sản phẩm</h4>
    <table class="table table-bordered">
        <thead>
        <tr style="text-align: center">
            <th>#</th>
            <th>Ảnh</th>
            <th>Sản phẩm</th>
            <th>Số lượng</th>
            <th>Giá</th>
            <th>Thành tiền</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${hoadonChiTietList}" var="ct" varStatus="loop">
            <tr style="text-align: center">
                <td>${loop.index + 1}</td>
                <td><img src="../../../image/${ct.sanphamchitietEN.sanphamEN.type}/${ct.sanphamchitietEN.image}" style="width: 30%"></td>
                <td>${ct.sanphamchitietEN.sanphamEN.name}</td>
                <td>${ct.quantity}</td>
                <td><fmt:formatNumber value="${ct.price}" type="number" groupingUsed="true"/>đ</td>
                <td><fmt:formatNumber value="${ct.subtotal}" type="number" groupingUsed="true"/>đ</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="/hoadon-list" class="btn btn-secondary">Quay lại</a>
</div>
</body>
</html>
