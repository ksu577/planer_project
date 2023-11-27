<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%request.setCharacterEncoding("UTF-8");%>
    <%@include file="/WEB-INF/inc/header.jsp" %>


    <style>
        div {
            border: solid red 1px;
        }

        .container{padding-top: 180px}

        .nav-bar2 {
            background-color: whitesmoke;
            height: 60px;
            position: relative;
        }

        .nav-bar2:hover .drop-content3 {
            visibility: visible;
        }

        .nav1 {
            height: 100%;
            display: flex;
        }

        .nav1>div {
            width: calc(100%/3);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .drop-content3 {
            position: absolute;
            top: 100%;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: start;
            background-color: #ffffffaa;
            visibility: hidden;
        }

        .drop-content3>div {
            width: calc(100%/3);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: start;
        }
    </style>



</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="container">

    <div class="nav-bar2">
        <div class="nav1">
            <div>게시판</div>
            <div>회원 관리</div>
            <div>상품</div>
        </div>


        <div class="drop-content3">
            <div>
                <a href="/free/freeList.wow">게시판</a>
            </div>
            <div>
                <a href="/member/memberList.wow">회원 목록</a>
            </div>
            <div>
                <a href="/ManagerPage/managerproduct">상품 목록</a>
                <a href="/product/productregist">상품 등록</a>

            </div>

        </div>
    </div>

</div>

<script>
    $(document).ready(function() {
        // 클릭 이벤트 처리
        $('.nav1 div').on('click', function(event) {
            event.preventDefault(); // 기본 링크 동작 방지

            var url = $(this).find('a').attr('href'); // 클릭한 링크의 URL 가져오기

            // AJAX 호출
            $.ajax({
                url: url,
                type: 'GET',
                success: function(data) {
                    // 가져온 데이터를 원하는 곳에 표시
                    $('.result-container').html(data);
                },
                error: function(xhr, status, error) {
                    // 오류 처리
                    console.error(error);
                }
            });
        });
    });
</script>
</body>
</html>
