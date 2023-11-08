<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>memberform</title>
</head>
<style>
    body {
        margin: 0;
    }

    .member-container {
        width: 100vw;
        height: 100vh;
        background-color: rgba(220, 220, 220, 0.30);
        position: relative;
    }

    .member-box {
        border: 1px solid #98dde3;
        width: 510px;
        height: 900px;
        background-color: white;
        border-radius: 10px;
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
    }

    .member-logo {
        font-size: 40px;
        padding-top: 20px;
        padding-left: 170px;
        cursor: pointer;
    }

    .member-input-box1 {
        /* border: 1px solid red; */
        width: 100%;
        height: 30%;
        margin-top: 40px;
    }

    .id-cover {
        width: 465px;
        height: 60px;
        border-radius: 5px;
        margin-left: 4%;
        position: relative;
        background-color: rgba(220, 220, 220, 0.30);
        margin-top: 25px;
    }

    #member-id {
        border: 1px rgba(220, 220, 220, 0.30);
        width: 370px;
        height: 60px;
        border-radius: 5px;
        margin-left: 2%;
        font-size: 18px;
        background-color: rgba(220, 220, 220, 0);
    }

    .idCheck {
        border: 1px solid #98dde3;
        width: 70px;
        height: 60px;
        position: absolute;
        background-color: #98dde3;
        border-radius: 5px;
        cursor: pointer;
        font-size: 20px;
        font-weight: 700;
        color: white;
        left: 397px;
    }

    .pw-cover {
        width: 468px;
        height: 60px;
        border-radius: 5px;
        margin-left: 4%;
        position: relative;
        background-color: rgba(220, 220, 220, 0.30);
        margin-top: 25px;
    }

    #member-pw {
        border: 1px rgba(220, 220, 220, 0.30);
        width: 450px;
        height: 60px;
        border-radius: 5px;
        margin-left: 2%;
        font-size: 18px;
        background-color: rgba(220, 220, 220, 0);
    }

    .em-cover {
        width: 465px;
        height: 60px;
        border-radius: 5px;
        margin-left: 4%;
        position: relative;
        background-color: rgba(220, 220, 220, 0.30);
        margin-top: 25px;
    }

    #member-em {
        border: 1px rgba(220, 220, 220, 0.30);
        width: 370px;
        height: 60px;
        border-radius: 5px;
        margin-left: 2%;
        font-size: 18px;
        background-color: rgba(220, 220, 220, 0);
    }

    .em-check-btn {
        border: 1px solid #98dde3;
        width: 70px;
        height: 60px;
        position: absolute;
        background-color: #98dde3;
        border-radius: 5px;
        cursor: pointer;
        font-size: 20px;
        font-weight: 700;
        color: white;
        left: 397px;
    }

    .member-input-box1 input:focus {
        outline: none;
    }

    .member-input-box2 {
        width: 100%;
        height: 30%;
        margin-top: 30px;
    }

    .name-cover {
        width: 465px;
        height: 60px;
        border-radius: 5px;
        margin-left: 4%;
        position: relative;
        background-color: rgba(220, 220, 220, 0.30);
        margin-top: 25px;
    }

    #member-name {
        border: 1px rgba(220, 220, 220, 0.30);
        width: 450px;
        height: 60px;
        border-radius: 5px;
        margin-left: 2%;
        font-size: 18px;
        background-color: rgba(220, 220, 220, 0);
    }

    .birth-cover {
        width: 465px;
        height: 60px;
        border-radius: 5px;
        margin-left: 4%;
        position: relative;
        background-color: rgba(220, 220, 220, 0.30);
        margin-top: 25px;
    }

    #member-birth {
        border: 1px rgba(220, 220, 220, 0.30);
        width: 450px;
        height: 60px;
        border-radius: 5px;
        margin-left: 2%;
        font-size: 18px;
        background-color: rgba(220, 220, 220, 0);
    }

    .phone-cover {
        width: 465px;
        height: 60px;
        border-radius: 5px;
        margin-left: 4%;
        position: relative;
        background-color: rgba(220, 220, 220, 0.30);
        margin-top: 25px;
    }

    #member-phone {
        border: 1px rgba(220, 220, 220, 0.30);
        width: 370px;
        height: 60px;
        border-radius: 5px;
        margin-left: 2%;
        font-size: 18px;
        background-color: rgba(220, 220, 220, 0);
    }

    .phone-check-btn {
        border: 1px solid #98dde3;
        width: 70px;
        height: 60px;
        position: absolute;
        background-color: #98dde3;
        border-radius: 5px;
        cursor: pointer;
        font-size: 20px;
        font-weight: 700;
        color: white;
        left: 397px;
    }

    .address-cover {
        width: 465px;
        height: 60px;
        border-radius: 5px;
        margin-left: 4%;
        position: relative;
        background-color: rgba(220, 220, 220, 0.30);
        margin-top: 25px;
    }

    #member-address {
        border: 1px rgba(220, 220, 220, 0.30);
        width: 450px;
        height: 60px;
        border-radius: 5px;
        margin-left: 2%;
        font-size: 18px;
        background-color: rgba(220, 220, 220, 0);
    }

    .member-input-box2 input:focus {
        outline: none;
    }

    .member-btn {
        border: 1px solid #98dde3;
        width: 465px;
        height: 60px;
        border-radius: 5px;
        background-color: #98dde3;
        margin-left: 4%;
        cursor: pointer;
        margin-top: 100px;
    }

    .member-btn > p {
        margin: auto;
        font-size: 20px;
        color: white;
    }
