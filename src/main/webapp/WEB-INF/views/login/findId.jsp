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
<style>

    .container {
        padding-top: 70px;
        max-width: 1900px;
        height: 100vh;
        border: 1px solid red;
        position: absolute;
    }

    .cover {
        margin-top: 50px;
        margin-left: 50px;
        width: 400px;
        height: 300px;
    }

    .name-input {
        width: 400px;
        height: 50px;
        border: 1px solid black;
        border-radius: 5px;
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

    #name {
        width: 350px;
        height: 48px;
        margin-left: 5px;
        border: 1px solid white;
        font-size: 15px;
        outline: none;
    }

    #email {
        width: 350px;
        height: 48px;
        margin-left: 5px;
        border: 1px solid white;
        font-size: 15px;
        outline: none;
    }

    #emailcheck {
        width: 350px;
        height: 48px;
        margin-left: 5px;
        border: 1px solid white;
        font-size: 15px;
        outline: none;
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
        left: 407px;
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
        left: 407px;
    }

    .checkbtn {
        width: 400px;
        height: 50px;
        font-size: 15px;
        margin-top: 20px;
        border-radius: 5px;
        background-color: #f9f9f9;
    }

    .result-section {
        border: 1px solid black;
        margin-top: 50px;
        width: 800px;
        height: 500px;
        left: 500px;
        position: absolute;
        font-size: 5mm;
        font-weight: 400;
        overflow-y: scroll;
        padding-left: 10px;
        padding-top: 10px;
    }
</style>

<body>
<%@ include file="/WEB-INF/inc/top.jsp" %>
<div class="container">
    <div class="cover">
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
        <button class="checkbtn" id="checkbtn" onclick="findId_click()">확인</button>
    </div>
    <div class="result-section" id="result-section"></div>
</div>

</body>
<script>

    let CheckIdentify = false;


    $("#emCheck").on("click", function (e) {
        let testName = $("input[name='name']").val();
        let mailAddress = $("input[name='email']").val();
        $.ajax({
            url: "/findId/emailCheck3"
            , type: "get"
            , data: {"name":testName, "email": mailAddress}
            , success: function (data) {
                if (data == "error") {
                    alert("이름 또는 이메일을 확인해주세요");
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


    function findId_click() {
        let curName = $("input[name=name]").val();
        let curEmail = $("input[name=email]").val();
        let curEmailCheck = $("input[name=emailcheck]").val();

        $.ajax({
            url: "/login/findId.wow",
            type: "POST",
            data: {"name": curName, "email": curEmail, "emailcheck": curEmailCheck},
            success: function (data) {
                if (data == null) {
                    $('#result-section').text("회원 정보를 확인해주세요.");
                } else {
                    document.getElementById("result-section").innerHTML = "";
                    for (let i = 0; i < data.length; i++) {
                        document.getElementById("result-section").innerHTML += '<div>' + data[i]["id"] + '</div>'
                    }
                }
            }, error: function (error) {
                console.log(error)
                alert("에러발생");
            }
        })
    }
</script>
</html>