<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <style>

        @font-face {
            font-family: 'yg-jalnan';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }

        @font-face {
            font-family: 'JalnanGothic';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/JalnanGothic.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'KCCChassam';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCCChassam.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'KOTRAHOPE';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/KOTRAHOPE.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        .mp-title {
            color: #333;
            text-align: center;
            margin-top: 100px;
        }

        .schedule {
            background-color: #fcfcfd;
            border-radius: 8px;
            box-shadow: 1px 1px 5px 1px #98dde3;
            padding: 20px;
            margin-top: 30px;
            margin-bottom: 30px;
            margin-right: 50px;
            width: 300px;
            text-align: center;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: space-around;
        }

        .schedule-container {
            display: flex;
        }

        .schedule-dropdown {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            width: 100%;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 10px;
            z-index: 1;
        }

        .schedule > div > p {
            font-size: 15px;
            cursor: pointer;
            font-family: 'yg-jalnan';
        }

        .mp-span {
            font-weight: bold;
            color: #007bff;
        }

        h2 {
            font-family: 'JalnanGothic';
        }

        .top {
            height: 300px;
            background-color: #98dde3;
        }

        .regdate {
            font-family: 'Pretendard-Regular';
            font-size: 13px;
            color: #797979;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="top">
</div>
<div class="container">
    <h2 class="mp-title">${user.getName()}님의 일정</h2>
    <div class="schedule-container" id="scheduleContainer">
        <!-- 동적으로 생성될 나의 일정이 여기에 들어갑니다. -->
        <c:forEach items="${myPlan}" var="myPlan">
            <div class="schedule" data-title="${myPlan.planTitle}" data-id="${myPlan.id}">
                <div>
                    <img src="/resources/img/planG.png" width="70px" height="70px">
                </div>
                <div>
                    <p>
                <span class="mp-span">
                        ${myPlan.planTitle}
                </span>
                    </p>
                    <div id="regdate" class="regdate">작성일 : ${myPlan.regDate}</div>
                </div>
            </div>
        </c:forEach>
    </div>

    <h2 class="mp-title">공유된 일정</h2>

    <div class="schedule-container" id="sharedScheduleContainer">
        <c:forEach items="${sharedPlans}" var="sharedPlan">
            <div class="schedule" data-title="${sharedPlan.planTitle}" data-id="${sharedPlan.id}">
                <div>
                    <img src="/resources/img/shareG.png" width="70px" height="70px">
                </div>
                <div>
                    <p>
                <span class="mp-span">
                        ${sharedPlan.id}의 ${sharedPlan.planTitle}
                </span>
                    </p>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script>
    $(document).on("click", ".schedule", function () {
        let title = $(this).data("title")
        let id = $(this).data("id")
        location.href = encodeURI("/plan/marker.wow?planTitle=" + title + "&id=" + id);
    });
    const regdate = document.getElementById("regdate")
    regdate.innerHTML = regdate.innerHTML.substring(0,16)
</script>
</body>
</html>