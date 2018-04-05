<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<p align="center">로그인실패</p>
<br/>
<br/>
<br/>

	<div id="content" align="center">
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
						&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
		<a href = "/account/login">로그인</a> / <a href = "/account/createView">회원가입</a> 
					</p>
				</form>
			</div>
		</div>
	</div>




</div>