<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Chat</title>
</head>
<body>
	<div id="container" style="width:800px;border:5px solid grey;padding:10px">
		<div id="chatlog" style="padding: 5px; border: 1px solid black">
		</div>
		<hr/>
		<input type="text" style="height: 80px; width: 500px" id="chat">
	</div>
	<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script>
		var ws = new WebSocket("ws://${pageContext.request.serverName }/WebSocket");
		// 연결이 됬을때.
		$(document).ready(function(){
			$("input[id=chat]").keyup(function(key){
				if(key.keyCode==13){
					sendMessage();
				}
			})
		})
		
		function sendMessage(){
			var text=$("#chat").val();
			if(text==""){
				
			}else{
				ws.send(text);
				$("#chat").val("");	
			}
		}
		
		
		ws.onopen=function(){
			console.log("opened ");
			console.log(this);
		}
		// 메시지가 들어올때.
		ws.onmessage=function(resp){
			console.log(resp);
			var obj=JSON.parse(resp.data);
			$("#chatlog").append("<p>"+obj.text+<"</p>");
		}
		// 연결이 끊길때.
		ws.onclose=function(){
			window.alert("연결이 해제되었습니다.");
		}
	
	</script>
</body>

</html>