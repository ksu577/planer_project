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
            margin-right: 50px;
            width: 300px;
            text-align: center;
            position: relative;
        }
        .schedule-container{
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
        <c:forEach items="${myPlan}" var="myPlan">
            <div class="schedule" data-title="${myPlan.planTitle}" data-id="${myPlan.id}">
                <p>
                <span class="mp-span" >
                        ${myPlan.planTitle} 계획
                </span>
                </p>
                <div>${myPlan.regDate}</div>
            </div>
        </c:forEach>
    </div>

    <h2 class="mp-title">공유된 일정</h2>

    <div class="schedule-container" id="sharedScheduleContainer">
        <c:forEach items="${sharedPlans}" var="sharedPlan">
            <div class="schedule" data-title="${sharedPlan.planTitle}" data-id="${sharedPlan.id}">
                <p>
                <span class="mp-span" >
                        ${sharedPlan.id}의 ${sharedPlan.planTitle} 계획
                </span>
                </p>
            </div>
        </c:forEach>
    </div>
</div>

<script>


    // 나의 일정을 추가


    // 공유된 일정을 추가

    $(document).on("click", ".schedule", function () {
        let title = $(this).data("title")
        let id = $(this).data("id")
        location.href = encodeURI("/plan/marker.wow?planTitle=" + title + "&id=" + id);
    });


</script>
</body>
</html>