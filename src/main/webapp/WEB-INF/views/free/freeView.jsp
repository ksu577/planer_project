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


<table border="1">
    <tr><td>글번호</td>   <td>${freeBoard.free_Num}</td></tr>
    <tr><td>제목</td>    <td>${freeBoard.Title}</td></tr>
    <tr><td>분류</td>    <td>${freeBoard.freeCategory }</td></tr>
    <tr><td>작성자</td>   <td>${freeBoard.Id }</td></tr>
    <tr><td>내용</td>    <td><textarea readonly="readonly" rows="5">${freeBoard.freeContext }</textarea></td></tr>
    <tr><td>등록일</td>   <td>${freeBoard.createDate }</td></tr>
    <tr> <td> <a href="freeEdit.wow?freeNum=${freeBoard.free_Num }">수정</a></td></tr>
</table>




</body>
</html>