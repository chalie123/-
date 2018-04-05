<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="lnbheader">
	<h2></h2>
	<p></p>
</div>

<div id="contentcore">
	<div class="naviandtitle"></div>
	<div class="contents">
		<h2 align="center">
			<strong>찰리정보문화도서관 찾아오시는 길</strong>
		</h2>
		<br />
		<div class="map" class="tblWrap" align="center">
			<!-- * Daum 지도 - 지도퍼가기 -->
			<!-- 1. 지도 노드 -->
			<div id="daumRoughmapContainer1426656145199"
				class="root_daum_roughmap root_daum_roughmap_landing"></div>

			<!--
                                               2. 설치 스크립트
                                               * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
                                           -->
			<script charset="UTF-8" class="daum_roughmap_loader_script"
				src="http://dmaps.daum.net/map_js_init/roughmapLoader.js"></script>

			<!-- 3. 실행 스크립트 -->
			<script charset="UTF-8">
				new daum.roughmap.Lander({
					"timestamp" : "1426656145199",
					"key" : "3iqt",
					"mapWidth" : "700",
					"mapHeight" : "425"
				}).render();
			</script>
		</div>
		<br />
		<div align="center">
			<div style="width: 500px;" align="left">
				<ul class="guide">
					<li class="pb20"><strong>대중교통 이용 시</strong>
						<ul>
							<li>지하철 : 2호선 문래역 1번 출구, 도보로 5분 소요<br /> (문래공원을 가로질러 국화아파트와
								한신아파트 사잇길로 오시면, 도보 5분거리에 있습니다.)
							</li>
							<li>버스 : 6625번, 5번(우리은행 앞), 영등포12(문래동자이아파트)</li>
							<li style="background: none;">※ 주차공간이 협소하니 대중교통을 이용해 주시면
								감사하겠습니다.</li>
						</ul></li>
					<li class="pb30"><strong>주소</strong>
						<ul>
							<li>(07296) 서울시 영등포구 문래로 20길 49</li>
							<li><span class="fb">TEL</span> : 02)2629-8600 &nbsp;&nbsp;
								<span class="fb">FAX</span> : 02)2629-8601</li>
						</ul></li>
				</ul>

			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	function gofam(num) {
		if (num == 1) {
			var tmp = document.fams1.fam.value;
			window.open(tmp, "_blank");
		}
		if (num == 2) {
			var tmp = document.fams2.fam.value;
			window.open(tmp, "_blank");
		}
	}
</script>
