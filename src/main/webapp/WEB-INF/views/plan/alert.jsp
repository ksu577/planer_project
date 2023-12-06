<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <style>
        .cover1 {
            background: linear-gradient(to right, #98dde3, #0ea5e9);
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="cover1"></div>
</body>
<script>
    alert("이미 있는 제목입니다.")
    location.href = "/"
</script>
</html>
