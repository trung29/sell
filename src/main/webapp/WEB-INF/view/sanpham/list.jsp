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
    /* ----- Form Upload + Button ----- */
    form {
        margin-bottom: 15px;
    }

    form input[type="file"] {
        padding: 6px;
        border: 1px solid #ccc;
        border-radius: 6px;
        background-color: #f9f9f9;
    }

    form button {
        margin-left: 10px;
        background-color: #28a745;
        color: white;
        border: none;
        padding: 6px 12px;
        border-radius: 6px;
        transition: background-color 0.3s;
    }

    form button:hover {
        background-color: #218838;
    }

    /* ----- Table Styling ----- */
    .table {
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
        background-color: white;
    }

    .table thead {
        background-color: #343a40;
        color: white;
    }

    .table tbody tr:hover {
        background-color: #f2f2f2;
        cursor: pointer;
        transition: 0.3s;
    }

    .table td, .table th {
        vertical-align: middle;
        text-align: center;
        padding: 10px;
    }

    /* ----- Action Buttons ----- */
    .table .btn-sm {
        padding: 4px 8px;
        margin: 2px;
        border-radius: 5px;
        font-size: 0.85rem;
        transition: 0.3s;
    }

    .table .btn-warning {
        background-color: #ffc107;
        color: black;
    }

    .table .btn-warning:hover {
        background-color: #e0a800;
        color: white;
    }

    .table .btn-danger {
        background-color: #dc3545;
        color: white;
    }

    .table .btn-danger:hover {
        background-color: #c82333;
    }

    /* ----- Tab Headings ----- */
    h3.text-center.text-primary {
        font-weight: bold;
        font-size: 1.5rem;
        margin: 15px 0;
        color: #007bff;
    }

</style>
<body>
<%@ include file="../trangchinh/menu1.jsp" %>
<div class="container" style="margin-bottom: 400px">



    <div class="container mt-3">
        <!-- Tabs Điều Hướng -->
        <ul class="nav nav-tabs" id="myTabs">
            <li class="nav-item">
                <a class="nav-link active" data-bs-toggle="tab" href="#phone">📱 Điện thoại</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#laptop">💻 Máy tính</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#accessory">🎧 Phụ kiện</a>
            </li>
        </ul>

        <!-- Nội dung Tabs -->
        <div class="tab-content mt-3">
            <c:if test="${sessionScope.nhanvienLogin ne null}">
                <a href="/sanpham-add" class="btn btn-primary">➕ Thêm sản phẩm mới</a>
                <br>
                <form method="post" enctype="multipart/form-data" action="/product/import" style="margin-top: 10px">
                    <label for="fileUpload" class="btn btn-secondary">📂 Excel</label>
                    <input id="fileUpload" type="file" name="file" accept=".xlsx" style="display: none;" onchange="showFileName(this)">
                    <span id="fileName" style="margin-left: 10px;"></span>
                    <button type="submit" class="btn btn-success">Nhập</button>
                </form>

            </c:if>
            <!-- Tab Điện thoại -->
            <div class="tab-pane fade show active" id="phone">

                <h3 class="text-center text-primary">📱 Điện thoại</h3>
                <table class="table table-hover table-bordered">
                    <thead class="table-dark">
                    <tr>
                        <th>Code</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${sanpham}" var="m">
                        <c:if test="${m.type eq 'dienthoai'}">
                            <tr>
                                <td>${m.code}</td>
                                <td>${m.name}</td>
                                <td>${m.price}</td>
                                <td>${m.status}</td>
                                <td>
                                    <c:if test="${sessionScope.nhanvienLogin ne null}">
                                        <a href="/sanpham-update/${m.id}" class="btn btn-warning btn-sm">✏️ Update</a>
                                        <a href="/sanpham-delete/${m.id}" class="btn btn-danger btn-sm">🗑 Delete</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Tab Máy tính -->
            <div class="tab-pane fade" id="laptop">

                <h3 class="text-center text-primary">💻 Máy tính</h3>
                <table class="table table-hover table-bordered">
                    <thead class="table-dark">
                    <tr>
                        <th>Code</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${sanpham}" var="m">
                        <c:if test="${m.type eq 'laptop'}">
                            <tr>
                                <td>${m.code}</td>
                                <td>${m.name}</td>
                                <td>${m.price}</td>
                                <td>${m.status}</td>
                                <td>
                                    <c:if test="${sessionScope.nhanvienLogin ne null}">
                                        <a href="/sanpham-update/${m.id}" class="btn btn-warning btn-sm">✏️ Update</a>
                                        <a href="/sanpham-delete/${m.id}" class="btn btn-danger btn-sm">🗑 Delete</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Tab Phụ kiện -->
            <div class="tab-pane fade" id="accessory">

                <h3 class="text-center text-primary">🎧 Phụ kiện</h3>
                <table class="table table-hover table-bordered">
                    <thead class="table-dark">
                    <tr>
                        <th>Code</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${sanpham}" var="m">
                        <c:if test="${m.type eq 'phukien'}">
                            <tr>
                                <td>${m.code}</td>
                                <td>${m.name}</td>
                                <td>${m.price}</td>
                                <td>${m.status}</td>
                                <td>
                                    <c:if test="${sessionScope.nhanvienLogin ne null}">
                                        <a href="/sanpham-update/${m.id}" class="btn btn-warning btn-sm">✏️ Update</a>
                                        <a href="/sanpham-delete/${m.id}" class="btn btn-danger btn-sm">🗑 Delete</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<%@include file="../trangchinh/footer.jsp"%>
<script>
    function showFileName(input) {
        var fileName = input.files[0] ? input.files[0].name : "Chưa chọn file";
        document.getElementById("fileName").innerText = fileName;
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>