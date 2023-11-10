<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@include file="/WEB-INF/inc/header.jsp" %>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">


<style>
    .container {
        width: 1225px;
    }

    .selectcategory {
        text-align: right;

    }

    .carousel{
        width: 1200px;
        height: 600px;
        overflow: hidden;
    }

    .cell {
        background-color: white;
        border-radius: 20px;
        box-shadow: 0px 0px 4px 2px gainsboro;
    }

    .place-box a {
        text-decoration: none;
    }

    .place-box {
        text-decoration: none;
        cursor: pointer;
        margin: auto;
        width: 1200px;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
        border-radius: 20px;
    }

    .place-box>div {
        width: calc(1200px / 4 - 20px);
        height: 400px;
        border: 0;
        box-shadow: 1px 1px 4px 1px black;
        border-bottom: 20px;
        overflow: hidden;
        margin: 10px;
    }

    .top {
        height: 80%;
        border-radius: 20px;
        box-shadow: 0px 0px 4px 2px gainsboro;
    }

    .bottom {
        display: flex;
        align-items: center;
        justify-content: space-between;
        height: 20%;
        color: rgb(0, 102, 0);
        flex-direction: column;
    }

    .bottom a {
        color: rgb(0, 102, 0);
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 12px;
        padding-right: 12px;
        border-radius: 20px;
        cursor: pointer;
    }

</style>

</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>

<div class="container">
    <div class="selectcategory">
        <div class="btn-group">
            <button type="button" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown"
                    aria-expanded="false">
                보는순서설정
            </button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#"> 인기상품순 </a></li>
                <li><a class="dropdown-item" href="#"> 낮은가격순 </a></li>
                <li><a class="dropdown-item" href="#"> 높은가격순 </a></li>
            </ul>
        </div>
    </div>
    <div class="place-box">
        <div class="cell">
            <div class="top">
                <img height="320px" width="328px" src="/resources/images/보조배터리.jpeg" alt="" >
            </div>
            <div class="bottom">
                <a href=""> 장소명 영어 </a>
                <a href=""> 장소명 한글 </a>
            </div>
        </div>
        <div class="cell">
            <div class="top">
                <img height="320px" width="328px" src="../resources/images/22.png" alt="">
            </div>
            <div class="bottom">
                <a href=""> 장소명 영어 </a>
                <a href=""> 장소명 한글 </a>
            </div>
        </div>
        <div class="cell">
            <div class="top">
                <img height="320px" width="328px" src="../resources/images/22.png" alt="">
            </div>
            <div class="bottom">
                <a href=""> 장소명 영어 </a>
                <a href=""> 장소명 한글 </a>
            </div>
        </div>

        <div class="cell">
            <div class="top">
                <img height="320px" width="328px" src="../resources/images/22.png" alt="">
            </div>
            <div class="bottom">
                <a href=""> 장소명 영어 </a>
                <a href=""> 장소명 한글 </a>
            </div>
        </div>

        <div class="cell">
            <div class="top">
                <img height="320px" width="328px" src="../resources/images/22.png" alt="">
            </div>
            <div class="bottom">
                <a href=""> 장소명 영어 </a>
                <a href=""> 장소명 한글 </a>
            </div>
        </div>

        <div class="cell">
            <div class="top">
                <img height="320px" width="328px" src="../resources/images/22.png" alt="">
            </div>
            <div class="bottom">
                <a href=""> 장소명 영어 </a>
                <a href=""> 장소명 한글 </a>
            </div>
        </div>


        <div class="cell">
            <div class="top">
                <img height="320px" width="328px" src="../resources/images/22.png" alt="">
            </div>
            <div class="bottom">
                <a href=""> 장소명 영어 </a>
                <a href=""> 장소명 한글 </a>
            </div>
        </div>

        <div class="cell">
            <div class="top">
                <img height="320px" width="328px" src="../resources/images/22.png" alt="">
            </div>
            <div class="bottom">
                <a href=""> 장소명 영어 </a>
                <a href=""> 장소명 한글 </a>
            </div>
        </div>

        <div class="cell">
            <div class="top">
                <img height="320px" width="328px" src="../resources/images/22.png" alt="">
            </div>
            <div class="bottom">
                <a href=""> 장소명 영어 </a>
                <a href=""> 장소명 한글 </a>
            </div>
        </div>

        <div class="cell">
            <div class="top">
                <img height="320px" width="328px" src="../resources/images/22.png" alt="">
            </div>
            <div class="bottom">
                <a href=""> 장소명 영어 </a>
                <a href=""> 장소명 한글 </a>
            </div>
        </div>


        <div class="cell">
            <div class="top">
                <img height="320px" width="328px" src="../resources/images/22.png" alt="">
            </div>
            <div class="bottom">
                <a href=""> 장소명 영어 </a>
                <a href=""> 장소명 한글 </a>
            </div>
        </div>

        <div class="cell">
            <div class="top">
                <img height="320px" width="328px" src="../resources/images/22.png" alt="">
            </div>
            <div class="bottom">
                <a href=""> 장소명 영어 </a>
                <a href=""> 장소명 한글 </a>
            </div>
        </div>

        <div class="cell">
            <div class="top">
                <img height="320px" width="328px" src="../resources/images/22.png" alt="">
            </div>
            <div class="bottom">
                <a href=""> 장소명 영어 </a>
                <a href=""> 장소명 한글 </a>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>


</body>
</html>
