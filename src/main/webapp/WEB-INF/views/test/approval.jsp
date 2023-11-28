
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<script>
    window.onload = function(){
        window.opener.document.getElementById("cartForm").submit();
        window.close();
    };


</script>
<body>
  성공
${msg}
</body>
</html>
