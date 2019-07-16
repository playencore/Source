<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//<!--
		if(${result}>0){
			alert("회원가입 성공. 로그인해주세요.");
		}else{
			alert("회원가입에 실패했습니다. 다시 시도해주세요.");
		}
		window.location.replace("/login/loginForm.do");
	//--/
</script>
</head>
<body>
</body>
</html>