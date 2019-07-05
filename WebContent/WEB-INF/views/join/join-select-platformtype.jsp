<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>join-select-platformtype</title>
		<script src="/js/jquery.js"></script>
		<script type="text/javascript">
		//<!--
			function plattypeselect(flag){
				var form = document.dForm; 
				if(!flag) return;
				if(flag == 1){
					form.action = "/join/join-select-membertype.do";
					form.platformtype.value = "1";
				}else{
					form.action = "/join/join-error.do";
				}
				form.submit();
			}
		//-->
		</script>
	</head>
	<body>
		<h4> 회원가입 플렛폼 선택 </h4>
		<form action="" name="dForm" method="post">
			<input type="button" id="normal" value="일반회원가입(normal)" onclick="plattypeselect(1)">
			<input type="button" id="kakao" value="카카오회원가입(kakao)" onclick="">
			<input type="button" id="naver" value="네이버회원가입(naver)" onclick="">
			<input type="hidden" name="platformtype" value="">
		</form>
	</body>
</html>