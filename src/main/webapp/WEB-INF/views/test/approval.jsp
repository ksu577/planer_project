<%--
  Created by IntelliJ IDEA.
  User: pc41
  Date: 23. 11. 20.
  Time: 오전 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<script>
    window.onload = function(){
        window.opener.location.href = '<c:url value="/shop/afterpay.wow" />';
        window.close();
    };


</script>
<body>
  성공
${msg}
</body>
</html>
