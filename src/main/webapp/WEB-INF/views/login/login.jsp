<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<%@ include file="/WEB-INF/inc/top.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
    body {
        margin: 0;
    }

    ::-webkit-scrollbar {
        width: 5px;
    }

    ::-webkit-scrollbar-thumb {
        background-color: gainsboro;
        border-radius: 5px;
    }

    ::-webkit-scrollbar-thumb:hover {
        background-color: darkgray;
    }

    .login-container {
        width: 99.7vw;
        height: 92.5vh;
        background-color: rgba(220, 220, 220, 0.30);
        position: relative;
    }

    .login-box {
        border: 1px solid #98dde3;
        width: 510px;
        height: 500px;
        background-color: white;
        border-radius: 10px;
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-47%, -50%);
    }

    .login-input-box {
        width: 100%;
        height: 83%;
    }

    .login-id-cover {
        width: 465px;
        height: 60px;
        border-radius: 5px;
        margin-left: 4%;
        position: relative;
        background-color: rgba(220, 220, 220, 0.30);
        margin-bottom: 20px;
    }

    #login-id {
        border: 1px rgba(220, 220, 220, 0.20);
        width: 450px;
        height: 58px;
        border-radius: 5px;
        margin-left: 2%;
        position: relative;
        font-size: 18px;
        background-color: rgba(220, 220, 220, 0);
    }

    .login-pw-cover {
        width: 465px;
        height: 60px;
        border-radius: 5px;
        margin-left: 4%;
        position: relative;
        background-color: rgba(220, 220, 220, 0.30);
        margin-bottom: 25px;
    }

    #login-pw {
        border: 1px rgba(220, 220, 220, 0.20);
        width: 450px;
        height: 58px;
        border-radius: 5px;
        margin-left: 2%;
        position: relative;
        font-size: 18px;
        background-color: rgba(220, 220, 220, 0);
    }

    .login-btn {
        border: 1px solid white;
        width: 465px;
        height: 60px;
        border-radius: 8px;
        background-color: #98dde3;
        margin-left: 4%;
        margin-top: 50px;
        cursor: pointer;
    }

    .login-btn > p {
        margin: auto;
        font-size: 20px;
        color: white;
    }

    .findMe > a {
        font-size: 15px;
        text-decoration: none;
    }

    .login-input-box input:focus {
        outline: none;
    }

    .message {
        color: red;
        margin-left: 100px;
        margin-top: 30px;
        font-size: 17px;
    }

    .top-background{
        height: 70px;
        width: 100%;
        background-color: #98dde3;
    }
</style>
<%session.invalidate();%>
<body>
<div class="top-background"></div>

<div class="login-container">
    <div class="login-box">
        <div style="cursor: pointer; padding-top: 20px; padding-left: 160px;" class="member logo" onclick="location.href='/'">G-ROUTE</div>
        <div class="login-input-box">
            <form name="memberVO" action="login.wow" method="post">
                <p style="margin-left: 30px; margin-top: 20px; color: rgba(0,0,0,0.73); font-size: 15px">아이디</p>
                <div class="login-id-cover">
                    <input id="login-id" name="Id" type="text">
                </div>
                <p style="margin-left: 30px; margin-top: 10px; color: rgba(0,0,0,0.73); font-size: 15px">비밀번호</p>
                <div class="login-pw-cover">
                    <input id="login-pw" name="password" type="password">
                    <p class="message">${msg}</p>
                </div>

                <button class="login-btn" id="login-btn">
                    <p>로그인</p>
                </button>
            </form>
            <div class="findMe" style="padding-top: 10px; text-align: center;">
                <a href="/member/memberForm.wow">회원가입</a>&nbsp;&nbsp;&nbsp;
                <a href="/login/findId.wow"> 아이디 찾기</a>&nbsp;&nbsp;&nbsp;
                <a href="/login/findPw.wow"> 비밀번호 찾기</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>