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

    <img src="<%=request.getContextPath()%>/member/showProfile.wow?fileName=${member.profile}&filePath=member" width="100px" height="100px" style="margin: auto; border-radius: 50px; border: 1px solid gainsboro">
    <tr> <td>아이디</td>      <td>${member.id}         </td></tr>
    <tr> <td>비밀번호</td>    <td>${member.password}   </td></tr>
    <tr> <td>이름</td>        <td>${member.name}       </td></tr>
    <tr> <td>생년월일</td>    <td>${member.birth}      </td></tr>
    <tr> <td>주소</td>        <td>${member.address}    </td></tr>
    <tr> <td>상세주소</td>        <td>${member.address2}    </td></tr>
    <tr> <td>휴대전화번호</td>  <td>${member.phnum}      </td></tr>
    <tr> <td>이메일</td>      <td>${member.email}      </td></tr>
    <tr> <td>회원가입일</td>      <td>${member.createDate}      </td></tr>
    <tr>
        <td>
            <a href="memberEdit.wow?Id=${member.id}">수정</a>
        </td>
    </tr>
</table>
</body>
</html>