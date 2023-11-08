<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문서페이지</title>

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
                <h2>주문정보</h2>
                <hr>
                <form>
                    <div class="mb-3">
                        <label for="deliveryAddress" class="form-label">배송지 : </label>
                    </div>
                    <div class="mb-3">
                        <label for="recipientName" class="form-label">수령인 : </label>
                    </div>
                    <div class="mb-3">
                        <label for="phoneNumber" class="form-label">연락처 : </label>
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">주소입력 : </label>
                    </div>

                    <div class="mb-3">
                        <label for="deliveryRequest" class="form-label">배송 메모 : </label>
                    </div>
                </form>
            </div>
            <div class="bill col-md-4">
                <div class="mb-3" style="display: flex; flex-direction: column;">
                    <span>총 상품금액</span>
                    <span>배송비</span>
                </div>
                <hr>
                <div class="mb-3">
                    <span>결제 예정 금액</span>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJