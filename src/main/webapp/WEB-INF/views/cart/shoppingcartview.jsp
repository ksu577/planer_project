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
        <c:forEach var="cartItem" items="${listCart}"> <%--CartController 2번 항목 listCart 호--%>출
            <div class="cart-item">
                <span>${cartItem.productName}</span>
                <span>${cartItem.price * cartItem.amount}t원</span>
                <form action="/cart/shoppingcartupdate" method="post">
                    <input type="hidden" name="productId" value="${cartItem.productId}">
                    <label for="amount">수량:</label>
                    <input type="number" name="amount" id="amount" value="${cartItem.amount}" min="0"/>
                    <button type="submit">수량 업데이트</button>
                </form>
            </div>
        </c:forEach>
        <hr>
        <div class="cart-item">
            <span>합 산</span>
            <span>${sumMoney}원</span>
        </div>

<%--        <div> 전체 삭제 버튼--%>
    </div>

    <div class="cart-summary">
        <h2>영수증</h2>
        <hr>

        <div class="mb-3 d-flex justify-content-between">
            <span>${cartItem.productName}</span>
            <span>${cartItem.productAmount}원</span>
        </div>
        <hr>
        <div class="mb-3 d-flex justify-content-between">
            <span>총 상품금액</span>
            <span>로직짜야됨 총합 금액</span>
        </div>
        <hr>
        <div class="mb-3 d-flex justify-content-between">
            <span>배송비</span>
            <span>3000원</span>
        </div>
        <hr>
        <div class="mb-3 d-flex justify-content-between">
            <span>결제 예정 금액</span>
            <span>"로직짜야됨 총합 금액" + 3000원</span>
        </div>
        <button class="btn btn-primary" style="width: 100%;">결제하기</button>
    </div>
</div>


</body>
</html>
