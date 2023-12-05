<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <style>
        body {
            margin: 0;
            padding-top: 70px;
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
            <form action="/title" id="title" method="GET">
                <div class="form-floating is-invalid">
                    <input type="text" class="form-control form-control-lg is-invalid input-title" name="planTitle"
                           id="floatingInputGroup2"
                           placeholder="Username" required>
                    <label for="floatingInputGroup2">PLAN TITLE</label>
                </div>
                <div class="invalid-feedback">
                    제목을 입력해주세요.
                </div>
                <button type="submit" class="btn-lg btn btn-outline-warning">저장</button>
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
