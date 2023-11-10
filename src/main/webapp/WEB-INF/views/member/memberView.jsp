<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <title>memberView</title>
</head>
<body>
<table border="1">
    <tr> <td>아이디</td>      <td>${member.id}         </td></tr>
    <tr> <td>비밀번호</td>    <td>${member.password}   </td></tr>
    <tr> <td>이름</td>        <td>${member.name}       </td></tr>
    <tr> <td>생년월일</td>    <td>${member.birth}      </td></tr>
    <tr> <td>주소</td>        <td>${member.address}    </td></tr>
    <tr> <td>휴대전화번호</td>  <td>${member.phnum}      </td></tr>
    <tr> <td>이메일</td>      <td>${member.email}      </td></tr>

    <tr>
        <td>
            <a href="memberEdit.wow?Id=${member.id}">수정</a>&nbsp;|
            <a href="memberDelete.wow?Id=${member.id}">삭제</a>
        </td>
    </tr>
</table>
</body>
</html>