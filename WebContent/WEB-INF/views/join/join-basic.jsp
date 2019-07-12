<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/js/jquery-3.4.1.js"></script>
<script src="/js/join/join-basic.js?version=0.03"></script>
<script src="/js/mail/sendmail.js?version=0.01"></script>

<title> 회원가입(기본정보)</title>
</head>
<body>
	<h2 id="usertypeid"> </h2>
	<h2> 회원가입(기본정보) </h2>
	<form name="dForm" action="" method="post">
		<table border="1">
		
<!-- MEM_ID		VARCHAR2(20)	No	-	1 -->
			<tr>
				<th>아이디 (memid)</th>
				<td><input type="text" name="memid" placeholder="6자 영문  소문자, 숫자 조합"></td>
				<td><span name="memidcomment"></span></td>
			</tr>
<!-- PASSWD		VARCHAR2(20)	No	-	- -->
			<tr>
				<th>비밀번호 (passwd)</th>
				<td><input type="password" name="passwd" placeholder="4자 이상 입력하세요."></td>
				<td><span name="passwdcomment"></span></td>
			</tr>
			<tr>
				<th>비밀번호확인 (repasswd)</th>
				<td><input type="password" name="repasswd" placeholder="비밀번호를 한번더 입력하세요."></td>
				<td><span name="repasswdcomment"></span></td>
			</tr>
<!-- NAME		VARCHAR2(20)	No	-	- -->
			<tr>
				<th>이름 (name)</th>
				<td><input type="text" name="name"></td>
				<td><span name="namecomment"></span></td>
			</tr>
<!-- EMAIL		VARCHAR2(30)	No	-	- -->
			<tr>
	<!-- 인증번호 받을 이메일 적는 곳 -->
				<th>본인확인이메일 (email)</th>
				<td><input type="text" name="email"></td>
				<td><span name="emailcomment"></span></td>
			</tr>
			<tr>
	<!-- 인증번호 발송 버튼 -->
				<th><input type="button" name="emailcheck" value="인증번호발송" onclick="sendemail();">(emailcheckcomment)</th>
	<!-- 인증발송 결과 출력 -->
				<td><span name="emailcheckcomment" value="이메일확인여부 출력"></span></td>
			</tr>
			<tr>
				<th>이메일인증번호 (emailcode)</th>
				<td><input type="text" name="emailcode"></td>
				<td><span name="emailcodecomment"></span></td>
			</tr>
			<tr>
	<!-- 인증번호 확인 버튼 -->
				<th><input type="button" name="codecheck" value="인증번호확인" onclick="codecompare();">(codecheckcomment)</th>
				<td><input name="codecheckcomment" value="인증번호확인여부 출력" disabled></td>
			</tr>
<!-- ZIPCODE	VARCHAR2(6)		No	-	- -->
			<tr>
				<th>우편번호 (zipcode)</th>
				<td><input type="text" name="zipcode"></td>
				<td><span name="zipcodecomment"></span></td>
			</tr>
<!-- TEL		VARCHAR2(13)	No	-	- -->
			<tr>
				<th>연락처 (tel)</th>
				<td><input type="text" name="tel"></td>
				<td><span name="telcomment"></span></td>
			</tr>
<!-- BIRTH_DATE	VARCHAR2(8)		No	-	- -->
			<tr>
				<th>생년월일 (birthdate)</th>
				<td><input type="text" name="birthdate"></td>
				<td><span name="birthdatecomment"></span></td>
			</tr>
<!-- ADDRESS	VARCHAR2(30)	No	-	- -->
			<tr>
				<th>기본주소 (address)</th>
				<td><input type="text" name="address"></td>
				<td><span name="addresscomment"></span></td>
			</tr>
<!-- ADDRESS_DETAIL	VARCHAR2(40)	No	-	- -->
			<tr>
				<th>상세주소 (addressdetail)</th>
				<td><input type="text" name="addressdetail"></td>
				<td><span name="addressdetailcomment"></span></td>
			</tr>
<!-- GENDER		VARCHAR2(1)		Yes	-	- -->
			<tr>
				<th>성별 (gender)</th>
				<td><input type="text" name="gender"></td>
				<td><span name="gendercomment"></span></td>
			</tr>
<!-- JOB		VARCHAR2(20)	Yes	-	- -->
			<tr>
				<th>직업 (job)</th>
				<td><input type="text" name="job"></td>
				<td><span name="jobcomment"></span></td>
			</tr>
<!-- AUTHORITY	CHAR(1)			No	-	- -->
			<tr>
				<th>권한 (authority)</th>
				<td><input type="hidden" name="authority"></td>
				<td><span name="authoritycomment"></span></td>
			</tr>
<!-- JOIN_DATE	DATE			No	-	- -->
			<tr>
				<th colspan="2"><input type="button" name="tableok" value="확인"></th>
			</tr>
		</table>
		<%-- <input type="hidden" id="jointypeid" name="type" value="${param.type}"> --%>
		<input type="hidden" id="jointypeid" name="type" value="1">
		<input type="hidden" name="passstate" value="0">
		<input type="hidden" name="code" value="">
	</form>
</body>
</html>
