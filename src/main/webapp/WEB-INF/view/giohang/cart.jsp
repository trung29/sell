<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Bán Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .cart-container { max-width: 800px; margin: auto; padding: 20px; background: #fff; border-radius: 10px; }
        .product-img { width: 80px; height: auto; }
        .price { color: red; font-weight: bold; }
        .total { font-size: 1.5rem; font-weight: bold; }
        #qrPopup {
            display:none; position:fixed; top:0; left:0; width:100%; height:100%;
            background:rgba(0,0,0,0.6); z-index:9999; justify-content:center; align-items:center;
        }
    </style>
</head>
<body>
<%@ include file="../trangchinh/menu1.jsp" %>

<form id="orderForm" style="width: 50%;margin-left: 24%;" action="/hoadon-save" method="post">
    <c:if test="${not empty cart}">
        <div class="cart-container mt-4 p-4">
            <h2 class="text-center">🛒 Giỏ hàng</h2>

            <!-- Nhân viên -->
            <input type="hidden" name="nhanvienEN" value="${sessionScope.nhanvienLogin.id}">

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

            <!-- Ngày đặt hàng -->
            <div class="mb-3">
                <label>Order date</label>
                <input type="date" name="order_date" class="form-control">
            </div>

            <!-- Trạng thái -->
            <input type="hidden" name="status" value="Đã thanh toán">

            <!-- Danh sách sản phẩm -->
            <c:forEach items="${sessionScope.cart}" var="m">
                <div class="mt-4 border-top pt-3 cart-item">
                    <div class="d-flex align-items-center">
                        <img src="../../../image/${m.sanphamEN.type}/${m.image}" class="product-img" alt="Sản phẩm">
                        <div class="ms-3">
                            <h5>${m.sanphamEN.name}</h5>
                            <p class="text-muted">Màu ${m.color} - <b>${m.size}</b></p>
                            <p class="price text-danger" data-price="${m.pricespct}">${m.pricespct}đ</p>
                        </div>
                    </div>

                    <input type="hidden" name="sanphamIds" value="${m.id}">

                    <div class="d-flex align-items-center mb-3" style="gap: 10px;margin-left: 626px">
                        <input type="number" name="quantities" class="form-control quantity" value="${m.quantity}" min="1" oninput="updateTotal()" style="width: 60px;">
                        <a href="/cart-remove/${m.id}" onclick="return confirm('Bạn có chắc chắn muốn xoá sản phẩm này không?');" class="btn btn-danger">Xoá</a>
                    </div>
                </div>
            </c:forEach>

            <!-- Tổng tiền -->
            <div class="mt-4">
                <h4 class="total text-end" id="totalPrice">0đ</h4>
                <input type="hidden" id="hiddenTotalPrice" name="total_price">
            </div>

            <!-- Hình thức thanh toán -->
            <div class="mt-3">
                <h5>Hình thức thanh toán</h5>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="payment" id="cash" checked>
                    <label class="form-check-label" for="cash">Thanh toán tiền mặt</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="payment" id="bank">
                    <label class="form-check-label" for="bank">Chuyển khoản</label>
                </div>
            </div>

            <!-- Nút mua hàng -->
            <div class="mt-4">
                <c:if test="${sessionScope.nhanvienLogin ne null}">
                    <button type="button" class="btn btn-danger w-100" onclick="showQRCode()">Mua hàng</button>
                </c:if>
            </div>
        </div>

        <!-- QR Popup -->
        <div id="qrPopup">
            <div style="background:#fff; padding:20px; border-radius:8px; text-align:center; position:relative;">
                <h4>Quét mã QR để thanh toán</h4>
                <p id="qrTotal" style="font-weight:bold;"></p>
                <img id="qrImage" src="" alt="QR Code" style="width:300px; height:300px; margin:10px 0;">
                <br>
                <button type="submit" class="btn btn-success">✅ Xác nhận Thanh toán</button>
                <button type="button" onclick="closeQRCode()" class="btn btn-danger">❌ Đóngg</button>
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
<script>
    function updateTotal() {
        let total = 0;
        document.querySelectorAll(".cart-item").forEach(function (item) {
            let price = parseInt(item.querySelector(".price").dataset.price);
            let quantity = parseInt(item.querySelector(".quantity").value || 1);
            total += price * quantity;
        });
        document.getElementById("totalPrice").innerText = total.toLocaleString() + " đ";
        document.getElementById("hiddenTotalPrice").value = total;
    }

    function showQRCode() {
        let total = parseInt(document.getElementById("hiddenTotalPrice").value || "0");
        if (total > 0) {
            let qrLink = "https://quickchart.io/qr?size=300&text=Thanh+toan+" + total + "+VND";
            document.getElementById("qrTotal").innerText = "Tổng tiền: " + total.toLocaleString() + " đ";
            document.getElementById("qrImage").src = qrLink;
            document.getElementById("qrPopup").style.display = "flex";
        } else {
            alert("Giỏ hàng trống hoặc tổng tiền = 0");
        }
    }

    function closeQRCode() {
        document.getElementById("qrPopup").style.display = "none";
    }

    document.addEventListener("DOMContentLoaded", function () {
        updateTotal();
        const select = document.getElementById("khachhang-select");
        const khachLeInput = document.getElementById("khachle-input");
        if (select.value === "") khachLeInput.style.display = "block";
        select.addEventListener("change", function () {
            khachLeInput.style.display = this.value === "" ? "block" : "none";
        });
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
