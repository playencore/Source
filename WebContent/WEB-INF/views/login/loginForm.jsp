<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<!-- material css-->
<link rel = "stylesheet" type = "text/css" href ="/css/materialize.css" />
<!--  -->
<script src = "/js/jquery-3.4.1.js"></script>
<script src = "/js/materialize.js"></script>

  <script type="text/javascript">
  //<!--
 	<c:if test="${test == 0 }">
		alert("아이디가 존재하지 않습니다. 회원가입 후 이용해 주시기 바랍니다.");
	</c:if>
	<c:if test="${test == -1 }">
	alert("비밀번호가 일치하지 않습니다.");
	</c:if>
	
  function loginCheck(){
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
			<a href="#"> 아이디 찾기</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#">비밀번호 찾기</a><br>
			<a href="/join/join-start.do">구매자 회원가입</a>
			&nbsp;&nbsp;&nbsp;
			<a href="/joinUser/joinSupplier.do">판매자 회원가입</a>
			</div>
			<div class="input-field col s4 ">
				<input type="submit" value="로그인" class="waves-effect waves-light btn">
			</div>			
		</div>	
		<div class="col s12">
			<div class="col s4"></div>
			<img alt="네이버 로그인" src="/WEB-INF/views/login/kakao.PNG">
		</div>		
		<div class="col s12">
			<div class="col s4"></div>
			<img alt="카카오 로그인" src="/WEB-INF/views/login/kakao.PNG">
		</div>
	</div>	
</body>
</form>
</html>