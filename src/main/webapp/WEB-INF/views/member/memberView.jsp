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
        height: 350px;
        border-radius: 15px;
        transform: translate(70%, 200%);
        box-shadow: 0 0 10px 1px gainsboro;
        object-fit: cover;
        overflow: auto;
    }

</style>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>

<c:if test="${bnf==null}">
<form action="memberEdit.wow" method="get" enctype="multipart/form-data">
    <div class="body-container">
        <img src="<%=request.getContextPath()%>/member/showProfile.wow?fileName=${member.profile}&filePath=member"
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
                        <span>상품명 : ${productinfo.productName} </span>
                        <hr>
                        <span>개수 : ${productinfo.amount} 개</span>
                        <span>상품금액 : ${productinfo.price} 원</span>
                        <hr>
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
</body>
<script>
    $("#edit_btn").on("click", function (e) {
        document.getElementById('edit_btn').submit();
    })
</script>
</html>