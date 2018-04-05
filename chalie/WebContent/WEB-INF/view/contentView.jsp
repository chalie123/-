<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<%
	String id = "";
	//로그인 확인
	if (session.getAttribute("logon") != null) {
		id = (String) session.getAttribute("id");
	}
%>
	
	<c:set var="id" value="<%=id%>"></c:set>
	<c:if test="${text.USER_ID==id}">
		<form action="/contentModify">
			<input type="hidden" value="${text.UUID }" name="UUID">
			<input type="hidden" value="${link}" name="link"> 
	<input type="hidden" value="${board}" name="board">
			<button type="submit" value="modify" name="modify">수정</button>
			<button type="submit" value="delete" name="delete">삭제</button>
		</form>
	</c:if>
	<br> 제목 ${text.TITLE }
	<br>게시판 ${text.BOARD }
	<br /> 아이디${text.USER_ID }
	<br /> 본문 ${text.TEXT }
	<br /> 날짜
	<c:choose>
		<c:when test="${text.LASTMODIFIEDDATE ==null }">
			${text.FIRSTMODIFIEDDATE  }<br />
		</c:when>
		<c:otherwise>
			최초등록:${text.FIRSTMODIFIEDDATE  }<br />
			수정시각:${text.LASTMODIFIEDDATE  }<br />
		</c:otherwise>
	</c:choose>
	조회수${text.VIEWS }
	<br /> 태그 ${text.TAGS }
	<br /> 업로드된 파일
	<c:if test="${files !=null }">
		<c:forEach var="i" items="${files}">
			<img src="${i.UPLOAD_FILE}" width="200px" height="200px">
			<br />
		</c:forEach>
	</c:if>
	<br />
	<br />
	<c:if test="${ comments !=null }">
		<c:forEach var="o" items="${ comments }">
			댓글  <br />
			아이디  ${o.USER_ID}<br /> 
			본문 ${o.TEXT}<br /> 
			시간 <br />
			<c:choose>
				<c:when test="${o.LASTMODIFIEDDATE ==null }">
				${o.FIRSTMODIFIEDDATE  }<br />
				</c:when>
				<c:otherwise>
				최초등록:${o.FIRSTMODIFIEDDATE  }<br />
				수정시각:${o.LASTMODIFIEDDATE  }<br />
				</c:otherwise>
			</c:choose>
			<br />
			<br />
			<c:if test="${o.USER_ID==id}">
				<form action="/commentDelete">
					<input type="hidden" value="${o.COMMENTS_UUID }"name="comments_UUID">
					 <input type="hidden"value="${o.UUID }" name="UUID">
					 <input type="hidden" value="${link}" name="link"> 
	<input type="hidden" value="${board}" name="board">
					<button type="submit">삭제</button>
					<br>
				</form>
			</c:if>
		</c:forEach>
	</c:if>

	<form action="/commentRegister">
		<input type="hidden" value="${text.UUID }" name="UUID"> 
		<input type="hidden" value="${link}" name="link"> 
	<input type="hidden" value="${board}" name="board">		
		<input type="text" name="text"><br /> <br />
		<button type="submit">확인</button>
	</form>
	<form action="/contentIndex">
	<input type="hidden" value="${link}" name="link"> 
	<input type="hidden" value="${board}" name="board">
		<button type="submit">목록으로</button>
	</form>

