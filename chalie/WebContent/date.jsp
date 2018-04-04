<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<style>
input, button {
	font-family: 맑은고딕;
	padding: 2px;
}
</style>
<form action="">
	<h2>대출내역</h2>
	<table>
		<thead>
			<tr>
				<th>서적</th>
				<th>저자</th>
				<th>대출 날짜</th>
				<th>반납 기한</th>
			</tr>
		</thead>
		<tbody id="">
				
		</tbody>
	</table>
</form>
<hr />
<form action="">
	<h2>예약내역</h2>
	<table>
		<thead>
			<tr>
				<th>서적</th>
				<th>저자</th>
			</tr>
		</thead>
		<tbody id="">
				
		</tbody>
	</table>
</form>
<hr />
<script>
	$("#submit").on("click", function send() {
		$.ajax("http://${pageContext.request.serverName }/search/Controller/all", {
			"async" : true,
			"data" : {"arg" : $("#search").val()},
			"method" : "post"
		}).done(function(rst) {
			$("#result").empty();
			if(rst.result==false){
				$("#result").append("<hr/><p style=\"color:red;\"><b>검색된 결과가 없습니다.</b></p><hr/>");
			}else{
				$.each(rst,function(i,item){
					$("#result").append("<hr/><p style=\"color:blue;font-size:16;\"><b>" + item.TITLE + "</b></p><p>저자 : " + item.AUTHOR + "</p><p>발행인 : " + item.PUBLISHER + ", 발행일 : " + item.PUBLISH_PREDATE + "</p><p>ISBN : " + item.EA_ISBN + "</p>");
				})
			}
		}).fail(function(request,status,error){
			window.alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		});
	})
</script>
