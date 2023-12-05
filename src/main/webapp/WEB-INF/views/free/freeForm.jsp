<%@ page import="com.study.login.vo.UserVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%
    request.setCharacterEncoding("UTF-8");

    UserVO user = (UserVO) session.getAttribute("user");
    String loggedInUserName = user.getId();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <script src="${pageContext.request.contextPath}/resource/smarteditor/summernote-lite.js"></script>
    <script src="${pageContext.request.contextPath}/resource/smarteditor/js/summernote/lang/summernote-ko-KR.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/smarteditor/summernote-lite.css">

    <style>
        .container {
            padding-top: 70px;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/inc/top.jsp" %>
<div class="container">
    <div class="page-header">
        <h3>자유게시판 - <small>글 등록</small></h3>
    </div>
    <form action="freeRegist.wow" method="post" modelAttribute="freeBoard" enctype="multipart/form-data">

        <table class="table table-striped table-bordered">
            <colgroup>
                <col width="20%"/>
                <col/>
            </colgroup>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" value="" class="form-control input-sm" required="required"></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><input readonly type="text" name="id" class="form-control " value="<%= loggedInUserName %>"></td>
            </tr>
            <c:if test="${planList ne null}">
                <input type="hidden" name="planTitle" value="${planList[0].planTitle}">
                <tr>
                    <th>여행공유</th>
                    <td>
                        <ul>
                            <c:forEach items="${planList}" var="planVo" varStatus="i">
                                <li>${planVo.dayCount}일차 : ${planVo.placeName}(${planVo.placeLoadAddress})</li>
                            </c:forEach>
                        </ul>
                    </td>
                </tr>
            </c:if>
            <tr>
                <th>내용</th>
                <td><textarea id="summernote" rows="10"  name="freeContext"> </textarea></td>
            </tr>

            <tr>
                <th>첨부파일
                    <button type="button" id="id_btn_new_file">추가</button>
                </th>
                <td class="file_area">
                    <div class="form-inline">
                        <input type="file" name="boFiles" class="form-control">
                        <button type="button" class="btn_delete btn btn-sm">삭제</button>
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <div class="pull-right">

                        <a href="freeList.wow" class="btn btn-info btn-sm"> <span class="glyphicon glyphicon-list" aria-hidden="true"></span> &nbsp;목록으로
                        </a>
                        <button type="submit"  class="btn btn-sm btn-primary">
                            <span class="glyphicon glyphicon-save" aria-hidden="true"></span> &nbsp;&nbsp;등록
                        </button>

                        <button type="submit" formaction="freeDelete.wow" class="btn btn-sm btn-danger">
                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span> &nbsp;&nbsp;삭제
                        </button>

                    </div>
                </td>
            </tr>
        </table>
    </form>

</div>
</body>
<script>
    $(document).ready(function (){
        $('#summernote').summernote({
            height: 400,
            minHeight: null,
            maxHeight: null,
            focus: true,
            lang: "ko-KR",
            toolbar: [
                // 글꼴 설정
                ['fontname', ['fontname']],
                // 글자 크기 설정
                ['fontsize', ['fontsize']],
                // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
                ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                // 글자색
                ['color', ['forecolor','color']],
                // 표만들기
                ['table', ['table']],
                // 글머리 기호, 번호매기기, 문단정렬
                ['para', ['ul', 'ol', 'paragraph']],
                // 줄간격
                ['height', ['height']],
                // 그림첨부, 링크만들기, 동영상첨부
                ['insert',['picture','link','video']],
                // 코드보기, 확대해서보기, 도움말
                ['view', ['codeview','fullscreen', 'help']]
            ],
            // 추가한 글꼴
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
            // 추가한 폰트사이즈
            fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
            placeholder: '최대 2048자까지 쓸수 있습니다.',
            collback: {
                onImageUpload: function (files, editor, welEditable){
                    for (var i = files.length -1; i >= 0; i--){
                        uploadSummernoteImageFile(files[i], this);
                    }
                }
            }
        });
        $('#summernote').summernote(setting);
    });

    function uploadSummernoteImageFile(file, editor){
        data = new FormData();
        data.append("file",file)
        $.ajax({
            data: data,
            type: "POST",
            url: '${pageContext.request.contextPath}/uploadSummernoteImageFile',
            contentType: false,
            processData: false,
            success: function (data){
                $(editor).summernote('editor.insertImage', data.url);
            },
            error: function (jqXHR, textStatus, errorThrown){
                console.error("Error uploading image:" + textStatus,errorThrown);
            }
        });
    }

</script>
<script type="text/javascript">
    $('#id_btn_new_file').click(function () {
        $('.file_area').append('<div class="form-inline">'
            + '<input type="file" name="boFiles" class="form-control">'
            + ' <button type="button" class="btn_delete btn btn-sm">삭제</button>' + '</div>');
    });

    $('.file_area').on('click', '.btn_delete', function () {
        $(this).closest('div').remove();
    });

    // 목록 링크 클릭
    $('.btn-info').click(function() {
        if (!confirm('목록으로 돌아가시겠습니까?')) {
            return false; // 목록으로의 이동을 취소함
        }
    });

    // 저장 버튼 클릭
    $('button.btn-primary').click(function() {
        if (!confirm('등록하시겠습니까?')) {
            return false; // 저장을 취소함
        }
    });

    // 삭제 버튼 클릭
    $('button.btn-danger').click(function() {
        if (!confirm('정말로 삭제하시겠습니까?')) {
            return false; // 삭제를 취소함
        }
    });
</script>
</html>