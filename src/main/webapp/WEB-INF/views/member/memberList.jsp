<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
<%--<c:if test="${user.getRole()=='MANAGER'}">--%>
    <div class="container">
        <div class="panel panel-default collapse in" id="id_search_area">
            <div class="panel-body">
                <form name="search" action="memberList.wow" method="post" class="form-horizontal">
                    <input type="hidden" name="curPage" value="${paging.curPage}"> <input type="hidden"
                                                                                          name="rowSizePerPage"
                                                                                          value="${paging.rowSizePerPage}">
                    <div class="form-group">
                        <div class="col-sm-2">
                            <select id="id_searchType" name="searchType" class="form-control input-sm">
                                <option value="NAME" ${search.searchType=='NAME' ? "selected='selected'" :""} >이름
                                </option>
                                <option value="ID" ${search.searchType=='ID' ? "selected='selected'" :""} >아이디</option>
                            </select>
                            <div class="col-sm-2">
                                <input type="text" name="searchWord" class="form-control input-sm"
                                       value="${search.searchWord}"
                                       placeholder="검색어">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <h3>회원목록</h3>

        <table class="table table-striped table-bordered">
            <caption class="hidden">회원목록 조회</caption>
            <colgroup>
                <col style="width: 10%"/>
                <col style="width: 10%"/>
                <col style="width: 10%"/>
                <col style="width: 10%"/>
                <col style="width: 20%"/>
                <col style="width: 10%"/>
                <col style="width: 10%"/>
                <col style="width: 10%"/>
                <col style="width: 10%"/>
            </colgroup>
            <thead>
            <tr>
                <td>아이디</td>
                <td>비밀번호</td>
                <td>이름</td>
                <td>생년월일</td>
                <td>주소</td>
                <td>상세주소</td>
                <td>휴대전화번호</td>
                <td>이메일</td>
                <td>회원가입일</td>
                <td hidden="true">삭제여부</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${memberList}" var="member">
                <tr>
                    <td><a href="memberView.wow?Id=${member.id}">${member.id}</a></td>
                    <td>${member.password}</td>
                    <td>${member.name}</td>
                    <td>${member.birth}</td>
                    <td>${member.address}</td>
                    <td>${member.address2}</td>
                    <td>${member.phnum}</td>
                    <td>${member.email}</td>
                    <td>${member.createDate}</td>
                    <td id="resign" hidden="true">${member.delYn}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <nav class="text-center">
            <ul class="pagination">
                <li><a href="memberList.wow?curpage=1">&laquo;</a></li>
                <li><a href="memberList.wow?curpage=1${paging.curPage-1}">&lt;</a></li>

                <c:forEach begin="${paging.firstPage}" end="${paging.lastPage}" var="i">
                    <c:if test="${paging.curPage eq i}">
                        <li class="active"><a href="#">${paging.curPage}</a></li>
                    </c:if>
                    <c:if test="${paging.curPage ne i}">
                        <li><a href="memberList.wow?curPage=${i}" data-page="${i}">${i}</a></li>
                    </c:if>
                </c:forEach>

                <li><a href="memberList.wow?curPage=${paging.curPage+1}">&gt;</a></li>
                <li><a href="memberList.wow?curPage=${paging.totalPageCount}"
                       data-page="${paging.totalPageCount}">&raquo;</a>
                </li>
            </ul>
        </nav>
    </div>
<%--</c:if>--%>
</body>
</html>
