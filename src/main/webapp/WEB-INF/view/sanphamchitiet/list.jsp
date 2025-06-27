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
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 20px;
        }
        .btn-add {
            display: block;
            width: max-content;
            margin: 10px auto;
            font-weight: bold;
        }
        table {
            background: #fff;
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            text-align: center;
            vertical-align: middle;
        }
        img.product-img {
            width: 50px;
            height: 50px;
            object-fit: cover;
            border-radius: 5px;
        }
        .nav-tabs .nav-link {
            font-weight: bold;
            color: #495057;
        }
        .nav-tabs .nav-link.active {
            background-color: #007bff;
            color: #fff;
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

                <!-- Tab Điện thoại -->
                <div class="tab-pane fade show active" id="phone">
                    <c:if test="${sessionScope.nhanvienLogin ne null}">
                        <a href="/sanphamchitiet-add?type=dienthoai" class="btn btn-primary">➕ Thêm sản phẩm mới</a>
                    </c:if>
                    <h3 class="text-center text-primary">📱 Điện thoại</h3>
                    <table class="table table-hover table-bordered">
                        <thead class="table-dark">
                        <tr>
                            <th>Name</th>
                            <th>Color</th>
                            <th>Size</th>
                            <th>Quantity</th>
                            <th>Image</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${sanphamchitiet}" var="m">
                            <c:if test="${m.sanphamEN.type eq 'dienthoai'}">
                                <tr>
                                    <td>${m.sanphamEN.name}</td>
                                    <td>${m.color}</td>
                                    <td>${m.size}</td>
                                    <td>${m.quantity}</td>
                                    <td>
                                        <img class="product-img" src="../../../image/${m.sanphamEN.type}/${m.image}" alt="Product Image">
                                    </td>
                                    <td>
                                        <c:if test="${sessionScope.nhanvienLogin ne null}">
                                            <a href="/sanphamchitiet-update/${m.id}" class="btn btn-warning btn-sm">✏️ Update</a>
                                            <a href="/sanphamchitiet-delete/${m.id}" class="btn btn-danger btn-sm">🗑 Delete</a>
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
                    <c:if test="${sessionScope.nhanvienLogin ne null}">
                        <a href="/sanphamchitiet-add?type=laptop" class="btn btn-primary">➕ Thêm sản phẩm mới</a>
                    </c:if>
                    <h3 class="text-center text-primary">💻 Máy tính</h3>
                    <table class="table table-hover table-bordered">
                        <thead class="table-dark">
                        <tr>
                            <th>Name</th>
                            <th>Color</th>
                            <th>Size</th>
                            <th>Quantity</th>
                            <th>Image</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${sanphamchitiet}" var="m">
                            <c:if test="${m.sanphamEN.type eq 'laptop'}">
                                <tr>
                                    <td>${m.sanphamEN.name}</td>
                                    <td>${m.color}</td>
                                    <td>${m.size}</td>
                                    <td>${m.quantity}</td>
                                    <td>
                                        <img class="product-img" src="../../../image/${m.sanphamEN.type}/${m.image}" alt="Product Image">
                                    </td>
                                    <td>
                                        <c:if test="${sessionScope.nhanvienLogin ne null}">
                                            <a href="/sanphamchitiet-update/${m.id}" class="btn btn-warning btn-sm">✏️ Update</a>
                                            <a href="/sanphamchitiet-delete/${m.id}" class="btn btn-danger btn-sm">🗑 Delete</a>
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
                    <c:if test="${sessionScope.nhanvienLogin ne null}">
                        <a href="/sanphamchitiet-add?type=phukien" class="btn btn-primary">➕ Thêm sản phẩm mới</a>
                    </c:if>
                    <h3 class="text-center text-primary">🎧 Phụ kiện</h3>
                    <table class="table table-hover table-bordered">
                        <thead class="table-dark">
                        <tr>
                            <th>Name</th>
                            <th>Color</th>
                            <th>Size</th>
                            <th>Quantity</th>
                            <th>Image</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${sanphamchitiet}" var="m">
                            <c:if test="${m.sanphamEN.type eq 'phukien'}">
                                <tr>
                                    <td>${m.sanphamEN.name}</td>
                                    <td>${m.color}</td>
                                    <td>${m.size}</td>
                                    <td>${m.quantity}</td>
                                    <td>
                                        <img class="product-img" src="../../../image/${m.sanphamEN.type}/${m.image}" alt="Product Image">
                                    </td>
                                    <td>
                                        <c:if test="${sessionScope.nhanvienLogin ne null}">
                                            <a href="/sanphamchitiet-update/${m.id}" class="btn btn-warning btn-sm">✏️ Update</a>
                                            <a href="/sanphamchitiet-delete/${m.id}" class="btn btn-danger btn-sm">🗑 Delete</a>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>