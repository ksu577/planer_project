<%-- <%@page import="com.study.login.vo.UserVO"%> --%>
<%@page import="java.util.List" %>
<%@ page language="java"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<head>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    <style>
        .nav-bar {
            font-size: 20px;
            border: 1px solid red;
            height: 70px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: linear-gradient(to right, #b6d3e0, #65c4ea);
        }

        .navcategory a {
            text-decoration: none;
            margin: 10px;
            padding: 30px;
        }

        .navcategory {
            display: flex;
        }

        .btn-gruop-right {
            display: flex;

        }

        .btn-gruop-right > a {
            margin: 10px;
        }

        .name {
            margin-right: -200px;
        }



    </style>
</head>
<body>

<!-- navbar 시작 -->
<div class="nav-bar fixed-top">
    <div class="homepagelogo">
        <img width="70px" height="70px"
             src="https://blogpfthumb-phinf.pstatic.net/MjAyMjEwMTZfMTI3/MDAxNjY1OTExMjQzOTEw.UVI-Y_plYDNPSB0xvcf94a312JWd-9G13TGbY5zFLQgg.rB78JXJkmCKSUYARca2qkLUu6NGqdlYCUoIsJ-wmIsAg.PNG.beatitude98/profileImage.png?type=w161"
             alt="">
        <a href="/"> 왼쪽엔 홈페이지 로고 </a>
    </div>

    <div class="navcategory">
        <a href="/place/place.wow" style="padding-top: 57px "> 여행지 </a>
        <a href="/shop/minishop.wow" style="padding-top: 57px "> 미니샵 </a>
        <a href="/free/freeList.wow" style="padding-top: 57px "> 게시판 </a>

        <c:if test="${user.getRole() =='MANAGER'}">
            <li class="nav-item dropdown" style="padding-bottom: 25px">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                   aria-expanded="false">
                    회원관리
                </a>
                <ul class="dropdown-menu">
                    <li><a href="/ManagerPage/managerproduct">회원 목록</a></li>
                </ul>
            </li>

            <li class="nav-item dropdown"  style="" >
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                   aria-expanded="false">
                    상품관리
                </a>
                <ul class="dropdown-menu" >
                    <li><a href="/ManagerPage/managerproduct">상품 목록</a></li>
                    <li><a href="/product/productregist">상품 등록</a></li>
                </ul>
            </li>

        </c:if>

    </div>


    <c:if test="${user==null}">
        <div class="btn-gruop-right">
            <a href="/login/login.wow">로그인</a>

            <a href="/member/memberForm.wow">회원가입</a>
        </div>
    </c:if>

    <c:if test="${user!=null}">
        <span class="name" id="login_log" style="border-bottom: 1px solid white;">${user.name} 님, 환영합니다.</span>

        <div class="btn-group">
            <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown"
                    aria-expanded="false">
                My page
            </button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/member/memberView.wow"> 내 정보 </a></li>
                <li><a class="dropdown-item" href="/member/memberEdit.wow"> 회원 정보 수정 </a></li>
                <li><a class="dropdown-item" href="/plan/myPlan.wow"> 나의 여행 일정 </a></li>
                <li><a class="dropdown-item" href="/cart/shoppingcartview"> 장바구니 </a></li>
                <li>
                    <hr class="dropdown-divider">
                </li>
                <li><a class="dropdown-item" href="/login/logout.wow"> 로그아웃 </a></li>
            </ul>
        </div>
    </c:if>
</div>
<!-- navbar 끝 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>

</body>