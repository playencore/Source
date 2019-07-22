<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
//<!--
	window.opener.printResult('${approveInfo.code }','${approveInfo.amount }','${approveInfo.approved_at }');
	self.close();
//-->
</script>