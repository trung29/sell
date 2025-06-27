<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    #background-video {
        position: fixed;
        top: 0;
        left: 0;
        min-width: 100%;
        min-height: 100%;
        object-fit: cover; /* Cho video phủ kín giống background-size: cover */
        z-index: -1; /* Để video nằm dưới toàn bộ nội dung khác */
        opacity: 0.8; /* Tuỳ chọn: Làm mờ video nếu muốn dễ nhìn chữ */
        pointer-events: none; /* Để click chuột không bị video cản trở */
    }
    .container {
        background: none;
        padding: 30px 0;
        border-radius: 10px;
    }

    .product-item {
        position: relative;
        padding: 20px;
        background-color: #fff;
        border-radius: 30px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
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
        background-color: #dc3545;
        border: none;
        font-family: sans-serif;
        text-transform: uppercase;
        /*padding: 10px 20px;*/
        min-width: 100%;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.3s ease;
        opacity: 0.3;
    }

    .btn1:hover {
        background-color: #dc3545;
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
    .middle {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 100%;
    }

</style>
<body style="background-color: #f2f4f7; padding-top: 0px">
<video autoplay muted loop id="background-video">
    <source src="../../../image/267745_small.mp4" type="video/mp4">
    Trình duyệt của bạn không hỗ trợ video nền.
</video>
<%@include file="../../view/trangchinh/menu1.jsp"%>

<div class="container">
    <h2 class="text-center" style="margin-top: 20px; color:#fff">
        <c:choose>
            <c:when test="${type == 'dienthoai'}">Điện Thoại</c:when>
            <c:when test="${type == 'laptop'}">Laptop</c:when>
            <c:when test="${type == 'phukien'}">Phụ Kiện</c:when>
            <c:otherwise>Danh sách Sản phẩm</c:otherwise>
        </c:choose>
    </h2>

    <div class="row mt-4">
        <c:forEach var="m" items="${sanphamviewkh}">
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="product-item border p-2 rounded">
                    <div class="product-img">
                        <a href="sanpham-detail/${m.id}">
                            <img src="/image/${m.sanphamEN.type}/${m.image}" alt="${m.sanphamEN.name}" style="width:100%; height:auto;">
                        </a>
                    </div>
                    <div class="product-info text-center mt-2">
                        <div class="product-desc">${m.sanphamEN.name}</div>
                        <div class="product-desc"><b>Số lượng tồn kho:</b> <strong>${m.quantity}</strong></div>
                        <div class="product-title">
                            <b>${m.size}</b> - <strong>${m.color}</strong>
                        </div>
                        <div class="product-price text-danger">
                            <fmt:formatNumber value="${m.pricespct}" type="number" groupingUsed="true"/>đ
                        </div>

                        <div class="middle mt-2">
                            <c:choose>
                                <c:when test="${m.quantity > 0}">
                                    <button class="btn1"><a href="/cart-add/${m.id}" class="btn btn-sm btn-danger w-100" data-id="${m.id}">Thêm giỏ hàng</a></button>
                                </c:when>
                                <c:otherwise>
                                    <button class="btn btn-sm btn-secondary w-100" disabled>Hết hàng</button>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>


<!-- btn btn-sm btn-danger w-100 -->
<%@include file="../trangchinh/footer.jsp"%>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll(".btn1 a").forEach(link => {
            link.addEventListener("click", function (e) {
                e.preventDefault(); // ❗️Chặn chuyển trang

                const url = this.getAttribute("href");

                fetch(url)
                    .then(res => res.text())
                    .then(() => {
                        alert("🛒 Thêm vào giỏ hàng thành công!");
                        // KHÔNG chuyển trang
                    })
                    .catch(err => {
                        alert("❌ Có lỗi xảy ra");
                        console.error(err);
                    });
            });
        });
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>