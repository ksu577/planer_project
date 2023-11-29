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
    <%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<%@ include file="/WEB-INF/inc/top.jsp" %>
<style>

    .member-container {
        width: 100vw;
        height: 100vh;
        background-color: rgba(220, 220, 220, 0.30);
        position: relative;
        margin-top: 70px;
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
        /*border: 1px solid red;*/
        width: 100%;
        height: 100%;
        margin-top: 20px;
    }

    .id-cover {
        width: 450px;
        height: 55px;
        border-radius: 5px;
        margin-left: 5.5%;
        position: relative;
        background-color: rgba(220, 220, 220, 0.30);
        margin-top: 20px;
    }

    #member-id {
        border: 1px rgba(220, 220, 220, 0.30);
        width: 380px;
        height: 53px;
        border-radius: 5px;
        margin-left: 2%;
        font-size: 18px;
        background-color: rgba(220, 220, 220, 0);
    }

    .idCheck {
        border: 1px solid #98dde3;
        width: 60px;
        height: 55px;
        position: absolute;
        background-color: #98dde3;
        border-radius: 4px;
        cursor: pointer;
        font-size: 20px;
        font-weight: 700;
        color: white;
        left: 390px;
    }

    .pw-cover {
        width: 450px;
        height: 55px;
        border-radius: 5px;
        margin-left: 5.5%;
        position: relative;
        background-color: rgba(220, 220, 220, 0.30);
        margin-top: 20px;
    }

    #member-pw {
        border: 1px rgba(220, 220, 220, 0.30);
        width: 440px;
        height: 53px;
        border-radius: 5px;
        margin-left: 2%;
        font-size: 18px;
        background-color: rgba(220, 220, 220, 0);
    }

    .em-cover {
        width: 450px;
        height: 55px;
        border-radius: 5px;
        margin-left: 5.5%;
        position: relative;
        background-color: rgba(220, 220, 220, 0.30);
        margin-top: 20px;
    }

    #member-em {
        border: 1px rgba(220, 220, 220, 0.30);
        width: 380px;
        height: 53px;
        border-radius: 5px;
        margin-left: 2%;
        font-size: 18px;
        background-color: rgba(220, 220, 220, 0);
    }

    .em-check-btn {
        border: 1px solid #98dde3;
        width: 60px;
        height: 55px;
        position: absolute;
        background-color: #98dde3;
        border-radius: 5px;
        cursor: pointer;
        font-size: 20px;
        font-weight: 700;
        color: white;
        left: 390px;
    }

    .em-cover2 {
        width: 450px;
        height: 55px;
        border-radius: 5px;
        margin-left: 5.5%;
        position: relative;
        background-color: rgba(220, 220, 220, 0.30);
        margin-top: 20px;
    }

    #member-em2 {
        border: 1px rgba(220, 220, 220, 0.30);
        width: 380px;
        height: 53px;
        border-radius: 5px;
        margin-left: 2%;
        font-size: 18px;
        background-color: rgba(220, 220, 220, 0);
    }

    .em-check-btn2 {
        border: 1px solid #98dde3;
        width: 60px;
        height: 55px;
        position: absolute;
        background-color: #98dde3;
        border-radius: 5px;
        cursor: pointer;
        font-size: 20px;
        font-weight: 700;
        color: white;
        left: 390px;
    }

    .member-input-box1 input:focus {
        outline: none;
    }

    .name-cover {
        width: 450px;
        height: 55px;
        border-radius: 5px;
        margin-left: 5.5%;
        position: relative;
        background-color: rgba(220, 220, 220, 0.30);
        margin-top: 20px;
    }

    #member-name {
        border: 1px rgba(220, 220, 220, 0.30);
        width: 440px;
        height: 53px;
        border-radius: 5px;
        margin-left: 2%;
        font-size: 18px;
        background-color: rgba(220, 220, 220, 0);
    }

    .birth-cover {
        width: 450px;
        height: 55px;
        border-radius: 5px;
        margin-left: 5.5%;
        position: relative;
        background-color: rgba(220, 220, 220, 0.30);
        margin-top: 20px;
    }

    #member-birth {
        border: 1px rgba(220, 220, 220, 0.30);
        width: 420px;
        height: 53px;
        border-radius: 5px;
        margin-left: 2%;
        font-size: 18px;
        background-color: rgba(220, 220, 220, 0);
    }

    .phone-cover {
        width: 450px;
        height: 55px;
        border-radius: 5px;
        margin-left: 5.5%;
        position: relative;
        background-color: rgba(220, 220, 220, 0.30);
        margin-top: 20px;
    }

    #member-phone {
        border: 1px rgba(220, 220, 220, 0.30);
        width: 440px;
        height: 53px;
        border-radius: 5px;
        margin-left: 2%;
        font-size: 18px;
        background-color: rgba(220, 220, 220, 0);
    }

    .address-cover {
        width: 450px;
        height: 55px;
        border-radius: 5px;
        margin-left: 5.5%;
        position: relative;
        background-color: rgba(220, 220, 220, 0.30);
        margin-top: 20px;
    }

    #member-address {
        border: 1px rgba(220, 220, 220, 0.30);
        width: 380px;
        height: 53px;
        border-radius: 5px;
        margin-left: 2%;
        font-size: 18px;
        background-color: rgba(220, 220, 220, 0);
    }

    .add-check-btn {
        border: 1px solid #98dde3;
        width: 60px;
        height: 55px;
        position: absolute;
        background-color: #98dde3;
        border-radius: 5px;
        cursor: pointer;
        font-size: 20px;
        font-weight: 700;
        color: white;
        left: 390px;
    }

    .address-cover2 {
        width: 450px;
        height: 55px;
        border-radius: 5px;
        margin-left: 5.5%;
        position: relative;
        background-color: rgba(220, 220, 220, 0.30);
        margin-top: 20px;
    }

    #member-address2 {
        border: 1px rgba(220, 220, 220, 0.30);
        width: 380px;
        height: 53px;
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
        width: 450px;
        height: 55px;
        border-radius: 5px;
        background-color: #98dde3;
        margin-left: 5.5%;
        cursor: pointer;
        margin-top: 40px;
    }

    .member-btn > p {
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
<div class="member-container">
    <div class="member-box">
        <div class="member-logo">순자산 3조</div>
        <form id="memForm" name="memberVO" action="memberRegist.wow" method="post">
            <div class="member-input-box1">
                <div class="id-cover">
                    <input name="id" id="member-id" type="text" placeholder="아이디" pattern="\w{4,}" required="required">
                    <button type="button" id="idCheck" class="idCheck">중복</button>
                </div>
                <div class="pw-cover">
                    <input name="password" id="member-pw" type="password" placeholder="비밀번호" required="required">
                </div>
                <div class="em-cover">
                    <input name="email" id="member-em" type="text" placeholder="이메일" required="required">
                    <button type="button" id="emCheck" class="em-check-btn">인증</button>
                </div>
                <div class="em-cover2">
                    <input name="email2" id="member-em2" type="text" placeholder="인증번호" required="required">
                    <button type="button" id="emCheck2" class="em-check-btn2">확인</button>
                </div>
                <div class="name-cover">
                    <input name="name" id="member-name" type="text" placeholder="이름" required="required">
                </div>
                <div class="birth-cover">
                    <input name="birth" id="member-birth" type="text" placeholder="생년월일 ex)19981231"
                           required="required">
                </div>
                <div class="phone-cover">
                    <input name="phnum" id="member-phone" type="text" placeholder="휴대전화번호 (-없이 입력)" required="required">
                </div>
                <div class="address-cover">
                    <input name="address" id="member-address" type="text" placeholder="주소" required="required">
                    <input class="add-check-btn" type="button" onclick="sample6_execDaumPostcode()" value="검색"><br>
                    <div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
                </div>
                <div class="address-cover2">
                    <input name="address2" id="member-address2" type="text" placeholder="상세주소">
                </div>
            </div>
            <button class="member-btn" id="member-btn" type="button"><p>회원가입</p></button>
        </form>
    </div>
    <div class="bingbing">
        <div class="spinner-border" style="position: fixed; left: 50%; top: 50%; width: 4rem; height: 4rem;"
             role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%--<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c5554b04079322ffc3fe43c2cf3f2f5e&libraries=services"></script>--%>
<script>

    let idCheckIdentify = false;
    let emailCheckIdentify = false;

    $("#idCheck").on("click", function (e) {
        let curId = $("input[name=id]").val();
        e.preventDefault();
        $.ajax({
            url: "/memberForm/idCheck"
            , type: "get"
            , data: {"id": curId}
            , success: function (data) {
                idCheckIdentify = true;
                alert(data);
            }
            , error: function (err) {
                idCheckIdentify = false;
                alert(err);
            }
        });
    });

    $("#emCheck").on("click", function (e) {
        $(".bingbing").show();
        $(".overlay").show();

        let mailAddress = $("input[name='email']").val();

        $.ajax({
            url: "/memberForm/emailCheck"
            , type: "get"
            , data: {"email": mailAddress}
            , success: function (data) {
                if (data == "error") {
                    alert("이미 가입한 이메일입니다.")
                } else {
                    $(".bingbing").hide();
                    $(".overlay").hide();
                    alert("전송되었습니다.");
                }
            }
            , error: function (err) {
                $(".bingbing").hide();
                $(".overlay").hide();
                alert("전송실패");
            }
        });
    });


    $("#emCheck2").on("click", function (e) {
        let mailCheck = $("input[name='email2']").val();
        $.ajax({
            url: "/memberForm/emailCheck2"
            , type: "get"
            , data: {"sendKey": mailCheck}
            , success: function (data) {
                alert(data)
                if (data == "인증 되었습니다.") {
                    emailCheckIdentify = true;
                } else {
                    emailCheckIdentify = false;
                }

            }, error: function (err) {
                emailCheckIdentify = false;
                alert("인증번호를 확인해주세요.");

            }, complete() {
                if (emailCheckIdentify) {
                    $("#member-em").prop('disabled', true);
                    $("#member-em2").prop('disabled', true);
                }
            }
        });
    });


    $("#member-btn").on("click", function (e) {
        if (!idCheckIdentify) {
            alert("아이디 중복을 확인해주세요.")
            return;
        }
        if (!emailCheckIdentify) {
            alert("인증번호를 확인해주세요.")
            return;
        }

        $("#member-em").prop('disabled', false);
        $("#member-em2").prop('disabled', false);

        document.getElementById('memForm').submit();

    });


    let mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    let map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    let geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    let marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("member-address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("member-address2").focus();
            }
        }).open();
    }


</script>
</body>
</html>