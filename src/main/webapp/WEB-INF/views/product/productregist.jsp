<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@include file="/WEB-INF/inc/header.jsp" %>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    <style>
        .container {
            width: 80%;
            margin: auto;
        }

        .form-container {
            margin: 20px;
            padding: 20px;
            border: 1px solid #e0e0e0;
            border-radius: 5px;
        }


    </style>

</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>



<div class="container">
    <h1 class="text-center">상품 등록</h1>
    <div class="form-container">
        <form method="post" action="/product/productinsert">
            <div class="mb-3">
                <label for="productName" class="form-label">상품명</label>
                <input type="text" class="form-control" id="productName" required>
            </div>
            <div class="mb-3">
                <label for="productPrice" class="form-label">가격</label>
                <input type="number" class="form-control" id="productPrice" required placeholder="-과 원빼고 입력하세요 ex.10000">
            </div>
            <div class="mb-3">
                <label for="productDesc" class="form-label">상품 설명</label>
                <textarea class="form-control" id="productDesc" rows="4" required></textarea>
            </div>
            <div class="mb-3">
                <label for="img" class="form-label">상품 이미지</label>
                <input type="file" class="form-control" id="img" accept="image/*" required>
            </div>
            <button type="submit" class="btn btn-primary">상품 등록</button>
        </form>
    </div>
</div>

<!-- Bootstrap JS 및 Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
