<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<meta name="format-detection" content="telephone=no, address=no, email=no">
<link href="../../../img/common/favicon_initech.ico" rel="shortcut icon"/>
<link rel="stylesheet" type="text/css" href="../../../css/contents.css">
<link rel="stylesheet" type="text/css" href="../../../css/reset.css">
<link rel="stylesheet" type="text/css" href="../../../css/layout.css">
<link rel="stylesheet" type="text/css" href="../../../css/contents.css">
<link rel="stylesheet" type="text/css" href="../../../css/responsive.css">
<link rel="stylesheet" type="text/css" href="../../../css/responsive_cont.css">
<script type="text/javascript" src="../../../js/jquery.js"></script>
<script src="../../../js/modernizr-custom.js"></script>
<script src="../../../js/actfunction.js"></script>
<script src="../../../js/layout.js"></script>
<script type="text/javascript">

$(function() {
	//공통 layout 불러오기 
	var $wrapper = "#wrapper";
	var $contentsWrap = ".contents_wrap";
	var $folder = "../../../";	//경로 구분
	
	categoryrLayout($wrapper,$folder);
	headerLayout($contentsWrap,$folder);
	footerLayout($contentsWrap,$folder);
	topMenu(); // topMenu 실행
	subTitleFixed($folder); // subTitleFixed 실행
	moveTop(); // 위로가기 실행
	footerToggle(); //familygroup toggle
	
});

