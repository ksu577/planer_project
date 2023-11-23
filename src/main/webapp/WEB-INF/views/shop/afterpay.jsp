<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <% request.setCharacterEncoding("UTF-8"); %>
  <%@ include file="/WEB-INF/inc/header.jsp" %>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

  <style>
    .paycontainer {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .container {
      margin-top: 20px;
    }
    .address {
      border: 1px solid #ddd;
      padding: 20px;
    }
    .bill {
      border: 1px solid #ddd;
      box-shadow: 0 0 0 0;
      padding: 20px;
    }
  </style>

</head>
<body>
<%@ include file="/WEB-INF/inc/top.jsp" %>
<div class="container">


  <div class="route mt-3">
    장바구니 > 주문결제 > 주문완료
  </div>

  <div class="paycontainer mt-3">
    <div class="address col-md-8">
      <h2>주문정보</h2>
      <hr>
      <form>
        <div class="mb-3">
          <%--          회원정보로 DB에서 데이터 받아와야됨--%>
          <label for="recipientName" class="form-label"> 수령인 : ${member.name}</label>
          <input type="text" class="form-control"  id="recipientName" value="${member.name}" >
        </div>
        <div class="mb-3">
          <%--          회원정보로 DB에서 데이터 받아와야됨--%>
          <label for="phoneNumber" class="form-label"> 연락처 : ${member.phnum}</label>
          <input type="tel" class="form-control" id="phoneNumber" placeholder="-를 제외한 숫자만 입력 (ex.01012345678)" value="${member.phnum}">

        </div>
        <div class="mb-3">
          <%--          여긴 payapge에서 그대로 정보 받아와야됨--%>
          <label for="address" class="form-label"> 배송지 : ${saveCartVO.address}</label>
        </div>

        <div class="mb-3">
          <%--          여긴 payapge에서 그대로 정보 받아와야됨--%>
          <label for="deliveryRequest" class="form-label"> 배송 메모 : ${saveCartVO.deliveryRequest}</label>
        </div>
      </form>
    </div>
    <div class="bill col-md-4">
      <div class="mb-3" style="display: flex; flex-direction: column;">
        <span>총 상품금액 : ${saveCartVO.sumMoney}</span>
        <span>배송비 : 3000원</span>
      </div>
      <hr>
      <div class="mb-3">
        <span>결제된 금액 : ${saveCartVO.sumMoney + 3000} 원</span>
      </div>
    </div>
  </div>
</div>



</body>
</html>
