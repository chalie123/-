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
	자유 게시판<br /> <br /> 글쓴이 제목 날짜 조회 <br>
	<c:forEach var="o" items="${list }" varStatus="vs">
						${o.USER_ID } 가쓴 <a href="/contentView?UUID=${o.UUID}">${o.TITLE }</a>
						 날짜
						 <c:choose>
			<c:when test="${o.LASTMODIFIEDDATE !=null }">
							${o.LASTMODIFIEDDATE } 
						</c:when>
			<c:otherwise>
							:${o.FIRSTMODIFIEDDATE }
						</c:otherwise>
		</c:choose>
						조회수 ${o.VIEWS }
						<br />
	</c:forEach>
	글 목록
	<c:forEach var="i" begin="1" end="${maxIndex }" step="1">
		<c:choose>
			<c:when test="${i}==${index }">
						${i }&nbsp;
						</c:when>
			<c:otherwise>
				<a href="/contentView?index=${i-1 }">${i }</a>&nbsp;
						</c:otherwise>
		</c:choose>
	</c:forEach>
	<br /> 검색 글 제목,태그,글쓴이
	<form action="/contentIndex">
		검색 <input type="search" name="key">
		<button type="submit">확인</button>
	</form>
	<br /> 글쓰기 버튼
	<form action="/contentWriteView">
		<button type="submit">글 쓰기</button>
	</form>
</div>
