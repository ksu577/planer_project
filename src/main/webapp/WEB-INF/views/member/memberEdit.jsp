<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <title>memberEdit</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
    .body-container {
        height: 310px;
        position: relative;
        background-color: #98dde3;
    }

    .my-container {
        border: 1px solid #98dde3;
        transform: translate(70%, 60%);
        width: 800px;
        height: 500px;
        border-radius: 15px;
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

    input[type=file]::file-selector-button {
        background-color: #0d6efd;
        border: 1px solid white;
        color: white;
        border-radius: 5px;
        width: 192px;
        height: 40px;
        cursor: pointer;
        font-size: 18px;
    }

</style>

<body>
<%@ include file="/WEB-INF/inc/top.jsp" %>
<form action="memberModify.wow" method="post" enctype="multipart/form-data">
    <div class="body-container">
        <img src="<%=request.getContextPath()%>/member/showProfile.wow?fileName=${member.profile}&filePath=member"
             id="profile"
             style="background-color: white; border-radius: 75px; border: 10px solid white; width: 150px; height: 150px; transform: translate(590%, 160%)">
        <input type="file" name="file"
               style="transform: translate(447%, 580%);">

        <div class="my-container">
            <table>
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
                        <button id="edit_btn" type="submit"
                                style="width: 80px; height: 30px; color: white; border-radius: 5px; background-color: #0d6efd; border: 1px solid white;">
                            적용
                        </button>
                        <c:if test="${user.getRole() =='USER'}">
                            <button class="delete_btn" type="submit"
                                    style="width: 80px; height: 30px; color: white; border-radius: 5px; background-color: #0d6efd; border: 1px solid white;"
                                    formaction="memberDelete.wow">탈퇴
                            </button>
                        </c:if>
                        <c:if test="${user.getRole() =='MANAGER'}">
                            <button class="delete_btn2" type="submit"
                                    style="width: 80px; height: 30px; color: white; border-radius: 5px; background-color: #0d6efd; border: 1px solid white;"
                                    formaction="memberDelete.wow">삭제
                            </button>
                        </c:if>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</form>
</body>
<script>
    $(".delete_btn").on("click", function (e) {
        if (confirm("탈퇴 하시겠습니까?") == true) {
            alert("탈퇴 되었습니다.");
            document.getElementById('delete_btn').submit();
        } else {
            return false;
        }
    })

    $(".delete_btn2").on("click", function (e) {
        if (confirm("ID : ${member.id} 회원을 삭제 하시겠습니까?") == true) {
            alert("삭제 되었습니다.");
            document.getElementById('delete_btn2').submit();
        } else {
            return false;
        }
    })

    $("#edit_btn").on("click", function (e) {
        if (confirm("변경사항이 있습니다. \n적용 하시겠습니까?") == true) {
            alert("변경 되었습니다.");
            document.getElementById('edit_btn').submit();
        } else {
            return false;
        }
    })
</script>
</html>
