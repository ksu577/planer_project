<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>
<%
    request.setCharacterEncoding("UTF-8");

%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>

    <!-- 추가된 스타일과 스크립트 -->
    <style type="text/css">

        body a {
            text-decoration: none; /* 밑줄 제거 */
            color: inherit; /* 링크의 기본 색상 유지 */
        }

        .panel-body {
            background-color: #98dde3; /* 배경색 설정 */
        }

        #noticeTable {
            margin: auto;
        }

        #noticeTable tbody tr {
            display: table-row;
            text-align: center;
        }

        #noticeTable thead tr {
            display: table-row;
            text-align: center;
        }


        #noticeTable {
            border-collapse: collapse;
            width: 100%;
        }

        #noticeTable tbody tr:nth-child(odd) {
            background-color: #f2f2f2;
        }

        #noticeTable td {
            border: 1px solid #dddddd;
            text-align: center;
            padding: 8px;
        }


        #noticeTable td:nth-child(2) {
            text-align: left;
        }

        .container {
            padding-top: 70px;
        }

        .top-background {
            height: 70px;
            background-color: #98dde3;
        }

        #mainList {
            /*border: 1px solid red;*/
            padding: 0px 10px 40px;
            width: 1300px;
            position: absolute;
            background-color: #ffffff;
        }

        #sidebar {
            float: left;
            margin: 0;
            padding: 0px;
            width: 193px;
            height: 300px;
            overflow: hidden;
            /*border: 1px solid red;*/
            position: relative;
            right: 15%;
            top: 100px;
        }

        #side_title {
            background-color: #98dde3;
        }

        .skip {
            position: absolute;
            left: -1000%;
            top: 0;
            width: 1px;
            height: 1px;
            font-size: 0;
            line-height: 0;
            overflow: hidden;
        }

        #side_title {
            color: #0f0f0f;
            margin: 0;
            padding: 0;
            width: 193px;
            height: 60px;

        }

        #side_title h2 {
            text-align: center;
            vertical-align: top;
            padding: 0px;
            margin: 0px;
        }

        #sidemenu {
            width: 193px;
            padding: 0;
            margin: 0;
        }

        #sidemenu ul {
            list-style: none;
            margin: 10px 0 0 0;
            padding: 0;
            width: 193px;
        }

        #sidemenu ul li {
            margin: 0;
            padding: 6px 0 6px 20px;
            width: 181px;
            vertical-align: top;
        }

        #side2m li a {
            font-size: 1.5em;
        }

        #noticeTable tbody tr {
            display: table-row;
            text-align: center;
        }

        #noticeTable th {
            background-color: #98dde3; /* 헤더 배경색 */
            color: #ffffff; /* 글자 색깔 */
            font-size: 12px; /* 글자 크기 */
        }

        #noticeTable thead tr {
            display: table-row;
            text-align: center;
        }


        #noticeTable {
            border-collapse: collapse;
            width: 100%;
        }

        #noticeTable tbody tr:nth-child(odd) {
            background-color: #0f0f0f;
        }

        #noticeTable td {
            border: 1px solid #dddddd;
            text-align: center;
            padding: 8px;
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

    </style>

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            function applyNoticeLogic() {

                // 순회하며 공지글이면 상단에 추가하고 개수를 체크
                $("tbody tr").each(function () {
                    if ($(this).find("td:nth-child(3) a").text().startsWith("[공지]")) {
                        $("#noticeTable tbody").append($(this).clone());
                        $(this).remove();
                    }
                });

                var noticeRows = $("#noticeTable tbody tr").toArray().sort(function (a, b) {
                    var dateA = new Date($(a).find("td:nth-child(4)").text());
                    var dateB = new Date($(b).find("td:nth-child(4)").text());
                    return dateB - dateA;
                });
            }

            applyNoticeLogic();
            $('ul.pagination li a[data-page]').click(function (e) {
                e.preventDefault();
                let curPage = $(this).data('page');
                $curPage.val(curPage);
                $form.submit();

                setTimeout(function () {
                    applyNoticeLogic();
                }, 100);
            });
            applyNoticeLogic();
        });
    </script>

