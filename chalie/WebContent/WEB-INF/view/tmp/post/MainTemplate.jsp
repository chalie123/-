<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<html lang="en">
<head>
<title><tiles:insertAttribute name="title" /></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 1000px
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #555;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>
</head>
<body>
	<a href="/"> <b> <img src="/image/logo.gif" alt="도서관" />
	</b>
	</a>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">리스트</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">도서관리 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/list">도서목록</a></li>
							<li><a href="/word">도서신청</a></li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">고객센터 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">찾아오시는길</a></li>
							<li><a href="#">전화번호</a></li>
							<li><a href="#">공지사항</a></li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">커뮤니티 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">동아리방</a></li>
							<li><a href="#">광 장 </a></li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">자료검색 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">통합검색</a></li>
							<li><a href="#">비도서검색 </a></li>
							<li><a href="/chat">챗 </a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/account/createView"><span
							class="glyphicon glyphicon-log-in"></span> Create</a></li>
				</ul>
				<c:choose>
					<c:when test="${logon==null }">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="/account/loginView"><span
									class="glyphicon glyphicon-log-in"></span> Login</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="/accountManagement"><span
									class="glyphicon glyphicon-log-in"></span> ${logon }</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${logon!=null }">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="/account/logout"><span
									class="glyphicon glyphicon-log-in"></span> Logout</a></li>
						</ul>
					</c:when>
				</c:choose>
			</div>
		</div>
	</nav>

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav">
				<tiles:insertAttribute name="side"></tiles:insertAttribute>
			</div>
			<div class="col-sm-8 text-left">
				<tiles:insertAttribute name="menu"></tiles:insertAttribute>
			</div>
		</div>
	</div>
	<footer class="container-fluid text-center">
		<p>KG ITBANK 찰리조 도서관 소개 개인정보취급 방침 채용 안내오시는길 환불규정안내 강남점 서울특별시 강남구
			강남대로84길 16 제이스타워 11층~12층 사업자등록번호 : 000-00-00000 l 법인등록번호 :
			0000000-0000000 통신판매번호 : 제 00-000-0호 0 상표권출원번호 : 000000000 고객지원센터
			대표번호 : 00-0000-0000 0 FAX : 00-000-0000 Copyright ⓒ KG ITBANK 찰리조 도서관
			All rights reserved.</p>
	</footer>

</body>
</html>
