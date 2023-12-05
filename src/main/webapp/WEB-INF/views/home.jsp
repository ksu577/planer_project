<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <style>
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
            transform: translate(220%, 20%);
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
            color: white;
            font-size: 60px;
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
            width: 99vw;
            height: 100vh;
            position: relative;
            font-family: 'Arial', sans-serif;
        }

        .ranking-container {
            width: 80%;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transform: translate(13%, 10%);
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
            background-color: #afafaf;
            font-weight: 900;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<%-- 1. 절벽바다 밝진않음/ 한국이아님.  https://img.freepik.com/free-photo/sunset-over-majestic-coastal-cliff-waves-breaking-generative-ai_188544-12582.jpg?w=1380&t=st=1701418451~exp=1701419051~hmac=a9421e8ed86a1d50b75c6d3687d4b14c2b11f8e551effeb5d1504c6e4c92fc60--%>
<%-- 2. 부산야경 어두운편  https://img.freepik.com/free-photo/view-of-downtown-cityscape-at-dongjak-bridge-and-seoul-tower-over-han-river-in-seoul-south-korea_335224-511.jpg?w=1380&t=st=1701414043~exp=1701414643~hmac=f10e2934cdfdff3af8de2519144b9c19ba9b2d2c4b30948f2f4977e8d560eb0f--%>
<%-- 3. 북한산 나쁘지않음   https://img.freepik.com/free-photo/bukhansan-mountains-is-covered-by-morning-fog-and-sunrise-in-bukhansan-national-park-seoul-in-south-korea_335224-305.jpg?w=1480&t=st=1701419608~exp=1701420208~hmac=3b866924035540a70e56462affa51cf27b6e0c71664a7aa49b979ea7058cf7ef--%>
<%-- 4. 오로라 애매함 https://img.freepik.com/free-photo/beautiful-landscape-with-aurora-borealis_23-2150439618.jpg?w=1380&t=st=1701419917~exp=1701420517~hmac=7bc1b5caa172a77d7299fed6a221c2a8dc5946ee5de685f4f0f0efa6f743c2ee--%>
<div class="container1">
    <div id="carouselExample" class="carousel slide">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="container1">
                    <div class="imgcover">
                        <img src="/resources/img/한국지도.png" class="d-block w-100" alt="...">
                    </div>
                    <div class="cover1">
                        <p>여행을 준비하는 연준이는 <br> 순자산 3조를 통해 <br> 2시간을 아꼈어요!</p>
                        <a class="go-trip" href="plan/title.wow">여행 가자!</a>
                    </div>
                </div>
            </div>

            <div class="carousel-item">
                <div class="container2">
                    <img src="/resources/img/부산야경.jpg" class="d-block w-100" alt="...">
                    <div class="cover2">
                        <p>The night view of <br> Busan is beautiful</p>
                        <a class="go-trip" href="plan/title.wow">여행 가자!</a>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container3">
                    <img src="/resources/img/절벽바다.jpg"
                         class="d-block w-100" alt="...">
                    <div class="cover3">
                        <p>Experience <br> The best trip ever</p>
                        <a class="go-trip" href="plan/title.wow">여행 가자!</a>
                    </div>
                </div>
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
    <div class="ranking-container"></div>
    <a class="go-trip2" href="plan/title.wow">여행 가자!</a>
</div>
</body>
<script>
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
</script>
</html>
