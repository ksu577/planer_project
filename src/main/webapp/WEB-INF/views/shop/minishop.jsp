<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@include file="/WEB-INF/inc/header.jsp" %>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">


    <title></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <style>

        .container {
            width: 1225px;
        }

        .selectcategory {
            text-align: right;

        }

        .carousel {
            width: 1200px;
            height: 600px;
            overflow: hidden;
        }

        .cell {
            background-color: white;
            /*border-radius: 20px;*/
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
            /*border-radius: 20px;*/
        }

        .item-box > div {
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
            /*border-radius: 20px;*/
            box-shadow: 0px 0px 4px 2px gainsboro;
        }

        .bottom {
            display: flex;
            justify-content: space-between;
            height: 20%;
            background-color: #0d6efd;
            color: rgb(0, 102, 0);
            flex-direction: column;
        }

        .bottom a {
            color: white;
            padding-top: 8px;
            padding-bottom: 8px;
            padding-left: 12px;
            padding-right: 12px;
            /*border-radius: 20px;*/
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
                <img id="#" src="${product.img}" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="${product.img}" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="${product.img}" class="d-block w-100" alt="...">
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

    <div>

<c:if test="${user.getRole()=='MANAGER'}">
        <button type="button" class="regist" onclick="registProduct()">물건 등록</button> </div>
    </c:if>

    <div class="selectcategory">
        <div class="btn-group">
            <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown"
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

        <c:forEach var="product" items="${list}">
            <div class="cell" onclick="detailView(${product.productId})">
                <div class="top" >
                    <img height="320px" width="328px" src="${product.img}" alt="">
                </div>
                <div class="bottom">
                    <a href="#"> ${product.productName} </a>
                    <a href="#"> ${product.productPrice} 원</a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"--%>
<%--        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"--%>
<%--        crossorigin="anonymous"></script>--%>

<script>
    function detailView(productId) {
        window.location.href = "/product/productview.wow?productId=" + productId;
    }

    function registProduct() {
        window.location.href = "/product/productregist";
    }
</script>


</body>
</html>

