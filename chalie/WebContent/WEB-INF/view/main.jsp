<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<c:choose>
<c:when test="${logon==null }">
<div style="float: left; margin-right:100px;" >
	<div id="content" align="left">
		<div id="sideBar">
			<div id="member">

				<h2>
					&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;<img src="/image/mi_mc_member.gif"
						width="120" height="50" alt="gd" />
				</h2>
				<form name="email" id="emailVal" method="post"
					action="/account/login">

					<p class="id">
						<label class="blind">아이디</label>:&nbsp;&nbsp; <input type="text"
							name="email" id="emailVal" maxlength="30" title="아이디"
							class="input required" />
					</p>
					<p class="password">
						<label for="password" class="blind">비밀번호</label> <input
							type="password" name="pass" id="password" maxlength="12"
							title="비밀번호" class="input required" />
					</p>
					&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;
					<p class="button">
						&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<input
							type="image" name="Image" src="/image/lmi_mc_login.gif" alt="로그인" />
					</p>
				</form>
			</div>
		</div>
	</div>
</div>
</c:when>
</c:choose>
<div class="lo_1000" id="container" align="center" style="float: left;">
	<div class="jwxe_root"
		style="width: 464px; height: 643px; position: relative;">
		<img class="jwxe_img" src="/image/visual02.jpg" align="top"
			alt="당신의 서재에서 잠자고 있는 자료들이 찰리도서관 을 통해 세상의 빛과 만나게 됩니다."
			style="height: 609px; width: 464px;" />


	</div>
</div>








<div id="main">
	<ul id="board">
		<li class="selected">
			<h2>
				<a href="#notice" id="notice"><img
					src="/image/mi_mc_board_1_off.gif" width="69"
					height="22" alt="공지사항" /></a>
			</h2>
			<ul class="boardRecent">
				<li class="bullet32"><span>[18.04.04]</span> <img
					src="/image/mi_new.gif" alt="새글" /> <a
					href="/contentView?UUID=5bb967af-b1cb&link=t_guide_notification&board=2"
					class="ajaxAnchor">서천도서관 3월의 문제적이용자 발표</a></li>
				<li class="bullet32"><span>[18.04.04]</span> <img
					src="/image/mi_new.gif" alt="새글" /> <a
					href="/contentView?UUID=b3eeb838-5c45&link=t_guide_notification&board=2"
					class="ajaxAnchor">제54회 도서관주간 행사 안내</a></li>
				<li class="bullet32"><span>[18.04.01]</span> <a
					href="/contentView?UUID=342180fe-9c8e&link=t_guide_notification&board=2"
					class="ajaxAnchor">서천도서관 소식지 4월호</a></li>
				<li class="bullet32"><span>[18.03.29]</span> <a
					href="/contentView?UUID=1f9c7a92-218f&link=t_guide_notification&board=2"
					class="ajaxAnchor">2018년 4월 휴관일 안내</a></li>
				<li class="bullet32"><span>[18.03.22]</span> <a
					href="/contentView?UUID=98417a31-3939&link=t_guide_notification&board=2"
					class="ajaxAnchor">2018년 1차 도서구매 소액수의 전자견적 공고</a></li>
				<li class="bullet32"><span>[18.03.21]</span> <a
					href="/contentView?UUID=42fdb939-4eea&link=t_guide_notification&board=2"
					class="ajaxAnchor">공감학교 강의 제안서 첨부</a></li>
				<li class="bullet32"><span>[18.03.20]</span> <a
					href="/contentView?UUID=ce823231-9540&link=t_guide_notification&board=2"
					class="ajaxAnchor">3월 문화가 있는 날 행사 안내</a></li>
				<li class="bullet32"><span>[18.03.15]</span> <a
					href="/contentView?UUID=f18f43fc-7fd6&link=t_guide_notification&board=2"
					class="ajaxAnchor">서천도서관 2월의 문제적 이용자 발표</a></li>
				<li class="bullet32"><span>[18.03.09]</span> <a
					href="/contentIndex?link=t_guide_notification&board=2"
					class="ajaxAnchor">2018년 2월 희망도서 비치안내</a></li>
				<li class="bullet32"><span>[18.03.05]</span> <a
					href="http://192.168.10.77/contentView?UUID=ea706fce-84ef&link=t_guide_notification&board=2"
					class="ajaxAnchor">'책 읽어주세요' 참여 어린이 모집</a></li>
			</ul>
			<p class="more">
				<a href="board/list.php?tblname=20110609115109" title="공지사항 더보기"><img
					src="skin/default/images/lmi_mc_more_1.gif" width="30" height="6"
					alt="더보기" /></a>
			</p>
		</li>
		<li>
			<h2>
				<a href="#data" id="data"><img
					src="/image/mi_mc_board_3_off.gif" width="69"
					height="22" alt="행정자료실" /></a>
			</h2>
		
			
		</li>
	</ul>
	<!-- /board -->
	<ul id="booksea">
	
		<li>
			<img
				src="/image/lmi_mc_ask_librarian.gif" width="177"
				height="49" alt="사서에게 물어보세요" /></li>
	</ul>
</div>