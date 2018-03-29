<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 650px
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
<div class="col-sm-8 text-left">

	<div align="center">
		<br /> <br /> <br />
		<div>
			<h2>회원정보수정</h2>
			<br /> <br /> <br />
			<form action="/account/modify">
				
				<div align="center" style="font: bold 13pt/1.3 돋움">
					PASS &nbsp;&nbsp;<input type="password" width="250px"
						height="250px;" name="pass" placeholder="비밀번호">
				</div>
				<br />
				
				<div align="center" style="font: bold 13pt/1.3 돋움">
					휴대폰번호&nbsp;&nbsp;<input type="text" width="500px" height="500px;"
						name="phone" placeholder="번호">
				</div>
				<br />
				<div align="center" style="font: bold 13pt/1.3 돋움">
					카드번호 &nbsp;&nbsp;<input type="text" width="250px" height="250px;"
						name="card" placeholder="필수아님">
				</div>
				<br />
				<div align="center" style="font: bold 13pt/1.3 돋움">
					카드사 &nbsp;&nbsp;<input type="text" width="250px" height="250px;"
						name="cardname" placeholder="필수아님">
				</div>
				<br />
				<div align="center" style="font: bold 13pt/1.3 돋움">
					주소 &nbsp;&nbsp;<input type="text" width="500px" height="500px;"
						name="address" placeholder="주소">
				</div>
				<br />
				<div align="center" style="font: bold 13pt/1.3 돋움">
					카드유효기간 &nbsp;&nbsp;<input type="text" width="500px" height="500px;"
						name="carddate" placeholder="카드 유효기간">
				</div>
				<br />
				<div align="center" style="font: bold 13pt/1.3 돋움">
					cvc &nbsp;&nbsp;<input type="text" width="500px" height="500px;"
						name="cvc" placeholder="cvc">
				</div>
				<br />
				<div align="center" style="font: bold 13pt/1.3 돋움">
					흥미 &nbsp;&nbsp;<input type="text" width="500px" height="500px;"
						name="interest" placeholder="흥미있는것적어주세요">
				</div>
				<br /> <br />
				<button type="submit" id="create" >확인</button>
			</form>
				
			<footer class="container-fluid text-center">
				<p>KG ITBANK 찰리조 도서관 소개 개인정보취급 방침 채용 안내오시는길 환불규정안내 강남점 서울특별시 강남구
					강남대로84길 16 제이스타워 11층~12층 사업자등록번호 : 000-00-00000 l 법인등록번호 :
					0000000-0000000 통신판매번호 : 제 00-000-0호 0 상표권출원번호 : 000000000 고객지원센터
					대표번호 : 00-0000-0000 0 FAX : 00-000-0000 Copyright ⓒ KG ITBANK 찰리조
					도서관 All rights reserved.</p>
			</footer>
		</div>
	</div>
</div>
