<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script>
		var ws = new WebSocket("ws://${pageContext.request.serverName }/WebSocket");
		// 연결이 됬을때.
		ws.onopen=function(){
			console.log("opened ");
			console.log(this);
		}
		// 메시지가 들어올때.
		ws.onmessage=function(resp){
			console.log(resp);
			var obj=JSON.parse(resp.data);
			$("#cnt").html(obj.cnt);
			$("#info").html(obj.info);
		}
// 		ws.onmessage=function(rst){
// 			console.log(rst);
// 			var obj=JSON.parse(rst);
// 		}
		// 연결이 끊길때.
		ws.onclose=function(){
			window.alert("연결이 해제되었습니다.");
		}
	
	</script>
</body>

</html>