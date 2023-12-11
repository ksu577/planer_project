<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <title>아이디 찾기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<%@ include file="/WEB-INF/inc/top.jsp" %>

<style>
    body {
        margin: 0;
        background-color: rgba(220, 220, 220, 0.30);
    }

    .container {
        width: 100vw;
        height: 92vh;
        position: relative;
    }

    .cover {
        border: 1px solid #98dde3;
        width: 510px;
        height: 500px;
        transform: translate(80%, 40%);
        background-color: white;
        border-radius: 10px;
    }

    .findId > p {
        transform: translate(35%, 50%);
        font-size: 30px;
    }

    .idName {
        font-size: 30px;
        font-weight: 200;
        transform: translate(40%, 200%);
        margin-top: 50px;
    }

    .findMe {
        transform: translate(0%, 800%);
        text-align: center;
    }

    .findMe > a {
        font-size: 15px;
        text-decoration: none;
    }

    .top-background {
        background-color: #98dde3;
        height: 70px;
    }

</style>

<body>
<div class="top-background"></div>
<div class="container">
    <div class="cover" id="cover">
        <div class="findId"><p>아이디 찾기</p></div>
        <c:forEach items="${result}" var="result">
            <p class="idName"> ${result.id} </p>
        </c:forEach>
        <div class="findMe">
            <a href="/login/login.wow">로그인</a>&nbsp;&nbsp;&nbsp;
            <a href="/login/findPw.wow">비밀번호 찾기</a>
        </div>
    </div>
</div>
</body>
<script>

</script>

</html>
