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
<form action="/tourism/data" method="get">
    <input type="text" name="search" placeholder="여행지를 검색하세요">
    <button type="submit">검색</button>
</form>
</body>
<script>
</script>
</html>
