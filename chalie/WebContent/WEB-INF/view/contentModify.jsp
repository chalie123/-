<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://yourdomain.com/script.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<form action="/contentRewrite" method="post"
		enctype="multipart/form-data">
		제목 :<input type="text" name="title" value="${text.TITLE }"><br>
		<input type="hidden" name="UUID" value="${text.UUID}">
		<br>
		<br>
		<br> 본문 :
		<textarea rows="20" cols="120" style="resize: none;" name="text"> ${text.TEXT }</textarea>
		<br>
		<p id="photo_preview"></p>
		<br>
		<br> 사진 : <input type="file" multiple name="other" id="photo"><br>
		업로드된 파일<br/>
		<c:if test="${files !=null }">
			<c:set var="cnt" value="0"></c:set>
			<c:forEach var="i" items="${files}">
				<img src="${i.UPLOAD_FILE}" width="200px" height="200px"><br/>
				삭제시 체크 박스 체크 ->
				<input type="checkbox" name="deleteFile" value="${i.UPLOAD_FILE}">
				<br />
			</c:forEach>
		</c:if>
		태그 : <input type="text" name="tags" value="${text.TAGS }"><br>
		#으로 구분
		<button type="submit">확인</button>
	</form>
</body>
<script >
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
