<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/js/jquery.js"></script>
<script type="text/javascript">
	// <!--
	
	
	//페이지 로드가 끝난 후에 실행하는 구역
	$(function(){
		var jointype = $("#jointypeid").val();
		alert( "jointype : " + jointype );
		//기본정보를 입력후 확인을 누르면 페이지 이동
		$("#tableok").click(function(){
			var form = document.dForm; 
		    if(jointype == "1" ){
		    	alert("구매자 회원가입을 시도합니다.");
				form.action = "/join/join-end.do";
		    }
		    else if( jointype == "2" ){
		        alert("판매자 회원가입을 시도합니다.");
				form.action = "/join/join-end.do";
		    }
		}); 
		
	});
	
	//id 중복확인(중복이면 0, 중복이 아니면 1))
	var idcheck = function(){
		var params = "id=" + $('input[name=id]').val();
		$.ajax({
		    type : "post",
		    url : "/join/join-basic.do",
		    data : params,
		    error : function(data){
		      	  console.log(data);
		    	},
		    success : function(data){
		     		//alert(data);
		    		alert(data);
		    	}     
		});
	 }
	//-->
</script>

<title> 회원가입(기본정보)</title>
</head>
<body>
	<h2 id="usertypeid">의 </h2>
	<h2> 회원가입(기본정보) </h2>
	<form name="dForm" action="" method="post">
		<table border="1">
		
<!-- MEM_ID		VARCHAR2(20)	No	-	1 -->
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td><input type="button" id="idcheck" value="아이디중복확인" onclick="idcheck()"></td>
				<td>아이디중복여부 출력</td>
			</tr>
<!-- PASSWD		VARCHAR2(20)	No	-	- -->
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="passwd"></td>
			</tr>
			<tr>
				<th>비밀번호확인</th>
				<td><input type="password" id="passwd"></td>
			</tr>
<!-- NAME		VARCHAR2(20)	No	-	- -->
			<tr>
				<th>이름</th>
				<td><input type="text" id="name"></td>
			</tr>
<!-- EMAIL		VARCHAR2(30)	No	-	- -->
			<tr>
				<th>본인확인이메일</th>
				<td><input type="text" id="email"></td>
			</tr>
			<tr>
				<th><input type="button" id="emailcheck" value="인증번호발송"></td>
				<td>이메일확인여부 출력</td>
			</tr>
			<tr>
				<th>이메일인증번호</th>
				<td><input type="text" id="emailcode"></td>
			</tr>
			<tr>
				<th><input type="button" id="emailcodecheck" value="인증번호확인"></td>
				<td>인증번호확인여부 출력</td>
			</tr>
<!-- ZIPCODE	VARCHAR2(6)		No	-	- -->
			<tr>
				<th>우편번호</th>
				<td><input type="text" id="zipcode"></td>
			</tr>
<!-- TEL		VARCHAR2(13)	No	-	- -->
			<tr>
				<th>연락처</th>
				<td><input type="text" id="tel"></td>
			</tr>
<!-- BIRTH_DATE	VARCHAR2(8)		No	-	- -->
			<tr>
				<th>생년월일</th>
				<td><input type="text" id="birthdate"></td>
			</tr>
<!-- ADDRESS	VARCHAR2(30)	No	-	- -->
			<tr>
				<th>기본주소</th>
				<td><input type="text" id="address"></td>
			</tr>
<!-- ADDRESS_DETAIL	VARCHAR2(40)	No	-	- -->
			<tr>
				<th>상세주소</th>
				<td><input type="text" id="addressdetail"></td>
			</tr>
<!-- GENDER		VARCHAR2(1)		Yes	-	- -->
			<tr>
				<th>성별</th>
				<td><input type="text" id="gender"></td>
			</tr>
<!-- JOB		VARCHAR2(20)	Yes	-	- -->
			<tr>
				<th>직업</th>
				<td><input type="text" id="job"></td>
			</tr>
<!-- AUTHORITY	CHAR(1)			No	-	- -->
			<tr>
				<th>권한</th>
				<td><input type="hidden" id="authority"></td>
			</tr>
<!-- JOIN_DATE	DATE			No	-	- -->
			<tr>
				<th colspan="2"><input type="submit" id="tableok" value="확인"></th>
			</tr>
		</table>
		<input type="hidden" id="jointypeid" name="type" value="${param.type}">
	</form>
</body>
</html>