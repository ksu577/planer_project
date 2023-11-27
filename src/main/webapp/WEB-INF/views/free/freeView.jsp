<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <script src="${pageContext.request.contextPath}/resource/smarteditor/summernote-lite.js"></script>
    <script src="${pageContext.request.contextPath}/resource/smarteditor/js/summernote/lang/summernote-ko-KR.js"></script>
    <!-- JavaScript 및 jQuery를 로드하는 부분 -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/smarteditor/summernote-lite.css">
    <%@ include file="/WEB-INF/inc/header.jsp" %>

    <style>
        .content-container {
            width: 100%;
            box-sizing: border-box;
        }

        .content-container > div {
            width: 100%;
            word-wrap: break-word;
        }
        .custom-input{
            width: auto;
            height: auto;
        }
    </style>
    <title>자유게시판 - 글 보기</title>
</head>
<body>
<%@ include file="/WEB-INF/inc/top.jsp" %>
<div class="container">
    <div class="page-header">
        <h3>
            자유게시판 - <small>글 보기</small>
        </h3>
    </div>
    <table id="viewPage" class="table table-striped table-bordered">
        <tbody>
        <tr>
            <td>글번호</td>
            <td>${freeBoard.freeNum}</td>
        </tr>
        <tr>
            <td>제목</td>
            <td>${freeBoard.title}</td>
        </tr>
        <tr>
            <td>작성자</td>
            <td>${freeBoard.id }</td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <div class="content-container">
                    <div name="freeContext" class="form-control input-sm custom-input" style="overflow: auto; white-space: pre-line"
                         readonly="readonly">${freeBoard.freeContext }
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${freeBoard.viewRate }</td>
        </tr>
        <tr>
            <td>등록일</td>
            <td>${freeBoard.createDate }</td>
        </tr>


        <tr>
            <th>첨부파일</th>
            <td>
                <c:forEach var="f" items="${freeBoard.attaches}" varStatus="st">
                    <div> 파일 ${st.count} <a href="<c:url value='/attach/download/${f.atchNo}' />" target="_blank">
                        <span class="glyphicon glyphicon-save" aria-hidden="true"></span> ${f.atchOriginalName}
                    </a> Size : ${f.atchFancySize} Down : ${f.atchDownHit}

<%--                        <img alt=""--%>
<%--                             src="<%=request.getContextPath()%>/attach/showImg.wow?fileName=${f.atchFileName}&filePath=${f.atchPath}"--%>
<%--                             width="750px" height="500px">--%>
                    </div>
                </c:forEach>
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <div class="pull-left">
                    <a href="freeList.wow" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-list"
                                                                                 aria-hidden="true"></span> &nbsp;&nbsp;목록
                    </a>
                </div>
                <c:if test="${canEdit}">
                    <div class="pull-right">
                        <a href="freeEdit.wow?freeNum=${freeBoard.freeNum }" class="btn btn-success btn-sm"> <span
                                class="glyphicon glyphicon-pencil" aria-hidden="true"></span> &nbsp;&nbsp;수정
                        </a>
                    </div>
                </c:if>
            </td>
        </tr>
        </tbody>
    </table>
</div>
<div class="container">
    <!-- reply container -->
    <!-- // START : 댓글 등록 영역  -->
    <div class="panel panel-default">
        <div class="panel-body form-horizontal">
            <form name="frm_reply" action="/comment/commentRegist.wow" method="post">
                <input type="hidden" name="freeNum" value="${freeBoard.freeNum}">
                <input
                        type="hidden" name="id" value="${USER_INFO.user }">
                <div class="form-group">
                    <label class="col-sm-2  control-label">댓글</label>
                    <div class="col-sm-8">
                        <textarea rows="3" name="freeContextComment" class="form-control"></textarea>
                    </div>
                    <div class="col-sm-2">
                        <button id="btn_reply_regist" type="button"
                                class="btn btn-sm btn-info">등록
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- // END : 댓글 등록 영역  -->


    <!-- // START : 댓글 목록 영역  -->
    <div id="id_reply_list_area">

    </div>

    <!-- // END : 댓글 목록 영역  -->
    <!-- START : 댓글 수정용 Modal -->
    <div class="modal" id="id_reply_edit_modal" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <form name="frm_reply_edit"
                      action="/comment/commentModify" method="post">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                        <h4 class="modal-title">댓글수정</h4>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="freeBoardCommentNumber" value="">
                        <textarea rows="3" name="freeContextComment" class="form-control"></textarea>
                        <input type="hidden" name="id" value="${USER_INFO.user }">
                    </div>
                    <div class="modal-footer">
                        <button id="btn_reply_modify" type="button"
                                class="btn btn-sm btn-info">저장
                        </button>
                        <button id="btnCloseModal" type="button" class="btn btn-default btn-sm"
                                data-dismiss="modal">닫기
                        </button>
                    </div>
                </form>
                <script type="text/javascript">
                    // 모달 닫기 버튼 클릭 이벤트 처리
                    $("#btnCloseModal").on("click", function () {
                        $("#id_reply_edit_modal").modal("hide");
                    });
                </script>
            </div>
        </div>
    </div>
    <!-- END : 댓글 수정용 Modal -->

</div>
<!-- reply container -->

