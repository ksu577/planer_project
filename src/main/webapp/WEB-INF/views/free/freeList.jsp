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

        .top-background{
            height: 70px;
            background-color: #98dde3;
        }

        body a {
            text-decoration: none; /* 밑줄 제거 */
            color: inherit; /* 링크의 기본 색상 유지 */
        }

        .panel-body {
            background-color: #98dde3; /* 배경색 설정 */
        }

        #mainList {
            background-color: #ffffff;
        }


        #noticeTable {
            margin: auto;
        }


        #noticeTable td {
            color: #0f0f0f; /* 글자 색깔 */
            font-size: 12px; /* 글자 크기 */
        }

        #freeTable td {
            color:#5e5e5e ; /* 글자 색깔 */
            font-size: 12px; /* 글자 크기 */
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

        body {
            font-size: 100%;
        }

        .container {
            padding-top: 70px;
        }

        #mainList {
            border: 1px solid red;
            padding: 0px 10px 40px;
            width: 1300px;
            position: absolute;
        }

        #sidebar {
            float: left;
            margin: 0;
            padding: 0 20px;
            width: 193px;
            height: 300px;
            overflow: hidden;
            border: 1px solid red;
            position: relative;
            right: 15%;
        }
        #side_title{
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

        #side2m li a{
            font-size: 1.5em;
        }

        .page-header {
            right: 10%;
        }

        .hit {
            animation-name: blink;
            animation-duration: 1.5s;
            animation-timing-function: ease;
            animation-iteration-count: infinite;
            /* 위 속성들을 한 줄로 표기하기 */
            /* -webkit-animation: blink 1.5s ease infinite; */
        }

        /* 애니메이션 지점 설정하기 */
        /* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
        @keyframes blink {
            from {color: white;}
            30% {color: yellow;}
            to {color: red; font-weight: bold;}

        }

    </style>

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            function applyNoticeLogic() {
                // 상단 공지글 개수 제한
                var maxNoticeCount = 3;
                var noticeCount = 0;

                // 순회하며 공지글이면 상단에 추가하고 개수를 체크
                $("tbody tr").each(function () {
                    if ($(this).find("td:nth-child(3) a").text().startsWith("[공지]") && noticeCount < maxNoticeCount) {
                        $("#noticeTable tbody").append($(this).clone());
                        $(this).remove();
                        noticeCount++;
                    }
                });

                var noticeRows = $("#noticeTable tbody tr").toArray().sort(function (a, b) {
                    var dateA = new Date($(a).find("td:nth-child(4)").text());
                    var dateB = new Date($(b).find("td:nth-child(4)").text());
                    return dateB - dateA;
                });

                if (noticeRows.length > 3) {
                    noticeRows.slice(3).hide();
                }

                // 나머지 공지사항 숨김/보임 토글 처리
                $("#showMoreNotices").click(function () {
                    noticeRows.slice(3).toggle();
                });

                if (noticeCount >= maxNoticeCount) {
                    $("#freeTable tbody tr").each(function () {
                        if ($(this).find("td:nth-child(3) a").text().startsWith("[공지]")) {
                            $(this).remove();
                        }
                    });
                }
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
    <div id="searchBar">
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
                            <input type="text" name="searchWord" class="form-control input-sm"
                                   value="${search.searchWord}"
                                   placeholder="검색어">
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
            <h3>자유게시판 - <small>글 목록</small></h3>
        </div>

        <div class="row">
            <div class="col-sm-2 col-sm-offset-10 text-right" style="margin-bottom: 5px;">
                <a href="freeForm.wow" class="btn btn-primary btn-sm">
                    <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
                    &nbsp;새글쓰기
                </a>
            </div>
            <%--        <div class="col-sm-2 col-sm-offset-0 text-left" style="margin-bottom: 5px;">--%>
            <%--            <a href="noticeList.wow" class="btn btn-primary btn-sm">--%>
            <%--                <span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>--%>
            <%--                공지 더보기--%>
            <%--            </a>--%>
            <%--        </div>--%>
        </div>


        <table id="noticeTable" class="table table table-bordered table-hover">
            <thead>
            <tr>
                <th>글번호</th>
                <th>작성자</th>
                <th>제목</th>
                <th>등록일</th>
                <th>조회수</th>

            </tr>
            </thead>
            <colgroup>
                <col width="5%"/>
                <col width="10%"/>
                <col width="30%"/>
                <col width="10%"/>
                <col width="10%"/>
            </colgroup>
            <tbody></tbody>
        </table>


        <table id="freeTable" class="table table table-bordered table-hover">
            <colgroup>
                <col width="5%"/>
                <col width="10%"/>
                <col width="30%"/>
                <col width="10%"/>
                <col width="10%"/>
            </colgroup>
            <tbody>
            <c:forEach items="${freeBoardList }" var="freeBoard">
            <c:choose>
            <c:when test="${fn:startsWith(freeBoard.title,'[공지]') and freeBoard.notice.equals('Y')}">
            <tr class="text-center">
                <td>${freeBoard.freeNum}</td>
                <td>${freeBoard.id}</td>
                <td>
                    <a href="freeView.wow?freeNum=${freeBoard.freeNum}">${freeBoard.title}
                        <c:if test="${freeBoard.commentCount ne 0}">
                            <small><b>[&nbsp;<c:out value="${freeBoard.commentCount}"/>&nbsp;] </b></small>
                        </c:if>
                    </a>
                </td>
                <td>${freeBoard.createDate}</td>
                <td>${freeBoard.viewRate}</td>
            </tr>
            </c:when>

            <c:when test="${not fn:startsWith(freeBoard.title,'[공지]')}">
            <tr class="text-center">
                <td>${freeBoard.freeNum}</td>

                <td>
                        ${freeBoard.id }
                </td>
                <td>
                    <a href="freeView.wow?freeNum=${freeBoard.freeNum}">${freeBoard.title}
                        <c:if test="${freeBoard.commentCount ne 0}">
                            <small><b>[&nbsp;<c:out value="${freeBoard.commentCount}"/>&nbsp;] </b></small>
                        </c:if>
                        <c:if test="${freeBoard.viewRate >= 20}">
                            <span class="hit">hit!</span>
                        </c:if>
                    </a></td>
                <td>${freeBoard.createDate }</td>
                <td>${freeBoard.viewRate}</td>
            </tr>
            </c:when>
            </c:choose>
            </c:forEach>
        </table>

        <!-- START : 페이지네이션  -->
        <nav class="text-center">
            <ul class="pagination">
                <!-- 첫 페이지  -->
                <li><a href="freeList.wow?curPage=1" data-page="1"><span aria-hidden="true">&laquo;</span></a></li>
                <!-- 이전 페이지 -->
                <c:if test="${paging.firstPage ne 1}">
                    <li><a href="freeList.wow?curPage=${paging.firstPage-1}" data-page="${paging.firstPage-1}"><span
                            aria-hidden="true">&lt;</span></a></li>
                </c:if>



                <!-- 페이지 넘버링  -->
                <c:forEach begin="${paging.firstPage}" end="${paging.lastPage}" var="i">
                    <c:if test="${paging.curPage ne i}">
                        <li><a href="freeList.wow?curPage=${i}" data-page="${i}">${i}</a></li>
                    </c:if>
                    <c:if test="${paging.curPage eq i}">
                        <li class="active"><a href="#">${i}</a></li>
                    </c:if>

                </c:forEach>

                <!-- 다음  페이지  -->
                <c:if test="${paging.lastPage ne paging.totalPageCount}">
                    <li><a href="freeList.wow?curPage=${paging.lastPage+1}" data-page="${paging.lastPage+1}"><span
                            aria-hidden="true">&gt;</span></a></li>
                </c:if>

                <!-- 마지막 페이지 -->
                <li><a href="freeList.wow?curPage=${paging.totalPageCount}" data-page="${paging.totalPageCount}"><span
                        aria-hidden="true">&raquo;</span></a></li>
            </ul>
        </nav>
        <!-- END : 페이지네이션  -->
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