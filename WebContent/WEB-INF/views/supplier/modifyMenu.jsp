<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//<!--
		if(${result} == 1){
			alert("정상적으로 수정 되었습니다.");
		}else{
			alert("진행중 오류가 발생 되었습니다. 다시 시도해주세요");
		}
		window.location.replace("/supplier/setfood.do");
	//-->
</script>
</head>
</html>