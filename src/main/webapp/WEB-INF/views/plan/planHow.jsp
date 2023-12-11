<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


    <style>
        .container{
            background-color: #caf0f5;
        }


        .top-background {
            height: 70px;
            background-color: #ade8ef;
        }
        .img-box{
            position: relative;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .img-box > h1{
            font-family: 'yg-jalnan';
            font-size: 30px;
            margin-top: 70px;
            margin-bottom: 70px;
        }
        .img-box > a {
            position: absolute;
            bottom: 30px;
            font-family: 'yg-jalnan';
            color: darkblue;
            font-size: 30px;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>

</body>
<div class="top-background">
</div>
<div class="container">
    <div class="img-box">
        <h1>이용방법</h1>
        <img src="/resources/img/이용방법.png">
        <a href="/">일정 생성하러 가기!</a>
    </div>
</div>

<script>
</script>
</html>
