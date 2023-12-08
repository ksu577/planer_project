<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <title>비밀번호 변경</title>
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

    .cover > p {
        font-size: 25px;
        padding-left: 170px;
        padding-top: 40px;
    }

    .newpwcover {
        margin-top: 60px;
        margin-left: 20px;
        width: 450px;
        height: 60px;
        border-radius: 5px;
        position: relative;
        background-color: rgba(220, 220, 220, 0.30);
    }

    .newpwcover2 {
        margin-top: 60px;
        margin-left: 20px;
        width: 450px;
        height: 60px;
        border-radius: 5px;
        position: relative;
        background-color: rgba(220, 220, 220, 0.30);
    }

    .newpw {
        width: 445px;
        height: 60px;
        margin-left: 5px;
        font-size: 18px;
        outline: none;
        border: 1px rgba(220, 220, 220, 0.20);
        background-color: rgba(220, 220, 220, 0);
        border-radius: 5px;
    }

    .newpwcheck {
        width: 445px;
        height: 60px;
        margin-left: 5px;
        font-size: 18px;
        outline: none;
        border: 1px rgba(220, 220, 220, 0.20);
        background-color: rgba(220, 220, 220, 0);
        border-radius: 5px;
    }

    .pwbtn {
        width: 450px;
        height: 60px;
        border-radius: 5px;
        margin-top: 80px;
        margin-left: 20px;
        font-size: 20px;
        background-color: #98dde3;
        border: 1px solid white;
        color: white;
    }

    .top-background {
        background-color: #98dde3;
        height: 70px;
    }

</style>
<body>
<div class="top-background"></div>
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
