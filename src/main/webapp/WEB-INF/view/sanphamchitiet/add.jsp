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

<div class="container" >
    <form style="width: 50%;margin-left: 24%;" action="/sanphamchitiet-save" method="post">
        <div class="mb-3">
            <label for="exampleInputEmail1"  class="form-label" hidden="hidden">ID</label>
            <input type="hidden" name="id" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" disabled>
        </div>
        <div class="mb-3">
            <label class="form-label">Sản phẩm</label>
            <select class="form-select" aria-label="Default select example" name="sanphamEN">

                <c:forEach items="${sanphamCBX}" var="acc">
                    <c:if test="${acc.type eq typeSelect}">
                        <option value="${acc.id}">${acc.name}</option>
                    </c:if>

                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label>Color</label>
            <input type="text" name="color" class="form-control" >
        </div>

        <div class="mb-3">
            <label>Size</label>
            <input type="text" name="size" class="form-control" >
        </div>
        <div class="mb-3">
            <label>Quantity</label>
            <input type="text" name="quantity" class="form-control" >
        </div>
        <div class="mb-3">
            <label>Image</label>
            <input type="file" name="image" class="form-control" >
        </div>
        <select name="khuyenmaiEN.id" class="form-select">
            <option value="">-- Không áp dụng --</option>
            <c:forEach var="km" items="${khuyenmaiCBX}">
                <option value="${km.id}"
                        <c:if test="${sanphamchitiet.khuyenmaiEN.id == km.id}">selected</c:if>
                >
                        ${km.name} -
                    <c:choose>
                        <c:when test="${km.type eq 'phantram'}">${km.value}%</c:when>
                        <c:otherwise>${km.value}đ</c:otherwise>
                    </c:choose>
                </option>
            </c:forEach>
        </select>






        <button type="submit" class="btn btn-primary" style="margin-left: 45%;">Submit</button>
    </form>
</div>
<%@include file="../trangchinh/footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>