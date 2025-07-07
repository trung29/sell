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
<%@ include file="../trangchinh/menu.jsp" %>

<div class="container">
    <form style="width: 50%;margin-left: 24%;" action="/sanphamchitiet-update" method="post">
        <div class="mb-3">
            <input type="hidden" name="id" value="${sanphamchitiet.id}" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" >
        </div>
        <div class="mb-3">
            <label class="form-label">Khuyến mãi</label>
            <select class="form-select" aria-label="Default select example" name="khuyenmaiEN">
                <option value="" >-- Không --</option>
                <c:forEach items="${khuyenmaiCBX}" var="acc">
                        <option value="${acc.id}">${acc.name} -
                        <c:choose>
                            <c:when test="${acc.type eq 'phantram'}">
                                Giảm ${acc.value}%
                            </c:when>
                            <c:when test="${acc.type eq 'tienmat'}">
                                Giảm ${acc.value}VNĐ
                            </c:when>
                        </c:choose>
                        </option>
                </c:forEach>
            </select>
        </div>

        <div class="mb-3">
            <label>Color</label>
            <input type="text" name="color" value="${sanphamchitiet.color}" class="form-control" >
        </div>

        <div class="mb-3">
            <label>Size</label>
            <input type="text" name="size"  class="form-control" value="${sanphamchitiet.size}">
        </div>
        <div class="mb-3">
            <label>Price</label>
            <input type="text" name="pricespct"  class="form-control" value="${sanphamchitiet.pricespct}">
        </div>
        <div class="mb-3">
            <label>Quantity</label>
            <input type="text" name="quantity" class="form-control" value="${sanphamchitiet.quantity}">
        </div>

        <input type="hidden" name="sanphamEN.id" value="${sanphamchitiet.sanphamEN.id}">
        <div class="mb-3">
            <label>Image</label>
            <input type="file" name="image" class="form-control" id="imageInput">
        </div>

        <!-- Hiển thị ảnh cũ -->
        <div class="mb-3">
            <label>Current Image</label><br>
            <img id="previewImage" src="../../../image/${sanphamchitiet.sanphamEN.type}/${sanphamchitiet.image}"
                 alt="Product Image"
                 style="width: 150px; height: auto; border: 1px solid #ddd; padding: 5px;">
        </div>

        <!-- Giữ lại đường dẫn ảnh cũ nếu không chọn ảnh mới -->
        <input type="text" name="oldImage" value="${sanphamchitiet.image}">






        <button type="submit" class="btn btn-primary" style="margin-left: 45%;">Submit</button>
    </form>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>