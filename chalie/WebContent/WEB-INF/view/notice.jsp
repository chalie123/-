<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/top.jsp" />
<div class="container">
	<h2>공지 사항</h2>
	<p>The .table-responsive class creates a responsive table which
		will scroll horizontally on small devices (under 768px). When viewing
		on anything larger than 768px wide, there is no difference:</p>
	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>Firstname</th>
					<th>Lastname</th>
					<th>Age</th>
					<th>City</th>
					<th>Country</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>Anna</td>
					<td>Pitt</td>
					<td>35</td>
					<td>New York</td>
					<td>USA</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<jsp:include page="/WEB-INF/end.jsp" />