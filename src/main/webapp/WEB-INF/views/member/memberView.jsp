<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/WEB-INF/inc/header.jsp" %>
    <title>memberView</title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<table border="1">


    <div class="container" style="padding-top: 100px">
        <div>
        <c:if test="${bnf==null}">
            <img src="<%=request.getContextPath()%>/member/showProfile.wow?fileName=${member.profile}&filePath=member"
                 width="100px" height="100px"
                 style="margin: auto; border-radius: 50px; border: 1px solid gainsboro">
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
                <td>
                    <a href="memberEdit.wow?Id=${member.id}">수정</a>
                </td>
            </tr>
        </c:if>
        </div>

        <div class="paycontainer mt-3">
            <div class="address col-md-8">
                <h2>주문정보</h2>
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
</table>
</body>
</html>