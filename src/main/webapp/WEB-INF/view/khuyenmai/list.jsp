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

    <button type="button" class="btn btn-dark" style="margin-left:10px;margin-top: 5px"><a style="list-style: none ; color: white; text-decoration: none"
      href="<%= session.getAttribute("nhanvienLogin") == null ? "login" :"nhanvien-add" %>">Thêm nhân viên mới </a></button>

    <br>


    <table class="table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Code</th>
            <th scope="col">Name</th>
            <th scope="col">type</th>
            <th scope="col">value</th>
            <th scope="col">Start Date</th>
            <th scope="col">End Date</th>
            <th scope="col">Status</th>

            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${khuyenmai}" var="m">
            <tr style="border-bottom: 1px solid chocolate;">

                <td>${m.id}</td>
                <td>${m.code}</td>
                <td>${m.name}</td>
                <td>${m.type}</td>
                <td>${m.value}</td>
                <td>${m.startdate}</td>
                <td>${m.enddate}</td>
                <td>${m.status}</td>

                <td>
                    <button class="btn btn-danger"><a style="text-decoration: none;color: white" href="/nhanvien-delete/${m.id}">Delete</a>
                    </button>
                    <button class="btn btn-warning"><a style="text-decoration: none;color: white"
                                                       href="/nhanvien-update/${m.id}">Update</a></button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>