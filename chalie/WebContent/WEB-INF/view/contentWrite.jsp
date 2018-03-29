<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<form action="contentWrite" method="post"
		enctype="multipart/form-data">
		제목 :<input type="text" name="title"><br>
		<br>
		<br>
		<br> 본문 :
		<textarea rows="20" cols="120" style="resize: none;" name="text"></textarea>
		<br>
		<br> 사진 : <input type="file" multiple name="other"><br>
		태그 : <input type="text" name="tags"><br> #으로 구분
		<button type="submit">확인</button>
	</form>
</body>
</html>