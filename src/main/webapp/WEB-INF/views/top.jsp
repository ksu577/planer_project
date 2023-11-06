<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>topnavbar</title>

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

        .navcategory a{
            text-decoration: none;
            margin: 10px;
            padding: 30px;
        }

    </style>
</head>
<body>

<%@include file="/WEB-INF/inc/top.jsp" %>

<!-- navbar 시작 -->
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>



</body>
</html>
