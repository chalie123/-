<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<input type="hidden" value="/image/bookDonation.png" name="file">
		<input type="hidden" value="bookDonation.png" name="fileName">
		<button type="submit">수정</button>
	</form>


</c:if>
<img src="/image/bookDonation.png">