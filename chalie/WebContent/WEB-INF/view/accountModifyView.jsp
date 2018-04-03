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

			<col style="width: 70%;">

		</colgroup>
		<thead>
			<tr>
				<th>이름</th>
				<th>${logon }</th>

			</tr>
		</thead>
		<tbody>
			<tr>
				<td>이 메일</td>
				<td>${email }</td>
			</tr>
			<tr>
				<td>주소</td>

				<td>${address }</td>
			</tr>
			<tr>
				<td>핸드폰 번호</td>
				<td>${phone }</td>
			</tr>
			<td>등급</td>
			<td>${rank }</td>
			<tr />

		</tbody>
	</table>
	<form action="/acccount/delete">
	<div align="center"><button type="submit" name="delete">회원탈퇴</button></div>
	</form>
</div>
