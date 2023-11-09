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
    <tr><td>글번호</td>   <td>${freeBoard.freeNum}</td></tr>
    <tr><td>제목</td>    <td>${freeBoard.title}</td></tr>
    <tr><td>작성자</td>   <td>${freeBoard.id }</td></tr>
    <tr><td>내용</td>    <td><textarea readonly="readonly" rows="5">${freeBoard.freeContext }</textarea></td></tr>
    <tr><td>등록일</td>   <td>${freeBoard.createDate }</td></tr>
    <tr><td>삭제여부</td> <td>${freeBoard.boDelYn }</td></tr>
    <tr> <td> <a href="freeEdit.wow?freeNum=${freeBoard.freeNum }">수정</a></td></tr>

    <tr>
        <th>첨부파일</th>
        <td>
            <c:forEach var="f" items="${freeBoard.attaches}" varStatus="st">
                <div> 파일 ${st.count} <a href="<c:url value='/attach/download/${f.atchNo}' />" target="_blank">
                    <span class="glyphicon glyphicon-save" aria-hidden="true"></span> ${f.atchOriginalName}
                </a> Size : ${f.atchFancySize} Down : ${f.atchDownHit}
                </div>
            </c:forEach>
        </td>
    </tr>

</table>




</body>
</html>