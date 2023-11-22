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
        #noticeTable tbody tr {
            display: table-row;
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
            text-align: left;
            padding: 8px;
        }
    </style>

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            // 상단 공지글 개수 제한
            var maxNoticeCount = 3;
            var noticeCount = 0;

            // 순회하며 공지글이면 상단에 추가하고 개수를 체크
            $("tbody tr").each(function() {
                if ($(this).find("td:nth-child(3) a").text().startsWith("[공지]") && noticeCount < maxNoticeCount) {
                    $("#noticeTable tbody").append($(this).clone());
                    $(this).remove();
                    noticeCount++;
                }
            });

            var noticeRows = $("#noticeTable tbody tr").toArray().sort(function (a, b){
                var dateA = new Date($(a).find("td:nth-child(4)").text());
                var dateB = new Date($(b).find("td:nth-child(4)").text());
                return dateB - dateA;
            });

            if (noticeRows.length > 3){
                noticeRows.slice(3).hide();
            }

            // 나머지 공지사항 숨김/보임 토글 처리
            $("#showMoreNotices").click(function() {
                noticeRows.slice(3).toggle();
            });

            if (noticeCount >= maxNoticeCount) {
                $("#freeTable tbody tr").each(function () {
                    if ($(this).find("td:nth-child(3) a").text().startsWith("[공지]")){
                        $(this).remove();
                    }
                });
            }
        });
    </script>

</head>
<body>
<%@ include file="/WEB-INF/inc/top.jsp" %>
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
        <h3>공지사항 - <small>최신 공지사항</small></h3>
    </div>

    <!-- 추가된 테이블 -->
    <table id="noticeTable" class="table table-striped table-bordered table-hover">
        <colgroup>
            <col width="10%"/>
            <col width="15%"/>
            <col/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="10%"/>
        </colgroup>
        <tbody></tbody>
    </table>

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
    <table id="freeTable" class="table table-striped table-bordered table-hover">
        <colgroup>
            <col width="10%"/>
            <col width="15%"/>
            <col/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="10%"/>
        </colgroup>
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
        <tbody>
        <c:forEach items="${freeBoardList }" var="freeBoard">
            <c:choose>
                <c:when test="${fn:startsWith(freeBoard.title,'[공지]') and freeBoard.notice.equals('Y')}">
                    <tr class="text-center">
                        <td>${freeBoard.freeNum}</td>
                        <td>${freeBoard.id}</td>
                        <td>
                            <a href="freeView.wow?freeNum=${freeBoard.freeNum}">${freeBoard.title}</a>
                        </td>
                        <td>${freeBoard.createDate}</td>
                        <td>${freeBoard.viewRate}</td>
                    </tr>
                </c:when>

                <c:when test="${not fn:startsWith(freeBoard.title,'[공지]')}">
                    <tr class="text-center">
                        <td>${freeBoard.freeNum}</td>
                        <!-- 이미지 표시 -->
                        <td>
                            <!-- 이미지 표시 -->
                                <%--                    <img src="${"/pc34/Aupload/"}" alt="" width="50" height="50">--%>
                            <!-- 게시글 제목 링크 -->
                                ${freeBoard.id }
                        </td>
                        <td>
                            <a href="freeView.wow?freeNum=${freeBoard.freeNum}">${freeBoard.title}</a></td>
                        <td>${freeBoard.createDate }</td>
                        <td>${freeBoard.viewRate}</td>
                    </tr>
                </c:when>
            </c:choose>
        </c:forEach>
        </tbody>
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