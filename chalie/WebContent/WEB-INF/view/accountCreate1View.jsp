<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<div class="container">
	<h2>회원가입</h2>
	<p>양식에 맞게 작성바랍니다.</p>
	<form action="/account/create">
		<div class="form-group">
			<label for="usr">Mail:</label> <input type="text"
				class="form-control" id="emailVal" name="email">
			<button type="button" id="emailOverlap">중복확인</button>
			<span id="emailRst"></span>
		</div>
		<div class="form-group">
			<label for="pwd">Password:</label> <input type="password"
				class="form-control" name="pass" id="pass">
		</div>
		<div class="form-group">
			<label for="pwd">NickName:</label> <input type="text"
				class="form-control" id="nameVal" name="name">
			<button type="button" id="nameOverlap">중복확인</button>
			<span id="nameRst"></span>
		</div>
		<div class="form-group">
			<label for="pwd">PhoneNumber:</label> <input type="text"
				class="form-control" name="phone" id="phone">
		</div>
		<div class="form-group">
			<label for="pwd">CardNumber:</label> <input type="text"
				class="form-control" name="card">
		</div>
		<div class="form-group">
			<label for="pwd">Card:</label> <input type="text"
				class="form-control" name="cardname"
				placeholder="Credit card company">
		</div>
		<div class="form-group">
			<label for="pwd">Address:</label> <input type="text"
				class="form-control" name="address" id="address">
		</div>
		<div class="form-group">
			<label for="pwd">Card:</label> <input type="text"
				class="form-control" name="carddate"
				placeholder="Card validity period">
		</div>
		<div class="form-group">
			<label for="pwd">Cvc:</label> <input type="password"
				class="form-control" name="cvc">
		</div>
		<div class="form-group">
			<label for="pwd">Interesting:</label> <input type="password"
				class="form-control" name="interest">
		</div>

		<div align="center">
			<button type="submit" id="create" disabled onclick="check()">확인</button>
		</div>

	</form>
	<script>
	//emailVal,pass,nameVal,phone,address
	//ppt만들기
	//메인페이지 링크 걸기
	//회원가입 폼 막기
	function check(){
		var email =$("#emailVal").val();
		var pass =$("#pass").val();
		var nameVal =$("#nameVal").val();
		var phone =$("#phone").val();
		var address =$("#address").val();
		console.log(email);
		console.log(pass);
		console.log(nameVal);
		console.log(phone);
		console.log(address);
		window.setTimeout(function() {
			
		}, 10000)
	}
		var emailCheck = false;
		var nameCheck = false;
		$("#emailOverlap").on("click", function() {
			$.ajax("/account/overlapCheck", {
				"async" : true,
				"data" : {
					"email" : $("#emailVal").val()
				},
				"method" : "post"
			}).done(function(rst) {
				if (rst.overlapCheck) {
					$("#emailRst").html("사용 가능한 이메일 주소입니다.");
					$("#emailRst").css("color", "green");
					emailCheck = true;
				} else {
					$("#emailRst").html("사용 불가능한 이메일 주소입니다.");
					$("#emailRst").css("color", "red");
					emailCheck = false;
				}
				if ((emailCheck == true) && (nameCheck == true)) {
					$("#create").removeAttr("disabled");
				} else {
					$("#create").attr("disabled", "disabled");
				}
			})
		})
	
		$("#nameOverlap").on("click", function() {
			$.ajax("/account/overlapCheck", {
				"async" : true,
				"data" : {
					"name" : $("#nameVal").val()
				},
				"method" : "post"
			}).done(function(rst) {
				if (rst.overlapCheck) {
					$("#nameRst").html("사용 가능한 이름 입니다.");
					$("#nameRst").css("color", "green");
					nameCheck = true;
				} else {
					$("#nameRst").html("사용 불가능한 이름 입니다.");
					$("#nameRst").css("color", "red");
					nameCheck = false;
				}
				if ((emailCheck == true) && (nameCheck == true)) {
					$("#create").removeAttr("disabled");
				} else {
					$("#create").attr("disabled", "disabled");
				}
			})
		})
	</script>



















</div>

