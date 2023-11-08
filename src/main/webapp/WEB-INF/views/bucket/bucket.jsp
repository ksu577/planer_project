<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <% request.setCharacterEncoding("UTF-8"); %>
  <%@include file="/WEB-INF/inc/header.jsp" %>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>장바구니</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <style>
    .nav-bar {
      border: 1px solid red;
      height: 70px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      cursor: pointer;
    }


    .navcategory a {
      text-decoration: none;
      margin: 10px;
      padding: 30px;
    }
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
<div class="container">
  <!-- navbar 시작 이 부분은 이거 쓰는게 아니고 top.jsp 불러와야됨-->
  <div class="nav-bar">
    <div class="homepagelogo">
      <img width="70px" height="70px"
           src="https://blogpfthumb-phinf.pstatic.net/MjAyMjEwMTZfMTI3/MDAxNjY1OTExMjQzOTEw.UVI-Y_plYDNPSB0xvcf94a312JWd-9G13TGbY5zFLQgg.rB78JXJkmCKSUYARca2qkLUu6NGqdlYCUoIsJ-wmIsAg.PNG.beatitude98/profileImage.png?type=w161"
           alt="">
      <a href=""> 왼쪽엔 홈페이지 로고 </a>
    </div>

    <div class="navcategory">

      <a href=""> 여행지 </a>

      <a href=""> 미니샵 </a>

      <a href=""> 게시판 </a>

    </div>

    <div class="btn-group">
      <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown"
              aria-expanded="false">
        My page
      </button>

      <ul class="dropdown-menu">

        <li><a class="dropdown-item" href="#"> 내 정보 </a></li>
        <li><a class="dropdown-item" href="#"> 회원 정보 수정 </a></li>
        <li><a class="dropdown-item" href="#"> 장바구니 </a></li>
        <li>
          <hr class="dropdown-divider">
        </li>
        <li><a class="dropdown-item" href="#"> 로그아웃 </a></li>
      </ul>
    </div>
  </div>
  <!-- navbar 끝 -->

  <div class="route mt-3">
    장바구니
  </div>

  <div class="cart-container mt-3">
    <div class="cart-items">
      <h2>장바구니</h2>
      <hr>
      <!-- Replace the placeholders with your actual cart items -->
      <div class="cart-item">
        <span>Product 1</span>
        <span>9000원</span>
      </div>
      <div class="cart-item">
        <span>Product 2</span>
        <span>9000원</span>
      </div>
      <div class="cart-item">
        <span>Product 3</span>
        <span>9000원</span>
      </div>
      <hr>
      <div class="cart-item">
        <span>합 산</span>
        <span>27000원</span>
      </div>
    </div>

    <div class="cart-summary">
      <h2>영수증</h2>
      <hr>
      <div class="mb-3 d-flex justify-content-between">
        <span>총 상품금액</span>
        <span>27000원</span>
      </div>
      <hr>
      <div class="mb-3 d-flex justify-content-between">
        <span>배송비</span>
        <span>3천원</span>
      </div>
      <hr>
      <div class="mb-3 d-flex justify-content-between">
        <span>결제 예정 금액</span>
        <span>30000원</span>
      </div>
      <button class="btn btn-primary" style="width: 100%;">결제하기</button>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJ
    </script>
</body>
</html>