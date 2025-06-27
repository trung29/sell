<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<body>
<%@ include file="../trangchinh/menu1.jsp" %>
<br><br>

<div class="container mt-4">
    <h3 class="text-center mb-4">📋 Danh sách hóa đơn</h3>
    <div class="table-responsive">
        <table class="table table-hover table-bordered align-middle text-center">
            <thead class="table-dark">
            <tr>
                <th>Mã</th>
                <th>Khách hàng</th>
                <th>Người nhận</th>
                <th>Nhân viên</th>
                <th>Ngày bán</th>
                <th>Tổng tiền</th>
                <th>Trạng thái</th>
                <th>Hoạt động</th>
                <th>Xuât </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${hoadonPage.content}" var="m">
                <tr>
                    <td>${m.code}</td>
                    <td>
                        <c:choose>
                            <c:when test="${not empty m.khachhangEN}">
                                ${m.khachhangEN.name}
                            </c:when>
                            <c:otherwise>
                                <em></em>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${m.ten_nguoi_nhan}</td>
                    <td>${m.nhanvienEN.name}</td>
                    <td>${m.order_date}</td>
                    <td><strong class="text-danger"><fmt:formatNumber value="${m.total_price}" type="number" groupingUsed="true"/>đ</strong></td>

                    <td>
                        <span class="badge bg-success">${m.status}</span>
                    </td>
                    <td>
                        <a class="btn btn-sm btn-outline-info" href="/hoadon-hoadonchitiet/${m.id}">
                            Chi tiết
                        </a>
                    </td>
                    <td>
                        <a class="btn btn-sm btn-outline-info" href="/hoadon/export/${m.id}">
                            Excel
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<c:set var="currentPage" value="${hoadonPage.number}" />
<c:set var="totalPages" value="${hoadonPage.totalPages}" />
<c:set var="startPage" value="${currentPage - 2 < 0 ? 0 : currentPage - 2}" />
<c:set var="endPage" value="${currentPage + 2 >= totalPages ? totalPages - 1 : currentPage + 2}" />

<nav class="d-flex justify-content-center mt-4">
    <ul class="pagination">
        <li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
            <a class="page-link" href="?p=${currentPage - 1}">Previous</a>
        </li>

        <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <li class="page-item ${i == currentPage ? 'active' : ''}">
                <a class="page-link" href="?p=${i}">${i + 1}</a>
            </li>
        </c:forEach>

        <li class="page-item ${currentPage == totalPages - 1 ? 'disabled' : ''}">
            <a class="page-link" href="?p=${currentPage + 1}">Next</a>
        </li>
    </ul>
</nav>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>