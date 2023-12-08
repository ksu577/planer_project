<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <style>

        @font-face {
            font-family: 'JalnanGothic';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/JalnanGothic.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        body {
            margin: 0;
            background-color: #f1f1f1;
            justify-content: center;
        }

        ::-webkit-scrollbar {
            width: 5px;
        }

        ::-webkit-scrollbar-thumb {
            background-color: gainsboro;
            border-radius: 5px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background-color: darkgray;
        }


        .container1 {
            width: 99.7vw;
            height: 100vh;
            position: relative;
            background-color: #98dde3;
        }

        .imgcover {
            width: 25%;
            height: 80%;
            position: relative;
            transform: translate(250%, 20%);
            z-index: 1;
        }

        .search-travel-cover {
            position: absolute;
            z-index: 9999;
            height: 60px;
            border-bottom: 2px solid white;
            transform: translate(130%, -200%);
        }

        .plan-count {
            position: absolute;
            right: 350px;
            bottom: 50px;
        }

        .plan-count > div {
            font-family: 'JalnanGothic';
            text-align: end;
            color: white;
            margin-bottom: 20px;
        }

        @font-face {
            font-family: 'HakgyoansimWoojuR';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/HakgyoansimWoojuR.woff2') format('woff2');
            font-weight: bold;
            font-style: normal;
        }

        .plan-count > div > h2 {
            font-family: 'HakgyoansimWoojuR';
        }

        .search-travel {
            width: 480px;
            height: 60px;
            outline: none;
            border: 1px solid transparent;
            background: transparent;
            padding: 0;
            margin: 0;
            font-size: 30px;
            color: white;
            font-weight: 500;
            text-align: center;
        }

        .search-travel::placeholder {
            color: white;
        }

        .cover1 {
            background: linear-gradient(to right, #98dde3, #0ea5e9);
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

        .cover1 > p {
            font-family: 'JalnanGothic';
            color: white;
            font-size: 55px;
            font-weight: 200;
            transform: translate(30%, 120%);
            position: absolute;
        }

        .container2 {
            width: 99.7vw;
            height: 100vh;
            position: relative;
        }

        .container2 > img {
            width: 99.7vw;
            height: 100vh;
            position: relative;
            filter: brightness(110%);
        }

        .cover2 {
            background-color: rgba(0, 0, 0, 0.4);
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

        .cover2 > p {
            color: white;
            font-size: 80px;
            font-weight: 200;
            transform: translate(30%, 100%);
            position: absolute;
        }

        .container3 {
            width: 99.7vw;
            height: 100vh;
            position: relative;
        }

        .container3 > img {
            width: 99.7vw;
            height: 100vh;
            position: relative;
            filter: brightness(110%);
        }

        .cover3 {
            background-color: rgba(0, 0, 0, 0.4);
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

        .cover3 > p {
            color: white;
            font-size: 80px;
            font-weight: 200;
            transform: translate(30%, 100%);
            position: absolute;
        }

        .container4 {
            position: relative;
            padding-top: 80px;
            width: 99.7vw;
            height: 80vh;
            font-family: 'Arial', sans-serif;
        }

        .cover4 {
            width: 100%;
            height: 100%;
        }

        .p_cover {
            border-bottom: 2px solid gainsboro;
            height: 150px;
            width: 700px;
            margin: auto;
        }

        .p_cover > p {
            font-size: 40px;
            position: absolute;
            transform: translate(0%, 120%);
            font-family: 'JalnanGothic';
        }

        .ranking-container {
            width: 80%;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transform: translate(13%, 40%);
            border: 2px solid #98dde3;
        }

        .number {
            width: 50px;
            font-size: 16px;
            color: #555;
            margin-right: 10px; /* 여백을 추가했습니다. */
        }

        .ranking-item {
            padding: 15px;
            border-bottom: 1px solid #eee;
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .ranking-item:hover {
            background-color: #f8f8f8;
        }

        .rank {
            width: 50px;
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .keyword {
            width: 150px;
            font-size: 16px;
            color: #555;
        }

        .addr {
            font-size: 16px;
            color: #555;
        }

        .go-trip {
            font-size: 50px;
            position: absolute;
            transform: translate(100%, 1000%);
        }

        .go-trip2 {
            font-size: 50px;
            position: absolute;
            transform: translate(100%, 100%);
        }

        .ranking-container > div:first-child {
            font-weight: 900;
        }

        .container5 {
            padding-top: 300px;
            width: 1700px;
            padding-left: 240px;
            text-align: center;
        }


        .cell {
            text-align: center;
            height: 330px;
            background-color: white;
        }


        .cell {
            background-color: rgb(255, 255, 255);
            box-shadow: none; /* 초기에는 그림자 없음 */
            transition: box-shadow 0.3s ease, transform 0.5s ease; /* 그림자에 트랜지션 효과 적용 */
        }

        .cell > .bottom > h1 {
            text-align: end;
        }

        .cell:hover {
            border-radius: 20px;
            /*box-shadow: 0px 0px 3px 2px rgb(135, 206, 250); !* 마우스 호버 시 그림자 나타남 *!*/
            transform: scale(1.1); /* 이미지 크기를 1.1배로 확대 */
        }

        .place-box a {
            text-decoration: none;
        }

        .place-box {
            padding-top: 70px;
            text-decoration: none;
            cursor: pointer;
            margin: auto;
            width: 1400px;
            display: flex;
            flex-wrap: wrap;
            border-radius: 20px;
        }

        .place-box > div {
            width: calc(100% / 4 - 20px);
            height: 400px;
            border: 0;
            border-bottom: 20px;
            overflow: hidden;
            margin: 10px;
        }

        .top > img {
            border-radius: 20px;
        }

        .top > img:hover {
            box-shadow: 0px 0px 3px 3px rgb(135, 206, 250); /* 마우스 호버 시 그림자 나타남 */
        }


        .bottom {
            text-align: center;
            padding-top: 10px;
            display: flex;
            align-items: self-end;
            /*align-items: center; 지역 글씨 가운데로 내 생각엔 오른쪽 끝이 이뻐서 그렇게 해둠*/
            justify-content: space-between;
            width: 232px;
            height: 65px;
            color: black;
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

        .bottom h3 {
            text-align: left;
        }

        .modalcontainer {
            margin: 10px;
            padding: 10px;
            display: flex;
            align-items: center;
            justify-content: space-between;;
        }

        /*.nav-bar>div:nth-child(1)*/
        .modalcontainer > div {
            text-align: left;
            margin: 20px;
            padding: 20px;
            border: 1px red;
            width: 90%;
            height: 90%;
        }


        .modal2 {
            z-index: 5;
            background-color: white;
            width: 400px;
            height: 300px;
            border-radius: 20px;
            box-shadow: 1px 1px 1px 3px gainsboro;
            position: fixed;
            top: 10%;
            left: 50%;
            transform: translate(-50%, 20%);
        }

        .align-end2 {
            text-align: end;
        }

        @keyframes summon {
            0% {
                height: 0;
                width: 0;
            }

            100% {
                height: 512px;
                width: 960px;
            }
        }

        @keyframes down {
            0% {
                top: 0%;
                transform: translate(-50%, -100%);
            }

            100% {
                top: 10%;
                transform: translate(-50%, 0);
            }
        }

        .modal-summon {
            /*animation: summon 1s forwards; 애니메이션 효과로 뜨게하는거 아래는 바로 뜨게하는거*/
            animation: summon forwards;
        }

        .box-title {
            display: flex;
            align-content: center;
            justify-content: center;
            font-size: 50px;
            font-family: 'yg-jalnan';
        }

        .d-none2 {
            display: none;
        }

        #overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1;
        }

        .search-local-cover {
            box-shadow: 1px 1px 10px 2px gainsboro;
            margin-top: 100px;
            transform: translate(72%);
            width: 600px;
            height: 60px;
            border-radius: 30px;
        }

        .search-local {
            transform: translate(2%, 10%);
            outline: none;
            border: 1px solid transparent;
            background: transparent;
            width: 500px;
            height: 50px;
            text-align: center;
            font-size: 25px;
        }

        .footer-container {
            margin-top: 100px;
            background-color: rgba(220, 220, 220, 0.30);
            height: 310px;
            color: #868e96;
        }

        h5 {
            width: 500px;
            transform: translate(40%, 100%);
            padding-top: 10px;
            color: white;
        }

        h4 {
            width: 500px;
            transform: translate(40%, 300%);
        }

        .footer-icons {
            width: 350px;
            /*border: 1px solid red;*/
            transform: translate(430%, -180%);
            display: flex;

        }

        .footer-icon {
            height: 50px;
            width: 50px;
            border-radius: 50px;
            /*border: 1px solid black;*/
            box-shadow: 0 0 10px 5px gainsboro;
            margin-right: 30px;
            background-color: white;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="container1">
    <div id="carouselExample" class="carousel slide">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="container1">
                    <div class="imgcover">
                        <img src="/resources/img/한국지도.png" class="d-block w-100" alt="...">
                    </div>
                    <div class="cover1">
                        <p>여행을 준비하는 연준이는 <br> G-Route를 통해 <br> 2시간을 아꼈어요!</p>
                    </div>
                </div>
            </div>

            <div class="carousel-item">
                <div class="container2">
                    <img src="/resources/img/부산야경.jpg" class="d-block w-100" alt="...">
                    <div class="cover2">
                        <p>The night view of <br> Busan is beautiful</p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container3">
                    <img src="/resources/img/절벽바다.jpg"
                         class="d-block w-100" alt="...">
                    <div class="cover3">
                        <p>Experience <br> The best trip ever</p>
                    </div>
                </div>
            </div>
        </div>


        <div class="search-travel-cover" style="z-index: 1">
            <form action="/title" id="title" method="GET">
                <input class="search-travel" type="text" placeholder="목적지를 입력해주세요" id="title-ip" name="planTitle"
                       onclick="hidePlaceholder()" onblur="showPlaceholder()">
                <div id="sm-div" style="display: inline-block">
                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="white  "
                         class="bi bi-search svg-1" viewBox="0 0 16 16"
                         style="transform: translate(0%, -20%); cursor: pointer; ">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                    </svg>
                </div>
            </form>
        </div>

        <div class="plan-count">
            <div>
                <h2>여행지 수</h2>
            </div>
            <div>
                <h1>${planCount}</h1>
            </div>
        </div>


        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev"
                style="justify-content: start;">
            <span class="carousel-control-prev-icon" aria-hidden="true" style="width: 80px; height: 80px;"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next"
                style="justify-content: end;">
            <span class="carousel-control-next-icon" aria-hidden="true" style="width: 80px; height: 80px;"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>

<div class="container4">
    <div class="cover4">
        <div class="p_cover">
            <p>G-Route 회원들이 선택한 장소 Top 5</p>
        </div>
        <div class="ranking-container"></div>
    </div>
</div>
<div class="container5">

    <div class="box-title" id="box-title"> 여행지역</div>

    <div class="search-local-cover">
        <input type="search" id="title-ip2" class="search-local" onkeyup="f_place()" placeholder="찾고있는 지역을 검색해주세요" onclick="hidePlaceholder2()" onblur="showPlaceholder2()">
        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="black"
             class="bi bi-search svg-1" viewBox="0 0 16 16" style="transform: translate(50%, -5%); cursor: pointer;">
            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
        </svg>
    </div>

    <div class="place-box">
        <c:forEach var="place" items="${placeList}">
            <div class="cell" onclick="f_summon('${place.placeNum}')">
                <div class="top">
                    <img height="280px" width="280px"
                         src="<%=request.getContextPath()%>/imgDownload/showImg.wow?fileName=${place.img}&filePath=${place.imgPath}"
                         alt="">
                </div>
                <div class="bottom" style="text-align: left;">
                    <h1> ${place.englishName} </h1>
                    <h3> ${place.placeName} </h3>
                    <a href="" hidden="true"> ${place.placeNum} </a>
                </div>
            </div>
        </c:forEach>
    </div>


    <div id="overlay" class="overlay"></div>
    <div class="modal2 modal-summon d-none2">
        <div class="align-end2">
            <img style="border-radius: 15px; cursor:pointer;" onclick="f_close2()" height="35px" width="35px"
                 src="data:image/png;base64,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"
                 alt="">
            <div class="modalcontainer">
                <div>
                    <p id="AreaTitleEng" style="font-size: 20px; color: #8a8a8a; font-weight: bold;"></p>
                    <p id="AreaTitle" style="font-size: 35px; color: black; font-weight: bold;"></p>
                    <hr>
                    <%--                    <p id="AreaContents" style="font-size: 20px; color: black;" ></p>--%>
                    <h3 id="AreaContents"></h3>
                    <hr>
                    <div style="display: flex; justify-content: flex-end;">
                        <button class="btn btn-primary" onclick="makeplanner()"
                                style="width: 120px; height: 35px; font-size: 15px">
                            일정만들기 >
                        </button>
                    </div>
                </div>
                <div>
                    <img id="modalImage" height="330px" width="330px" src="" alt="">
                </div>
            </div>
        </div>
    </div>

</div>
<div class="footer-container">
    <div class="footer logo" style="width: 300px; transform: translate(65%, 20%)">
        G-ROUTE
    </div>
    <h5>주식회사 그루트 | 팀장 권순욱</h5>
    <h5>대전광역시 중구 계룡로 825 (용두동) 2층</h5>
    <h5>ksu577@naver.com</h5>
    <h5>Tel : 042-719-8850</h5>
    <h4>Copyright © G-Route. All Right Reserved</h4>

    <div class="footer-icons">
        <div class="footer-icon">
            <a href="https://blog.naver.com/nextit_center" target="_blank">
                <img style="width: 30px; height: 30px; margin-top: 10px; margin-left: 10px"
                     src="https://cdn-icons-png.flaticon.com/128/3959/3959425.png">
            </a>
        </div>

        <div class="footer-icon">
            <a href="https://www.youtube.com/@nextit_center" target="_blank">
                <svg xmlns="http://www.w3.org/2000/svg" style="margin-left: 10px; margin-top: 10px;" width="30"
                     height="30" fill="black" class="bi bi-youtube" viewBox="0 0 16 16">
                    <path d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.007 2.007 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.007 2.007 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31.4 31.4 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.007 2.007 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A99.788 99.788 0 0 1 7.858 2h.193zM6.4 5.209v4.818l4.157-2.408L6.4 5.209z"/>
                </svg>
            </a>
        </div>

        <div class="footer-icon">
            <a href="https://www.instagram.com/__nextit__/" target="_blank">
                <svg xmlns="http://www.w3.org/2000/svg" style="margin-left: 10px; margin-top: 10px;" width="30"
                     height="30" fill="black" class="bi bi-instagram"
                     viewBox="0 0 16 16">
                    <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"/>
                </svg>
            </a>
        </div>
    </div>
</div>


</body>
<script>
    const place_box = document.getElementsByClassName("place-box")[0];
    const input_search = document.getElementsByClassName("search-local")[0];


    function f_place() {


        $.ajax({
            type: 'POST',
            dataType: 'JSON',
            url: '/place/placeSearch',
            data: {
                "search": $(".search-local").val()
            },
            success: function (data) {
                let html = "";

                for (let i = 0; i < data.length; i++) {
                    html += '<div class="cell" onclick="f_summon(' + data[i]["placeNum"] + ')">';
                    html += '<div class="top">';
                    html += '<img height="280px" width="280px" src="<%=request.getContextPath()%>/imgDownload/showImg.wow?fileName=' + data[i]["img"] + '&filePath=' + data[i]["imgPath"]+'" alt="">'
                    html += '</div>';
                    html += '<div class="bottom" style="text-align: left;">';
                    html += '<h1> ' + data[i]["englishName"] + ' </h1>';
                    html += '<h3> ' + data[i]["placeName"] + ' </h3>';
                    html += '<a href="" hidden="true"> ' + data[i]["placeNum"] + ' </a>';
                    html += '</div>';
                    html += '</div>';
                    place_box.innerHTML = html;
                }
            },
            error: function (error) {
                console.log(error);
            }
        })

    }


    document.addEventListener("DOMContentLoaded", function () {
        // 가상의 실시간 검색어 데이터
        const keywords = [];
        const name_count = [];
        const name_add = [];
        keywords[0] = ("장소");
        name_count[0] = ("선택 수");
        name_add[0] = ("지역");
        let address = ""
        let result1 = null
        <c:forEach var="topPlan" items="${topPlan}" begin="0" end="4" step="1" varStatus="status">
        keywords.push("${topPlan.placeName}");
        name_count.push("${topPlan.count}");
        address = "${topPlan.placeLoadAddress}";
        result1 = address.substring(0, 2);
        name_add.push(result1);
        </c:forEach>


        const rankingContainer = document.querySelector(".ranking-container");

        // 검색어 목록을 돌면서 화면에 표시
        for (let i = 0; i < 6; i++) {
            const rankingItem = document.createElement("div");
            rankingItem.classList.add("ranking-item");

            const rank = document.createElement("div");
            rank.classList.add("rank");
            if (i != 0) {
                rank.textContent = (i).toString();
            }

            const keywordElement = document.createElement("div");
            keywordElement.classList.add("keyword");
            keywordElement.textContent = keywords[i];

            const number = document.createElement("div");
            number.classList.add("number");
            number.textContent = name_count[i];

            const addr = document.createElement("div");
            addr.classList.add("addr");
            addr.textContent = name_add[i];

            rankingItem.appendChild(rank);
            rankingItem.appendChild(keywordElement);
            rankingItem.appendChild(number);
            rankingItem.appendChild(addr);

            rankingContainer.appendChild(rankingItem);
        }
    });


    const v_modal2 = document.getElementsByClassName("modal2")[0];
    document.getElementById('sm-div').addEventListener('click', function () {
        if ($("#title-ip").val() == null || $("#title-ip").val() == "") {
            alert("아이디를 입력해주세요")
            return;
        }
        document.getElementById('title').submit();
    });

    function hidePlaceholder() {
        var input = document.getElementById('title-ip');
        input.placeholder = '';
    }

    function showPlaceholder() {
        var input = document.getElementById('title-ip');
        input.placeholder = '목적지를 입력해주세요';
    }

    document.addEventListener('click', function (event) {
        var input = document.getElementById('title-ip2');
        var isInputClicked = input.contains(event.target);

        if (!isInputClicked) {
            showPlaceholder();
        }
    });

    function hidePlaceholder2() {
        var input2 = document.getElementById('title-ip2');
        input2.placeholder = '';
    }

    function showPlaceholder2() {
        var input2 = document.getElementById('title-ip2');
        input2.placeholder = '찾고있는 지역을 검색해주세요';
    }

    document.addEventListener('click', function (event) {
        var input2 = document.getElementById('title-ip2');
        var isInputClicked2 = input2.contains(event.target);

        if (!isInputClicked2) {
            showPlaceholder2();
        }
    });

    function f_summon(placeNum) {

        document.getElementById('overlay').style.display = 'block';

        $.ajax({
            url: '/place/placeView',
            dataType: 'json',
            data: {
                'placeNum': placeNum
            },
            type: "post",
            success: function (data) {
                console.log(data);


                $("#AreaTitle").html(data['placeName']);
                $("#AreaTitleEng").html(data['englishName'])
                $("#AreaContents").html(data['placeContext']);

                // 이미지를 가져와서 모달 이미지에 설정
                var modalImgElement = $("#modalImage");
                modalImgElement.attr('src', '<%=request.getContextPath()%>/imgDownload/showImg.wow?fileName=' + data['img'] + '&filePath=' + data['imgPath']);

                v_modal2.classList.remove("d-none2");
            },
            error: function (error) {
                console.log(error);
            }
        });
    }

    function f_close2() {
        // 오버레이 숨김
        document.getElementById('overlay').style.display = 'none';

        v_modal2.classList.add("d-none2");
    }

    function makeplanner() {
        window.location.href = "/plan/title.wow"
    }
</script>
</html>
