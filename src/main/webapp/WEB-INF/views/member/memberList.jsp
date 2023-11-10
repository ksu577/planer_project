<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <title>memberList</title>
</head>
<body>
<a href="memberForm.wow">회원가입</a> <br>
<table border="1">
    <thead>
    <tr>
        <td>아이디</td>
        <td>비밀번호</td>
        <td>이름</td>
        <td>생년월일</td>
        <td>주소</td>
        <td>핸드폰번호</td>
        <td>이메일</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${ memberList }" var="member">
        <tr>
            <td><a href="memberView.wow?Id=${member.id}"> ${member.id} </a></td>
            <td>${member.password}</td>
            <td>${member.name}</td>
            <td>${member.birth}</td>
            <td>${member.address}</td>
            <td>${member.phnum}</td>
            <td>${member.email}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<a href="memberList.wow?curpage=1">&laquo;</a>
<a href="memberList.wow?curpage=1${paging.curPage-1}">&lt;</a>

<c:forEach begin="${paging.firstPage}" end="${paging.lastPage}" var="i">
    <a href="memberList.wow?curPage=${i}">
        <c:if test="${paging.curPage eq i}"><span style="color: red">${i}</span></c:if>
        <c:if test="${paging.curPage ne i}">${i}</c:if>
    </a>
</c:forEach>

<a href="memberList.wow?curPage=${paging.curPage+1}">&gt;</a>
<a href="memberList.wow?curPage=${paging.totalPageCount}">&raquo;</a>

</body>
</html>