</head>
<body>
<%@ include file="/WEB-INF/inc/top.jsp" %>

<div class="top-background">

</div>

<div class="container">

    <!-- START : 검색 폼  -->
    <div class="panel panel-default">
        <div class="panel-body">
            <form name="search" action="freeList.wow" method="get" class="form-horizontal">
                <input type="hidden" name="curPage" value="${paging.curPage}">
                <input type="hidden" name="rowSizePerPage" value="${paging.rowSizePerPage}">
                <div class="form-group">
                    <label for="id_searchType" class="col-sm-1 control-label"></label>
                    <div class="col-sm-2">
                        <select id="id_searchType" name="searchType" class="form-control input-sm">
                            <option value="T"  ${search.searchType=='T' ? "selected='selected'" :""} >제목</option>
                            <option value="W" ${search.searchType=='W' ? "selected='selected'"  :""} >작성자</option>
                            <option value="C" ${search.searchType=='C' ? "selected='selected'"  : ""} >내용</option>
                        </select>
                    </div>
                    <div class="col-sm-6">
                        <input type="text" name="searchWord" class="form-control input-sm" value="${search.searchWord}"
                               placeholder="검색어">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-2 col-sm-offset-9 text-right">
                        <button type="button" id="id_btn_reset" class="btn btn-sm btn-light">
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

    <div id="sidebar">
        <h2 class="skip">사이드 메뉴</h2>
        <div id="side_title">
            <h2>
                게시판
            </h2>
        </div>
        <div id="sidemenu">
            <ul id="side2m">
                <li><a href="noticeList.wow">공지게시판</a></li>
                <li><a href="freeList.wow">자유게시판</a></li>
            </ul>
        </div>
    </div>

    <div id="mainList">
        <div class="page-header">
            <h3>공지 게시판 - <small>공지 사항</small></h3>
        </div>

        <div class="row">
            <div class="col-sm-2 col-sm-offset-10 text-right" style="margin-bottom: 5px;">
                <c:if test="${request.isUserInRole('MANAGER') or user.role eq 'MANAGER'}">
                    <a href="freeForm.wow" class="btn btn-primary btn-sm">
                        <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
                        &nbsp;새글쓰기
                    </a>
                </c:if>
            </div>
        </div>

        <div class="row">
        </div>
        <!-- 추가된 테이블 -->
        <table id="noticeTable" class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>글번호</th>
                <th>작성자</th>
                <th>제목</th>
                <th>등록일</th>
                <th>조회수</th>
                <%--            <th>첨부파일</th>--%>
            </tr>
            </thead>
            <colgroup>
                <col width="10%"/>
                <col width="15%"/>
                <col/>
                <col width="10%"/>
                <col width="10%"/>
            </colgroup>
            <tbody></tbody>
        </table>


        <table>
            <c:forEach items="${freeBoardList}" var="freeBoard">
                <c:if test="${fn:startsWith(freeBoard.title, '[공지]') and freeBoard.notice eq 'Y'}">
                    <tr class="text-center">
                        <td>${freeBoard.freeNum}</td>
                        <td>${freeBoard.id}</td>
                        <td>
                            <a href="freeView.wow?freeNum=${freeBoard.freeNum}">${freeBoard.title}</a>
                        </td>
                        <td>${freeBoard.createDate}</td>
                        <td>${freeBoard.viewRate}</td>
                    </tr>
                </c:if>
            </c:forEach>
        </table>


        <%--  <!-- START : 페이지네이션  -->--%>
        <%--  <nav class="text-center">--%>
        <%--    <ul class="pagination">--%>
        <%--      <!-- 첫 페이지  -->--%>
        <%--      <li><a href="freeList.wow?curPage=1" data-page="1"><span aria-hidden="true">&laquo;</span></a></li>--%>
        <%--      <!-- 이전 페이지 -->--%>
        <%--      <c:if test="${paging.firstPage ne 1}">--%>
        <%--        <li><a href="freeList.wow?curPage=${paging.firstPage-1}" data-page="${paging.firstPage-1}"><span--%>
        <%--                aria-hidden="true">&lt;</span></a></li>--%>
        <%--      </c:if>--%>

        <%--      <!-- 페이지 넘버링  -->--%>
        <%--      <c:forEach begin="${paging.firstPage}" end="${paging.lastPage}" var="i">--%>
        <%--        <c:if test="${paging.curPage ne i}">--%>
        <%--          <li><a href="freeList.wow?curPage=${i}" data-page="${i}">${i}</a></li>--%>
        <%--        </c:if>--%>
        <%--        <c:if test="${paging.curPage eq i}">--%>
        <%--          <li class="active"><a href="#">${i}</a></li>--%>
        <%--        </c:if>--%>

        <%--      </c:forEach>--%>

        <%--      <!-- 다음  페이지  -->--%>
        <%--      <c:if test="${paging.lastPage ne paging.totalPageCount}">--%>
        <%--        <li><a href="freeList.wow?curPage=${paging.lastPage+1}" data-page="${paging.lastPage+1}"><span--%>
        <%--                aria-hidden="true">&gt;</span></a></li>--%>
        <%--      </c:if>--%>

        <%--      <!-- 마지막 페이지 -->--%>
        <%--      <li><a href="freeList.wow?curPage=${paging.totalPageCount}" data-page="${paging.totalPageCount}"><span--%>
        <%--              aria-hidden="true">&raquo;</span></a></li>--%>
        <%--    </ul>--%>
        <%--  </nav>--%>
        <%--  <!-- END : 페이지네이션  -->--%>
    </div>
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
                <img style="width: 30px; height: 30px; margin-top: 10px; margin-left: 10px"
                     src="https://cdn-icons-png.flaticon.com/128/3959/3959425.png">
            </a>
        </div>

        <div class="footer-icon">
            <a href="https://www.youtube.com/@nextit_center" target="_blank">
                <svg xmlns="http://www.w3.org/2000/svg" style="margin-left: 10px; margin-top: 10px;" width="30"
                     height="30" fill="black" class="bi bi-youtube" viewBox="0 0 16 16">
                    <path d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.007 2.007 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.007 2.007 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31.4 31.4 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.007 2.007 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A99.788 99.788 0 0 1 7.858 2h.193zM6.4 5.209v4.818l4.157-2.408L6.4 5.209z"/>
                </svg>
            </a>
        </div>

        <div class="footer-icon">
            <a href="https://www.instagram.com/__nextit__/" target="_blank">
                <svg xmlns="http://www.w3.org/2000/svg" style="margin-left: 10px; margin-top: 10px;" width="30"
                     height="30" fill="black" class="bi bi-instagram"
                     viewBox="0 0 16 16">
                    <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"/>
                </svg>
            </a>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    // 변수 정의
    $form = $("form[name='search']");
    $curPage = $form.find("input[name='curPage']");
    // 각 이벤트 등록
    // 페이지 링크 클릭, event전파방지, data속성값읽고 form태그 내의 input name=curPage값 바꾸기
    //submit
    $('ul.pagination li a[data-page]').click(function (e) {
        e.preventDefault();
        let curPage = $(this).data('page');
        $curPage.val(curPage);
        $form.submit();
    }); // ul.pagination li a[data-page]


    //member까지 다 해보세요....3시간 동안..

    //form태그내의 버튼 클릭
    //이벤트전파방지, curPage 값 1로
    //submit
    $form.find("button[type=submit]").click(function (e) {
        e.preventDefault();
        $curPage.val(1);
        $form.submit();
    });

    // 목록 갯수 변경
    // id_rowSizePerPage 변경되었을 때
    // 페이지 1, 목록수 = 현재값 으로 변경 후 서브밋
    $('#id_rowSizePerPage').change(function (e) {
        $curPage.val(1);
        $form.find("input[name='rowSizePerPage']").val($(this).val());
        $form.submit();
    }); // '#id_rowSizePerPage'.change

    // 초기화 버튼 클릭
    $('#id_btn_reset').click(function () {
        $("#id_searchType option:eq(0)").prop("selected", "selected");
        $form.find("input[name='searchWord']").val("");
        $("#id_searchCategory option:eq(0)").prop("selected", "selected");
    }); // #id_btn_reset.click

</script>
</html>