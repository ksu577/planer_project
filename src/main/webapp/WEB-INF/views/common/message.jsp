<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/inc/header.jsp" %>
    <title>next_study : ${resultMessageVO.title}</title>
</head>
<body>
<div class="top-background" style="height: 70px; width: 100%; background-color: #98dde3;"></div>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div style="padding-top: 100px; transform: translate(20%)" class="container">
    <div class="row col-md-8 col-md-offset-2">
        <div class="page-header" style="border-bottom: 1px solid #98dde3;">
            <h1>${resultMessageVO.title}</h1>
        </div>
        <div class="panel panel-default"
             style="font-size: 13px; border: 1px solid #98dde3; border-radius: 10px; background-color: white;">
            <div class="panel-heading" style="font-size: 15px; border-radius: 10px; background-color: #98dde3;">
                <p>${resultMessageVO.message}</p>
            </div>
            <div class="panel-body">
                <a style="font-size: 13px;" href="${pageContext.request.contextPath}/"
                   class="btn btn-primary">
                    <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
                    &nbsp;Home
                </a>
                <div class="pull-right">
                    <a style="font-size: 13px; border: 1px solid #0d6efd;" href="#" onclick="history.back()"
                       class="btn btn-default">
                        <span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>
                        &nbsp;뒤로가기
                    </a>
                    &nbsp;&nbsp;
                    <c:if test="${not empty resultMessageVO.url}">
                        <a style="font-size: 13px; background-color: #0d6efd; color: white; border: 1px solid white"
                           href="<c:url value='${resultMessageVO.url}' />"
                           class="btn btn-warning">
                            <span class="glyphicon glyphicon-new-window" aria-hidden="true"></span>
                            &nbsp;${resultMessageVO.urlTitle}
                        </a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- container -->
</body>
</html>