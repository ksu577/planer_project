<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <% request.setCharacterEncoding("UTF-8"); %>
  <%@include file="/WEB-INF/inc/header.jsp" %>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>결제페이지</title>

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
    .paycontainer {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .navcategory a {
      text-decoration: none;
      margin: 10px;
      padding: 30px;
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
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="container">
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
      장바구니 > 주문결제 > 주문완료
    </div>

    <div class="paycontainer mt-3">
      <div class="address col-md-8">
        <h2>배송지정보</h2>
        <hr>
        <form>
          <div class="mb-3">
            <label for="deliveryAddress" class="form-label">배송지선택</label>
            <input type="text" class="form-control" id="deliveryAddress">
            <button class="btn btn-primary mt-2" onclick="searchAddress()">+ 주소검색</button>
          </div>
          <div class="mb-3">
            <label for="recipientName" class="form-label">받는사람</label>
            <input type="text" class="form-control" id="recipientName">
          </div>
          <div class="mb-3">
            <label for="phoneNumber" class="form-label">휴대폰 번호</label>
            <input type="tel" class="form-control" id="phoneNumber" placeholder="숫자만 입력">
          </div>
          <div class="mb-3">
            <label for="address" class="form-label">주소입력</label>
            <input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호">
            <button class="btn btn-primary mt-2" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
            <input type="text" class="form-control mt-2" id="sample6_address" placeholder="주소">
            <input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소">
            <input type="text" class="form-control" id="sample6_extraAddress" placeholder="참고항목">
          </div>

          <div class="mb-3">
            <label for="deliveryRequest" class="form-label">배송 요청 사항</label>
            <select class="form-select" id="deliveryRequest">
              <option value="">배송 시 요청 사항을 선택해주세요.</option>
              <option value="경비실에 맡겨주세요.">경비실에 맡겨주세요.</option>
              <option value="택배보관함에 넣어놔주세요.">택배보관함에 넣어놔주세요.</option>
              <option value="집 현관문 앞에 놓아주세요.">집 현관문 앞에 놓아주세요.</option>
            </select>
          </div>
        </form>
      </div>
      <div class="bill col-md-4">
        <div class="mb-3 d-flex justify-content-between">
          <span>총 상품금액</span>
          <span>배송비</span>
        </div>
        <hr>
        <div class="mb-3">
          <span>결제 예정 금액</span>
        </div>
        <button class="btn btn-primary" style="width: 100%;">결제하기</button>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-HwwvtgBNo3bZJJ