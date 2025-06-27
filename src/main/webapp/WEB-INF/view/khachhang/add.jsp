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
<body>
<%@ include file="../trangchinh/menu1.jsp" %>

<div class="container">
    <c:if test="${not empty errorsdt}">
        <div class="alert alert-danger" role="alert" style="width: 50%; margin-left: 24%;">
                ${errorsdt}
        </div>
    </c:if>
    <form style="width: 50%;margin-left: 24%;" action="/khachhang-save" method="post">
        <div class="mb-3">
            <label for="exampleInputEmail1"  class="form-label" hidden="hidden">ID</label>
            <input type="hidden" name="id" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" disabled>
        </div>

        <div class="mb-3">
            <label>Code</label>
            <input value="${khachhang != null ? khachhang.code :''}" type="text" name="code" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Name</label>
            <input type="text"  name="name" class="form-control" value="${khachhang != null ? khachhang.name :''}" required>
        </div>
        <div class="mb-3">
            <label>Gender</label>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="gender" value="Nam" id="flexRadioDefault1">
                <label class="form-check-label" for="flexRadioDefault1">
                    Nam
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="gender" value="Nữ" id="flexRadioDefault2" checked>
                <label class="form-check-label" for="flexRadioDefault2">
                    Nữ
                </label>
            </div>
        </div>
        <div class="mb-3">
            <label>Birthday</label>
            <input type="date" name="birthday" class="form-control" value="${khachhang != null ? khachhang.birthday :''}" required>
        </div>
        <div class="mb-3">
            <label>Andress</label>
            <input type="text" name="address" class="form-control" value="${khachhang != null ? khachhang.address :''}" required>
        </div>
        <div class="mb-3">
            <label>Phone</label>
            <input type="text" name="phone" class="form-control" value="${khachhang != null ? khachhang.phone :''}" required>
        </div>
        <div class="mb-3">
            <label>Email</label>
            <input type="text" name="email" class="form-control" value="${khachhang != null ? khachhang.email :''}" required>
        </div>

        <div class="mb-3">
            <label>Create Date</label>
            <input type="date" name="creat" class="form-control" value="${khachhang != null ? khachhang.creat :''}" required>
        </div>
        <div class="mb-3">
            <label>Status</label>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="status" value="Hoạt động" id="flexRadioDefault3" checked>
                <label class="form-check-label" for="flexRadioDefault1">
                    Hoạt động
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="status" value="Không hoạt động" id="flexRadioDefault4" disabled>
                <label class="form-check-label" for="flexRadioDefault2">
                    Không hoạt động
                </label>
            </div>
        </div>
        <button type="submit" class="btn btn-primary" style="margin-left: 45%;">Submit</button>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>