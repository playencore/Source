<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/js/jquery.js"></script>
<script type="text/javascript">
	// <!--
	$(function(){
		var jointype = $("#jointypeid").val();
		alert( "jointype : " + jointype );
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
 	

 
	//-->
</script>

<title>cus-main 회원가입</title>
</head>
<body>
	
	<form name="dForm" action="" method="post">
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" id="name"></td>
			</tr>
			<tr>
			<th>비밀번호</th>
				<td><input type="password" id="passwd"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" id="tel"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" id="tableok" value="확인"></th>
			</tr>
		</table>
		<input type="hidden" id="jointypeid" name="type" value="${param.type}">
	</form>
</body>
</html>