<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <style>
        .container {
            width: 80%;
            margin: auto;
            transform: translate(0%, 10%);
            background-color: white;
            border: 1px solid #98dde3;
            border-radius: 10px;
            box-shadow: 0 0 10px 5px gainsboro;
        }

        .product-title {
            font-size: 24px;
            font-weight: bold;
            margin-top: 10px;
        }

        .product-price {
            font-size: 30px; /* 원하는 크기로 조절 */
            font-weight: bold;
            color: black;
            margin-top: 10px;
            border-radius: 10px;
        }

        .product-price::after {
            content: '원';
            font-size: 18px; /* 작게 조절 */
        }

        .product-description {
            font-size: 18px;
            margin-top: 20px;
        }

        .product-buttons {
            margin-top: 20px;
        }

        .col-md-6 {
            border-radius: 10px;
            box-shadow: 0 0 0 0;
            /*padding: 20px;*/
        }

        .carousel-inner img {
            width: 100%;
            height: auto;
            aspect-ratio: 1/1; /* 이미지를 정사각형으로 만들어줌 */
        }

        .product-amount {
            display: flex;
            justify-content: flex-end;
        }

        .product-quantity {
            display: flex;
            justify-content: flex-end;
            margin-top: 10px;
        }

        .btn-primary {
            width: 100%;
            height: 35px;
        }

        .top-background {
            height: 70px;
            background-color: #98dde3;
        }

    </style>

</head>
<body style="background-color: rgba(220, 220, 220, 0.30);">
<%@include file="/WEB-INF/inc/top.jsp" %>

<div class="top-background"></div>

<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div id="carouselExample" class="carousel slide">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="<%=request.getContextPath()%>/imgDownload/showImg.wow?fileName=${product.img}&filePath=${product.imgPath}"
                             class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="<%=request.getContextPath()%>/imgDownload/showImg.wow?fileName=${product.img}&filePath=${product.imgPath}"
                             class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="<%=request.getContextPath()%>/imgDownload/showImg.wow?fileName=${product.img}&filePath=${product.imgPath}"
                             class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExample"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        <div class="col-md-6">
            <div class="product-title"> ${product.productName} </div>
            <hr>
            <div class="product-price"> ${product.productPrice} </div>
            <div class="product-description">${product.productDesc}</div>
            <div>
                <div class="product-amount" style="margin-top: 250px;">재고 : ${product.productAmount} 개</div>
                <div class="product-quantity">
                    <div class="product-quantity" style="font-size: 15px; margin-bottom: 10px;">
                        <label style="margin-right: 10px" for="purchase-quantity">구매 수량</label>
                        <input style="width: 100px; height: 25px;" type="number" id="purchase-quantity" name="purchaseQuantity" min="1"
                               max="${product.productAmount}">&nbsp;개
                    </div>
                </div>
            </div>
            <c:if test="${user.getRole()=='MANAGER'}">
                <%--        물건 수정 하는 곳으로 이동 버튼  --%>
                <button style="font-weight: 700; font-size: 15px; background-color: #98dde3; border: 1px solid #98dde3;" onclick="productmodify(${product.productId})" name="product" class="btn btn-primary">수정</button>
                <div style="margin-top: 20px"></div>
                <%--        물건 삭제 버튼  --%>
                <form action="/product/productdelete" method="post">
                    <input type="hidden" name="product" value="${product.productId}">
                    <button style="font-weight: 700; font-size: 15px; background-color: #98dde3; border: 1px solid #98dde3;" type="submit" class="btn btn-primary">삭제</button>
                </form>
            </c:if>
            <div class="product-buttons">
                <button style="margin-bottom: 10px; font-weight: 700; font-size: 15px; background-color: #98dde3; border: 1px solid #98dde3;" formaction="/cart/shoppingcartinsert" class="btn btn-primary" onclick="listCart()">장바구니에 담기</button>
            </div>
        </div>
    </div>
</div>
<script>
    function productmodify(productId) {
        window.location.href = "/product/productupdate(admin)?product=${product.productId}"
    }

    document.getElementById('purchase-quantity').addEventListener('input', function () {
        const purchaseQuantity = parseInt(this.value);
        const maxQuantity = parseInt(${product.productAmount});
        if (purchaseQuantity < 1 || purchaseQuantity > maxQuantity) {
            alert('구매 수량은 1 이상 ' + maxQuantity + ' 이하여야 합니다.');
            this.value = 1; // 조건에 맞지 않는 값 입력 시 기본값으로 변경할 수 있습니다. (예: 1)
        }
    });

    function listCart() {
        let amount = document.getElementById('purchase-quantity').value;
        if (amount.trim() === "") {
            alert('구매 수량을 입력해야 합니다.');
            return;
        }
        window.location.href = "/cart/shoppingcartinsert?productId=${product.productId}&amount=" + amount;
    }
</script>
</body>
</html>
