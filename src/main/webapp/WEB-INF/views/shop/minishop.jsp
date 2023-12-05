<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@include file="/WEB-INF/inc/header.jsp" %>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
          crossorigin="anonymous">


    <title></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          rel="stylesheet">
    <style>
        .container {
            padding-top: 70px;
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
            background-color: rgb(255, 255, 255);
            box-shadow: none; /* 초기에는 그림자 없음 */
            transition: box-shadow 0.3s ease; /* 그림자에 트랜지션 효과 적용 */
        }

        .cell:hover {
            box-shadow: 0px 0px 3px 2px rgb(92, 54, 54); /* 마우스 호버 시 그림자 나타남 */
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


        }

        .item-box>div {
            width: calc(1200px / 4 - 20px);
            height: 400px;
            border: solid 1px lightgrey;
            border-bottom: 20px;
            overflow: hidden;
            margin: 10px;

        }

        .top {
            height: 80%;
            box-shadow: 0px 0px 4px 2px gainsboro;
        }

        .bottom {
            display: flex;
            justify-content: space-between;
            height: 20%;
            flex-direction: column;
        }

        .bottom a {
            color: black;
            padding-top: 8px;
            padding-bottom: 8px;
            padding-left: 12px;
            padding-right: 12px;
            cursor: pointer;
            font-size: 20px;

        }
        .top-background{
            height: 70px;
            background-color: #98dde3;
        }

    </style>

</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>

<div class="top-background">

</div>
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
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample"
                data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample"
                data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <div>

        <c:if test="${user.getRole()=='MANAGER'}">
        <button type="button" class="regist" onclick="registProduct()">물건 등록</button>
    </div>
    </c:if>



    <div class="item-box">
        <c:forEach var="product" items="${list}">
            <div class="cell" onclick="detailView(${product.productId})">
                <img alt=""
                     src="<%=request.getContextPath()%>/imgDownload/showImg.wow?fileName=${product.img}&filePath=${product.imgPath}"
                     width="320px" height="328px">
                <div class="bottom">
                    <a href="#">${product.productName}</a>
                    <a href="#">${product.productPrice} 원</a>
                </div>
            </div>
        </c:forEach>
    </div>



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