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
	boolean auth=false;
	if (session.getAttribute("logon") != null) {
		id = (String) session.getAttribute("logon");
		if(session.getAttribute("rank").toString().equals("1")||session.getAttribute("rank").toString().equals("9"))
			auth=true;
	}
%>
<c:set var="id" value="<%=id%>"></c:set>
<c:if test="${text.USER_ID==id}">
	<form action="/contentModify">
		<input type="hidden" value="${text.UUID }" name="UUID"> <input
			type="hidden" value="${link}" name="link"> <input
			type="hidden" value="${board}" name="board">
		<button type="submit" value="modify" name="modify">수정</button>
		<button type="submit" value="delete" name="delete">삭제</button>
	</form>
</c:if>


<div>
	<div style="background-color: #F0F0F0; width: 100%; height: 50px;">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="bd00 bd00Bbs bd01">
			<thead>
				<tr>
					<th scope="col" width="60px" align="left">제목: ${text.TITLE }</th>
					<th scope="col" width="300px"><span id="time">시간: ${text.FIRSTMODIFIEDDATE  }</span></th>
				</tr>
			</thead>
			
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="bd00 bd00Bbs bd01">
			<thead>
				<tr>
					<th scope="col" width="60px" align="left">글쓴이</th>
					<th scope="col" width="70px" align="left"><span id="name">${text.USER_ID }</span></th>
					<th scope="col" width="40px" align="left">조회</th>
					<th scope="col" width="40px" height="30px" align="left"><span id="view">${text.VIEWS }</span></th>
					<th scope="col" width="40px" align="left">태그</th>
					<th scope="col" width="40px" align="left"><span id="comment">${text.TAGS }</span></th>
					<th scope="col"></th>
				</tr>
			</thead>
		</table>
		<hr/>
		<br/>
	</div>
	<br>
	<br>
	<hr/>
	
	<div style="height: 100px;">
		<c:if test="${files !=null }">
			<c:forEach var="i" items="${files}">
				<img src="${i.UPLOAD_FILE}" width="400px" height="400px">
				<br />
			</c:forEach>
		</c:if>
	</div>
		<br><br>
	<br><br>
	<br><br>
	<br><br>
	<br><br>
	<br><br>
	<br><br>	<br><br>
	<br><br>
	<br><br>
	<br><br>
	<br><br>
	<br><br>
	<div style="height: 100px;" >${text.TEXT }</div>
	<br><br>
	<br>
	<hr />
	<div style="background-color: #F0F0F0; width: 100%;">
		<div>
			<c:if test="${ comments !=null }">
				<c:forEach var="o" items="${ comments }">
			
			작성자: ${o.USER_ID}<br /> 
			 ${o.TEXT}<br /> 
			작성시간:
				${o.FIRSTMODIFIEDDATE  }<br />
					<c:if test="${o.USER_ID==id}">
						<form action="/commentDelete">
							<input type="hidden" value="${o.COMMENTS_UUID }"
								name="comments_UUID"> <input type="hidden"
								value="${o.UUID }" name="UUID"> <input type="hidden"
								value="${link}" name="link"> <input type="hidden"
								value="${board}" name="board">
							<button type="submit">삭제</button>
							<br>
						</form>
					</c:if>
					<br/>
				</c:forEach>
			</c:if>
		</div>

		<div>
		<c:set var="auth" value="<%=auth%>"></c:set>
		<c:if test="${auth }">
			<form action="/commentRegister">
				<input type="hidden" value="${text.UUID }" name="UUID"> <input
					type="hidden" value="${link}" name="link"> <input
					type="hidden" value="${board}" name="board"> <input
					type="text" name="text" placeholder="댓글달기"><br /> <br />
				<button type="submit">확인</button>
			</form>
		</c:if>
		</div>
	</div>
	<form action="/contentIndex">
		<input type="hidden" value="${link}" name="link"> <input
			type="hidden" value="${board}" name="board">
		<button type="submit">목록으로</button>
	</form>
</div>