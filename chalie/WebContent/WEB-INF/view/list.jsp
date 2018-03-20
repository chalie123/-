<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/top.jsp" />
<div class="container">
	<h2>도서목록</h2>
	<p>Contextual classes can be used to color table rows or table
		cells. The classes that can be used are: .active, .success, .info,
		.warning, and .danger.</p>
	<table class="table">
		<thead>
			<tr>
				<th>도서명</th>
				<th>종류</th>
				<th>이미지</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>난 네가 부러워</td>
				<td>유아도서</td>
				<td><img src="/image/894481.jpg" width="150px" height="150px" /></td>
			</tr>
			<tr class="success">
				<td>Success</td>
				<td>Doe</td>
				<td>john@example.com</td>
			</tr>
			<tr class="danger">
				<td>Danger</td>
				<td>Moe</td>
				<td></td>
			</tr>
			<tr class="info">
				<td>Info</td>
				<td>Dooley</td>
				<td></td>
			</tr>
			<tr class="warning">
				<td>Warning</td>
				<td>Refs</td>
				<td></td>
			</tr>
			<tr class="active">
				<td>Active</td>
				<td>Activeson</td>
				<td></td>
			</tr>
		</tbody>
	</table>
</div>
<jsp:include page="/WEB-INF/end.jsp" />