</body>
<script type="text/javascript">
    // 댓글 데이터를 딱 10개만 가지고 오도록 하는 파라미터 모음
    var params = {
        "curPage": 1, "rowSizePerPage": 10
        , "freeNum": ${freeBoard.freeNum}
    };
    var loginUser = ${loginUser ? "'" + loginUser.user + "'" : 'null'};

    //ajax 요청해서 댓글리스트를 받아오는 함수.
    function fn_reply_list() {
        //아작스 호출해서 DB에 있는 reply 데이터 가지고 옵니다.
        //가지고오면(success)하면 댓글 div 만들어줍니다.
        //list를 가지고오니까 jquery 반복문 써서 div 여러개 만들어주면됩니다.
        $.ajax({
            url: '/comment/commentList.wow'
            , type: "GET"
            , data: params
            , success: function (data) {
                console.log(data);

                // $("#id_reply_list_area").empty();

                $.each(data.data, function (i, comment) {
                    let str = '<div class="row" data-free-board-comment-number="' + comment.freeBoardCommentNumber + '">'
                        + '<div class="col-sm-2 text-right">' + comment.id + '</div>'
                        + '<div class="col-sm-6">'
                        + '<pre>' + comment.freeContextComment + '</pre>'
                        + '</div>'
                        + '<div class="col-sm-2">' + comment.createDate + '</div>'
                        + '<div class="col-sm-2">';
                    if (comment.id !== null) {
                        str += '<button name="btn_reply_edit" type="button"'
                            + 'class=" btn btn-sm btn-info" onclick="fn_modify()">수정</button>'
                            + ' <button name="btn_reply_delete" type="button" '
                            + 'class="btn btn-sm btn-danger">x</button>';
                    }

                    str = str + '</div>'
                        + '</div>';

                    $("#id_reply_list_area").append(str);

                });
                params.curPage += 1;

            }

        });
        // 다 했으면 param의 curPage=2로 바꿔줍시다
    }//function fn_reply_list

    function fn_modify() {
        // 여기에 수정에 필요한 로직을 추가합니다.
        console.log("fn_modify 함수가 호출되었습니다.");
        // 필요한 로직을 추가하세요.
    }


    $(document).ready(function () {

        fn_reply_list();
        //더보기 버튼
        $("#id_reply_list_more").on("click", function (e) {
            fn_reply_list();
        });

        //등록버튼
        $("#btn_reply_regist").on("click", function (e) {
            e.preventDefault();
            $form = $(this).closest("form[name='frm_reply']");

            $.ajax({
                url: "/comment/commentRegist.wow",
                type: "POST",
                data: $form.serialize(),
                success: function (data) {
                    if (data.msg == "login_required") {
                        //로그인이 필요할 경우 로그인 페이지로 이동
                        window.location.href = "/login/login.wow"
                    } else {
                        //성공시
                        $form.find("textarea[name='freeContextComment']").val(''); // 댓글 내용 초기화
                        $("#id_reply_list_area").html('');
                        fn_reply_list(); // 현재 게시물에 대한 댓글을 다시 불러오도록 수정

                    }
                },
                error: function (req, status, error) {
                    console.error(error);

                }
            });
            // form태그안에 input hidden으로 필요한거 넣기
            //가장가까운 form찾은 후 ajax 호출(data는 form.serialize(), )
            //성공 : 등록 글 내용부분 지우기,  댓글영역초기화( list_area.html('), curPage=1, fn_reply_list)
            //실패 : error : req.status==401이면 login으로   location.href
        });//등록버튼


        //수정버튼 : 댓글 영역안에 있는 수정버튼만  이벤트 등록
        $("#id_reply_list_area").on("click", 'button[name="btn_reply_edit"]'
            , function (e) {
                console.log("댓글 수정 버튼 클릭");
                $btn = $(this); // 수정버튼
                $div = $btn.closest('div.row');
                $modal = $('#id_reply_edit_modal');
                $pre = $div.find('pre');
                var context = $pre.text();
                $textarea = $modal.find('textarea');
                $textarea.val(context);
                var freeBoardCommentNumber = $div.data('free-board-comment-number');
                $modal.find('input[name=freeBoardCommentNumber]').val(freeBoardCommentNumber);
                $modal.modal('show');
            });//수정버튼


        //모달창 저장 버튼
        $("#btn_reply_modify").on("click", function (e) {
            e.preventDefault();
            $form = $(this).closest('form[name="frm_reply_edit"]');
            $.ajax({
                url: "/comment/commentModify.wow",
                type: "POST",
                data: $form.serialize(),
                dataType: "JSON",
                success: function () {
                    $modal = $('#id_reply_edit_modal');
                    $modal.modal('hide');

                    var freeBoardCommentNumber = $modal.find('input[name=freeBoardCommentNumber]').val();
                    var freeContextComment = $modal.find('textarea').val();
                    $("#id_reply_list_area").find("div[data-free-board-comment-number='" + freeBoardCommentNumber + "']").find("pre").html(freeContextComment);
                }
            });
        });//모달창 저장버튼


        //삭제버튼
        $("#id_reply_list_area").on("click", 'button[name="btn_reply_delete"]'
            , function (e) {
                console.log("댓글 삭제 버튼 클릭");
                e.preventDefault();
                $div = $(this).closest('.row');
                freeBoardCommentNumber = $div.data('free-board-comment-number');
                id = "${USER_INFO.user}";
                $.ajax({
                    url: "/comment/commentDelete.wow",
                    type: "POST",
                    data: {"freeBoardCommentNumber": freeBoardCommentNumber, "id": id},
                    dataType: 'JSON',
                    success: function () {
                        $div.remove();
                    },
                    error: function (req, status, error) {
                        console.error(error); // MODIFIED
                    }
                }); //ajax
            }); //삭제버튼


    });


</script>
</html>