</script>
</head>
<body>
<div id="wrapper">

	<!-- categoryrLayout include -->
	<div class="contents_wrap now_comp">

		<!-- headerLayout include -->
		<div class="sub_gnb">
			<div class="sub_gnb_title">
				<h2>연혁</h2>
			</div>
		</div>
		<div id="content" class="hist" >
			<div class="content_margin">
				<h3>도서관 연혁</h3>
				<div class="historybg clear">
					<div class="history mt60">
						<dl>
							<dt style="background: url('../../../img/comp/history_on.png') no-repeat 0 0;">2017</dt>
							<dd>
								<ul class="list_dash">
									<li><span>12월</span><p>인기 도서관</p></li>
									<li><span>02월</span><p>책이 가장많은 도서관으로 선정</p></li>
								</ul>
							</dd>
							<dt>2016</dt>
							<dd>
								<ul class="list_dash">
									<li><span>10월</span><p>책이 가장많은 도서관으로 선정</p></li>
									<li><span>07월</span><p>책이 가장많은 도서관으로 선정</p></li>
									<li><span>05월</span><p>책이 가장많은 도서관으로 선정</p></li>
									<li><span>04월</span><p>책이 가장많은 도서관으로 선정</p></li>
									<li><span>03월</span><p>책이 가장많은 도서관으로 선정</p></li>
								</ul>
							</dd>
							<dt>2015</dt>
							<dd>
								<ul class="list_dash">
									<li><span>10월</span><p>책이 가장많은 도서관으로 선정</p></li>
									<li><span>06월</span><p>책이 가장많은 도서관으로 선정</p></li>
									<li><span>02월</span><p>책이 가장많은 도서관으로 선정</p></li>
								</ul>
							</dd>
							<dt>2014</dt>
							<dd>
								<ul class="list_dash">
									<li><span>10월</span><p>찰리</p></li>
									<li><span>06월</span><p>도서관</p></li>
								</ul>
							</dd>
							<dt>2013</dt>
							<dd>
								<ul class="list_dash">
									<li><span>12월</span><p>잘나가</p></li>
								</ul>
							</dd>
							<dt>2012</dt>
							<dd>
								<ul class="list_dash">
									<li><span>07월</span><p>시설도</p></li>
									<li><span>02월</span><p>깨끗하고</p></li>
								</ul>
							</dd>
							<dt>2011</dt>
							<dd>
								<ul class="list_dash">
									<li><span>06월</span><p>조용해서</p></li>
									<li><span>04월</span><p>도서읽기 좋은</p></li>
									<li><span>03월</span><p>찰리도서관으로</p></li>
								</ul>
							</dd>
							<dt>2010</dt>
							<dd>
								<ul class="list_dash">
									<li><span>12월</span><p>오세요</p></li>
									<li><span>10월</span><p>식당도</p></li>
								</ul>
							</dd>
							<dt>2009</dt>
							<dd>
								<ul class="list_dash">
									<li><span>06월</span><p>있다</p></li>
								</ul>
							</dd>
							<dt>2008</dt>
							<dd>
								<ul class="list_dash">
									<li><span>05월</span><p>2호점</p></li>
								</ul>
							</dd>
							<dt>2007</dt>
							<dd>
								<ul class="list_dash">
									<li><span>03월</span><p>차리게</p></li>
								</ul>
							</dd>
							<dt>2006</dt>
							<dd>
								<ul class="list_dash">
									<li><span>12월</span><p>많이들</p></li>
									<li><span>06월</span><p>오세요</p></li>
									<li><span>01월</span><p>MOTP(MOBILE ONE TIME PASSWORD)서비스 런칭</p></li>
								</ul>
							</dd>
							<dt>2005</dt>
							<dd>
								<ul class="list_dash">
									<li><span>06월</span><p>제7회 인터넷 그랑프리 정보보호 부문 대상 수상</p></li>
									<li><span>04월</span><p>정보보호컨설팅전문업체 지정</p></li>
								</ul>
							</dd>
							<dt>2004</dt>
							<dd>
								<ul class="list_dash">
									<li><span>12월</span><p>국내 최초 기업용 CLENT 뱅킹 서비스 개발</p></li>
									<li><span>09월</span><p>국내 최초 BPM 기반 U-뱅킹 통합 플랫폼 구축</p></li>
									<li><span>08월</span><p>국내 최초 MACINTOSH용 인터넷뱅킹 개발</p></li>
									<li><span>02월</span><p>국세청 통합인증 관리 시스템 공급</p></li>
								</ul>
							</dd>
							<dt>2003</dt>
							<dd>
								<ul class="list_dash">
									<li><span>11월</span><p>제4회 정보통신산업 디지털 대상 정보통신부 장관상 수상(한겨레)</p></li>
									<li><span>06월</span><p>'IT 산업대상 - 정보보호 부문' 정보통신장관상 수상(헤럴드 경제)</p></li>
									<li><span>06월</span><p>정보의 날 기념 E-BIZ 유공부문 국무총리상 수상</p></li>
									<li><span>04월</span><p>금융자동화기기 보안 솔루션 INISAFE ATM 개발</p></li>
									<li><span>04월</span><p>ONE TIME PASSWORD 솔루션, INISAFE MOBILE OTP 개발</p></li>
								</ul>
							</dd>
							<dt>2002</dt>
							<dd>
								<ul class="list_dash">
									<li><span>11월</span><p>사람들이 선호하는 도서관선정</p></li>
									<li><span>08월</span><p>사람들이 선호하는 도서관선정</p></li>
									<li><span>03월</span><p>사람들이 선호하는 도서관선정</p></li>
								</ul>
							</dd>
							<dt>2001</dt>
							<dd>
								<ul class="list_dash">
									<li><span>12월</span><p>사람들이 선호하는 도서관선정</p></li>
									<li><span>12월</span><p>사람들이 선호하는 도서관선정</p></li>
									<li><span>11월</span><p>사람들이 선호하는 도서관선정 등록</p></li>
									<li><span>08월</span><p>사람들이 선호하는 도서관선정 </p></li>
								</ul>
							</dd>
							<dt>2000</dt>
							<dd>
								<ul class="list_dash">
									<li><span>06월</span><p>사람들이 선호하는 도서관선정</p></li>
									<li><span>03월</span><p>사람들이 선호하는 도서관선정</p></li>
								</ul>
							</dd>
							<dt>1999</dt>
							<dd>
								<ul class="list_dash">
									<li><span>07월</span><p>사람들이 선호하는 도서관선정</p></li>
									<li><span>07월</span><p>사람들이 선호하는 도서관선정</p></li>
									<li><span>04월</span><p>사람들이 선호하는 도서관선정</p></li>
								</ul>
							</dd>
							<dt>1998</dt>
							<dd>
								<ul class="list_dash">
									<li><span>10월</span><p>시설이 좋은 도서관 설정</p></li>
									<li><span>02월</span><p>깨끗한 도서관 선정</p></li>
									<li><span></span><p>사람들이 선호하는 도서관선정</p></li>
								</ul>
							</dd>
							<dt>1997</dt>
							<dd>
								<ul class="list_dash">
									<li><span>10월</span><p>찰리도서관설립</p></li>
								</ul>
							</dd>				
						</dl>
					</div>
				</div>
			</div><!--content_margin-->
		</div><!--content-->


		<!-- footerLayout include -->

	
	</div>
</div>
</body>
</html>