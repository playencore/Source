<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	// <!--
	
	//페이지 로드가 끝난 후에 실행하는 구역
	/* $(function(){
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
		
	}); */
	
	$(function(){
		// 아이디 입력에서 keyup 이벤트 감지
		$('input[name=memid]').on('keyup', function() {
			alert("keyup 이벤트 감지됨");
			$.ajax({
			    type : "post",					// HTTP 요청 방식(GET, POST)
			    url : "/join/join-basic/checkid.do",	// 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
			    data : {
			    	id:$("input[name=memid]").val()
			    	},								// HTTP 요청과 함께 서버로 보낼 데이터(URL뒤에 붙이는 내용)
			    error : function(result){			
			      	  alert("error: " + result);
			    	},
			    success : function(result){
			     		alert("success : " + result);
			    		if($.trim(result) == 0){
			    			alert("result : 해당 아이디 사용가능");
		                    $('p[name=idcomment]').html('<p style="color:blue">사용가능</p>');
						}else{
			    			alert("result : 해당 아이디 사용불가");
		                    $('p[name=idcomment]').html('<p style="color:red">사용불가능</p>');
		                }
			    		if($.trim(result) == 0){
			    			alert("result : 해당 아이디 사용가능");
		                    $('p[name=idcomment]').html('<p style="color:blue">사용가능</p>');
						}
			    	}     
			});
		});
		
		// 입력값 검사
		var jointype = $("#jointypeid").val();
		alert("jointype : " + jointype);
		var inputmemid = $("input[name=memid]").val();
		alert("inputmemid : " + inputmemid);
		
		// 최종 확인버튼을 클릭했을 경우 실행 되는 부분
		$("#tableok").click(function(){
			alert("확인버튼을 클릭해서 가입가능 여부를 검사합니다.");
			var form = document.dForm; 
			var check = false;
			var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			// 아이디 입력여부 검사
			if( dForm.memid.value == "" ){
				alert("아이디를 입력하지 않았습니다.")
				dForm.memid.focus();
				return false;
			}
			// 아이디 유효성 검사
			for (var i = 0; i < document.dForm.memid.value.length; i++) {
	            ch = document.dForm.memid.value.charAt(i)
	            if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
	                alert("아이디는 영문 대소문자, 숫자만 입력가능합니다.")
	                document.dForm.memid.focus();
	                document.dForm.memid.select();
	                return false;
	            }
	        }
			// 아이디에 공백 사용하지 않기
	        if (document.dForm.memid.value.indexOf(" ") >= 0) {
	            alert("아이디에 공백을 사용할 수 없습니다.")
	            document.dForm.memid.focus();
	            document.dForm.memid.select()
	            return false;
	        }
	        // 아이디 길이 체크 (4~20자)
	        if (document.dForm.memid.value.length<4 || document.dForm.memid.value.length>20) {
	             alert("아이디를 4~20자까지 입력해주세요.")
	             document.dForm.memid.focus();
	             document.dForm.memid.select();
	             return false;
	        }
	      	// 비밀번호 입력여부 체크
	        if (document.dForm.passwd.value == "") {
	            alert("비밀번호를 입력하지 않았습니다.")
	            document.dForm.passwd.focus();
	            return false;
	        }
	      	// 아이디와 비밀번호 동일여부 체크
	        if (dForm.passwd.value == dForm.memid.value) {
	            alert("아이디와 비밀번호가 같습니다.")
	            document.dForm.passwd.focus();
	            return false;
	        }
	        // 비밀번호 길이 체크(4~20자 까지 허용)
	        if (document.dForm.passwd.value.length<4 || document.dForm.passwd.value.length>20) {
	            alert("비밀번호를 4~20자까지 입력해주세요.")
	            document.dForm.passwd.focus();
	            document.dForm.passwd.select();
	            return false;
	        }
	        // 비밀번호와 비밀번호 확인 일치여부 체크
	        if (document.dForm.passwd.value != document.dForm.repasswd.value) {
	            alert("비밀번호가 일치하지 않습니다")
	            document.dForm.repasswd.value = ""
	            document.dForm.repasswd.focus();
	            return false;
	        }
	        // 이메일 입력여부 체크
	        if (document.dForm.email.value == "") {
	            alert("이메일을 입력하지 않았습니다.")
	            document.dForm.email.focus();
	            return false;
	        }
	        if (regex.test(mail) === false) {
	            alert("잘못된 이메일 형식입니다.");
	            document.f.mail.value=""
	            document.f.mail.focus();
	            return false;
	        }
	 
	        
	        
	        for (var i = 0; i < document.f.mail.value.length; i++) {
	            chm = document.f.mail.value.charAt(i)
	            if (!(chm >= '0' && chm <= '9') && !(chm >= 'a' && chm <= 'z')&&!(chm >= 'A' && chm <= 'Z')) {
	                alert("이메일은 영문 대소문자, 숫자만 입력가능합니다.")
	                document.f.mail.focus();
	                document.f.mail.select();
	                return false;
	            }
	        }
	        
	        
	        
			
			
			// 모든 유효성 검사를 통과한 경우에만 회원가입을 진행한다.
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
	//-->
</script>

<title> 회원가입(기본정보)</title>
</head>
<body>
	<h2 id="usertypeid"> </h2>
	<h2> 회원가입(기본정보) </h2>
	<form name="dForm" action="" method="post">
		<table border="1">
		
<!-- MEM_ID		VARCHAR2(20)	No	-	1 -->
			<tr>
				<th>아이디</th>
				<td><input type="text" name="memid"></td>
				<td><p name="idcomment"></p></td>
			</tr>
<!-- PASSWD		VARCHAR2(20)	No	-	- -->
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<th>비밀번호확인</th>
				<td><input type="password" name="repasswd"></td>
			</tr>
<!-- NAME		VARCHAR2(20)	No	-	- -->
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"></td>
			</tr>
<!-- EMAIL		VARCHAR2(30)	No	-	- -->
			<tr>
				<th>본인확인이메일</th>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<th><input type="button" name="emailcheck" value="인증번호발송"></th>
				<td>이메일확인여부 출력</td>
			</tr>
			<tr>
				<th>이메일인증번호</th>
				<td><input type="text" name="emailcode"></td>
			</tr>
			<tr>
				<th><input type="button" name="emailcodecheck" value="인증번호확인"></th>
				<td>인증번호확인여부 출력</td>
			</tr>
<!-- ZIPCODE	VARCHAR2(6)		No	-	- -->
			<tr>
				<th>우편번호</th>
				<td><input type="text" name="zipcode"></td>
			</tr>
<!-- TEL		VARCHAR2(13)	No	-	- -->
			<tr>
				<th>연락처</th>
				<td><input type="text" name="tel"></td>
			</tr>
<!-- BIRTH_DATE	VARCHAR2(8)		No	-	- -->
			<tr>
				<th>생년월일</th>
				<td><input type="text" name="birthdate"></td>
			</tr>
<!-- ADDRESS	VARCHAR2(30)	No	-	- -->
			<tr>
				<th>기본주소</th>
				<td><input type="text" name="address"></td>
			</tr>
<!-- ADDRESS_DETAIL	VARCHAR2(40)	No	-	- -->
			<tr>
				<th>상세주소</th>
				<td><input type="text" name="addressdetail"></td>
			</tr>
<!-- GENDER		VARCHAR2(1)		Yes	-	- -->
			<tr>
				<th>성별</th>
				<td><input type="text" name="gender"></td>
			</tr>
<!-- JOB		VARCHAR2(20)	Yes	-	- -->
			<tr>
				<th>직업</th>
				<td><input type="text" name="job"></td>
			</tr>
<!-- AUTHORITY	CHAR(1)			No	-	- -->
			<tr>
				<th>권한</th>
				<td><input type="hidden" name="authority"></td>
			</tr>
<!-- JOIN_DATE	DATE			No	-	- -->
			<tr>
				<th colspan="2"><input type="button" name="tableok" value="확인" onclick=""></th>
			</tr>
		</table>
		<%-- <input type="hidden" id="jointypeid" name="type" value="${param.type}"> --%>
		<input type="hidden" id="jointypeid" name="type" value="1">
	</form>
</body>
</html>
