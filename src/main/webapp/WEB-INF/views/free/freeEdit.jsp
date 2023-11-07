<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
  <title></title>
</head>
<body>
<form action="freeModify.wow" method="post">
  <table border="1">
    <tr>
      <th>글번호</th>
      <td>${freeBoard.freeNum }<input type="hidden" name="freeNum"
                                   value="${freeBoard.freeNum }">
      </td>
    </tr>
    <tr>
      <th>제목</th>
      <td><input type="text" name="title"
                 value="${freeBoard.title }" required="required"></td>
    </tr>
    <tr>
      <th>작성자</th>
      <td>${freeBoard.id }<input type="hidden" name="id"
                                       value="${freeBoard.id }">
      </td>
    </tr>
    <tr>
      <th>분류</th>
      <td><input type="text" name="freeCategory"
                 value="${freeBoard.freeCategory }"></td>
    </tr>
    <tr>
      <th>내용</th>
      <td><textarea rows="10" name="freeContent">${freeBoard.freeContext } </textarea></td>
    </tr>

    <tr>
      <th>최근등록일자</th>
      <td>${freeBoard.updateDate eq null ? freeBoard.createDate : freeBoard.updateDate }
      </td>
    </tr>
    <tr>
      <td>
        <button type="submit" > 수정</button>

        <button type="submit" formaction="freeDelete.wow">삭제</button>
      </td>
    </tr>
  </table>
</form>


</body>
</html>
