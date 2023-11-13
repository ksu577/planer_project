<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="/WEB-INF/inc/header.jsp" %>
    <title>자유게시판 - 글 보기</title>
</head>
<body>
<%@ include file="/WEB-INF/inc/top.jsp" %>
<div class="container">
    <div class="page-header">
        <h3>
            자유게시판 - <small>글 보기</small>
        </h3>
    </div>
    <table class="table table-striped table-bordered">
        <tbody>
        <tr>
            <td>글번호</td>
            <td>${freeBoard.freeNum}</td>
        </tr>
        <tr>
            <td>제목</td>
            <td>${freeBoard.title}</td>
        </tr>
        <tr>
            <td>작성자</td>
            <td>${freeBoard.id }</td>
        </tr>
        <tr>
            <td>내용</td>
            <td><textarea rows="10" name="freeContext" class="form-control input-sm" readonly="readonly">${freeBoard.freeContext }</textarea></td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${freeBoard.viewRate }</td>
        </tr>
        <tr>
            <td>등록일</td>
            <td>${freeBoard.createDate }</td>
        </tr>



        <tr>
            <th>첨부파일</th>
            <td>
                <c:forEach var="f" items="${freeBoard.attaches}" varStatus="st">
                    <div> 파일 ${st.count} <a href="<c:url value='/attach/download/${f.atchNo}' />" target="_blank">
                        <span class="glyphicon glyphicon-save" aria-hidden="true"></span> ${f.atchOriginalName}
                    </a> Size : ${f.atchFancySize} Down : ${f.atchDownHit}

                        <img alt="" src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${f.atchFileName}&filePath=${f.atchPath}" width="100px" height="100px">
                    </div>
                </c:forEach>
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <div class="pull-left">
                    <a href="freeList.wow" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-list" aria-hidden="true"></span> &nbsp;&nbsp;목록
                    </a>
                </div>
                <div class="pull-right">
                    <a href="freeEdit.wow?freeNum=${freeBoard.freeNum }" class="btn btn-success btn-sm"> <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> &nbsp;&nbsp;수정
                    </a>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>