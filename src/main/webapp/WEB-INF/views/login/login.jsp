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
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
    body {
        margin: 0;
    }

    p {
        color: gray;
        margin-left: 30px;
        margin-top: 10px;
    }

    .login-container {
        width: 100vw;
        height: 100vh;
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
        transform: translate(-50%, -50%);
    }

    .login-logo {
        font-size: 40px;
        padding-top: 20px;
        padding-left: 170px;
        cursor: pointer;
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
        margin-top: 40px;
        cursor: pointer;
    }

    .login-btn > p {
        margin: auto;
        font-size: 20px;
        color: white;
    }

    a {
        color: #136bf0;
        font-size: 15px;
        text-decoration: none;
    }

    .login-input-box input:focus {
        outline: none;
    }

    .message {
        color: red;
        margin-left: 110px;
        margin-top: 30px;
    }
</style>
<%session.invalidate();%>
<body>

<div class="login-container">
    <div class="login-box">
        <div class="login-logo">순자산 3조</div>
        <div class="login-input-box">
            <form name="memberVO" action="login.wow" method="post">
                <p>아이디</p>
                <div class="login-id-cover">
                    <input id="login-id" name="Id" type="text">
                </div>
                <p>비밀번호</p>
                <div class="login-pw-cover">
                    <input id="login-pw" name="password" type="password">
                    <p class="message">${msg}</p>
                </div>

                <button class="login-btn" id="login-btn">
                    <p>로그인</p>
                </button>
            </form>
            <div style="padding-top: 20px; text-align: center;">
                <a href="/member/memberForm.wow">회원가입</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>