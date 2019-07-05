<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<!-- material css-->
<link rel = "stylesheet" type = "text/css" href ="/css/materialize.css" />
<!--  -->
<script src = "/js/jquery-3.4.1.js"></script>
<script src = "/js/materialize.js"></script>

  
	<script type="text/javascript">
	//<!--
	function logincheck(){
		if(! loginform.id.value){
			alert("아이디를 입력하세요.");
			loginform.id.focus();
			return false;
		}else if(! loginform.passwd.value){
			alert("비밀번호를 입력하세요.");
			loginform.passwd.focus();
			return false;
		}
	}
	//-->
	</script>
	
	
  <title>차리다 로그인</title>
  
</head>


<body>
<form name="loginform" action="/login/loginPro.do" onsubmit="return logincheck()">
	<div class="section"></div>
	<div class="section"></div>
	<div class="section"></div>
	<div class="row">
		<div class="col s12">
		<div class="col s4"></div>
			<div class="col s4">
				<h4>Cha-Ri-Da</h4>로그인
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col s12">
			<div class="col s4"></div>
			<div class="input-field col s4">
				<input id="id" type="text" class="validate" name="id">
				<label for="id">아이디</label>
			</div>
		</div>	
		<div class="col s12">
			<div class="col s4"></div>
			<div class="input-field col s4">
				<input id="passwd" type="password" class="validate" name="passwd">
				<label for="passwd">비밀번호</label>
			</div>
		</div>
		<div class="col s12">
			<div class="col s4"></div>
			<div class="col s3">
			<a href="#"> 아이디 찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#">비밀번호 찾기</a><br>
			<a href="#">차리다 회원가입</a>
			</div>
			<div class="input-field col s4 ">
				<input type="submit" value="로그인" class="waves-effect waves-light btn">
			</div>
		</div>
		<div class="col s12">
			<div class="col s4"></div>
			<div class="col s3">
			<a href="#"> 네이버 로그인 </a><br>
			<a href="#"> 카카오 로그인 </a>
			</div>
			
		</div>	
	</div>	  
</form>
</body>
</html>