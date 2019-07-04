<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> join-main</title>
	<script src="/js/jquery.js"></script>
	<script type="text/javascript">
	//<!--
		function test(flag){
		var form = document.dForm; 
		if(!flag) return;
			if(flag== 1){
				form.action = "/join/cus-main.do";
				form.type.value = "1";
			}else{
				form.action = "/join/cus-main.do";			 
				form.type.value = "2";
			}
			form.submit();
		}
	//-->
	</script>
</head>
<body>
	<form action="" name="dForm" method="post">
		<h4> 회원가입 선택 </h4>
		<input type="hidden" name="type">
		<input type="button" id="cus" value="구매자(cus)" onclick="test(1)">
		<input type="button" id="sup" value="판매자(sup)" onclick="test(2)">
	</form>
</body>//////////
</html>