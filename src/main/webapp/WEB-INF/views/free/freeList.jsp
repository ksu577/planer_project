<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>

<a href="freeForm.wow">글쓰기</a> <br>
<table border="1">
    <thead>
    <tr>
        <td>글번호</td>
        <td>제목</td>
        <td>글 분류</td>
        <td>아이디</td>
        <td>등록일</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${freeBoardList }" var="freeBoard">
        <tr>
            <td>${freeBoard.freeNum }</td>
            <td><a href="freeView.wow?freeNum=${freeBoard.freeNum }"> ${freeBoard.title } </a> </td>
            <td>${freeBoard.freeCategory }</td>
            <td>${freeBoard.id }</td>
            <td>${freeBoard.createDate }</td>
        </tr>
    </c:forEach>
    </tbody>
</table>


</body>
</html>