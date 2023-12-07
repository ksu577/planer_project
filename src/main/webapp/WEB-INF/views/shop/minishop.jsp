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
            max-height: 500px; /* 또는 다른 원하는 크기로 조절 */
            width: 100%; /* 이미지가 부모 요소에 꽉 차도록 함 */
            object-fit: cover; /* 이미지 비율을 유지한 채로 부모 요소에 맞춤 */
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

    </style>

</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>

<div class="top-background">

</div>
<div class="container">
    <div id="carouselExample" class="carousel slide" data-bs-ride="carousel" data-bs-interval="4000" style="transform: translate(4.5%, 0%)">
        <div class="carousel-inner">
            <div class="carousel-item active" style="height: 500px;">
                <img src="https://img.asiatoday.co.kr/file/2015y/07m/13d/2015071301001337300071601.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://cdn1.domeggook.com/upload/event/2022/04/07/16492911752D1034714CECAF752F3385/16492911752D1034714CECAF752F3385_mo_0.png?hash=068aa784014dca97ec0b75fa3d075533" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://media.discordapp.net/attachments/825344638575181835/1182192834682552410/coupang20see.png?ex=6583cddf&is=657158df&hm=d14aec8c28e36c56ee0111d6d66465171814b5be5482634b3f46c1e57233acba&=&format=webp&quality=lossless" class="d-block w-100" alt="...">
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
        <div class="main-wing__box">
            <div class="wing-box wing-box__cart">
                <a href="javascript:void(0);" class="wing-box__link" onclick="goToShoppingCart()" onmousedown="trkEventLog('메뉴_장바구니');">

                    <span class="txt">장바구니</span>
                </a>
            </div>
        </div>
    </div>


    <div>

        <c:if test="${user.getRole()=='MANAGER'}">
            <button type="button" class="regist" onclick="registProduct()">물건 등록</button>

        </c:if>
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