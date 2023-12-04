<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <title>비밀번호 찾기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<%@ include file="/WEB-INF/inc/top.jsp" %>

<style>
    body{
        margin: 0;
        background-color: rgba(220, 220, 220, 0.30);
    }

    .container {
        padding-top: 70px;
        width: 100vw;
        height: 100vh;
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

    .findPw > p {
        transform: translate(35%, 50%);
        font-size: 30px;
    }

    .id-input {
        margin-top: 60px;
        margin-left: 20px;
        width: 465px;
        height: 60px;
        border-radius: 5px;
        position: relative;
        background-color: rgba(220, 220, 220, 0.30);
    }

    .email-input {
        width: 465px;
        height: 60px;
        border-radius: 5px;
        margin-top: 30px;
        margin-left: 20px;
        position: relative;
        background-color: rgba(220, 220, 220, 0.30);
    }

    .emailcheck-input {
        width: 465px;
        height: 60px;
        border-radius: 5px;
        margin-top: 30px;
        margin-left: 20px;
        position: relative;
        border: 1px rgba(220, 220, 220, 0.20);
        background-color: rgba(220, 220, 220, 0.30);
    }

    #id {
        width: 460px;
        height: 60px;
        margin-left: 5px;
        font-size: 18px;
        outline: none;
        border: 1px rgba(220, 220, 220, 0.20);
        background-color: rgba(220, 220, 220, 0);
        border-radius: 5px;
    }

    #email {
        width: 400px;
        height: 60px;
        margin-left: 5px;
        font-size: 18px;
        outline: none;
        border: 1px rgba(220, 220, 220, 0.20);
        background-color: rgba(220, 220, 220, 0);
        border-radius: 5px;
    }

    #emailcheck {
        width: 400px;
        height: 60px;
        margin-left: 5px;
        font-size: 18px;
        outline: none;
        border: 1px rgba(220, 220, 220, 0.20);
        background-color: rgba(220, 220, 220, 0);
        border-radius: 5px;
    }

    .em-check-btn {
        width: 60px;
        height: 60px;
        left: 404px;
        position: absolute;
        border-radius: 5px;
        cursor: pointer;
        font-size: 20px;
        font-weight: 700;
        color: white;
        border: 1px solid #98dde3;
        background-color: #98dde3;
    }

    .em-check-btn2 {
        width: 60px;
        height: 60px;
        left: 404px;
        position: absolute;
        border-radius: 5px;
        cursor: pointer;
        font-size: 20px;
        font-weight: 700;
        color: white;
        border: 1px solid #98dde3;
        background-color: #98dde3;
    }

    .checkbtn {
        border: 1px solid white;
        width: 465px;
        height: 60px;
        border-radius: 8px;
        background-color: #98dde3;
        margin-left: 4%;
        margin-top: 50px;
        cursor: pointer;
    }

    .checkbtn > p {
        margin: auto;
        font-size: 20px;
        color: white;
    }

    .bingbing {
        display: none;
    }

    .overlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.1);
        z-index: 9999;
    }
</style>

<body>
<div class="overlay"></div>
<div class="container">
    <div class="cover">
        <div class="findPw"><p>비밀번호 찾기</p></div>
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
        <button class="checkbtn" id="checkbtn" onclick="findPw_click()"><p>확인</p></button>
    </div>
    <div class="bingbing">
        <div class="spinner-border" style="position: fixed; left: 50%; top: 50%; width: 4rem; height: 4rem;"
             role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
    </div>
</div>
</body>
<script>

    let CheckPwIdentify = false;


    $("#emCheck").on("click", function (e) {
        $(".bingbing").show();
        $(".overlay").show();

        let testId = $("input[name='id']").val();
        let mailAddress = $("input[name='email']").val();
        $.ajax({
            url: "/findPw/emailCheck5"
            , type: "get"
            , data: {"id":testId, "email": mailAddress}
            , success: function (data) {
                if(data == "error"){
                    alert("아이디 또는 이메일을 확인해주세요");
                    $(".bingbing").hide();
                    $(".overlay").hide();
                } else {
                    alert("전송되었습니다.");
                    $(".bingbing").hide();
                    $(".overlay").hide();
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
