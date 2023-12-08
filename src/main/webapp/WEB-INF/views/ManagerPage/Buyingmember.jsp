<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<style>
    td {
        background-color: #98dde3;
    }

    .container{
        padding-top: 70px
    }

    .top-background{
        height: 70px;
        background-color: #98dde3;
    }





</style>
<head>
        <%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/inc/top.jsp" %>
<div class="top-background">

</div>
<div class="container">

    <!-- START : 검색 폼  -->
    <div class="panel panel-default" id="id_search_area" style="background-color: #98dde3;">
        <div class="panel-body">
            <form name="search" action="Buyingmember.wow" method="post" class="form-horizontal">
                <input type="hidden" name="curPage" value="${paging.curPage}"> <input type="hidden"
                                                                                      name="rowSizePerPage"
                                                                                      value="${paging.rowSizePerPage}">

                <div class="form-group">
                    <div class="col-sm-2">
                        <select id="id_searchType" name="searchType" class="form-control input-sm"
                                style="font-size: 13px; padding: 0rem 0.75rem;">
                            <option value="takeName" ${search.searchType=='takeName' ? "selected='selected'" :""} >이름
                            </option>
                            <option value="userId" ${search.searchType=='userId' ? "selected='selected'" :""} >아이디</option>
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
    <!-- END : 검색 폼  -->


    <div class="page-header">
        <h3>주문 기록 - <small>회원 목록</small></h3>
    </div>


    <div class="row">
    </div>
    <table class="table  table-bordered table-hover">
        <thead>
        <tr>
            <th style="background-color: #98dde3; color: white; border: 1px solid white;">유저 아이디</th>
            <th style="background-color: #98dde3; color: white; border: 1px solid white;">이름</th>
            <th style="background-color: #98dde3; color: white; border: 1px solid white;">전화번호</th>
            <th style="background-color: #98dde3; color: white; border: 1px solid white;">주소</th>
            <th style="background-color: #98dde3; color: white; border: 1px solid white;">날짜</th>
            <th style="background-color: #98dde3; color: white; border: 1px solid white;">물품</th>

            <th style="background-color: #98dde3; color: white; border: 1px solid white;">삭제</th>
        </tr>
        </thead>
        <tbody>


        <c:forEach items="${buyingMemberList}" var="buyingMemberList" begin="${(paging.curPage - 1) * 15}" end="${(paging.curPage * 15) - 1}">

            <tr style="font-size: 12px; text-align: center;" class="text-center">
                <td style="background-color: white; border: 1px solid #98dde3;" >${buyingMemberList.userId}</td>
                <td style="background-color: white; border: 1px solid #98dde3;" ><a style="text-decoration:none;" href="buyingMemberView.wow?saveNum=${buyingMemberList.saveNum}">${buyingMemberList.takeName}</a></td>
                <td style="background-color: white; border: 1px solid #98dde3;" >${buyingMemberList.takeHp}</td>
                <td style="background-color: white; border: 1px solid #98dde3;" >${buyingMemberList.takeAdd}</td>
                <td style="background-color: white; border: 1px solid #98dde3;" >${buyingMemberList.payDate}</td>
            </tr>
        </c:forEach>

        </tbody>
    </table>


    <nav class="text-center">
        <ul class="pagination">
            <li><a href="Buyingmember?curpage=1">&laquo;</a></li>
            <li><a href="Buyingmember?curpage=1${paging.curPage-1}">&lt;</a></li>

            <c:forEach begin="${paging.firstPage}" end="${paging.lastPage}" var="i">
                <c:if test="${paging.curPage eq i}">
                    <li class="active"><a href="#">${paging.curPage}</a></li>
                </c:if>
                <c:if test="${paging.curPage ne i}">
                    <li><a href="Buyingmember?curPage=${i}" data-page="${i}">${i}</a></li>
                </c:if>
            </c:forEach>

            <li><a href="Buyingmember?curPage=${paging.curPage+1}">&gt;</a></li>
            <li><a href="Buyingmember?curPage=${paging.totalPageCount}"
                   data-page="${paging.totalPageCount}">&raquo;</a>
            </li>
        </ul>
    </nav>
</div>
</body>

</script>
</html>