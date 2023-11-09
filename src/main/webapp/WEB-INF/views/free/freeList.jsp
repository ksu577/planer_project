<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/inc/top.jsp" %>
<div class="container">

    <!-- START : 검색 폼  -->
    <div class="panel panel-default">
        <div class="panel-body">
            <form name="search" action="freeList.wow" method="post" class="form-horizontal">
                <input type="hidden" name="curPage" value="${paging.curPage}">
                <input type="hidden" name="rowSizePerPage" value="${paging.rowSizePerPage}">
                <div class="form-group">
                    <label for="id_searchType" class="col-sm-2 control-label">검색</label>
                    <div class="col-sm-2">
                        <select id="id_searchType" name="searchType" class="form-control input-sm">
                            <option value="T"  ${search.searchType=='T' ? "selected='selected'" :""} >제목</option>
                            <option value="W" ${search.searchType=='W' ? "selected='selected'"  :""} >작성자</option>
                            <option value="C" ${search.searchType=='C' ? "selected='selected'"  : ""} >내용</option>
                        </select>
                    </div>
                    <div class="col-sm-2">
                        <input type="text" name="searchWord" class="form-control input-sm" value="${search.searchWord}"
                               placeholder="검색어">
                    </div>
                    <label for="id_searchCategory" class="col-sm-2 col-sm-offset-2 control-label">분류</label>
                    <div class="col-sm-2">
                        <select id="id_searchCategory" name="searchCategory" class="form-control input-sm">
                            <option value="">-- 전체 --</option>
                            <c:forEach items="${cateList}" var="code">
                                <option value="${code.commCd}"
                                    ${searchCategory eq code.commCd ? "selected='selected'" : ""}  >${code.commNm}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-2 col-sm-offset-9 text-right">
                        <button type="button" id="id_btn_reset" class="btn btn-sm btn-default">
                            <i class="fa fa-sync"></i> &nbsp;&nbsp;초기화
                        </button>
                    </div>
                    <div class="col-sm-1 text-right">
                        <button type="submit" class="btn btn-sm btn-primary ">
                            <i class="fa fa-search"></i> &nbsp;&nbsp;검 색
                        </button>
                    </div>
                </div>
            </form>

        </div>
    </div>
    <!-- END : 검색 폼  -->

    <!-- START : 목록건수 및 새글쓰기 버튼  -->
    <div class="row" style="margin-bottom: 10px;">
        <div class="col-sm-3 form-inline">
            전체 ${paging.totalRowCount}건 조회
            <select id="id_rowSizePerPage" name="rowSizePerPage" class="form-control input-sm">
                <c:forEach var="i" begin="10" end="50" step="10">
                    <option value="${i}" ${paging.rowSizePerPage eq i ? "selected='selected'" : ""} >${i}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <!-- END : 목록건수 및 새글쓰기 버튼  -->

    <div class="page-header">
        <h3>자유게시판 - <small>글 목록</small></h3>
    </div>

    <div class="row">
        <div class="col-sm-2 col-sm-offset-10 text-right" style="margin-bottom: 5px;">
            <a href="freeForm.wow" class="btn btn-primary btn-sm">
                <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
                &nbsp;새글쓰기
            </a>
        </div>
    </div>
    <table class="table table-striped table-bordered table-hover">
        <colgroup>
            <col width="10%"/>
            <col width="15%"/>
            <col/>
            <col width="10%"/>
            <col width="15%"/>
            <col width="10%"/>
        </colgroup>
        <thead>
        <tr>
            <th>글번호</th>
            <th>분류</th>
            <th>제목</th>
            <th>작성자</th>
            <th>등록일</th>
            <th>조회수</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${freeBoardList }" var="freeBoard">
            <tr>
                <td>${freeBoard.freeNum}</td>
                <td><a href="freeView.wow?freeNum=${freeBoard.freeNum }"> ${freeBoard.title } </a></td>
                <td>${freeBoard.id }</td>
                <td>${freeBoard.createDate }</td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
    <a href="freeList.wow?curPage=1">&laquo;</a>
    <a href="freeList.wow?curPage=${paging.curPage-1 }">&lt;</a>
    <c:forEach begin="${paging.firstPage }" end="${paging.lastPage }" var="i">
        <a href="freeList.wow?curPage=${i }">
            <c:if test="${i eq paging.curPage }"> <span style="color: red"> ${i } </span> </c:if>
            <c:if test="${i ne paging.curPage }">  ${i } </c:if>
        </a>
    </c:forEach>
    <a href="freeList.wow?curPage=${paging.curPage+1 }">&gt;</a>
    <a href="freeList.wow?curPage=${paging.totalPageCount }">&raquo;</a>
</div>
</body>
</html>