<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    
    
    
<h2 align="center"> 로그인실패</h2>
<p align="center">아이디 혹은 패스워드 가 틀립니다 <br/>
   재확인후 다시 로그인 바랍니다 </p>

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
							type="password" name="pass" maxlength="12"
							title="비밀번호" class="input required" />
					</p>
					&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;
					<p class="button">
						&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
						<button type="submit" name="cnt">로그인</button> <button type="button"><a href="/account/createView/">회원가입</a></button>
					</p>
					<small>혹시 비밀번호를 잊으셨나요? </small><button type="button"><a href="/account/passfindView">비밀번호찾기</a></button>
					
				</form>
			</div>
		</div>
	</div>




