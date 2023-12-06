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
            <form name="search" action="memberList.wow" method="post" class="form-horizontal">
                <input type="hidden" name="curPage" value="${paging.curPage}"> <input type="hidden"
                                                                                      name="rowSizePerPage"
                                                                                      value="${paging.rowSizePerPage}">

                <div class="form-group">
                    <div class="col-sm-2">
                        <select id="id_searchType" name="searchType" class="form-control input-sm"
                                style="font-size: 13px; padding: 0rem 0.75rem;">
                            <option value="NAME" ${search.searchType=='NAME' ? "selected='selected'" :""} >이름
                            </option>
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
    <!-- END : 검색 폼  -->


    <div class="page-header">
        <h3>상품 - <small>물건 목록</small></h3>
    </div>

    <!-- START : 목록건수 및 새글쓰기 버튼  -->


    <div class="row">
        <div class="col-sm-2 col-sm-offset-10 text-right" style="margin-bottom: 5px;">
            <a href="/product/productregist" class="btn btn-primary btn-sm">
                <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
                &nbsp;새 물품 등록
            </a>
        </div>
    </div>
    <table class="table  table-bordered table-hover">
        <thead>
        <tr>
            <th style="background-color: #98dde3; color: white; border: 1px solid white;">물품 번호</th>
            <th style="background-color: #98dde3; color: white; border: 1px solid white;">가격</th>
            <th style="background-color: #98dde3; color: white; border: 1px solid white;">물품 설명</th>
            <th style="background-color: #98dde3; color: white; border: 1px solid white;">물품 이름</th>
            <th style="background-color: #98dde3; color: white; border: 1px solid white;">삭제</th>
        </tr>
        </thead>
        <tbody>


        <c:forEach items="${productList}" var="productList">

            <tr style="font-size: 12px; text-align: center;" class="text-center">
                <td style="background-color: white; border: 1px solid #98dde3;" >${productList.productId}</td>
                <td style="background-color: white; border: 1px solid #98dde3;" >${productList.productPrice}</td>
                <td style="background-color: white; border: 1px solid #98dde3;" >${productList.productDesc}</td>
                <td style="background-color: white; border: 1px solid #98dde3;" ><a href="/product/productview.wow?productId=${productList.productId}">${productList.productName}</a></td>
                <td style="background-color: white; border: 1px solid #98dde3;">
                    <form action="/product/productDelete" method="post">
                        <input type="hidden" name="product" value="${productList.productId}">
                        <button type="submit" >삭제</button>
                    </form>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>


    <!-- START : 페이지네이션  -->
    <nav class="text-center">
        <ul class="pagination">
            <!-- 첫 페이지  -->
            <li><a href="managerproduct.wow?curPage=1" data-page="1"><span aria-hidden="true">&laquo;</span></a></li>
            <!-- 이전 페이지 -->
            <c:if test="${paging.firstPage ne 1}">
                <li><a href="managerproduct.wow?curPage=${paging.firstPage-1}" data-page="${paging.firstPage-1}"><span
                        aria-hidden="true">&lt;</span></a></li>
            </c:if>

            <!-- 페이지 넘버링  -->
            <c:forEach begin="${paging.firstPage}" end="${paging.lastPage}" var="i">
                <c:if test="${paging.curPage ne i}">
                    <li><a href="managerproduct.wow?curPage=${i}" data-page="${i}">${i}</a></li>
                </c:if>
                <c:if test="${paging.curPage eq i}">
                    <li class="active"><a href="#">${i}</a></li>
                </c:if>

            </c:forEach>

            <!-- 다음  페이지  -->
            <c:if test="${paging.lastPage ne paging.totalPageCount}">
                <li><a href="managerproduct.wow?curPage=${paging.lastPage+1}" data-page="${paging.lastPage+1}"><span
                        aria-hidden="true">&gt;</span></a></li>
            </c:if>

            <!-- 마지막 페이지 -->
            <li><a href="managerproduct.wow?curPage=${paging.totalPageCount}" data-page="${paging.totalPageCount}"><span
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