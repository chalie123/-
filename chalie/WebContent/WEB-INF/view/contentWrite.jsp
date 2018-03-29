<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
		<p id="photo_preview"></p>
		<br>
		<br> 사진 : <input type="file" multiple name="other" id="photo"><br>
		태그 : <input type="text" name="tags"><br> #으로 구분
		<button type="submit">확인</button>
	</form>
</body>
<script>
$("#photo").on("change",function() {
	var files = this.files;
	$("#photo_preview").html("");
	for (var i = 0; i < files.length; i++) {
		console.log(files[i]);
		var reader = new FileReader();
		reader.readAsDataURL(files[i]);
		reader.onload = function() { // 파일다 읽어들였을때
			console.log(reader);
			$("#photo_preview")
					.append(
							"<img src=\""+ this.result+"\" style=\"width:70px;height:70px; margin:5px;\"/>");
		}
	}
});


</script>
</html>