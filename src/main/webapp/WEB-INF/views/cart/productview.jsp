<%--
  Created by IntelliJ IDEA.
  User: pc32
  Date: 23. 11. 9.
  Time: 오후 3:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>

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
<div class="container">
  <h1 class="text-center">상품 상세 페이지</h1>
  <div class="row">
    <div class="col-md-6">
      <div class="col-md-6">
        <div id="carouselExample" class="carousel slide">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="/resources/images/보조배터리.jpeg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
              <img src="/resources/images/보조배터리.jpeg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
              <img src="/resources/images/보조배터리.jpeg" class="d-block w-100" alt="...">
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
      <div class="product-title">상품명: 보조배터리</div>
      <div class="product-price">가격 : 23000원 </div>
      <div class="product-description">
        상품 설명: 이 상품은 휴대용 보조배터리로, 휴대폰이나 태블릿을 충전할 때 유용합니다. 고객들에게 매우 인기 있는 제품입니다.
      </div>

      <div class="product-options">
        <label for="product-options">색상 선택 </label>
        <select id="product-options">
          <option value="option1">빨간색</option>
          <option value="option2">파랑색</option>
          <option value="option3">검은색</option>
        </select>
      </div>

      <div class="product-quantity">
        <label for="product-quantity">수량 </label>
        <select id="product-options">
          <option value="1"> 1</option>
          <option value="2"> 2</option>
          <option value="3"> 3</option>
          <option value="4"> 4</option>
          <option value="5"> 5</option>
          <option value="6"> 6</option>
          <option value="7"> 7</option>
          <option value="8"> 8</option>
          <option value="9"> 9</option>
          <option value="10"> 10</option>
        </select> 개
      </div>

      <div class="product-buttons">
        <button class="btn btn-primary">장바구니에 담기</button>
        <button class="btn btn-primary">구매하기</button>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
