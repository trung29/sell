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

<body style="background: #f4f6f9">
<%@ include file="../trangchinh/menu1.jsp" %>
<div class="container" style="margin-top: 90px;margin-bottom: 200px;">
    <div class="row">
        <div class="col-6" ><img src="../../../image/donhang.png" alt=""></div>
        <div class="col-6" style="border: 1px #fff;border-radius:30px;text-align: center;background: #fff" >
            <div class="container" style="margin-top: 30px">
                <a style="font-size: 31.5px;font-weight: 50;font-family: Tahoma">Tra cứu thông tin đơn hàng</a><br><br>
                <c:if test="${not empty sessionScope.phoneError}">
                    <div style="width: 63.5%; margin-left: 110px;" class="alert alert-danger" id="phoneAlert">${sessionScope.phoneError}</div>
                    <c:remove var="phoneError" scope="session"/>
                </c:if>
                <form action="/tracuu-search" method="get">
                    <input type="number" name="phone" placeholder="Nhập số điện thoại..." style="padding: 12px; border: none;border-radius: 12px; box-shadow: 0 0 6px rgba(0, 0, 0, 0.1);width: 63%;font-size: 16px;"><br><br>
                    <button type="submit" style="width: 63%; padding: 12px; border: none; border-radius: 12px;  background-color: #F96F3A; color: white; font-size: 16px; cursor: pointer;" onmouseover="this.style.opacity='0.9'" onmouseout="this.style.opacity='1'">
                        TIẾP TỤC
                    </button>
                </form><br><br>

            </div>

        </div>
    </div>
</div>
<%@ include file="../trangchinh/footer.jsp" %>
<script>
    setTimeout(function () {
        const alert = document.getElementById('phoneAlert');
        if (alert) {
            alert.style.transition = "opacity 0.5s ease";
            alert.style.opacity = "0";
            setTimeout(() => alert.style.display = "none", 500);
        }
    }, 3000);
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>