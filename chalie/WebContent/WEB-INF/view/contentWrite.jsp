<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<form action="contentWrite" method="post" enctype="multipart/form-data">
	제목 :<input type="text" name="title"><br> <br> <br>
	<input type="hidden" value="${link}" name="link"> 
	<input type="hidden" value="${board}" name="board"> <br> 본문 :
	<textarea rows="20" cols="120" style="resize: none;" name="text"></textarea>
	<br>
	<p id="photo_preview"></p>
	<br> <br> 사진 : <input type="file" multiple name="other"
		id="photo"><br> 태그 : <input type="text" name="tags"><br>
	#으로 구분
	<button type="submit">확인</button>
</form>
<script>
	$("#photo").on("change", function() {
		var files = this.files;
		$("#photo_preview").html("");
		for (var i = 0; i < files.length; i++) {
			if (!files[i].type.startsWith("image")) {
				this.value = null;
				$("#photo_preview").html("");
				window.alert("사진만 업로드 가능합니다.");
				break;
			}
			var reader = new FileReader();
			reader.readAsDataURL(files[i]);
			reader.onload = function() {
				$("#photo_preview")
					.append("<img src=\"" + this.result + "\" style=\"width:200px;height:200px; margin:5px;\"/>");
			}
		}
	});
</script>
