<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://yourdomain.com/script.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<form action="/adminContentModify" method="post"
	enctype="multipart/form-data">
	<input type="hidden" name="fileName" value="${fileName}">
	<p id="photo_preview"></p>
	<br> <br> 사진 : 
	<input type="file"  name="other" id="photo"><br> 
	업로드된 파일<br />
			<p id="load_photo_preview"><img src="${files}" ></p>
			<br />
				<input type="hidden" name="fileName" value="${fileName }">			
				<input type="hidden" name="deleteFile" value="${files}">
			<br />
	<button type="submit">확인</button>
</form>
<form action="/index">
<button type="submit">취소</button>

</form>
<script>
	$("#photo")
			.on(
					"change",
					function() {
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
								$("#load_photo_preview").html("");
								$("#photo_preview")
										.append(
												"<img src=\""+ this.result+"\" style=\"width:200px;height:200px; margin:5px;\"/>");
							}
						}
					});
</script>