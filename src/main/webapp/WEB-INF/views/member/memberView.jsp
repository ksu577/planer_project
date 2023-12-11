<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="/WEB-INF/inc/header.jsp" %>
    <title>마이페이지</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
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

    .body-container {
        height: 310px;
        position: relative;
        background-color: #98dde3;
    }

    .my-container {
        border: 2px solid #98dde3;
        transform: translate(70%, 60%);
        width: 800px;
        height: 500px;
        border-radius: 15px;
        box-shadow: 0 0 10px 1px gainsboro;
    }

    table {
        transform: translate(50%, 10%);
        width: 400px;
        height: 400px;
        font-size: 15px;
        position: absolute;
    }

    input {
        border: 1px solid #98dde3;
        border-radius: 5px;
    }

    .parcel-container {
        border: 2px solid #98dde3;
        width: 800px;
        height: 500px;
        border-radius: 15px;
        transform: translate(70%, 150%);
        box-shadow: 0 0 10px 1px gainsboro;
        object-fit: cover;
        overflow: auto;
    }

    .footer-container {
        margin-top: 800px;
        background-color: rgba(220, 220, 220, 0.30);
        height: 310px;
        color: #868e96;
    }

    h5 {
        width: 500px;
        transform: translate(40%, 100%);
        padding-top: 10px;
        color: white;
    }

    h4 {
        width: 500px;
        transform: translate(40%, 300%);
    }

    .footer-icons {
        width: 350px;
        /*border: 1px solid red;*/
        transform: translate(430%, -180%);
        display: flex;

    }

    .footer-icon {
        height: 50px;
        width: 50px;
        border-radius: 50px;
        /*border: 1px solid black;*/
        box-shadow: 0 0 10px 5px gainsboro;
        margin-right: 30px;
        background-color: white;
    }

</style>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>

<div class="container">

</div>

