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

    .footer-container {
        margin-top: 100px;
        background-color: rgba(220, 220, 220, 0.30);
        height: 310px;
        color: #868e96;
    }

    h5 {
        width: 500px;
        transform: translate(40%, 100%);
        padding-top: 10px;
        color: white;
    }

    h4 {
        width: 500px;
        transform: translate(40%, 300%);
    }

    .footer-icons {
        width: 350px;
        /*border: 1px solid red;*/
        transform: translate(430%, -180%);
        display: flex;

    }

    .footer-icon {
        height: 50px;
        width: 50px;
        border-radius: 50px;
        /*border: 1px solid black;*/
        box-shadow: 0 0 10px 5px gainsboro;
        margin-right: 30px;
        background-color: white;
    }

    ::-webkit-scrollbar {
        width: 5px;
    }

    ::-webkit-scrollbar-thumb {
        background-color: gainsboro;
        border-radius: 5px;
    }

    ::-webkit-scrollbar-thumb:hover {
        background-color: darkgray;
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

        </tr>
        </thead>
        <tbody>


        <c:forEach items="${buyingMemberList}" var="buyingMemberList" begin="${(paging.curPage - 1) * 15}" end="${(paging.curPage * 15) - 1}">

            <tr style="font-size: 12px; text-align: center;" class="text-center">
                <td style="background-color: white; border: 1px solid #98dde3;" >${buyingMemberList.userId}</td>
                <td style="background-color: white; border: 1px solid #98dde3;" ><a style="text-decoration:none;" href="/ManagerPage/buyingMemberView.wow?saveNum=${buyingMemberList.saveNum}">${buyingMemberList.takeName}</a></td>
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
<div class="footer-container">
    <div class="footer logo" style="width: 300px; transform: translate(65%, 20%)">
        G-ROUTE
    </div>
    <h5>주식회사 그루트 | 팀장 권순욱</h5>
    <h5>대전광역시 중구 계룡로 825 (용두동) 2층</h5>
    <h5>ksu577@naver.com</h5>
    <h5>Tel : 042-719-8850</h5>
    <h4>Copyright © G-Route. All Right Reserved</h4>

    <div class="footer-icons">
        <div class="footer-icon">
            <a href="https://blog.naver.com/nextit_center" target="_blank">
                <svg xmlns="http://www.w3.org/2000/svg" style="margin-left: 10px; margin-top: 10px;" width="30" height="30" fill="#2DB400" class="bi bi-bootstrap" viewBox="0 0 16 16">
                    <path d="M5.062 12h3.475c1.804 0 2.888-.908 2.888-2.396 0-1.102-.761-1.916-1.904-2.034v-.1c.832-.14 1.482-.93 1.482-1.816 0-1.3-.955-2.11-2.542-2.11H5.062V12zm1.313-4.875V4.658h1.78c.973 0 1.542.457 1.542 1.237 0 .802-.604 1.23-1.764 1.23H6.375zm0 3.762V8.162h1.822c1.236 0 1.887.463 1.887 1.348 0 .896-.627 1.377-1.811 1.377H6.375z"/>
                    <path d="M0 4a4 4 0 0 1 4-4h8a4 4 0 0 1 4 4v8a4 4 0 0 1-4 4H4a4 4 0 0 1-4-4V4zm4-3a3 3 0 0 0-3 3v8a3 3 0 0 0 3 3h8a3 3 0 0 0 3-3V4a3 3 0 0 0-3-3H4z"/>
                </svg>
            </a>
        </div>

        <div class="footer-icon">
            <a href="https://www.youtube.com/@nextit_center" target="_blank">
                <svg xmlns="http://www.w3.org/2000/svg" style="margin-left: 10px; margin-top: 10px;" width="30"
                     height="30" fill="red" class="bi bi-youtube" viewBox="0 0 16 16">
                    <path d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.007 2.007 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.007 2.007 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31.4 31.4 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.007 2.007 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A99.788 99.788 0 0 1 7.858 2h.193zM6.4 5.209v4.818l4.157-2.408L6.4 5.209z"/>
                </svg>
            </a>
        </div>

        <div class="footer-icon" style="background: radial-gradient(circle farthest-corner at 32% 106%,#ffe17d 0%,#ffcd69 10%,#fa9137 28%,#eb4141 42%,transparent 82%) , linear-gradient(135deg,#234bd7 12%,#c33cbe 58%);">
            <a href="https://www.instagram.com/__nextit__/" target="_blank">
                <svg xmlns="http://www.w3.org/2000/svg" style=" margin-left: 10px; margin-top: 10px;" width="30"
                     height="30" fill="white" class="bi bi-instagram"
                     viewBox="0 0 16 16">
                    <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"/>
                </svg>
            </a>
        </div>
    </div>
</div>
</body>

</script>
</html>