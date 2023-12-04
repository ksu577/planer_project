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
            background-color: transparent;
            font-size: 20px;
            /*border: 1px solid red;*/
            height: 70px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: pointer;
            transition: background-color 0.5s ease;
        }

        .navcategory a {
            text-decoration: none;
            margin: 10px;
            padding: 30px;
        }

        .btn-gruop-right {
            display: flex;
        }

        .manager-box {
            display: flex;
            list-style-type: none;
        }


        ul {
            list-style: none;
        }

    </style>
</head>
<body>

<!-- navbar 시작 -->
<div class="nav-bar fixed-top" id="navbar">
    <div class="homepagelogo">
        <img width="70px" height="70px"
             src="https://blogpfthumb-phinf.pstatic.net/MjAyMjEwMTZfMTI3/MDAxNjY1OTExMjQzOTEw.UVI-Y_plYDNPSB0xvcf94a312JWd-9G13TGbY5zFLQgg.rB78JXJkmCKSUYARca2qkLUu6NGqdlYCUoIsJ-wmIsAg.PNG.beatitude98/profileImage.png?type=w161"
             alt="">
        <a href="/"> 왼쪽엔 홈페이지 로고 </a>
    </div>

    <div class="navcategory">
        <a href="/place/place.wow"> 여행지 </a>
        <a href="/shop/minishop.wow"> 미니샵 </a>
        <a href="/free/freeList.wow"> 게시판 </a>
    </div>

    <div class="manager-box">
        <c:if test="${user.getRole() =='MANAGER'}">

            <li class="nav-item dropdown">
                <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown"
                   aria-expanded="false" style="height: 20px">
                    회원관리
                </a>
                <ul class="dropdown-menu" STYLE="bottom: 100px">
                    <li><a href="/member/memberList.wow">회원 목록</a></li>
                </ul>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-linK" href="#" role="button" data-bs-toggle="dropdown"
                   aria-expanded="false" style="margin-left: 30px">
                    상품관리</a>
                <ul class="dropdown-menu">
                    <li><a href="/ManagerPage/managerproduct">상품 목록</a></li>
                    <li><a href="/product/productregist">상품 등록</a></li>
                </ul>
            </li>

        </c:if>
    </div>

    <c:if test="${user==null}">
        <div class="btn-gruop-right">
            <a href="/login/login.wow" style="text-decoration: none;">로그인</a>

            <a href="/member/memberForm.wow" style="text-decoration: none;">회원가입</a>&nbsp;
        </div>
    </c:if>

    <c:if test="${user!=null}">
        <span id="login_log" style="border-bottom: 1px solid white;">${user.name} 님, 환영합니다.</span>

        <div class="btn-group" style="right: 10px">
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
<script>
    window.onscroll = function () {
        scrollFunction()
    };

    function scrollFunction() {
        var navbar = document.getElementById("navbar");

        // 현재 스크롤 위치가 20px 이상이면 배경 색상을 흰색으로 변경
        if (document.body.scrollTop > 5 || document.documentElement.scrollTop > 5) {
            navbar.style.backgroundColor = "#b6d3e0"; // 원하는 색상으로 변경
        } else {
            navbar.style.backgroundColor = "transparent"; // 투명한 배경 색상으로 변경
        }
    }
</script>

</body>