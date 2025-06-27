<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<br>
<div class="container">
    <a href="<%= session.getAttribute("nhanvienLogin") == null ? "login" : "/khachhang-add" %>" class="btn btn-primary btn-add" style="margin-left: 537px;">
        ➕ Thêm khách hàng mới
    </a>

    <div class="container mt-4">
        <h3 class="text-center mb-4">📋 Danh sách khách hàng</h3>
        <div class="table-responsive">
            <table class="table table-hover table-bordered align-middle text-center">
                <thead class="table-dark">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Code</th>
                    <th scope="col">Name</th>
                    <th scope="col">Gender</th>
                    <th scope="col">Birthday</th>
                    <th scope="col">Address</th>
                    <th scope="col">Phone</th>
                    <th scope="col">Email</th>
                    <th scope="col">Creat Date</th>
                    <th scope="col">Status</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${khachhang}" var="m">
                    <tr style="border-bottom: 1px solid chocolate;">

                        <td>${m.id}</td>
                        <td>${m.code}</td>
                        <td>${m.name}</td>
                        <td>${m.gender}</td>
                        <td>${m.birthday}</td>
                        <td>${m.address}</td>
                        <td>${m.phone}</td>
                        <td>${m.email}</td>
                        <td>${m.creat}</td>
                        <td>${m.status}</td>

                        <td>
                            <a class="btn btn-sm btn-outline-danger"  href="/khachhang-delete/${m.id}">
                                Xóa
                            </a>
                            <a class="btn btn-sm btn-outline-warning" href="/khachhang-update/${m.id}">
                                Cập nhật
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>


</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>