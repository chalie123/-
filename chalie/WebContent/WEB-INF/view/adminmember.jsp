<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<br/>
<br/>
			<h2 align="center"><button type="submit">저장</button></h2>
<h3>회원관리</h3>	
<br/>
	<c:forEach var="list" items="${memberResult }" varStatus="status" >
	
	<hr/>
		이름 : ${list.NAME },&nbsp;&nbsp; 이메일 : ${list.EMAIL }, &nbsp;&nbsp;시리즈명 : ${list.JOINDATE },&nbsp;&nbsp;
			등급 : ${list.VERIFY_EMAIL }&nbsp;<button type="submit" name="ratingUp">↑</button><button type="submit" name="ratingDown">↓</button>,&nbsp;&nbsp; 
					시리얼 : ${list.SERIAL }
	</c:forEach>
</body>
</html>