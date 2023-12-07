<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <title>회원 목록</title>
</head>
<style>
    td {
        background-color: #98dde3;
    }

    .top-background {
        background-color: #98dde3;
        height: 70px;
    }
</style>
<body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<%@ include file="/WEB-INF/inc/top.jsp" %>
<%--<c:if test="${user.getRole()=='MANAGER'}">--%>
<div class="top-background"></div>
<div style="padding-top: 120px;" class="container">
    <div class="panel panel-default" id="id_search_area" style="background-color: #98dde3;">
        <div class="panel-body">
            <form name="search" action="memberList.wow" method="post" class="form-horizontal">
                <input type="hidden" name="curPage" value="${paging.curPage}">
                <input type="hidden" name="rowSizePerPage" value="${paging.rowSizePerPage}">
                <div class="form-group">
                    <label for="id_searchType" class="col-sm-1 control-label"></label>
                    <div class="col-sm-2">
                        <select id="id_searchType" name="searchType" class="form-control input-sm"
                                style="font-size: 13px; padding: 0rem 0.75rem;">
                            <option value="NAME" ${search.searchType=='NAME' ? "selected='selected'" :""} >이름</option>
                            <option value="ID" ${search.searchType=='ID' ? "selected='selected'" :""} >아이디</option>
                        </select>
                    </div>
                    <div class="col-sm-6">
                        <input style="font-size: 13px;" type="text" name="searchWord" class="form-control input-sm"
                               value="${search.searchWord}"
                               placeholder="검색어">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-2 col-sm-offset-9 text-right">
                        <button type="button" id="id_btn_reset" class="btn btn-sm btn-default"
                                style="background-color: white; font-size: 13px; width: 70px;">
                            <i class="fa fa-sync"></i> 초기화
                        </button>
                    </div>
                    <div class="col-sm-1 text-right">
                        <button type="submit" class="btn btn-sm btn-primary" style="width: 50px; font-size: 13px;">
                            <i class="fa fa-search"></i> 검 색
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <h3>회원목록</h3>

    <table class="table table-bordered">
        <caption class="hidden">회원목록 조회</caption>
        <colgroup>
            <col style="width: 10%"/>
            <col style="width: 10%"/>
            <col style="width: 10%"/>
            <col style="width: 10%"/>
            <col style="width: 15%"/>
            <col style="width: 10%"/>
            <col style="width: 10%"/>
            <col style="width: 10%"/>
            <col style="width: 10%"/>
            <col style="width: 5%"/>
        </colgroup>
        <thead>
        <tr style="font-size: 13px; text-align: center; background-color: #98dde3;">
            <td style="background-color: #98dde3; color: white; border: 1px solid white;">아이디</td>
            <td style="background-color: #98dde3; color: white; border: 1px solid white;">비밀번호</td>
            <td style="background-color: #98dde3; color: white; border: 1px solid white;">이름</td>
            <td style="background-color: #98dde3; color: white; border: 1px solid white;">생년월일</td>
            <td style="background-color: #98dde3; color: white; border: 1px solid white;">주소</td>
            <td style="background-color: #98dde3; color: white; border: 1px solid white;">상세주소</td>
            <td style="background-color: #98dde3; color: white; border: 1px solid white;">휴대전화번호</td>
            <td style="background-color: #98dde3; color: white; border: 1px solid white;">이메일</td>
            <td style="background-color: #98dde3; color: white; border: 1px solid white;">회원가입일</td>
            <td style="background-color: #98dde3; color: white; border: 1px solid white;">삭 제</td>
            <td hidden="true">삭제여부</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${memberList}" var="member">
            <tr style="font-size: 12px; text-align: center;">
                <td style="background-color: white; border: 1px solid #98dde3;"><a STYLE="text-decoration: none;" href="memberView.wow?Id=${member.id}">${member.id}</a>
                </td>
                <td style="background-color: white; border: 1px solid #98dde3;">${member.password}</td>
                <td style="background-color: white; border: 1px solid #98dde3;">${member.name}</td>
                <td style="background-color: white; border: 1px solid #98dde3;">${member.birth}</td>
                <td style="background-color: white; border: 1px solid #98dde3;">${member.address}</td>
                <td style="background-color: white; border: 1px solid #98dde3;">${member.address2}</td>
                <td style="background-color: white; border: 1px solid #98dde3;">${member.phnum}</td>
                <td style="background-color: white; border: 1px solid #98dde3;">${member.email}</td>
                <td style="background-color: white; border: 1px solid #98dde3;">${member.createDate}</td>
                <td style="border: 1px solid #98dde3;">
                    <form action="memberDelete.wow" method="post" enctype="multipart/form-data">
                        <button id="delete_btn" class="delete_btn" type="submit"
                                formaction="memberDelete.wow?Id=${member.id}"
                                style="width: 50px; height: 30px; border: 1px solid white; border-radius: 5px; background-color: #0d6efd; color: white;">
                            삭 제
                        </button>
                    </form>
                </td>
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
<script>
    $(".delete_btn").on("click", function () {
        if (confirm("회원을 삭제 하시겠습니까?")) {
            alert("삭제 되었습니다.");
            document.getElementById('delete_btn').submit();
        } else {
            return false;
        }
    })

    $('#id_btn_reset').click(function() {
        $form.find("input[name='searchWord']").val("");
    });
</script>
</html>
