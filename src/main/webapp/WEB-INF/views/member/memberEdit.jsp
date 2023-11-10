<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <title>memberEdit</title>
</head>
<body>
<form action="memberModify.wow" method="post">
    <table border="1">
        <tr>
            <th>아이디</th>
            <td><input type="text" readonly name="id" value="${member.id}" required="required"></td>
        </tr>

        <tr>
            <th>비밀번호</th>
            <td><input type="password" name="password" value="${member.password}" required="required"></td>
        </tr>

        <tr>
            <th>이름</th>
            <td><input type="text" name="name" value="${member.name}" required="required"></td>
        </tr>

        <tr>
            <th>생년월일</th>
            <td><input type="text" name="birth" value="${member.birth}" required="required"></td>
        </tr>

        <tr>
            <th>주소</th>
            <td><input type="text" name="address" value="${member.address}" required="required"></td>
        </tr>

        <tr>
            <th>휴대전화번호</th>
            <td><input type="text" name="phnum" value="${member.phnum}" required="required"></td>
        </tr>

        <tr>
            <th>이메일</th>
            <td><input type="text" name="email" value="${member.email}" required="required"></td>
        </tr>

        <tr>
            <td>
                <button type="submit">적용</button>
                <button type="submit" formaction="memberDelete.wow">삭제</button>
            </td>
        </tr>

    </table>
</form>
</body>
</html>
