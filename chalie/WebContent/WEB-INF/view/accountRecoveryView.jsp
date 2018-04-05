<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String serial=(String)session.getAttribute("serial"); %>
    <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
   <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <h2>비밀번호 재설정</h2>
    
    <form action="/account/recovery/<%=serial %>" method="post">
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" name="pass">
    </div>
   <div align="right"> <button type="submit" >확인</button></div>
    </form>