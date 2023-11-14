<%@ page import="com.study.login.vo.UserVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");

    UserVO user = (UserVO) session.getAttribute("user");
    String loggedInUserName = user.getId();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/inc/top.jsp" %>
<div class="container">
    <div class="page-header">
        <h3>자유게시판 - <small>글 등록</small></h3>
    </div>
    <form action="freeRegist.wow" method="post" modelAttribute="freeBoard" enctype="multipart/form-data">

        <table class="table table-striped table-bordered">
            <colgroup>
                <col width="20%"/>
                <col/>
            </colgroup>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" value="" required="required"></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><input readonly type="text" name="id" value="<%= loggedInUserName %>"></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea rows="10"  name="freeContext"> </textarea></td>
            </tr>

            <tr>
                <th>첨부파일
                    <button type="button" id="id_btn_new_file">추가</button>
                </th>
                <td class="file_area">
                    <div class="form-inline">
                        <input type="file" name="boFiles" class="form-control">
                        <button type="button" class="btn_delete btn btn-sm">삭제</button>
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <button type="submit"> 등록</button>
                </td>
            </tr>
        </table>
    </form>

</div>
</body>
<script type="text/javascript">
    $('#id_btn_new_file').click(function () {
        $('.file_area').append('<div class="form-inline">'
            + '<input type="file" name="boFiles" class="form-control">'
            + ' <button type="button" class="btn_delete btn btn-sm">삭제</button>' + '</div>');
    });

    $('.file_area').on('click', '.btn_delete', function () {
        $(this).closest('div').remove();
    });
</script>
</html>