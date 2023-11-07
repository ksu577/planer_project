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
<a href="memberForm.wow">회원가</a> <br>
<table border="1">
    <thead>
    <tr>
        <td>아이디</td>
        <td>이름</td>
        <td>비밀번호</td>
        <td>주소</td>
        <td>핸드폰번호</td>
        <td>이메일</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${ memberList }" var="member">
        <tr>
            <td>${member.id}</td>
            <td>${member.name}</td>
            <td>${member.password}</td>
            <td>${member.address}</td>
            <td>${member.phnum}</td>
            <td>${member.email}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
