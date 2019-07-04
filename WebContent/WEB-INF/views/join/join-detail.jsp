<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입(상세정보)</title>
</head>
<body>
	<h2> 회원가입(상세정보:판매자) </h2>
	<form>
		<table border="1">
<!-- REGIST_NUM	NUMBER(7,0)	No	-	- -->
			<tr>
				<th>사업자등록번호</th>
				<td><input type="text" id="registnum"></td>
			</tr>
<!-- EXPLANATION	VARCHAR2(400)	Yes	-	- -->
			<tr>
				<th>업체설명</th>
				<td><input type="text" id="explanation"></td>
			</tr>
<!-- NAME	VARCHAR2(50)	No	-	- -->
			<tr>
				<th>업체명</th>
				<td><input type="text" id="name"></td>
			</tr>
<!-- MAXIMUM_SEATING	NUMBER(4,0)	No	-	- -->
			<tr>
				<th>수용가능인원</th>
				<td><input type="text" id="maximumseating"></td>
			</tr>
<!-- CERT_FILE_ID	NUMBER(10,0)	No	-	- -->
			<tr>
				<th>사업자등록증 이미지 </th>
				<td><input type="text" id="certfileid"></td>
			</tr>
<!-- TELEGRAM_ID	VARCHAR2(30)	Yes	-	- -->
			<tr>
				<th>텔레그램아이디</th>
				<td><input type="text" id="name"></td>
			</tr>
<!-- MEM_ID	VARCHAR2(20)	No	-	1 -->
		</table>
	</form>
</body>
</html>