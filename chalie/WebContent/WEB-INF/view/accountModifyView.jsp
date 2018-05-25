<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>개인정보 변경/탈퇴</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<div class="container">
	<h2>개인정보 변경/ 탈퇴</h2>


	<table class="table table-bordered">
		<colgroup>
			<col style="width: 20%;">
			<col style="width: 40%;">
			<col style="width: 40%;">
		</colgroup>
		<tbody>
			<tr>
				<td>이름</td>
				<td>${logon }</td>
				<td>
					<form action="/account/modify" style="height:8px;">
						<input type="password" placeholder="변경할 비밀번호" name="pass">
						<button>변경</button>
					</form>
				</td>
			</tr>
			<tr>
				<td>이 메일</td>
				<td>${email }</td>
				<td></td>
			</tr>
			<tr>
				<td>주소</td>

				<td>${address }</td>
				<td>
					<form action="/account/modify" style="height:8px;">
						<input type="text" placeholder="변경할 주소" name="address">
						<button>변경</button>
					</form>
				</td>
			</tr>
			<tr>
				<td>핸드폰 번호</td>
				<td>${phone }</td>
				<td>
					<form action="/account/modify" style="height:8px;">
						<input type="text" placeholder="변경할 번호" name="phone">
						<button>변경</button>
					</form>
				</td>
			</tr>
			<tr>
				<td>등급</td>
				<td>${rank }</td>
				<td>${rank }</td>
			<tr />

		</tbody>
	</table>
	<div align="center">
		<form action="/account/delete">
			<button type="submit">회원탈퇴</button>
			<br /> <br /> <br />
		</form>
	</div>
</div>
