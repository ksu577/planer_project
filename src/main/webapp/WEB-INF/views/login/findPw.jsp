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
        width: 100vw;
        height: 100vh;
        border: 1px solid red;
        position: relative;
    }

    .cover {
        margin-top: 25%;
        margin-left: 35%;
        width: 510px;
        height: 300px;
    }

    .id-input {
        width: 400px;
        height: 50px;
        border: 1px solid black;
        border-radius: 5px;
        background-color: white;
    }

    .email-input {
        width: 400px;
        height: 50px;
        border: 1px solid black;
        border-radius: 5px;
        margin-top: 20px;
    }

    .emailcheck-input {
        width: 400px;
        height: 50px;
        border: 1px solid black;
        border-radius: 5px;
        margin-top: 20px;
    }

    #id {
        width: 380px;
        height: 48px;
        margin-left: 5px;
        border: white;
        font-size: 15px;
        outline: none;
        background-color: white;
    }

    #email {
        width: 350px;
        height: 48px;
        margin-left: 5px;
        border: 1px solid white;
        font-size: 15px;
        outline: none;
        background-color: white;
    }

    #emailcheck {
        width: 350px;
        height: 48px;
        margin-left: 5px;
        border: 1px solid white;
        font-size: 15px;
        outline: none;
        background-color: white;
    }

    .em-check-btn {
        width: 50px;
        height: 48px;
        position: absolute;
        background-color: white;
        border-radius: 5px;
        cursor: pointer;
        font-size: 15px;
        font-weight: 500;
        color: black;
        right: 455px;
    }

    .em-check-btn2 {
        width: 50px;
        height: 48px;
        position: absolute;
        background-color: white;
        border-radius: 5px;
        cursor: pointer;
        font-size: 15px;
        font-weight: 500;
        color: black;
        right: 455px;
    }

    .checkbtn {
        width: 400px;
        height: 50px;
        font-size: 15px;
        margin-top: 20px;
        border-radius: 5px;
        background-color: #f9f9f9;
    }
</style>

<body>
<div class="container">
    <div class="cover">
        <div class="id-input">
            <input type="text" name="id" id="id" value="${member.id}" placeholder="아이디">
        </div>
        <div class="email-input">
            <input type="text" name="email" id="email" placeholder="이메일">
            <button type="button" id="emCheck" class="em-check-btn">인증</button>
        </div>
        <div class="emailcheck-input">
            <input type="text" name="emailcheck" id="emailcheck" placeholder="인증번호">
            <button type="button" id="emCheck2" class="em-check-btn2">확인</button>
        </div>
        <button class="checkbtn" id="checkbtn" onclick="findPw_click()">확인</button>
    </div>
</div>
</body>
<script>

    let CheckPwIdentify = false;


    $("#emCheck").on("click", function (e) {
        let testId = $("input[name='id']").val();
        let mailAddress = $("input[name='email']").val();
        $.ajax({
            url: "/findPw/emailCheck5"
            , type: "get"
            , data: {"id":testId, "email": mailAddress}
            , success: function (data) {
                if(data == "error"){
                    alert("아이디 또는 이메일을 확인해주세요");
                } else {
                    alert("전송되었습니다.");
                }
            }, error: function (err) {
                alert("에러");
            }
        });
    });


    $("#emCheck2").on("click", function (e) {
        let mailCheck = $("input[name='emailcheck']").val();
        $.ajax({
            url: "/findPw/emailCheck6"
            , type: "get"
            , data: {"sendKey": mailCheck}
            , success: function (data) {
                alert(data);
                if (data == "인증 되었습니다.") {
                    CheckPwIdentify = true;
                } else {
                    CheckPwIdentify = false;
                }
            }, error: function (err) {
                CheckPwIdentify = false;
                alert("인증번호를 확인해주세요.");
            }, complete() {
                if (CheckPwIdentify) {
                    $("#id").prop('disabled', true);
                    $("#email").prop('disabled', true);
                    $("#emailcheck").prop('disabled', true);
                }
            }
        });
    });


    function findPw_click() {
        let curId = $("input[name=id]").val();
        let curEmail = $("input[name=email]").val();

        const sendData = {"id": curId, "email": curEmail};

        $.ajax({
            contentType: "application/json",
            url: "/login/author.wow",
            type: "post",
            dataType: "json",
            data: JSON.stringify(sendData),
            success: function (data) {
                if (CheckPwIdentify) {
                    window.location.href = data.url;
                } else {
                    alert("본인인증이 완료 되지 않았습니다.");
                }
            }, error: function (err) {
                CheckPwIdentify = false;
                alert("에러발생");
            }
        })
    }
</script>
</html>
