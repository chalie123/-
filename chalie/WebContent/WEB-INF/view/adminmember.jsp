<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="list" items="${memberResult }" varStatus="status">
		번호 : ${list.NAME }, 제목 : ${list.EMAIL }, 저자 : ${list.AUTHOR }, 분류 : ${list.SUBJECT }, 발행일 : ${list.PUBLISH_PREDATE }, 출판사 : ${list.PUBLISHER }, ISBN : ${list.EA_ISBN }, 형식 : ${list.FORM_DETAIL }, 발행가 : ${list.PRE_PRICE }, 시리즈명 : ${list.SERIES_TITLE }
	</c:forEach>
</body>
</html>