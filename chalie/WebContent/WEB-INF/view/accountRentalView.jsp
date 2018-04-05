<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<style>
input, button {
	font-family: 맑은고딕;
	padding: 2px;
}
</style>
<h2>대출내역</h2>
<span id="rental"></span>
<hr />
<h2>예약내역</h2>
<span id="reservation">
</span>
<hr />
<script>




	$("#submit").ready( function send() {
		console.log("ready");
		$.ajax("http://${pageContext.request.serverName }/rental/query", {
			"async" : true,
			"data" : {
			},
			"method" : "post"
		}).done(function(rst) {
			$("#rental").empty();
			$.each(rst, function(i, item) {
					if(item.RENTALNAME !=null){
					$("#rental").append("<hr/><p style=\"color:blue;font-size:16;\"><b>" + item.TITLE + 
					"</b></p><p>저자 : " + item.AUTHOR + "</p><p>대출날짜 : " + item.RENTALDATE + "</p>");
					}
					if(item.RESERVATIONNAME !=null){
						$("#reservation").append("<hr/><p style=\"color:blue;font-size:16;\"><b>" + item.TITLE + 
						"</b></p><p>저자 : " + item.AUTHOR + "</p><p>예약날짜 : " + item.RESERVATIONDATE + 
						"</p><button onclick=\"cancel("+item.NO+")\" type=\"button\" id=\""+item.NO+"\">예약취소</button>");
					}
				})
		}).fail(function(request, status, error) {
			window.alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		});
	})
	
		function cancel(no){
		$.ajax("http://${pageContext.request.serverName }/rental/cancel", {
			"async" : true,
			"data" : {"NO": no
			},
			"method" : "post"
		}).done(function(rst) {
			if(rst.result){
				window.alert("예약이 취소되었습니다.");
				window.location.reload();
			}
		})
	}
	
</script>