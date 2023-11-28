Copy code
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
            width: 300px;
            text-align: center;
            position: relative;
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

        .schedule > p {
            font-size: 15px;
            cursor: pointer;
        }

        .mp-span {
            font-weight: bold;
            color: #007bff;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="container">

    <h2 class="mp-title">나의 일정</h2>

    <div class="schedule-container" id="scheduleContainer">
        <!-- 동적으로 생성될 나의 일정이 여기에 들어갑니다. -->
    </div>

    <h2 class="mp-title">공유된 일정</h2>

    <div class="schedule-container" id="sharedScheduleContainer">
        <!-- 동적으로 생성될 공유된 일정이 여기에 들어갑니다. -->
    </div>
</div>

<script>
    // JavaScript로 일정을 동적으로 생성하는 함수
    function addSchedule(name, date, containerId) {
        var scheduleContainer = document.getElementById(containerId);

        var scheduleDiv = document.createElement('div');
        scheduleDiv.classList.add('schedule');

        var scheduleName = document.createElement('p');
        scheduleName.innerHTML = '<span class="mp-span">' + name + '</span>';

        var scheduleDate = document.createElement('p');
        scheduleDate.innerHTML = '생성일 : <span>' + date + '</span>';

        scheduleDiv.appendChild(scheduleName);
        scheduleDiv.appendChild(scheduleDate);

        scheduleContainer.appendChild(scheduleDiv);

        // 추가된 부분: 일정을 클릭하면 드롭다운 토글

    }

    // 나의 일정을 추가
    <c:forEach items="${myPlan}" var="myPlan">
    addSchedule("${myPlan.planTitle}", "${myPlan.regDate}", "scheduleContainer");
    </c:forEach>

    // 공유된 일정을 추가
    <c:forEach items="${sharedPlans}" var="sharedPlan">
    addSchedule("${sharedPlan.planTitle}", "${sharedPlan.regDate}", "sharedScheduleContainer");
    </c:forEach>

    $(document).on("click", ".schedule", function () {
        let title = $(this).find(".mp-span").text()
        location.href = encodeURI("/plan/marker.wow?planTitle=" + title);
    });
</script>
</body>
</html>