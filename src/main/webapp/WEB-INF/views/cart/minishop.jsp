<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>

<div id="carouselExample" class="carousel slide">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="/resources/images/연습용이미지1.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="/resources/images/연습용이미지2.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="/resources/images/연습용이미지3.png" class="d-block w-100" alt="...">
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

<div class="item-box">

    <div class="cell">
        <div class="top">
            <img height="320px" width="328px" src="../resources/images/22.png" alt="">
        </div>
        <div class="bottom">
            <a href=""> 상품명 </a>
            <a> 가격 </a>
        </div>
    </div>


    <div class="cell">
        <div class="top">
            <img height="320px" width="328px" src="../resources/images/22.png" alt="">
        </div>
        <div class="bottom">
            <a href=""> 상품명 </a>
            <a> 가격 </a>
        </div>
    </div>

    <div class="cell">
        <div class="top">
            <img height="320px" width="328px" src="../resources/images/22.png" alt="">
        </div>
        <div class="bottom">
            <a href=""> 상품명 </a>
            <a> 가격 </a>
        </div>
    </div>

    <div class="cell">
        <div class="top">
            <img height="320px" width="328px" src="../resources/images/22.png" alt="">
        </div>
        <div class="bottom">
            <a href=""> 상품명 </a>
            <a> 가격 </a>
        </div>
    </div>

    <div class="cell">
        <div class="top">
            <img height="320px" width="328px" src="../resources/images/22.png" alt="">
        </div>
        <div class="bottom">
            <a href=""> 상품명 </a>
            <a> 가격 </a>
        </div>
    </div>


    <div class="cell">
        <div class="top">
            <img height="320px" width="328px" src="../resources/images/22.png" alt="">
        </div>
        <div class="bottom">
            <a href=""> 상품명 </a>
            <a> 가격 </a>
        </div>
    </div>

    <div class="cell">
        <div class="top">
            <img height="320px" width="328px" src="../resources/images/22.png" alt="">
        </div>
        <div class="bottom">
            <a href=""> 상품명 </a>
            <a> 가격 </a>
        </div>
    </div>

    <div class="cell">
        <div class="top">
            <img height="320px" width="328px" src="../resources/images/22.png" alt="">
        </div>
        <div class="bottom">
            <a href=""> 상품명 </a>
            <a> 가격 </a>
        </div>
    </div>

    <div class="cell">
        <div class="top">
            <img height="320px" width="328px" src="../resources/images/22.png" alt="">
        </div>
        <div class="bottom">
            <a href=""> 상품명 </a>
            <a> 가격 </a>
        </div>
    </div>


    <div class="cell">
        <div class="top">
            <img height="320px" width="328px" src="../resources/images/22.png" alt="">
        </div>
        <div class="bottom">
            <a href=""> 상품명 </a>
            <a> 가격 </a>
        </div>
    </div>

    <div class="cell">
        <div class="top">
            <img height="320px" width="328px" src="../resources/images/22.png" alt="">
        </div>
        <div class="bottom">
            <a href=""> 상품명 </a>
            <a> 가격 </a>
        </div>
    </div>

    <div class="cell">
        <div class="top">
            <img height="320px" width="328px" src="../resources/images/22.png" alt="">
        </div>
        <div class="bottom">
            <a href=""> 상품명 </a>
            <a> 가격 </a>
        </div>
    </div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>


</body>
</html>

