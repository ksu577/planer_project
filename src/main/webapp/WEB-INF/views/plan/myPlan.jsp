<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <style>

        .mp-title {
            color: #333;
            text-align: center;
            margin-top: 100px;
        }

        .schedule {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 30px;
            margin-bottom: 30px;
            width: 100%;
            text-align: center;
        }

        .schedule > p {
            font-size: 15px;
        }

        .mp-span {
            font-weight: bold;
            color: #007bff;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<h2 class="mp-title">나의 일정</h2>

<div class="schedule-container" id="scheduleContainer">
    <!-- 여기에 동적으로 생성될 일정이 들어갑니다. -->
</div>

<script>
    // JavaScript로 일정을 동적으로 생성하는 함수
    function addSchedule(name, date) {
        var scheduleContainer = document.getElementById('scheduleContainer');

        var scheduleDiv = document.createElement('div');
        scheduleDiv.classList.add('schedule');

        var scheduleName = document.createElement('p');
        scheduleName.innerHTML = '<span class="mp-span">' + name + '</span>';

        var scheduleDate = document.createElement('p');
        scheduleDate.innerHTML = '생성일 : <span>' + date + '</span>';

        scheduleDiv.appendChild(scheduleName);
        scheduleDiv.appendChild(scheduleDate);

        scheduleContainer.appendChild(scheduleDiv);
    }
    let id = "";
    // 예시로 두 개의 일정 추가
    <c:forEach items="${myPlan}" var="myPlan">
    addSchedule("${myPlan.planTitle}", "${myPlan.regDate}");
    id = "${myPlan.id}";
    </c:forEach>


        $(document).on("click", ".schedule", function () {
            location.href = "/plan/marker.wow?user=" + id + "&planTitle=" + $(this).find(".mp-span").text() + "";
        });
</script>
</body>
</html>
