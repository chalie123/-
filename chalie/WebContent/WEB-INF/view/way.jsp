<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/top.jsp"/>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>
  
  <body>
    <div class="container">
      <h2>Image</h2>
      <p>The .img-rounded class adds rounded corners to an image (not available in IE8):</p>            
      <img src="/image/map.png" class="img-rounded" alt="Cinque Terre" width="1000" height="450"> 
    </div>
  </body>
<jsp:include page="/WEB-INF/end.jsp"/>