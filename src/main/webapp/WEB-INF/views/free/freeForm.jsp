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
<form action="freeRegist.wow" method="post">
  <table border="1">
    <tr>
      <th>제목</th>
      <td><input type="text" name="title" value="" required="required"></td>
    </tr>
    <tr>
      <th>작성자</th>
      <td><input type="text" name="id" value=""></td>
    </tr>
    <tr>
      <th>분류</th>
      <td><input type="text" name="freeCategory" value=""></td>
    </tr>
    <tr>
      <th>내용</th>
      <td><textarea rows="10" name="freeContent"> </textarea></td>
    </tr>

    <tr>
      <td>
        <button type="submit" > 등록</button>
      </td>
    </tr>
  </table>
</form>


</body>
</html>