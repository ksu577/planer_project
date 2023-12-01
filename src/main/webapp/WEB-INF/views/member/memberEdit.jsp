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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<body>
<form action="memberModify.wow" method="post" enctype="multipart/form-data">
    <table border="1">

        <img src="<%=request.getContextPath()%>/member/showProfile.wow?fileName=${member.profile}&filePath=member"
             id="profile" style="border-radius: 50px;  border: 1px solid gainsboro" width="100px" height="100px">
        <input type="file" name="file" style="cursor: pointer; border: 1px solid #868e96">

        <tr>
            <th>아이디</th>
            <td><input type="text" readonly name="id" value="${member.id}" required="required"></td>
        </tr>

        <tr>
            <th>비밀번호</th>
            <td><input type="text" name="password" value="${member.password}" required="required"></td>
        </tr>

        <tr>
            <th>이름</th>
            <td><input type="text" name="name" value="${member.name}" required="required"></td>
        </tr>

        <tr>
            <th>생년월일</th>
            <td><input type="date" name="birth" value="${member.birth}" required="required"></td>
        </tr>

        <tr>
            <th>주소</th>
            <td><input type="text" name="address" value="${member.address}" required="required"></td>
        </tr>

        <tr>
            <th>상세주소</th>
            <td><input type="text" name="address2" value="${member.address2}" required="required"></td>
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
                <c:if test="${user.getRole() =='USER'}">
                    <button id="delete_btn" type="submit" formaction="memberDelete.wow">탈퇴</button>
                </c:if>
                <c:if test="${user.getRole() =='MANAGER'}">
                    <button id="delete_btn" type="submit" formaction="memberDelete.wow">삭제</button>
                </c:if>
            </td>
        </tr>
    </table>
</form>
</body>
<script>
    $("#delete_btn").on("click", function (e) {
        if (confirm("탈퇴 하시겠습니까?") == true) {
            alert("탈퇴 되었습니다.");
            document.getElementById('delete_btn').submit();
        } else {
            return false;
        }
    })
</script>
</html>
