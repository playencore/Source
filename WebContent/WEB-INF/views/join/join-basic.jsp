<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/js/jquery-3.4.1.js"></script>
<script src="/js/join/join-basic.js?version=0.03"></script>

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
				<td><input type="text" name="memid"></td>
				<td><span name="idcomment"></span></td>
			</tr>
<!-- PASSWD		VARCHAR2(20)	No	-	- -->
			<tr>
				<th>비밀번호 (passwd)</th>
				<td><input type="password" name="passwd" id="passwd"></td>
				<td><span name="passwdcomment"></span></td>
			</tr>
			<tr>
				<th>비밀번호확인 (repasswd)</th>
				<td><input type="password" name="repasswd"></td>
				<td><span name="repasswdcomment"></span></td>
			</tr>
<!-- NAME		VARCHAR2(20)	No	-	- -->
			<tr>
				<th>이름 (name)</th>
				<td><input type="text" name="name"></td>
			</tr>
<!-- EMAIL		VARCHAR2(30)	No	-	- -->
			<tr>
				<th>본인확인이메일 (email)</th>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<th><input type="button" name="emailcheck" value="인증번호발송">(emailcheckcomment)</th>
				<td><span name="emailcheckcomment">이메일확인여부 출력</span></td>
			</tr>
			<tr>
				<th>이메일인증번호 (emailcode)</th>
				<td><input type="text" name="emailcode"></td>
			</tr>
			<tr>
				<th><input type="button" name="codecheck" value="인증번호확인">(codecheckcomment)</th>
				<td><span name="codecheckcomment">인증번호확인여부 출력</span></td>
			</tr>
<!-- ZIPCODE	VARCHAR2(6)		No	-	- -->
			<tr>
				<th>우편번호 (zipcode)</th>
				<td><input type="text" name="zipcode"></td>
			</tr>
<!-- TEL		VARCHAR2(13)	No	-	- -->
			<tr>
				<th>연락처 (tel)</th>
				<td><input type="text" name="tel"></td>
			</tr>
<!-- BIRTH_DATE	VARCHAR2(8)		No	-	- -->
			<tr>
				<th>생년월일 (birthdate)</th>
				<td><input type="text" name="birthdate"></td>
			</tr>
<!-- ADDRESS	VARCHAR2(30)	No	-	- -->
			<tr>
				<th>기본주소 (address)</th>
				<td><input type="text" name="address"></td>
			</tr>
<!-- ADDRESS_DETAIL	VARCHAR2(40)	No	-	- -->
			<tr>
				<th>상세주소 (addressdetail)</th>
				<td><input type="text" name="addressdetail"></td>
			</tr>
<!-- GENDER		VARCHAR2(1)		Yes	-	- -->
			<tr>
				<th>성별 (gender)</th>
				<td><input type="text" name="gender"></td>
			</tr>
<!-- JOB		VARCHAR2(20)	Yes	-	- -->
			<tr>
				<th>직업 (job)</th>
				<td><input type="text" name="job"></td>
			</tr>
<!-- AUTHORITY	CHAR(1)			No	-	- -->
			<tr>
				<th>권한 (authority)</th>
				<td><input type="hidden" name="authority"></td>
			</tr>
<!-- JOIN_DATE	DATE			No	-	- -->
			<tr>
				<th colspan="2"><input type="button" name="tableok" value="확인" onclick="ontableok()"></th>
			</tr>
		</table>
		<%-- <input type="hidden" id="jointypeid" name="type" value="${param.type}"> --%>
		<input type="hidden" id="jointypeid" name="type" value="1">
		<input type="hidden" name="passstate" value="0">
	</form>
</body>
</html>
