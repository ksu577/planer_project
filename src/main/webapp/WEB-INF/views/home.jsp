<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <style>
        body{
            margin: 0;
            padding-top: 70px;
            background-color: #f1f1f1;
            justify-content: center;
        }

        .container {
            font-family: 'Arial', sans-serif;
            height: 100vh;
        }

        .ranking-container {
            width: 80%;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
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
        }

        .ranking-container>div:first-child{
            background-color: #afafaf;
            font-weight: 900;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="container">
    <div class="ranking-container"></div>
    <a class="go-trip" href="plan/title.wow">여행 가자!</a>
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
            if(i != 0){
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
