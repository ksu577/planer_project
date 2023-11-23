<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>testbtn</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>

  <body>
    <button class="testbtn" id="testbtn">kakaopay</button>
  </body>
<script>
  $(function () {
    $('#testbtn').click(function (){
      $.ajax({
        url:'/test/kakaopay.wow'
        , dataType: 'json'
        , type : "post"
        , contentType : "application/json"
        ,success: function (data) {
          const msg = JSON.parse(data.message);
          const next_redirect_pc_url = msg.next_redirect_pc_url;
          window.open(next_redirect_pc_url, "_blank", "width=500, height=700")
        },
        error: function (error) {
          alert(error);
        }
      })
    })
  })

</script>
</html>