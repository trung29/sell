<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    .container {
        background-color: #fff;
        padding: 30px 0;
        border-radius: 10px;
    }

    .product-item {
        position: relative;
        padding: 20px;
        background-color: #fff;
        border-radius: 30px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .product-item:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 15px rgba(0, 0, 0, 0.15);
    }

    .product-item:hover .btn1{
        opacity: 1;
    }

    .product-img img {
        width: 100%;
        height: auto;
        border-radius: 10px;
    }

    .product-title a {
        color: #000;
        text-decoration: none;
        font-weight: bold;
        transition: color 0.3s ease;
    }

    .product-title a:hover {
        color: #ff9900;
    }

    .product-info {
        margin-top: 15px;
    }

    .product-desc {
        font-size: 14px;
        color: #555;
    }

    .product-price {
        margin-top: 10px;
        font-size: 18px;
        color: #ff5722;
        font-weight: bold;
    }

    .btn1 {
        position: relative;
        background-color: #ff9900;
        border: none;
        font-family: sans-serif;
        text-transform: uppercase;
        padding: 10px 20px;
        min-width: 150px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.3s ease;
        opacity: 0.3;
    }

    .btn1:hover {
        background-color: #e68900;
        transform: scale(1.05);
        opacity: 1;
    }

    .middle {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 100%;
    }

    .btn1 a {
        color: #fff;
        text-decoration: none;
        display: block;
        text-align: center;
    }

    .btn1:disabled {
        background-color: #ccc;
        cursor: not-allowed;
    }
    #title{
        color: #1d2939;
        font-size: 24px;
        padding: 0 0 10px 20px;
        font-weight: bold;
    }
    #alert{
        transition: opacity 0.5s ease;

    }
</style>
<body style="background-color: #f2f4f7; padding-top: 0px">

<%@include file="../../view/trangchinh/menu1.jsp"%>

<div class="container">
    <div class="row">
        <c:if test="${not empty sanphamchitiet}">
            <c:forEach var="m" items="${sanphamchitiet}">

                    <div class="col-md-3 col-sm-6 mb-4">
                        <a href="sanpham-detail/${m.id}" style="list-style: none; text-decoration: none;color: black">
                            <div class="product-item">
                                <div class="product-img">
                                    <img src="/image/${m.sanphamEN.type}/${m.image}" alt="${m.sanphamEN.name}" alt="${m.sanphamEN.name}">
                                </div>
                                <div class="product-info text-center">
                                    <div class="product-desc">${m.sanphamEN.name}</div>
                                    <div class="product-desc"><b>Số lượng tồn kho:</b> <strong>${m.quantity}</strong></div>
                                    <div class="product-title">
                                        <b>${m.size}</b> - <strong>${m.color}</strong>
                                    </div>
                                    <div class="product-price">${m.sanphamEN.price}đ</div>

                                    <c:if test="${m.quantity > 0}">
                                        <div class="middle">
                                            <button class="btn1"><a href="/cart-add/${m.id}">Thêm giỏ hàng</a></button>
                                        </div>
                                    </c:if>
                                    <c:if test="${m.quantity <= 0}">
                                        <div class="middle">
                                            <button class="btn1" style="background-color: gray;" disabled>Hết hàng</button>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </a>

                    </div>


            </c:forEach>
        </c:if>
        <!-- Nếu không có sản phẩm nào tìm thấy -->
        <c:if test="${empty sanphamchitiet}">
            <div class="col-12">
                <div class="no-products-message">
                    Không có sản phẩm tương tự.
                </div>
            </div>
        </c:if>
    </div>
</div>
<%@include file="../trangchinh/footer.jsp"%>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>