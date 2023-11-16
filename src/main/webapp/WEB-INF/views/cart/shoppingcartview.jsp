<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <style>
        .cart-container {
            display: flex;
            justify-content: space-between;
        }

        .cart-items {
            border: 1px solid #ddd;
            padding: 20px;
            flex: 1;
            margin-right: 20px;
        }

        .cart-summary {
            border: 1px solid #ddd;
            padding: 20px;
            flex: 1;
        }

        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="route mt-3">
    장바구니 > 주문결제 > 주문완료
</div>

<div class="cart-container mt-3">
    <div class="cart-items">
        <h2>장바구니</h2>
        <hr>
        <c:forEach var="cartItem" items="${listCart}"> <%--CartController 2번 항목 listCart 호출--%>
            <div class="cart-item">
                상품명 :
                <span>${cartItem.productName}</span>

                <span>${cartItem.price}원 </span>

                <form action="/cart/shoppingcartupdate" method="post">
                    <input type="hidden" name="productId" value="${cartItem.productId}">
                    <label for="amount">수량:</label>
                    <input type="number" name="amount" id="amount" value="${cartItem.amount}" min="1" onchange="checkAndUpdateAmount()" style="width: 20%" /> 개
                    <span> = ${cartItem.price * cartItem.amount}원</span>
                    <button type="submit" class="btn btn-primary">저장</button>
                </form>

<%--                물건 삭제 버튼--%>
                <form action="/cart/shoppingCartDelete" method="post">
                    <input type="hidden" name="cartId" value="${cartItem.cartId}">
                    <button type="submit" class="btn btn-primary">삭제</button>
                </form>


            </div>
        </c:forEach>
        <hr>
        <div class="cart-item">
            <span>합 산</span>
            <span>${sumMoney}원</span>
        </div>

<%--     전체 삭제 버튼--%>
        <form action="/cart/shoppingCartClear" method="post">
            <button type="submit" class="btn btn-primary" style="width: 100%">장바구니 비우기</button>
        </form>
    </div>

    <div class="cart-summary">
        <h2>주문목록</h2>
        <hr>

        <hr>
        <div class="mb-3 d-flex justify-content-between">
            <span>총 상품금액</span>
            <span>${sumMoney}</span>
        </div>
        <hr>
        <div class="mb-3 d-flex justify-content-between">
            <span>배송비</span>
            <span>3000원</span>
        </div>
        <hr>
        <div class="mb-3 d-flex justify-content-between">
            <span>결제 예정 금액</span>
            <span>${sumMoney + 3000}</span>
        </div>
        <button formaction="/shop/paypage.wow" class="btn btn-primary" style="width: 100%;">결제하기</button>
    </div>
</div>

<script>
    function addressbeforepay() {
        console.log("amount = ", $('#product-options').val());
        window.location.href = "/shop/paypage.wow?productId=${product.productId}&amount="+$('#product-options').val();
    }




    function checkAndUpdateAmount() {
        let amountInput = document.getElementById('amount');
        let amountValue = parseInt(amountInput.value);

        if (amountValue < 1) {
            alert('수량은 1개 이상이어야 합니다.');
            // 입력된 값이 0보다 작으면 값을 1로 변경하도록 설정
            amountInput.value = 1;
        }
    }
</script>



</body>
</html>
