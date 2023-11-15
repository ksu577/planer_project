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

        .product-image {
            max-width: 100%;
            height: auto;
        }

        .product-title {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 24px;
            font-weight: bold;
            margin-top: 10px;
        }

        .product-price {
            font-size: 18px;
            color: green;
            margin-top: 10px;
        }

        .product-description {
            margin-top: 20px;
        }

        .product-buttons {
            margin-top: 20px;
        }

        .col-md-6 {
            border: 1px solid #ddd;
            box-shadow: 0 0 0 0;
            padding: 20px;
        }

        .product-options {
            margin-top: 20px;
        }

        .product-quantity {
            margin-top: 10px;
        }
    </style>


</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="container">
    <h1 class="text-center">상품 상세 페이지</h1>
    <div class="row">
        <div class="col-md-6">
            <div class="col-md-6">
                <div id="carouselExample" class="carousel slide">
                    <div class="carousel-inner">
                        <div class="carousel-item active">

                            <img src="${product.img}" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="${product.img}" class="d-block w-100" alt="...">
                            <%--              여기선 두번째 다른 사진이 나와야되는 부분이긴한데.. 어떻게 해야되냐..--%>
                        </div>
                        <div class="carousel-item">
                            <img src="${product.img}" class="d-block w-100" alt="...">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="product-title">
                <div>상품명: ${product.productName} </div>
                <div>
                    <button class="btn btn-primary">수정하기</button>
                    <button class="btn btn-primary">삭제하기</button>
                </div>
            </div>
            <div class="product-price">가격 : ${product.productPrice}원 </div>
            <div class="product-description">${product.productDesc}</div>

            <div class="product-quantity">
                <label for="product-quantity">수량 </label>
                <select id="product-options">
                    <c:forEach begin="1" end="10" var="quantity">
                        <option value="${quantity}">${quantity}</option>
                    </c:forEach>
                </select> 개
            </div>

            <div class="product-buttons">
                <button formaction="" class="btn btn-primary" onclick="cartlist()">장바구니에 담기</button>
                <button class="btn btn-primary">구매하기</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script>
    function cartlist() {
        window.location.href = "/cart/shoppingcartview.wow"
    }
</script>

</body>
</html>
