<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<h2>추천도서</h2>

<div class="form-group">
	<input type="text" class="form-control" id="search" name="arg"
		placeholder="검색어를 입력하세요.">
</div>
<div align="right">
	<button type="button" id="submit">검색</button>
</div>
<div>
	<span id="result"></span>
</div>

<script>
	$("#submit").ready(function send() {
		$.ajax("http://${pageContext.request.serverName }/search/Controller/recommend", {
			"async" : true,
			"data" : {
				"arg" : $("#search").val()
			},
			"method" : "post"
		}).done(function(rst) {
			$("#result").empty();
			if (rst.result == false) {
				$("#result").append("<hr/><p style=\"color:red;\"><b>검색된 결과가 없습니다.</b></p><hr/>");
			} else {
				$.each(rst, function(i, item) {
					$("#result").append("<hr/><p style=\"color:blue;font-size:16;\"><b>" + item.TITLE + "</b></p><p>저자 : " + item.AUTHOR + "</p><p>발행인 : " + item.PUBLISHER + ", 발행일 : " + item.PUBLISH_PREDATE + "</p><p>ISBN : " + item.EA_ISBN + "</p>");
				})
			}
		}).fail(function(request, status, error) {
			window.alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		});
	})
	$("#submit").on("click", function send() {
		$.ajax("http://${pageContext.request.serverName }/search/Controller/recommend", {
			"async" : true,
			"data" : {
				"arg" : $("#search").val()
			},
			"method" : "post"
		}).done(function(rst) {
			$("#result").empty();
			if (rst.result == false) {
				$("#result").append("<hr/><p style=\"color:red;\"><b>검색된 결과가 없습니다.</b></p><hr/>");
			} else {
				$.each(rst, function(i, item) {
					$("#result").append("<hr/><p style=\"color:blue;font-size:16;\"><b>" + item.TITLE + "</b></p><p>저자 : " + item.AUTHOR + "</p><p>발행인 : " + item.PUBLISHER + ", 발행일 : " + item.PUBLISH_PREDATE + "</p><p>ISBN : " + item.EA_ISBN + "</p>");
				})
			}
		}).fail(function(request, status, error) {
			window.alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		});
	})
</script>
