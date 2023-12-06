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


        <div class="search-travel-cover">
            <form action="/title" id="title" method="GET">
                <input class="search-travel" type="text" placeholder="목적지를 입력해주세요" id="title-ip" name="planTitle" onclick="hidePlaceholder()" onblur="showPlaceholder()">
                <div id="sm-div" style="display: inline-block">
                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="white  "
                         class="bi bi-search svg-1" viewBox="0 0 16 16" style="transform: translate(0%, -20%)">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                    </svg>
                </div>
            </form>
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

    document.addEventListener('click', function(event) {
        var input = document.getElementById('title-ip');
        var isInputClicked = input.contains(event.target);

        if (!isInputClicked) {
            showPlaceholder();
        }
    });

</script>
</html>
