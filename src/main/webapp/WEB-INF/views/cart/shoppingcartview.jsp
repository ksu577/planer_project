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
                    <input type="number" name="amount" id="amount" value="${cartItem.amount}" min="0"/>
<%--                    수량 체크하는 사이즈좀 줄이기--%>
                    <button type="submit" class="btn btn-primary">개</button>
<%--                    <button type="submit" class="btn btn-primary" style="width: 100%;">결제하기</button>--%>
                    <span> = ${cartItem.price * cartItem.amount}원</span>
                </form>
            </div>
        </c:forEach>
        <hr>
        <div class="cart-item">
            <span>합 산</span>
            <span>${sumMoney}원</span>
        </div>

<%--        <div> 전체 삭제 버튼--%>
        <button class="btn btn-primary" style="width: 100%">결제하기</button>
    </div>

    <div class="cart-summary">
        <h2>주문목록</h2>
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
        <button class="btn btn-primary" style="width: 100%;">결제하기</button>
    </div>
</div>


</body>
</html>
