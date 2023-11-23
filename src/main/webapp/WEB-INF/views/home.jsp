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
            width: 300px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
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
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .keyword {
            font-size: 16px;
            color: #555;
        }
    </style>
    <title>실시간 검색어 순위</title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="container">
    <a href="plan/title.wow">여행 가자!</a>
    <div class="ranking-container"></div>
</div>
</body>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // 가상의 실시간 검색어 데이터
        const keywords = [];
        <c:forEach var="topPlan" items="${topPlan}" begin="0" end="4" step="1" varStatus="status">
        keywords.push("${topPlan.placeName}")
        </c:forEach>

        const rankingContainer = document.querySelector(".ranking-container");

        // 검색어 목록을 돌면서 화면에 표시
        keywords.forEach((keyword, index) => {
            const rankingItem = document.createElement("div");
            rankingItem.classList.add("ranking-item");

            const rank = document.createElement("div");
            rank.classList.add("rank");
            rank.textContent = (index + 1).toString();

            const keywordElement = document.createElement("div");
            keywordElement.classList.add("keyword");
            keywordElement.textContent = keyword;

            rankingItem.appendChild(rank);
            rankingItem.appendChild(keywordElement);

            rankingContainer.appendChild(rankingItem);
        });
    });
</script>
</html>
