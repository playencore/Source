<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>join-select-membertype</title>
		<script src="/js/jquery.js"></script>
		<script type="text/javascript">
		//<!--
			function memtypeselect(flag){
				var form = document.dForm; 
				if(!flag) return;
				if( flag == 1){
					//구매자로 회원가입 시작
					form.action = "/join/join-start.do";
					form.membertype.value = "1";
				}else if( flag == 2 ){
					//판매자로 회원가입 시작
					form.action = "/join/join-start.do";
					form.membertype.value = "2";
				}
				form.submit();
			}
		//-->
		</script>
	</head>
	<body>
		<form action="" name="dForm" method="post">
			<h4> 가입할 회원유형 선택 </h4>
			<input type="button" id="cus" value="구매자(cus)" onclick="memtypeselect(1)">
			<input type="button" id="sup" value="판매자(sup)" onclick="memtypeselect(2)">
			<input type="hidden" name="membertype" value="">
		</form>
	</body>
</html>