<c:if test="${bnf==null}">
<form action="memberEdit.wow" method="get" enctype="multipart/form-data">
    <div class="body-container">
        <img src="<%=request.getContextPath()%>/member/showProfile.wow?fileName=${member.profile}&filePath=/home/pc31/Docker/team3/imgDownload/"
             style="background-color: white; border-radius: 75px; border: 10px solid white; width: 150px; height: 150px; transform: translate(590%, 160%)">

        <div class="my-container">
            <table>
                <tr>
                    <td>아이디</td>
                    <td>${member.id} </td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td>${member.password} </td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td>${member.name} </td>
                </tr>
                <tr>
                    <td>생년월일</td>
                    <td>${member.birth} </td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>${member.address} </td>
                </tr>
                <tr>
                    <td>상세주소</td>
                    <td>${member.address2} </td>
                </tr>
                <tr>
                    <td>휴대전화번호</td>
                    <td>${member.phnum} </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>${member.email} </td>
                </tr>
                <tr>
                    <td>회원가입일</td>
                    <td>${member.createDate} </td>
                </tr>
                <tr>
                    <input type="hidden" name="Id" value="${member.id}">
                    <td>
                        <button id="edit_btn" type="submit"
                                style="width: 80px; height: 30px; border-radius: 5px; background-color: #0d6efd; border: 1px solid white; color: white"
                                formaction="memberEdit.wow?Id=${member.id}">수정
                        </button>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </c:if>

    <div class="parcel-container">
        <div class="paycontainer mt-3" style="padding-top: 50px; padding-left: 190px; font-size: 15px;">
            <div class="address col-md-8">
                <h2>최근 주문정보</h2>
                <hr>
                <form>
                    <div class="mb-3">
                        <span>수령인 : ${userinfo.takeName}</span>
                    </div>
                    <div class="mb-3">
                        <span> 연락처 : ${userinfo.takeHp} </span>

                    </div>
                    <div class="mb-3">
                        <span>배송지 : ${userinfo.takeAdd}</span>
                    </div>

                    <div class="mb-3">
                        <span>배송 메모 : ${userinfo.takeReq}</span>
                    </div>
                </form>
            </div>
            <div class="bill col-md-8">
                <c:set var="totalAmount" value="0"/>
                <c:forEach items="${productinfo}" var="productinfo">
                    <div class="mb-3" style="display: flex; flex-direction: column;">
                        <hr>
                        <span>상품명 : ${productinfo.productName} </span>
                        <span>개수 : ${productinfo.amount} 개</span>
                        <span>상품금액 : ${productinfo.price} 원</span>
                    </div>
                    <c:set var="totalAmount" value="${totalAmount + productinfo.price}"/>
                </c:forEach>
                <hr>
                <div class="mb-3">
                    <div class="mb-3" style="display: flex; flex-direction: column;">

                        <span>결제된 금액 : 총액 ${totalAmount} 원</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<div class="footer-container">
    <div class="footer logo" style="width: 300px; transform: translate(65%, 20%)">
        G-ROUTE
    </div>
    <h5>주식회사 그루트 | 팀장 권순욱</h5>
    <h5>대전광역시 중구 계룡로 825 (용두동) 2층</h5>
    <h5>ksu577@naver.com</h5>
    <h5>Tel : 042-719-8850</h5>
    <h4>Copyright © G-Route. All Right Reserved</h4>

    <div class="footer-icons">
        <div class="footer-icon">
            <a href="https://blog.naver.com/nextit_center" target="_blank">
                <svg xmlns="http://www.w3.org/2000/svg" style="margin-left: 10px; margin-top: 10px;" width="30" height="30" fill="#2DB400" class="bi bi-bootstrap" viewBox="0 0 16 16">
                    <path d="M5.062 12h3.475c1.804 0 2.888-.908 2.888-2.396 0-1.102-.761-1.916-1.904-2.034v-.1c.832-.14 1.482-.93 1.482-1.816 0-1.3-.955-2.11-2.542-2.11H5.062V12zm1.313-4.875V4.658h1.78c.973 0 1.542.457 1.542 1.237 0 .802-.604 1.23-1.764 1.23H6.375zm0 3.762V8.162h1.822c1.236 0 1.887.463 1.887 1.348 0 .896-.627 1.377-1.811 1.377H6.375z"/>
                    <path d="M0 4a4 4 0 0 1 4-4h8a4 4 0 0 1 4 4v8a4 4 0 0 1-4 4H4a4 4 0 0 1-4-4V4zm4-3a3 3 0 0 0-3 3v8a3 3 0 0 0 3 3h8a3 3 0 0 0 3-3V4a3 3 0 0 0-3-3H4z"/>
                </svg>
            </a>
        </div>

        <div class="footer-icon">
            <a href="https://www.youtube.com/@nextit_center" target="_blank">
                <svg xmlns="http://www.w3.org/2000/svg" style="margin-left: 10px; margin-top: 10px;" width="30"
                     height="30" fill="red" class="bi bi-youtube" viewBox="0 0 16 16">
                    <path d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.007 2.007 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.007 2.007 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31.4 31.4 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.007 2.007 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A99.788 99.788 0 0 1 7.858 2h.193zM6.4 5.209v4.818l4.157-2.408L6.4 5.209z"/>
                </svg>
            </a>
        </div>

        <div class="footer-icon" style="background: radial-gradient(circle farthest-corner at 32% 106%,#ffe17d 0%,#ffcd69 10%,#fa9137 28%,#eb4141 42%,transparent 82%) , linear-gradient(135deg,#234bd7 12%,#c33cbe 58%);">
            <a href="https://www.instagram.com/__nextit__/" target="_blank">
                <svg xmlns="http://www.w3.org/2000/svg" style=" margin-left: 10px; margin-top: 10px;" width="30"
                     height="30" fill="white" class="bi bi-instagram"
                     viewBox="0 0 16 16">
                    <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"/>
                </svg>
            </a>
        </div>
    </div>
</div>
</body>
<script>
    $("#edit_btn").on("click", function (e) {
        document.getElementById('edit_btn').submit();
    })
</script>
</html>