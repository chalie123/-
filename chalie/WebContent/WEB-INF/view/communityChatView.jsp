<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
   <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<div id="container"
		style="width: 700px; border: 5px solid grey; padding: 10px">
		<div id="chatlog"
			style="height: 500px; padding: 5px; border: 1px solid black; overflow-y: scroll; word-break: break-all">
		</div>
		<hr />
		<input type="text" style="height: 80px; width: 500px" id="chat">
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		var ws = new WebSocket(
				"ws://${pageContext.request.serverName }/WebSocket");
		$(document).ready(function() {
			$("input[id=chat]").keydown(function(key) {
				if (key.keyCode == 13) {
					sendMessage();
				}
			})
		})
		function sendMessage() {
			var text = $("#chat").val();
			if (text == "") {
			} else {
				ws.send(text);
				$("#chat").val("");
			}
		}

		ws.onopen = function() {
			console.log("WS Connected.");
		}
		ws.onmessage = function(resp) {
			var obj = JSON.parse(resp.data);
			if (obj.name != null) {
				$("#chatlog").append(obj.name + " : " + obj.text + "<br/>");
				$("#chatlog").scrollTop($("#chatlog").prop("scrollHeight"));
			}
		}
		ws.onclose = function() {
			window.alert("연결이 해제되었습니다. 새로고침을 눌러 다시 접속해주시기 바랍니다.");
		}
	</script>
