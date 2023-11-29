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
    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<form action="/title" id="title" method="GET">
    <input type="text" name="planTitle">
    <button type="submit"> 저장 </button>
</form>
</body>
<script>
    const title = document.getElementById("title")
</script>
</html>
