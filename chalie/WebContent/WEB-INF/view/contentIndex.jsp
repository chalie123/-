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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<div align="center">

	<%
		String id = "";
		boolean auth=false;	
	//로그인 확인
		if (session.getAttribute("logon") != null) {
			id = (String) session.getAttribute("logon");
			if(session.getAttribute("rank").toString().equals("1")||session.getAttribute("rank").toString().equals("9"))
				auth=true;
		}
	%>

	<br> <br>
	<div>
		<table border="0" width="850px" height="25" cellspacing="1"
			cellpadding="1" bgcolor="#FFE8E8" >
			<colgroup>
				<col width="7%"/>
				<col width="55%" />
				<col width="22%"/>
				<col width="6%"/>
			</colgroup>
			<tbody>
				<tr bgcolor="#FFFFFF" >
					<th scope="col" width="55px" >작성자</th>
					<th scope="col" width="55px" >제목</th>
					<th scope="col" width="55px">작성날짜</th>
					<th scope="col" width="55px">조회수</th>
				</tr>


				<c:forEach var="o" items="${list }" varStatus="vs">
					<tr bgcolor="#FFFFFF">
						<td>${o.USER_ID }</td>
						<td><a
							href="/contentView?UUID=${o.UUID}&link=${link}&board=${board}">${o.TITLE }</a></td>
						<td><c:choose>
								<c:when test="${o.LASTMODIFIEDDATE !=null }">
							${o.LASTMODIFIEDDATE } 
						</c:when>
								<c:otherwise>
							${o.FIRSTMODIFIEDDATE }
						</c:otherwise>
							</c:choose></td>
						<td>${o.VIEWS }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br> <br>
	</div>
	<c:forEach var="i" begin="1" end="${maxIndex }" step="1">
		<c:choose>
			<c:when test="${i}==${index }">
						${i }&nbsp;
						</c:when>
			<c:otherwise>
				<a href="/contentIndex?index=${i-1 }&link=${link}&board=${board}">${i }</a>&nbsp;
						</c:otherwise>
		</c:choose>
	</c:forEach>
	<div>
		<br />
		<div>
			<div>
				<form action="/contentIndex">
					<input type="hidden" value="${link}" name="link"> <input
						type="hidden" value="${board}" name="board"> 검색 <input
						type="search" name="key" placeholder="글태그 제목 아이디">
					<button type="submit">확인</button>
				</form>
			</div>
			<div>
				<c:set var="auth" value="<%=auth%>"></c:set>
			<c:if test="${auth}">
				<form action="/contentWriteView">
					<input type="hidden" value="${link}" name="link"> <input
						type="hidden" value="${board}" name="board">
					<button type="submit">글 쓰기</button>
				</form>
				</c:if>
			</div>
		</div>
	</div>
</div>
