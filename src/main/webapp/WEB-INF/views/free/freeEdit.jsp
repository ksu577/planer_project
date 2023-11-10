<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
            <th>내용</th>
            <td><textarea rows="10" name="freeContext">${freeBoard.freeContext } </textarea></td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${freeBoard.viewRate } </td>
        </tr>
        <tr>
            <th>최근등록일자</th>
            <td>${freeBoard.updateDate eq null ? freeBoard.createDate : freeBoard.updateDate }
            </td>
        </tr>
        <tr>
            <td>
                <button type="submit"> 수정</button>

                <button type="submit" formaction="freeDelete.wow">삭제</button>
            </td>
        </tr>
        <tr>
            <th>첨부파일
                <button type="button" id="id_btn_new_file">추가</button>
            </th>
            <td class="file_area">
                <c:forEach var="f" items="${freeBoard.attaches}" varStatus="st">
                    <div>
                        # 파일 ${st.count} <a href="<c:url value='/attach/download/${f.atchNo}' />" target="_blank"> <span
                            class="glyphicon glyphicon-save" aria-hidden="true"></span> ${f.atchOriginalName}
                    </a> Size : ${f.atchFancySize} Down : ${f.atchDownHit}
                        <button class="btn_file_delete" data-atch-no="${f.atchNo}">
                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                        </button>
                    </div>
                </c:forEach>
                <div class="form-inline">
                    <input type="file" name="boFiles" class="form-control">
                    <button type="button" class="btn_delete btn btn-sm">삭제</button>
                </div>
            </td>
        </tr>
    </table>
</form>


</body>
</html>
