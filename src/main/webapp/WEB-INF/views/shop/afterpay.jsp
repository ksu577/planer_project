<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <% request.setCharacterEncoding("UTF-8"); %>
  <%@ include file="/WEB-INF/inc/header.jsp" %>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

  <style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #f8f9fa;
    }

    .container {
      padding-top: 70px;
    }

    .route {
      font-size: 14px;
      color: #495057;
      margin-top: 20px;
    }

    .paycontainer {
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-direction: column;
      margin-top: 20px;
    }

    .address, .bill {
      width: 100%;
      border: 1px solid #98dde3;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      padding: 20px;
      margin-top: 15px;
      border-radius: 8px;
      background-color: #fff;
    }

    .address h2, .bill h2 {
      color: #343a40;
      font-size: 20px;
      margin-bottom: 20px;
    }

    .address span, .bill span {
      font-size: 16px;
      color: #495057;
    }

    .address hr, .bill hr {
      border: 1px solid #ddd;
      margin: 10px 0;
    }

    .bill span {
      display: block;
    }

    .bill .mb-3 {
      display: flex;
      flex-direction: column;
      margin-bottom: 15px;
    }

    .top-background{
      height: 70px;
      background-color: #98dde3;
    }

    .mb-3 {
      margin-bottom: 15px;
    }
  </style>

</head>
<body style="background-color: rgba(220, 220, 220, 0.30);">

<%@ include file="/WEB-INF/inc/top.jsp" %>
<div class="top-background">
</div>
<div class="container">


  <div class="route mt-3" style="transform: translate(45%, 80%); font-size: 15px; width: 500px;">
    장바구니 > 주문결제 > <p style="font-size: 20px; display: inline-block;">주문완료</p>
  </div>

  <div class="paycontainer mt-3">
    <div class="address col-md-8">
      <h2>주문정보</h2>
      <hr>
      <form>
        <div class="mb-3">
          <span>수령인 : ${userinfo.takeName}</span>
        </div>
        <div class="mb-3">
          <span> 연락처 : ${userinfo.takeHp} </span>

        </div>
        <div class="mb-3">
          <span>배송지 : ${userinfo.takeAdd}</span>
        </div>

        <div class="mb-3">
          <span>배송 메모 : ${userinfo.takeReq}</span>
        </div>
      </form>
    </div>
    <div class="bill col-md-8">
      <c:set var="totalAmount" value="0" />

      <c:forEach items="${productinfo}" var="productinfo">
        <div class="mb-3" style="display: flex; flex-direction: column;">
          <span>상품명 : ${productinfo.productName} </span>
          <hr>
          <span>개수 : ${productinfo.amount} 개</span>
          <span>상품금액 : ${productinfo.price} 원</span>
          <hr>
        </div>
        <c:set var="totalAmount" value="${totalAmount + productinfo.price}" />
      </c:forEach>
      <span>배송비 : 3000원</span>
      <hr>
      <div class="mb-3">
        <div class="mb-3" style="display: flex; flex-direction: column;">

          <span>결제된 금액 : 총액 ${totalAmount} 원</span>
        </div>
      <button onclick="home()" class="btn btn-primary" style="font-size: 16px; background-color: #98dde3; border: 1px solid #98dde3;">홈으로</button>
      </div>
    </div>
  </div>
</div>
</div>

<script>
  function home() {
      window.location.href = "/";
  }

</script>
</body>
</html>
