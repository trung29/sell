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

    .container {
        background-color: #f2f4f7;
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
<%@include file="menu1.jsp"%>
<body style="background-color: #f2f4f7; padding-top: 0px">


<%--    <c:if test="${sessionScope.nhanvienLogin == null}">--%>
<%--        <div class="alert alert-danger" id="alert">Chưa đăng nhập</div>--%>
<%--    </c:if>--%>




<div class="container mt-3" style="padding: 10px 0px">
    <div id="carouselExample" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="2000">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="../../../image/baner1.png" class="d-block w-100" alt="Banner 1">
            </div>
            <div class="carousel-item">
                <img src="../../../image/baner2.png" class="d-block w-100" alt="Banner 2">
            </div>
            <div class="carousel-item">
                <img src="../../../image/baner3.png" class="d-block w-100" alt="Banner 3">
            </div>
            <div class="carousel-item">
                <img src="../../../image/baner4.png" class="d-block w-100" alt="Banner 3">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>
<div class="container" style="background: #fff">
    <label id="title">Điện thoại</label>
    <div class="row">
        <c:forEach var="m" items="${sanphamchitiet}">
            <c:if test="${m.sanphamEN.type eq 'dienthoai'}">
                <div class="col-md-3 col-sm-6 mb-4">
                    <a href="sanpham-detail/${m.id}" style="list-style: none; text-decoration: none;color: black">
                        <div class="product-item">
                            <div class="product-img">
                                <img src="../../../image/dienthoai/${m.image}" alt="${m.sanphamEN.name}">
                            </div>
                            <div class="product-info text-center">
                                <div class="product-desc">${m.sanphamEN.name}</div>
                                <div class="product-desc">
                                    <b>Số lượng tồn kho:</b>
                                    <strong>
                                        <c:if test="${m.quantity <= 0}">
                                            <b style="color: red">Hết Hàng</b>
                                        </c:if>
                                        <c:if test="${m.quantity > 0}">
                                            ${m.quantity}
                                        </c:if>
                                    </strong>
                                </div>
                                <div class="product-title">
                                    <b>${m.size}</b> - <strong>${m.color}</strong>
                                </div>

                                <!-- ✅ Giá sản phẩm -->
                                <div class="product-price">
                                    <c:choose>
                                        <c:when test="${m.khuyenmaiEN ne null && m.khuyenmaiEN.status eq 'Hoạt động'}">
                                            <!-- Giá gốc có gạch ngang -->
                                            <span style="text-decoration: line-through; color: gray;">
                                                <fmt:formatNumber value="${m.pricespct}" type="number" groupingUsed="true"/>đ
                                            </span> -
                                            <!-- Giá sau giảm màu đỏ -->
                                            <span style="color: red; font-weight: bold;">
                                                <fmt:formatNumber value="${m.priceAfterDiscount}" type="number" groupingUsed="true"/>đ
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <!-- Không có khuyến mãi, chỉ hiển thị giá gốc -->
                                            <fmt:formatNumber value="${m.pricespct}" type="number" groupingUsed="true"/>đ
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                                <c:if test="${m.quantity > 0}">
                                    <div class="middle">
                                        <button class="btn1">
                                            <a href="/cart-add/${m.id}" class="buy-now-link" data-id="${m.id}">Thêm giỏ hàng</a>
                                        </button>
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
            </c:if>
        </c:forEach>
    </div>

    <label>
        <strong style="margin-left: 14.6cm; color: darkblue">
            <a href="/sanphamviewkh?type=dienthoai" style="list-style: none;color: darkblue; text-decoration: none">Xem thêm sản phẩm »</a>
        </strong>
    </label>
</div>


<div class="container" style="background: #fff;margin-top: 30px">
    <label id="title">Laptop</label>
    <div class="row">
        <c:forEach var="m" items="${sanphamchitiet}">
            <c:if test="${m.sanphamEN.type eq 'laptop'}">

                <div class="col-md-3 col-sm-6 mb-4">
                    <a href="sanpham-detail/${m.id}" style="list-style: none; text-decoration: none;color: black">
                        <div class="product-item">
                            <div class="product-img">
                                <img src="../../../image/laptop/${m.image}" alt="${m.sanphamEN.name}">
                            </div>
                            <div class="product-info text-center">
                                <div class="product-desc">${m.sanphamEN.name}</div>
                                <div class="product-desc"><b>Số lượng tồn kho:</b> <strong>${m.quantity}</strong></div>
                                <div class="product-title">
                                    <b>${m.size}</b> - <strong>${m.color}</strong>
                                </div>
                                <div class="product-price"> <fmt:formatNumber value="${m.sanphamEN.price}" type="number" groupingUsed="true"/>đ</div>

                                <c:if test="${m.quantity > 0}">
                                    <div class="middle">
                                            <%--                                        <button class="btn1 buy-now-link" data-id="${m.id}"><a href="/cart-add/${m.id}">Mua ngay</a></button>--%>

                                        <button class="btn1"><a href="/cart-add/${m.id}" class=" buy-now-link" data-id="${m.id}">Thêm giỏ hàng</a></button>

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

            </c:if>
        </c:forEach>    </div>
    <label><strong style="margin-left: 14.6cm; color: darkblue"><a href="/sanphamviewkh?type=laptop" style="list-style: none;color: darkblue; text-decoration: none">Xem thêm sản phẩm »</a></strong></label>

</div>

    <div class="container" style="background: #fff;margin-top: 30px">
        <label id="title">Phụ kiện</label>
        <div class="row">
            <c:forEach var="m" items="${sanphamchitiet}">
                <c:if test="${m.sanphamEN.type eq 'phukien'}">

                    <div class="col-md-3 col-sm-6 mb-4">
                        <a href="sanpham-detail/${m.id}" style="list-style: none; text-decoration: none;color: black">
                            <div class="product-item">
                                <div class="product-img">
                                    <img src="../../../image/phukien/${m.image}" alt="${m.sanphamEN.name}">
                                </div>
                                <div class="product-info text-center">
                                    <div class="product-desc">${m.sanphamEN.name}</div>
                                    <div class="product-desc"><b>Số lượng tồn kho:</b> <strong>${m.quantity}</strong></div>
                                    <div class="product-title">
                                        <b>${m.size}</b> - <strong>${m.color}</strong>
                                    </div>
                                    <div class="product-price"> <fmt:formatNumber value="${m.pricespct}" type="number" groupingUsed="true"/>đ</div>

                                    <c:if test="${m.quantity > 0}">
                                        <div class="middle">
                                                <%--                                        <button class="btn1 buy-now-link" data-id="${m.id}"><a href="/cart-add/${m.id}">Mua ngay</a></button>--%>

                                            <button class="btn1"><a href="/cart-add/${m.id}" class=" buy-now-link" data-id="${m.id}">Thêm giỏ hàng</a></button>

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

                </c:if>
            </c:forEach>    </div>
        <label><strong style="margin-left: 14.6cm; color: darkblue"><a href="/sanphamviewkh?type=phukien" style="list-style: none;color: darkblue; text-decoration: none">Xem thêm sản phẩm »</a></strong></label>

    </div>
<br>
<%@include file="footer.jsp"%>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll(".buy-now-link").forEach(link => {
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