<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		
		
		<form action="/account/reset" method="post">
		<div>
		email 입력 :<input type="text" name="email"><button type="submit" id="submit">비밀번호 재설정</button>
		
		</div>
		
		</form>
		<script>
			${"#submit"}.on("click", function(){
				window.alert("비밀번호 재설정 이메일이 발송됐습니다.")
			})
		</script>