<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>

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

        .item-box a {
            text-decoration: none;
        }

        .item-box {
            text-decoration: none;
            cursor: pointer;
            margin: auto;
            width: 1200px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            background-color: green;
            border-radius: 20px;
        }

        .item-box>div {
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
            background-color: greenyellow;
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
<%--여기가 확실하지 않은데 orderNum 인지 productNum인지 id 로 가져와야하는건지 모르겠다 순억아!!--%>
        <c:forEach var="product" items="${orderNum}">
            <div class="cell">
                <div class="top">
                    <img height="320px" width="328px" src="<c:out value="${product.img}" />" alt="">
                </div>
                <div class="bottom">
<%--                    klink엔 시부레 뭘 넣어야할까 --%>
                    <a href="<c:out value="${product.link}" />"> <c:out value="${product.name}" /> </a>
                    <a> <c:out value="${product.price}" /> </a>
                </div>
            </div>
        </c:forEach>
</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>


</body>
</html>

