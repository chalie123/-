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
				class="form-control" name="pass" id="pass" >
		</div>
		<div class="form-group">
			<label for="pwd">NickName:</label> <input type="text"
				class="form-control" id="nameVal" name="name"placeholder="필수입력">
			<button type="button" id="nameOverlap">중복확인</button>
			<span id="nameRst"></span>
		</div>
		<div class="form-group">
			<label for="pwd">PhoneNumber:</label> <input type="text"
				class="form-control" name="phone" id="phone"placeholder="필수입력">
		</div>
		<div class="form-group">
			<label for="pwd">CardNumber:</label> <input type="text"
				class="form-control" name="card" >
		</div>
		<div class="form-group">
			<label for="pwd">Card:</label> <input type="text"
				class="form-control" name="cardname"
				placeholder="Credit card company">
		</div>
		<div class="form-group">
			<label for="pwd">Address:</label> <input type="text"
				class="form-control" name="address" id="address" placeholder="필수입력">
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
			<button type="submit" id="create" onsubmit=" return check()" disabled>확인</button>
		</div>

	</form>
	<script>
		var emailCheck = false;
		var nameCheck = false;
		var passCheck = false;
		var phoneCheck = false;
		var addressCheck = false;
		$("input").keydown(function(){
			passCheck=$("#pass").val().length>=8;
			phoneCheck=$("#phone").val().length>=11;
			addressCheck=$("#address").val().length>=1;
		})
		
		$("#emailOverlap").on("click", function() {
			$.ajax("/account/overlapCheck", {
				"async" : true,
				"data" : {
					"email" : $("#emailVal").val()
				},
				"method" : "post"
			}).done(function(rst) {
				console.log($("#pass").val().length);
				if (rst.overlapCheck) {
					$("#emailRst").html("사용 가능한 이메일 주소입니다.");
					$("#emailRst").css("color", "green");
					emailCheck = true;
				} else {
					$("#emailRst").html("사용 불가능한 이메일 주소입니다.");
					$("#emailRst").css("color", "red");
					emailCheck = false;
				}
				if ((emailCheck == true) && (nameCheck == true)&& (phoneCheck == true)&& (passCheck == true)&& (addressCheck == true)) {
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
				if ((emailCheck == true) && (nameCheck == true)&& (phoneCheck == true)&& (passCheck == true)&& (addressCheck == true)) {
					$("#create").removeAttr("disabled");
				} else {
					$("#create").attr("disabled", "disabled");
				}
			})
		})
		function check(){
			if(!passCheck){
				window.alert("비밀번호를 8자 이상 입력해주시기 바랍니다.");
				return false;
			}
			if(!phoneCheck){
				window.alert("올바른 번호를 입력해주시기 바랍니다.");
				return false;
			}
			if(!addressCheck){
				window.alert("올바른 주소를 입력해주시기 바랍니다.");
				return false;
			};
			return  true;
		}

		
		
		
		
		
		</script>



















</div>

