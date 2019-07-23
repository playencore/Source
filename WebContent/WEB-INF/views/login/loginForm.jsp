<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/include/header.jsp" %>

<form name="loginform" onsubmit="loginCheck()" action="/login/loginCheck.do">
  <script type="text/javascript">
  //<!--
 	<c:if test="${test == 0 }">
		alert("아이디가 존재하지 않습니다. 회원가입 후 이용해 주시기 바랍니다.");
	</c:if>
	<c:if test="${test == -1 }">
	alert("비밀번호가 일치하지 않습니다.");
	</c:if>
	<c:if test="${test == 2 }">
	alert("판매자 승인대기상태입니다.");
	</c:if>
 	<c:if test="${param.kakao == 0 }">
	alert("카카오 아이디가 존재하지 않습니다. 회원가입 후 이용해 주시기 바랍니다.");
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
<div class="section"></div>
<div class="container" style="background-color: white;margin-top:2px;">	
	<div class="row">
		<div class="col m12">
			<div class="section">
				<h5>
					로그인
					<small id="sub_title"> CHA-RI-DA</small>
					<small style="float: right;"> Food Catering Service</small>
				</h5>
				<div class="divider"></div>
			</div>
		</div>
	</div>	

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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
			<a href="/member/findid.do"> 아이디 찾기</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="/member/findmemberpassowrd.do">비밀번호 찾기</a><br>
			<a href="/joinuser/joinmember.do">구매자 회원가입</a>
			<br>
			<a href="/joinuser/joinsupplier.do">판매자 회원가입</a>
			</div>
			<div class="container">
				<button class="btn waves-effect waves-light" type="submit"  >
			    <i class="material-icons left"></i>로그인
			  	</button>
			</div>			
		</div>	
		
		<%-- <div class="col s12">
			<div class="col s4"></div>
			<a href="${naver_url}">네이버 로그인</a>
		</div> --%>
		
		<!-- 카카오 로그인 -->
		<div class="col s12">
			<div class="col s4"></div>
			<a href="#" onclick="kakaoLogin()">
			<img alt="카카오로그인" src="/images/kakaologo.png">
			</a>
		    <script type='text/javascript'>
		      //<![CDATA[
	    	  Kakao.init('fa5cfc74b99a2f2f4274e1a57ab18e6e');
	    	  function kakaoLogin(){
	        Kakao.Auth.loginForm({
	          success: function(authObj) {
	            //alert(JSON.stringify(authObj));
	            Kakao.API.request({
	                url: '/v2/user/me',
	                success: function(res) {
	                  //alert(JSON.stringify(res));
	                  //alert(res.id);	
					kakao(res.id);
	                },
	                fail: function(error) {
	                  alert(JSON.stringify(error));
	                }
	              });
	          },
	          fail: function(err) {
	             alert(JSON.stringify(err));
	          }
	        });	   
	      }
	    	  function kakao(id){
             	 $.ajax({
               	    
               	    type : "post",
               	    url : "/login/kakaoLogin.do",
               	  	data:{kakao_key:id},
               	    error : function(data){
               	        //alert('아이디값 전송 : ' + res.id);
               	        console.log(data);
               	    },
               	    success : function(data){
               	     	//alert(data);
               	    	//alert(data);
               	    	window.location.href=data;
               	    }     
               	}); 
	    	  }
	      //]]>
		    </script>
		</div>
	</div>	
	<div class="section"></div>
	
	</div>

</form>
<form name="kakaoform">
	<input type="hidden" name="kakao_key">
</form>
<div class="section"></div>
<%@include file="/include/footer.jsp" %>
</body>


</html>