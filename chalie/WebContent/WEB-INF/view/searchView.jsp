<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<body>
	<c:forEach var="list" items="${searchResult }" varStatus="status">
		번호 : ${list.NO }, 제목 : ${list.TITLE }, 저자 : ${list.AUTHOR }, 분류 : ${list.SUBJECT }, 발행일 : ${list.PUBLISH_PREDATE }, 출판사 : ${list.PUBLISHER }, ISBN : ${list.EA_ISBN }, 형식 : ${list.FORM_DETAIL }, 발행가 : ${list.PRE_PRICE }, 시리즈명 : ${list.SERIES_TITLE }
	</c:forEach>
</body>
</html>