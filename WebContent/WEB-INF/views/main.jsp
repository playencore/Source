<%@page import="com.charida.app.component.pagination.PaginationInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" uri="http://charida.com/paging/ui" %>
<%@include file="/include/header.jsp" %>
<%
int pageNo = 1;
if(request.getParameter("pageNo") !=null){
	pageNo = Integer.parseInt(request.getParameter("pageNo"));
}
 PaginationInfo pp = new PaginationInfo();
pp.setCurrentPageNo(pageNo);
pp.setTotalRecordCount(213);
System.out.println(pp.getFirstRecordIndex());
System.out.println(pp.getLastRecordIndex());
%>
메인입니다.asdsd
<script type="text/javascript">
function movePage(pageNo){
	document.dForm.pageNo.value = pageNo;
	document.dForm.submit();
}
</script>
<form name="dForm">
	<input type="hidden" name="pageNo" value="${param.pageNo }">
</form>
<ui:pagination paginationInfo = "<%=pp %>" jsFunction="movePage"/>
<%@include file="/include/footer.jsp" %>