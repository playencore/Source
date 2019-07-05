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
  function loginCheck(){
	  if(! loginform.id.value){
		  alert("아이디를 입력하세요.")
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
<form name="loginform" onsubmit="loginCheck()" action="/login/loginCheck.do">
<body>  
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
				<input id="password" type="password" class="validate" name="passwd">
				<label for="password">비밀번호</label>
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
	</div>	  
</body>
</form>

</html>