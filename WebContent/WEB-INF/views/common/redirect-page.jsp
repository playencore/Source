<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form method="post" action="${url}" name="redirectForm">
<input type="hidden" name="msg" value="${msg}">
</form>
<script type="text/javascript">
<!--
document.redirectForm.submit();
//-->
</script>