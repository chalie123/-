<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <h2>로그인</h2>
    
  <p>양식에 맞게 작성바랍니다.</p>
    <form action="/account/login" method="post">
<div class="form-group">
      <label for="usr">Mail:</label>
      <input type="text" class="form-control" id="emailVal" name="email"> 
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" name="pass">
    </div>
   <div align="right"> <button type="submit" >확인</button></div>
    </form>