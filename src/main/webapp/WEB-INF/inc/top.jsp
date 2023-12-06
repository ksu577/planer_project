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
            transition: background-color 0.7s ease;
        }

        .letter {

            text-decoration: none;
            margin: 10px;
            padding: 30px;
            transition: color 0.7s ease;
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
    <div class="homepagelogo" style="padding-left: 20px">
        <img width="100px" height="100px"
             src="https://media.discordapp.net/attachments/1161840837647421475/1181133924332752956/marker-001.png?ex=657ff3af&is=656d7eaf&hm=bcaefc7a3c5f2dfb414d16ffe8be49dc15d9a2b7a673e23536598c8c10ca7e09&=&format=webp&quality=lossless&width=625&height=625"
             alt=""
             onclick="location.href='/'"
        >
    </div>

    <div class="navcategory">
        <a class="letter" href="/place/place.wow"> 여행지 </a>
        <a class="letter" href="/shop/minishop.wow"> 미니샵 </a>
        <a class="letter" href="/free/freeList.wow"> 게시판 </a>
    </div>

    <div class="manager-box">
        <c:if test="${user.getRole() =='MANAGER'}">

            <li class="nav-item dropdown">
                <a class="nav-link letter" href="#" role="button" data-bs-toggle="dropdown"
                   aria-expanded="false" style="height: 20px; display: flex; padding: 0;">
                    회원관리
                </a>
                <ul class="dropdown-menu" style="bottom: 100px;">
                    <li><a href="/member/memberList.wow">회원 목록</a></li>
                </ul>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-linK letter" href="#" role="button" data-bs-toggle="dropdown"
                   aria-expanded="false" style="margin-left: 30px; display: flex; padding: 0;">
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
            <a class="letter" href="/login/login.wow" style="text-decoration: none;">로그인</a>

            <a class="letter" href="/member/memberForm.wow" style="text-decoration: none;">회원가입</a>&nbsp;
        </div>
    </c:if>

    <c:if test="${user!=null}">
        <span class="letter" id="login_log" style="border-bottom: 1px;">${user.name} 님, 환영합니다.</span>

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
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
<script>
    window.onload = function () {
        scrollFunction();
    };

    function scrollFunction() {
        var navbar = document.getElementById("navbar");
        var id = document.getElementById("login_log");
        var letters = document.getElementsByClassName("letter");

        if (window.pageYOffset > 5) {
            navbar.style.backgroundColor = "#ffffff";
            id.style.color = "#000000";
            for (var i = 0; i < letters.length; i++) {
                letters[i].style.color = "#000000";
            }
        } else {
            navbar.style.backgroundColor = "transparent";
            id.style.color = "#ffffff";
            for (var i = 0; i < letters.length; i++) {
                letters[i].style.color = "#ffffff";
            }
        }
    }

    window.addEventListener('scroll', scrollFunction);
</script>

</body>