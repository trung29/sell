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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
    }
    body {
        background: linear-gradient(135deg, #667eea, #764ba2);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .login-container {
        background: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        width: 400px;
        text-align: center;
    }
    .login-container h4 {
        margin-bottom: 20px;
        font-weight: 600;
    }
    .input-group {
        margin-bottom: 15px;
    }
    .form-control {
        border-radius: 5px;
        height: 45px;
    }
    .btn-login {
        width: 100%;
        padding: 10px;
        border-radius: 5px;
        border: none;
        background: linear-gradient(45deg, #ff416c, #ff4b2b);
        color: white;
        font-size: 16px;
        transition: 0.3s;
    }
    .btn-login:hover {
        background: linear-gradient(45deg, #ff4b2b, #ff416c);
        box-shadow: 0 4px 10px rgba(255, 75, 43, 0.6);
    }
</style>
<body>

<div class="login-container">
    <h4>Đăng nhập</h4>
    <!-- Nếu có lỗi -->
    <c:if test="${not empty sessionScope.loginError}">
        <div class="alert alert-danger">${sessionScope.loginError}</div>
        <c:remove var="loginError" scope="session"/>
    </c:if>
    <form action="/run" method="post">
        <div class="input-group">
            <span class="input-group-text"><i class="fas fa-phone"></i></span>
            <input type="text" name="phone" class="form-control" placeholder="Số điện thoại" required>
        </div>
        <div class="input-group">
            <span class="input-group-text"><i class="fas fa-lock"></i></span>
            <input type="password" name="password" class="form-control" placeholder="Mật khẩu" required>
        </div>

            <button type="submit" class="btn-login">Đăng nhập</button>


    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>





