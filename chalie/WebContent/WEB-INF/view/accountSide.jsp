<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ul class="nav nav-pills nav-stacked">
	<li><a href="/account/rentalView">대출/연장/예약조회</a></li>
	<li><a href="/account/proposalView">희망도서신청/조회</a></li>
	<li><a href="/account/modifyView">개인정보수정</a></li>
	<c:choose>
	<c:when test="${logon==null }">
	<li><a href="/account/loginView">로그인</a></li>
	<li><a href="/account/createView">회원가입</a></li>
	</c:when>
</c:choose>
</ul>
<br>
