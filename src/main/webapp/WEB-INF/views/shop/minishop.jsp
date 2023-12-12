<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
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
            overflow: hidden;
        }

        .cell img {
            width: 100%;
            height: 100%;
            object-fit: cover;
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

        .item-box > div {
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
            font-size: 15px;

        }

        .carousel-item img {

        }

        .top-background {
            height: 70px;
            background-color: #98dde3;
        }

        .main-wing__fixed {
            position: fixed;
            top: 30%;
            z-index: 1000;
            right: 10%;

        }

        .main-wing__box {
            width: 70px;
            margin-bottom: 10px;
            display: flex;
            justify-content: flex-end;
        }

        .wing-box__cart {
            border-bottom-left-radius: 0;
            border-bottom-right-radius: 0;
        }

        .wing-box__cart a:before {
            width: 34px;
            height: 34px;
            background-size: contain;
            background-repeat: no-repeat;
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg width='48' height='48' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='%23555' stroke-linejoin='round' stroke-width='2.8235294118' d='m15.48 29.038-2.597-14.807H40.08a1 1 0 0 1 .985 1.173l-2.392 13.634a2 2 0 0 1-1.97 1.654H17.451a2 2 0 0 1-1.97-1.654Z'/%3E%3Ccircle cx='20.923' cy='37.846' r='3.615' stroke='%23555' stroke-width='2.8235294118'/%3E%3Ccircle cx='33.231' cy='37.846' r='3.615' stroke='%23555' stroke-width='2.8235294118'/%3E%3Cpath stroke='%23555' stroke-linecap='round' stroke-width='2.8235294118' d='M6.726 7.9h4.035a1 1 0 0 1 .977.788L13 14.5'/%3E%3C/svg%3E");
            content: "";
            display: block;
            margin: -4px auto 4px;
        }

        .wing-box {
            border: 1px solid #e7e7e7;
            padding: 15px 0 12px 0;
            line-height: 14px;
            text-align: center;
            background-color:  transparent;
            border-radius: 4px;
        }

        .wing-box__link:visited {
            color: #555;
        }

        .wing-box__link{
            font-size: 12px;
            display: block;
            position: relative;
            letter-spacing: -0.2px;
        }
        .main-wing__box .wing-box__link {
            color: black; /* 원하는 텍스트 색상으로 변경, 예: 검정색 */
        }

        a {
            text-decoration: none;
            cursor: pointer;

        }

        .wing-box__link .txt{
            display: inline-block;
            text-align: center;
        }

        .regist {
            background-color: #98dde3;
            font-family: 'yg-jalnan';
            font-size: 15px;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>

</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>

<div class="top-background">

</div>
<div class="container">
    <div id="carouselExample" class="carousel slide" data-bs-ride="carousel" data-bs-interval="4000" style="transform: translate(4.5%, 0%)">
        <div class="carousel-inner" style="height: 100%">
            <div class="carousel-item active" style="height: 100%;">
                <img src="/resources/img/route.jpg" class="d-block w-100" height="100%" alt="">
            </div>
            <div class="carousel-item" style="height: 100%;">
                <img src="/resources/img/수면세트.png" class="d-block w-100" height="100%" alt="">
            </div>
            <div class="carousel-item" style="height: 100%;">
                <img src="/resources/img/응급키트.png" class="d-block w-100" height="100%" alt="">
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

    <div class="main-wing__fixed">
        <div>
            <c:if test="${user.getRole()=='MANAGER'}">
                <button type="button" class="wing-box__link regist" onclick="registProduct()">물건 등록</button>
            </c:if>
        </div>
        <br>
        <br>
        <div class="main-wing__box">
            <div class="wing-box wing-box__cart">
                <a href="javascript:void(0);" class="wing-box__link" onclick="goToShoppingCart()" onmousedown="trkEventLog('메뉴_장바구니');">
                    <span class="txt">장바구니</span>
                </a>
            </div>
        </div>
    </div>



    <div class="item-box" style="padding-top: 50px; " >
        <c:forEach var="product" items="${list}" >
            <div class="cell" onclick="detailView(${product.productId})" style="margin: 10px; margin-top: 30px; margin-left: 10px; margin-right: 10px">
                <img style="height: 300px" alt=""
                     src="<%=request.getContextPath()%>/imgDownload/showImg.wow?fileName=${product.img}&filePath=${product.imgPath}"
                     width="320px" height="328px">
                <div class="bottom">
                    <a href="#">${product.productName}</a>
                    <a href="#">${product.productPrice} 원</a>
                </div>
            </div>
        </c:forEach>
    </div>

</div>


<script>
    function detailView(productId) {
        window.location.href = "/product/productview.wow?productId=" + productId;
    }

    function registProduct() {
        window.location.href = "/product/productregist";
    }

    function goToShoppingCart() {
        // 여기에서 현재 페이지에서의 이동 로직을 추가하세요
        window.location.href = "/cart/shoppingcartview";
    }



</script>


</body>

</html>