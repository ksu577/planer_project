<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <style>
        body {
            padding-top: 70px;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<h1>Tourism Data</h1>
<c:forEach var="tourism" items="${tourismData}">
    <div style="border: 1px solid black">
        <div>${tourism.addr1}</div>
        <img src="${tourism.firstImage}">
        <div>${tourism.title}</div>
    </div>
</c:forEach>
</body>
<script>
</script>
</html>
