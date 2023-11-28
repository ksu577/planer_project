<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <style>
        body {
            padding-top: 70px;
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .tour-list {
            list-style: none;
            padding: 0;
            display: flex;
            gap: 20px;
        }

        .tour-card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 300px;
            text-align: center;
        }

        .tour-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .tour-info {
            padding: 20px;
        }

        .tour-title {
            font-size: 1.2em;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .tour-address {
            font-size: 0.9em;
            color: #555;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<h1>Tourism Data</h1>
<ul class="tour-list">
    <c:forEach var="tourism" items="${tourismData}">
        <li class="tour-card">
            <img id="tour-img" src="${tourism.firstImage}" alt="이미지 오류" class="tour-image">
            <div class="tour-info">
                <div class="tour-title">${tourism.title}</div>
                <div class="tour-address">주소: ${tourism.addr1}</div>
            </div>
        </li>
    </c:forEach>
</ul>
</body>
<script>
    const img = document.getElementById("tour-img");
    console.log(img)
</script>
</html>
