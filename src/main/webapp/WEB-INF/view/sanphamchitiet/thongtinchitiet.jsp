<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<style>
    body {
        background-color: #f8f9fa;
    }

    .product-detail-card {
        background-color: #fff;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    .product-img {
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    .product-img img {
        width: 100%;
        object-fit: cover;
    }

    .product-title {
        font-size: 28px;
        font-weight: 700;
        margin-bottom: 10px;
    }

    .product-price {
        font-size: 24px;
        color: #e74c3c;
        margin-bottom: 15px;
    }

    .product-info p {
        margin: 5px 0;
        font-size: 16px;
    }

    .btn-buy {
        font-weight: bold;
        padding: 10px 25px;
        font-size: 16px;
    }

    .product-description {
        margin-top: 25px;
        white-space: pre-line; /* hỗ trợ xuống dòng tự nhiên */
    }
    .mt-5{
        margin-top: 1rem !important;
    }
</style>
<body>
<%@ include file="../trangchinh/menu1.jsp" %>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-lg-10 product-detail-card">
            <div class="row">
                <!-- Hình ảnh -->
                <div class="col-md-5 product-img">
                    <img src="/image/${detail.sanphamEN.type}/${detail.image}" alt="${detail.sanphamEN.name}">
                </div>

                <!-- Thông tin -->
                <div class="col-md-7 product-info">
                    <div class="product-title">${detail.sanphamEN.name}</div>
                    <div class="product-price">
                        <fmt:formatNumber value="${detail.sanphamEN.price}" type="number" groupingUsed="true"/>đ
                    </div>

                    <p><strong>Màu:</strong> ${detail.color}</p>
                    <p><strong>Size:</strong> ${detail.size}</p>
                    <p><strong>Số lượng còn:</strong> ${detail.quantity}</p>

                    <c:if test="${detail.quantity > 0}">
                        <a href="/cart-add/${detail.id}" class="btn btn-warning mt-3 btn-buy">🛒 Mua ngay</a>
                    </c:if>
                    <c:if test="${detail.quantity <= 0}">
                        <button class="btn btn-secondary mt-3 btn-buy" disabled>Hết hàng</button>
                    </c:if>
                </div>
            </div>

            <!-- Mô tả -->
            <hr class="my-4">
            <h5>📄 Mô tả sản phẩm</h5>
            <div class="product-description">
                <p> ${detail.sanphamEN.description}</p>
            </div>
        </div>
    </div>
</div>
<%@include file="../trangchinh/footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>