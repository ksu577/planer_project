<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
    <%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<%@ include file="/WEB-INF/inc/top.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
    body {
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

    .findId > p {
        transform: translate(35%, 50%);
        font-size: 30px;
    }

    .name-input {
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

    #name {
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

</style>
<%session.invalidate();%>
<body>

<div class="container">
    <div class="cover">
        <form id="searchId" action="/login/myId.wow" method="post">
            <div class="findId"><p>아이디 찾기</p></div>
            <div class="name-input">
                <input type="text" name="name" id="name" placeholder="이름">
            </div>
            <div class="email-input">
                <input type="text" name="email" id="email" placeholder="이메일">
                <button type="button" id="emCheck" class="em-check-btn">인증</button>
            </div>
            <div class="emailcheck-input">
                <input type="text" name="emailcheck" id="emailcheck" placeholder="인증번호">
                <button type="button" id="emCheck2" class="em-check-btn2">확인</button>
            </div>
            <button class="checkbtn" id="checkbtn" type="button"><p>찾기</p></button>
        </form>
    </div>
</div>

</body>
<script>

    let CheckEmailIdentify = false;
    let CheckIdentify = false;


    $("#emCheck").on("click", function (e) {
        let testName = $("input[name='name']").val();
        let mailAddress = $("input[name='email']").val();
        $.ajax({
            url: "/findId/emailCheck3"
            , type: "get"
            , data: {"name": testName, "email": mailAddress}
            , success: function (data) {
                if (data == "error") {
                    alert("이름 또는 이메일을 확인해주세요");
                    CheckEmailIdentify = false;
                } else {
                    alert("전송되었습니다.");
                    CheckEmailIdentify = true;
                }
            }, error: function (err) {
                alert("에러");
            }
        });
    });


    $("#emCheck2").on("click", function (e) {
        let mailCheck = $("input[name='emailcheck']").val();
        $.ajax({
            url: "/findId/emailCheck4"
            , type: "get"
            , data: {"sendKey": mailCheck}
            , success: function (data) {
                alert(data);
                if (data == "인증 되었습니다.") {
                    CheckIdentify = true;
                } else {
                    CheckIdentify = false;
                }
            }, error: function (err) {
                CheckIdentify = false;
                alert("인증번호를 확인해주세요.");

            }, complete() {
                if (CheckIdentify) {
                    $("#email").prop('disabled', true);
                    $("#emailcheck").prop('disabled', true);
                }
            }
        });
    });


    $("#checkbtn").on("click", function (e) {
        if (!CheckEmailIdentify) {
            alert("이메일을 확인해주세요.")
            return;
        }

        if (!CheckIdentify) {
            alert("인증번호를 확인해주세요.")
            return;
        }

        $("#email").prop('disabled', false);
        $("#emailcheck").prop('disabled', false);

        document.getElementById('searchId').submit();

    })

</script>
</html>