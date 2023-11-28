<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>loginpage</title>
    <%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<%@ include file="/WEB-INF/inc/top.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
    body {
        margin: 0;
        max-width: 2000px;
    }

    .container {
        padding-top: 70px;
        width: 100vw;
        height: 100vh;
        background-color: rgba(220, 220, 220, 0.30);
        position: relative;
    }

    .cover {
        border: 1px solid #98dde3;
        width: 500px;
        height: 500px;
        transform: translate(80%, 50%);
        border-radius: 10px;
        position: absolute;
        background-color: white;
    }

    .cover > p {
        font-size: 25px;
        padding-left: 170px;
        padding-top: 40px;
    }

    .newpwcover {
        border: 1px solid black;
        width: 400px;
        height: 50px;
        border-radius: 10px;
        margin-top: 80px;
        margin-left: 50px;
    }

    .newpwcover2 {
        border: 1px solid black;
        width: 400px;
        height: 50px;
        border-radius: 10px;
        margin-top: 50px;
        margin-left: 50px;
    }

    .newpw {
        width: 380px;
        height: 45px;
        margin-left: 10px;
        border-radius: 10px;
        border: 1px white;
        outline: none;
        font-size: 16px;
    }

    .newpwcheck {
        width: 380px;
        height: 45px;
        margin-left: 10px;
        border-radius: 10px;
        border: 1px white;
        outline: none;
        font-size: 16px;
    }

    .pwbtn {
        width: 400px;
        height: 50px;
        border-radius: 10px;
        margin-top: 80px;
        margin-left: 50px;
        font-size: 20px;
        background-color: #98dde3;
        border: 1px solid white;
        color: white;
    }

    .message {
        color: red;
        margin-left: 110px;
        margin-top: 15px;
    }

</style>
<body>
<%@ include file="/WEB-INF/inc/top.jsp" %>
<div class="container">
    <form id="changeForm" action="/login/changePw.wow" method="post" enctype="multipart/form-data">
        <div class="cover">
            <p>비밀번호 변경</p>
            <div class="newpwcover">
                <input class="newpw" id="password" type="password" name="password" placeholder="새 비밀번호">
            </div>
            <div class="newpwcover2">
                <input class="newpwcheck" id="password2" type="password" name="password2" placeholder="새 비밀번호 확인">
            </div>
            <button class="pwbtn" id="pwbtn" type="submit">확인</button>
        </div>
    </form>
</div>
</body>
<script>

    $("#pwbtn").on("click", function (e) {
        e.preventDefault();

        let password = $("#password").val();
        let password2 = $("#password2").val();

        if (password != password2) {
            alert("비밀번호를 확인해주세요.")
        } else {
            $("#changeForm").submit();
        }
    });

</script>
</html>
