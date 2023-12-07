<%-- <%@page import="com.study.login.vo.UserVO"%> --%>
<%@page import="java.util.List" %>
<%@ page language="java"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<head>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    <style>

        @font-face {
            font-family: 'yg-jalnan';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'YanoljaYacheR';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/YanoljaYacheR.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'LOTTERIACHAB';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/LOTTERIACHAB.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        .homepagelogo{
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .logo{
            font-family: 'LOTTERIACHAB';
            font-size: 39px;
            color: #5d92d2;
            text-shadow: 1px 1px 2px #aabbe1;
        }

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

        .letter, .letter2 {
            text-decoration-line: none;
            margin: 10px;
            padding: 30px;
            transition: color 0.7s ease;
            color: white;
            font-family: 'yg-jalnan';
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
        <div class="logo" onclick="location.href='/'">
            G-ROUTE
        </div>
    </div>

    <div class="navcategory">
        <a class="letter" id="place" href="/"> 여행지 </a>
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
        <span class="letter2" id="login_log" style="border-bottom: 1px;">${user.name} 님, 환영합니다.</span>

        <div class="btn-group" style="height: 50px; width: 100px; right: 70px">
            <button type="button" class="btn btn-primary dropdown-toggle h-100 w-100" data-bs-toggle="dropdown"
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

    const place = document.getElementById("place");

    console.log(location.href)
    if (location.href != "http://localhost:8081/"){
        place.href = "http://localhost:8081/#box-title";
        console.log(place.href)
    } else {
        place.href = "#box-title";
        console.log(place.href)
    }

    window.onload = function () {
        scrollFunction();
    };

    function scrollFunction() {
        var navbar = document.getElementById("navbar");
        var id = document.getElementById("login_log");
        var letters = document.getElementsByClassName("letter");

        if (window.pageYOffset > 5) {
            if (id != null) {
                id.style.color = "#000000";
            }
            navbar.style.backgroundColor = "#ffffff";
            for (var i = 0; i < letters.length; i++) {
                letters[i].style.color = "#000000";
            }
        } else {
            navbar.style.backgroundColor = "transparent";
            if (id != null) {
                id.style.color = "#ffffff";
            }
            for (var i = 0; i < letters.length; i++) {
                letters[i].style.color = "#ffffff";
            }
        }
    }


    document.addEventListener('DOMContentLoaded', function () {
        const letterLink = document.querySelector('.letter');
        const boxTitle = document.querySelector('.box-title');

        letterLink.addEventListener('click', function (e) {
            // e.preventDefault(); // 링크의 기본 동작(페이지 이동) 방지

            const targetOffset = boxTitle.offsetTop; // 대상 요소의 위치 계산
            window.scrollTo({
                top: targetOffset,
                behavior: 'smooth' // 부드러운 스크롤 적용
            });
        });
    });

    window.addEventListener('scroll', scrollFunction);


</script>

</body>