<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <title>loginpage</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<%@ include file="/WEB-INF/inc/top.jsp" %>

<style>
    .container {
        padding-top: 70px;
        width: 100vw;
        height: 100vh;
        border: 1px solid red;
    }

    .cover {
        width: 50%;
        height: 50%;
        border: 1px solid blue;
        transform: translate(50%, 50%);
    }
</style>

<body>
<div class="container">
    <div class="cover">

    </div>
</div>

</body>
</html>
