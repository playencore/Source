<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					form.action = "/join/join-basic.do";
					form.type.value = "1";
				}else{
					form.action = "/join/join-basic.do";			 
					form.type.value = "2";
				}
				form.submit();
			}
		//-->
		</script>
	</head>
	<body>
		<jsp:include page="join-basic.jsp" flush="false"/>
		<c:if test="${param.membertype ==1}">
			<input type="submit" value="가입">
		</c:if>
		<c:if test="${param.membertype ==2}">
			<jsp:include page="join-detail.jsp" flush="false"/>
			<input type="submit" value="가입">
		</c:if>
	</body>
</html>