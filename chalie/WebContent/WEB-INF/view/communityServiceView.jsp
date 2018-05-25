<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<br>
<br>
<br>
<%
	boolean auth = false;
if(session.getAttribute("rank")!=null){
	if ( session.getAttribute("rank").toString().equals("9")) {
		auth = true;
	}
}
%>
<c:if test="<%=auth%>">

	<form action="/adminContentModifyView">
		<input type="hidden" value="/image/volunteer.png" name="file">
		<input type="hidden" value="volunteer.png" name="fileName">
		<button type="submit">수정</button>
	</form>


</c:if>
<img src="/image/volunteer.png">