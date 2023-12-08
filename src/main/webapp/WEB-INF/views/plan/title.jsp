<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <style>
        body {
            margin: 0;

            background-color: #f1f1f1;
            justify-content: center;
        }

        .container {
            text-align: center;
            padding-top: 350px;
        }

        .top-background {
            height: 70px;
            background-color: #98dde3;
        }

    </style>

</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>

<div class="top-background">
</div>

    <div class="container">
        <div class="input-group-lg has-validation">
            <form action="/title" id="title" method="GET" class="form-floating">
                <div class="form-floating is-invalid fs-3 h-25">
                    <input type="text" class="form-control form-control-lg is-invalid input-title h-25" name="planTitle"
                           id="floatingInputGroup2"
                           placeholder="Username" required>
                    <label for="floatingInputGroup2">여행 제목</label>
                </div>
                <div class="invalid-feedback fs-2">
                    제목을 입력해주세요.
                </div>
                <button type="submit" class="btn-lg btn btn-info">저장</button>
            </form>
        </div>
    </div>
</body>
<script>
    function f_title() {
        if ($("#title").val() == null || $("#title").val() == "") {
            alert("아이디를 입력해주세요")
        }
    }
</script>
</html>