</style>


<body>
<div class="member-container">
    <div class="member-box">
        <div class="member-logo">순자산 3조</div>
        <form name="memberVO" action="memberRegist.wow" method="post">
            <div class="member-input-box1">
                <div class="id-cover">
                    <input name="Id" id="member-id" type="text" placeholder="아이디" pattern="\w{4,}" required="required">
                    <button type="button" id="idCheck" class="idCheck">중복</button>
                </div>
                <div class="pw-cover">
                    <input name="password" id="member-pw" type="password" placeholder="비밀번호">
                </div>
                <div class="em-cover">
                    <input name="email" id="member-em" type="text" placeholder="이메일">
                    <button class="em-check-btn">인증</button>
                </div>
            </div>

            <div class="member-input-box2">
                <div class="name-cover">
                    <input name="name" id="member-name" type="text" placeholder="이름">
                </div>
                <div class="birth-cover">
                    <input name="birth" id="member-birth" type="text" placeholder="생년월일 8자리">
                </div>
                <div class="phone-cover">
                    <input name="phnum" id="member-phone" type="text" placeholder="휴대전화번호">
                    <button class="phone-check-btn">인증</button>
                </div>
                <div class="address-cover">
                    <input name="address" id="member-address" type="text" placeholder="주소">
                </div>
            </div>
            <button class="member-btn" onclick=""><p>회원가입</p></button>
        </form>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
    let IdChecked = false;
    $("input[name='Id']").on("change", function (e) {
        IdChecked = false;
    });

    $("#idCheck").on("click", function (e) {
        let curId = $("input[name='Id']").val();
        $.ajax({
            url: "/memberForm/idCheck"
            , type: "get"
            , data: {"id": curId}
            , success: function (data) {
                alert(data);
                IdChecked = true;
            }
            , error: function (err) {
                alert("에러");
            }
        });
    });

    $("#email").on("click", function (e) {
        let mailAddress = $("input[name='email']").val();
        $.ajax({
            url: "/memberForm/emailCheck"
            , type: "get"
            , data: {"email": mailAddress}
            , success: function (data) {
                alert("메일확인");
            }
            , error: function (err) {
                alert("에러");
            }
        });
    });
</script>
</body>
</html>