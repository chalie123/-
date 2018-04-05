<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<div align="center">

<%
	String id = "";
	//로그인 확인
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}
%>
	
	<c:set var="id" value="<%=id%>"></c:set>
	<c:if test="${text.USER_ID==id}">
		<form action="/contentModify">
			<input type="hidden" value="${link}" name="link"> 
			<img src="/image/loanInfo1.png">
	<input type="hidden" value="${board}" name="board">
			<button type="submit" value="modify" name="modify">수정</button>
			<button type="submit" value="delete" name="delete">삭제</button>
		</form>
	</c:if>
<img src="/image/loanInfo1.png">
<img src="/image/loanInfo2.png">
<img src="/image/loanInfo3.png">




