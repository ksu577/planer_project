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
            padding-left: 70px;
            padding-right: 70px;
            padding-top: 100px;
        }

        .cart-items {
            border: 1px solid #98dde3;
            padding: 20px;
            flex: 1;
            margin-right: 20px;
            border-radius: 20px;
            background-color: white;
            box-shadow: 0 0 10px 5px gainsboro;
        }

        .cart-summary {
            border: 1px solid #98dde3;
            padding: 20px;
            flex: 1;
            border-radius: 20px;
            background-color: white;
            box-shadow: 0 0 10px 5px gainsboro;
        }

        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
            margin-top: 100px;
        }
        .top-background{
            height: 70px;
            background-color: #98dde3;
        }

    </style>

</head>
<body style="background-color: rgba(220, 220, 220, 0.30);">
<%@include file="/WEB-INF/inc/top.jsp" %>

<div class="top-background">

</div>
<div class="route mt-3" style="transform: translate(15%, 220%); font-size: 15px; width: 500px;">
    <p style="font-size: 20px; display: inline-block;">장바구니</p> > 주문결제 > 주문완료
</div>

<div class="cart-container mt-3">
    <div class="cart-items">
        <h2>장바구니</h2>
        <hr>
        <c:forEach var="cartItem" items="${listCart}"> <%--CartController 2번 항목 listCart 호출--%>
            <div class="cart-item" style="font-size: 15px;">
                상품명 :
                <span>${cartItem.productName}</span>
                <span>${cartItem.price}원 </span>

                <form action="/cart/shoppingcartupdate" method="post">
                    <input type="hidden" name="productId" value="${cartItem.productId}"/>
                    <label style="padding-top: 20px;" for="amount">수량:</label>
                    <input type="number" name="amount" id="amount" meta-id="${cartItem.productId}" meta-amount="${cartItem.productAmount}" value="${cartItem.amount}" min="1" style="width: 20%" /> 개
                    <span> = ${cartItem.price * cartItem.amount}원</span>
                    <button type="submit" class="btn btn-primary" style="background-color: #98dde3; font-size: 15px; font-weight: 600; border: 1px solid #98dde3;">저장</button>
                </form>

                    <%--                물건 삭제 버튼--%>
                <form action="/cart/shoppingCartDelete" method="post">
                    <input type="hidden" name="cartId" value="${cartItem.cartId}">
                    <button type="submit" class="btn btn-primary" style="margin-top: 15px; background-color: #98dde3; font-size: 15px; font-weight: 600; border: 1px solid #98dde3;">삭제</button>
                </form>


            </div>
        </c:forEach>
        <hr>
        <div class="cart-item" style="font-size: 15px">
            <span>합 산</span>
            <span>${sumMoney}원</span>
        </div>

        <%--     전체 삭제 버튼--%>
        <form action="/cart/shoppingCartClear" method="post">
            <button type="submit" class="btn btn-primary" style="border: 1px solid #98dde3; background-color: #98dde3; font-size: 18px; width: 100%; height: 40px; border-radius: 5px;">장바구니 비우기</button>
        </form>

        <%--        쇼핑 계속하기--%>
        <form action="/shop/minishop.wow" method="post">
            <button type="submit" class="btn btn-primary" style="border: 1px solid #98dde3; background-color: #98dde3; font-size: 18px; width: 100%; height: 40px; border-radius: 5px;">쇼핑 계속하기</button>
        </form>
    </div>

    <div class="cart-summary" style="font-size: 15px;">
        <h2>주문목록</h2>
        <hr>

        <hr>
        <div class="mb-3 d-flex justify-content-between" style="padding-top: 17px;">
            <span>총 상품금액</span>
            <span>${sumMoney}원</span>
        </div>
        <hr>
        <div class="mb-3 d-flex justify-content-between" style="padding-top: 18px;">
            <span>배송비</span>
            <span>3000원</span>
        </div>
        <hr>
        <div class="mb-3 d-flex justify-content-between" style="padding-top: 18px;">
            <span>결제 예정 금액</span>
            <span>${sumMoney + 3000}원</span>
        </div>

        <button onclick="addressbeforepay()" class="btn btn-primary" style="border: 1px solid #98dde3; background-color: #98dde3; font-size: 18px; width: 100%; height: 40px; border-radius: 5px;">결제하기</button>

    </div>
</div>

<script>

    function addressbeforepay() {
        if (${empty listCart}) {
            alert('장바구니가 비었습니다.');
            return false; // 장바구니가 비었을 때 false 반환
        } else {
            window.location.href = "/shop/paypage.wow";
        }
    }


    document.getElementById('amount').addEventListener('input', function () {

        const purchaseQuantity = parseInt(this.value);
        const maxQuantity = parseInt($(this).attr("meta-amount"));

        if (purchaseQuantity < 1 || purchaseQuantity > maxQuantity) {
            alert('구매 수량은 1 이상 ' + maxQuantity + ' 이하여야 합니다.');
            this.value = 1;
        }

        if (purchaseQuantity > maxQuantity) {
            alert('죄송합니다. 현재 재고수량은 ' + maxQuantity + '개입니다.');
            this.value = maxQuantity;
        }
    });



</script>



</body>
</html>