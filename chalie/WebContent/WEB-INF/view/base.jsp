<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<head>
<title>찰리 도서관</title>
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
	background-color: #f1f1f1;
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
	<header>
		<div align="left">
			<h1>
				<a href="/"><img src="/image/logo.gif" alt="도서관" />
				</a>
			</h1>
		</div>
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li class="dropdown"><a class="dropdown-toggle"

							data-toggle="dropdown" href="#">자료검색 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/search/allView">통합검색</a></li>
								<li><a href="/search/commonView">일반도서</a></li>
								<li><a href="/search/nonbookView">비도서</a></li>
								<li><a href="/search/kidView">아동도서</a></li>
								<li><a href="/search/newcomeView">신착자료</a></li>
								<li><a href="/search/recommendView">추천도서</a></li>
								<li><a href="/search/popularView">인기도서</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">나의 서재 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/account/rentalView">대출/연장/예약조회</a></li>
								<li><a href="/contentIndex?link=t_account_proposal&board=5">희망도서신청/조회</a></li>
								<li><a href="/account/modifyView">개인정보수정/탈퇴</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">참여마당 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/community/donationView">도서기증</a></li>
								<li><a href="/community/serviceView">자원봉사신청</a></li>
								<li><a href="/contentIndex?link=t_community_review&board=0">한줄감상</a></li>
								<li><a href="/contentIndex?link=t_community_suggestion&board=1">도서관에바란다</a></li>
								<li><a href="/community/chatView">대나무숲</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">이용안내 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/contentIndex?link=t_guide_notification&board=2">공지사항</a></li>
								<li><a href="/contentIndex?link=t_guide_FAQ&board=3">자주하는질문</a></li>
								<li><a href="/contentIndex?link=t_guide_QNA&board=4">Q&A(참고봉사)</a></li>
								<li><a href="/guide/rentalView">대출안내</a></li>
								<li><a href="/contentIndex?link=t_guide_proposal&board=5">희망도서신청/조회</a></li>
								<li><a href="/guide/constitutionView">도서관서비스헌장</a></li>
								<li><a href="/guide/scheduleView">도서관일정</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">도서관소개 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/info/welcomeView">인사말</a></li>
								<li><a href="/info/historyView">연혁</a></li>
								<li><a href="/info/organizationView">조직도</a></li>
								<li><a href="/info/statisticsView">자료현황</a></li>
								<li><a href="/info/mapView">찾아오시는길</a></li>
							</ul></li>
						<c:choose>
							<c:when test="${rank==9 }">
								<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#">관리자메뉴 <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="/manage/memberView">회원관리</a></li>
									<li><a href="/manage/dataView">자료관리</a></li>
									<li><a href="/manage/communityView">커뮤니티관리</a></li>
								</ul></li>
							</c:when>
						</c:choose>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/"><span class="glyphicon glyphicon-log-in"></span>
								홈</a></li>
					</ul>
					<c:choose>
					<c:when test="${logon==null }">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/account/createView"><span
								class="glyphicon glyphicon-log-in"></span>회원가입</a></li>
					</ul>
					</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${logon==null }">
							<ul class="nav navbar-nav navbar-right">
								<li><a href="/account/loginView"><span
										class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
							</ul>
						</c:when>
						<c:otherwise>
							<ul class="nav navbar-nav navbar-right">
								<li><a href="/account/modifyView"><span
										class="glyphicon glyphicon-log-in"></span> ${logon }</a></li>
							</ul>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${logon!=null }">
							<ul class="nav navbar-nav navbar-right">
								<li><a href="/account/logout"><span
										class="glyphicon glyphicon-log-in"></span> 로그아웃</a></li>
							</ul>
						</c:when>
					</c:choose>
				</div>
			</div>
		</nav>
	</header>
	
	
	<div class="container-fluid text-center">
		<tiles:insertAttribute name="main" />
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
