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



    <div class="page-header">
        <h3>주문 기록 - <small>상세 물품</small></h3>
    </div>


    <div class="row">
    </div>
    <table class="table  table-bordered table-hover">
        <thead>
        <tr>
            <th style="background-color: #98dde3; color: white; border: 1px solid white;">카트 아이디</th>
            <th style="background-color: #98dde3; color: white; border: 1px solid white;">유저 아이디</th>
            <th style="background-color: #98dde3; color: white; border: 1px solid white;">물품</th>
            <th style="background-color: #98dde3; color: white; border: 1px solid white;">구매량</th>
        </tr>
        </thead>
        <tbody>


        <c:forEach items="${buyingMemberList}" var="buyingMemberList" begin="${(paging.curPage - 1) * 15}" end="${(paging.curPage * 15) - 1}">

            <tr style="font-size: 12px; text-align: center;" class="text-center">
                <td style="background-color: white; border: 1px solid #98dde3;" >${buyingMemberList.userId}</td>
                <td style="background-color: white; border: 1px solid #98dde3;" ><a style="text-decoration:none;" href="buyingMemberView.wow?saveNum=${buyingMemberList.saveNum}">${buyingMemberList.takeName}</a></td>
                <td style="background-color: white; border: 1px solid #98dde3;" >${buyingMemberList.takeHp}</td>
                <td style="background-color: white; border: 1px solid #98dde3;" >${buyingMemberList.takeAdd}</td>
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