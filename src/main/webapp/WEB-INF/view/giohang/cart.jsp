<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Bán Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
    body { background-color: #f8f9fa; }
    .cart-container { max-width: 800px; margin: auto; padding: 20px; background: #fff; border-radius: 10px; }
    .product-img { width: 80px; height: auto; }
    .price { color: red; font-weight: bold; }
    .total { font-size: 1.5rem; font-weight: bold; }
</style>
<body>
<%@ include file="../trangchinh/menu1.jsp" %>
<form style="width: 50%;margin-left: 24%;" action="/hoadon-save" method="post">
    <c:if test="${not empty cart}">
        <div class="cart-container mt-4 p-4">
            <h2 class="text-center">🛒 Giỏ hàng</h2>

            <div class="mb-3" hidden="hidden">
                <input type="text" name="nhanvienEN" value="${sessionScope.nhanvienLogin.id}" class="form-control" >
            </div>
            <!-- Chọn khách hàng -->

            <div class="mb-3">
                <label class="form-label">Tên khách hàng:</label>
                <select class="form-select" name="khachhangEN" id="khachhang-select">
                    <option value="">-- Khách lẻ --</option>
                    <c:forEach items="${khachhangCBX}" var="c">
                        <option value="${c.id}">${c.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-3" id="khachle-input" style="display: none;">
                <input type="text" class="form-control" name="khachleName" placeholder="Nhập tên khách lẻ">
            </div>


            <!-- Order date -->
            <div class="mb-3">
                <label>Order date</label>
                <input type="date" name="order_date" class="form-control" >
            </div>

            <!-- Status -->
            <div class="mb-3" hidden="hidden">
                <input type="text" name="status" class="form-control" value="Đã thanh toán" >
            </div>
            <!-- Duyệt từng sản phẩm trong giỏ hàng -->
            <c:forEach items="${sessionScope.cart}" var="m" varStatus="loop">
                <div class="mt-4 border-top pt-3 cart-item">
                    <div class="d-flex align-items-center">
                        <img src="../../../image/${m.sanphamEN.type}/${m.image}" class="product-img" alt="Sản phẩm">
                        <div class="ms-3">
                            <h5>${m.sanphamEN.name}</h5>
                            <p class="text-muted">Màu ${m.color} - <b>${m.size}</b></p>

                            <p class="price text-danger" data-price="${m.pricespct}">${m.pricespct}đ</p>
                        </div>
                    </div>

                    <!-- Thêm input hidden để gửi ID sản phẩm lên server -->
                    <input type="hidden" name="sanphamIds" value="${m.id}">

                    <div class="d-flex align-items-center mb-3" style="gap: 10px;margin-left: 626px">
                        <div class="d-flex align-items-center">
                            <input type="number" name="quantities" class="form-control quantity" value="${m.quantity}" min="1"
                                   oninput="updateTotal()" style="width: 60px;">
                        </div>
                        <c:if test="${not empty sessionScope.quantityError}">
                            <div class="alert alert-danger" id="quantityAlert">${sessionScope.quantityError}</div>
                            <c:remove var="quantityError" scope="session"/>
                        </c:if>
                        <a href="/cart-remove/${m.id}"
                           onclick="return confirm('Bạn có chắc chắn muốn xoá sản phẩm này không?');"
                           class="btn btn-danger">
                            Xoá
                        </a>
                    </div>
                </div>
            </c:forEach>

            <!-- Hiển thị tổng tiền -->
            <div class="mt-4">
                <h4 class="total text-end" id="totalPrice">0đ</h4>
                <input type="hidden" id="hiddenTotalPrice" name="total_price">
            </div>

            <!-- Phương thức thanh toán -->
            <div class="mt-3">
                <h5>Hình thức thanh toán</h5>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="payment" id="cash" checked>
                    <label class="form-check-label" for="cash">Thanh toán tiền mặt khi nhận hàng</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="payment" id="bank">
                    <label class="form-check-label" for="bank">Chuyển khoản ngân hàng</label>
                </div>
            </div>

            <!-- Nút Mua hàng -->
            <div class="mt-4">
                <c:if test="${sessionScope.nhanvienLogin ne null}">
                    <button class="btn btn-danger w-100" onclick="updateTotal()">Mua hàng</button>
                </c:if>

            </div>
        </div>
    </c:if>


</form>
<c:if test="${empty cart}">

    <div style="display: flex; justify-content: center; align-items: center; min-height: 100vh;">
        <div style="text-align: center; background: #ffffff; padding: 40px; border-radius: 10px; box-shadow: 0 2px 8px rgba(0,0,0,0.1);">
            <img src="../../../image/cart-null.png" alt="Giỏ hàng trống" style="width: 200px; margin-bottom: 20px;">
            <h2 style="font-size: 24px; margin-bottom: 10px;">Chưa có sản phẩm nào trong giỏ hàng</h2>
            <p style="font-size: 16px; color: #555; margin-bottom: 20px;">Cùng mua sắm hàng ngàn sản phẩm tại cửa hàng nhé!</p>
            <button
                    style="background-color: #e60000; color: white; border: none; padding: 12px 24px; font-size: 16px; border-radius: 5px; cursor: pointer;"
                    onmouseover="this.style.backgroundColor='#cc0000'"
                    onmouseout="this.style.backgroundColor='#e60000'"
                    onclick="window.location.href='/trangchu'">
                Mua hàng
            </button>
        </div>
    </div>
    </c:if>




<%@include file="../trangchinh/footer.jsp"%>

<script>
    setTimeout(function () {
        const alert = document.getElementById('quantityAlert');
        if (alert) {
            alert.style.transition = "opacity 0.5s ease";
            alert.style.opacity = "0";
            setTimeout(() => alert.style.display = "none", 500);
        }
    }, 3000);
</script><script>
    function updateTotal() {
        let total = 0;

        // Lặp qua tất cả các sản phẩm trong giỏ hàng
        document.querySelectorAll(".cart-item").forEach(function (item) {
            let price = item.querySelector(".price").getAttribute("data-price");
            let quantityInput = item.querySelector(".quantity");
            let quantity = quantityInput ? parseInt(quantityInput.value) : 1;

            total += price * quantity;
        });

        // Hiển thị tổng tiền trong thẻ <h4>
        document.getElementById("totalPrice").innerText = total.toLocaleString() + " đ";

        // Gán giá trị vào input ẩn để gửi lên server
        document.getElementById("hiddenTotalPrice").value = total;

    }


</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const select = document.getElementById("khachhang-select");
        const khachLeInput = document.getElementById("khachle-input");

        // Kiểm tra lần đầu (khi reload)
        if (select.value === "") {
            khachLeInput.style.display = "block";
        }

        // Khi người dùng thay đổi
        select.addEventListener("change", function () {
            if (this.value === "") {
                khachLeInput.style.display = "block";
            } else {
                khachLeInput.style.display = "none";
            }
        });
        updateTotal();
    });
</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
    </body>
    </html>
