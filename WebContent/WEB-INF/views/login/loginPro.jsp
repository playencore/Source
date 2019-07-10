<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<h2>로그인 테스트</h2>
<h2>로그인 성공!</h2>
세션(관리자 1, 구매자2, 판매자,3) : ${id}<br>

<h1>${session_name}로 로그인 처리 되었습니다.</h1>
<br><br>

<c:if test="${session_authority == 2}">
<table border="1">
	<tr>
		<td style="width:300" align="center">
			<span>${session_name}</span>님 안녕하세요
		</td>
	</tr>
	<tr>
		<th>
			<input class="inputbutton" type="button" value="로그아웃"
				onclick="location='/login/logout.do'">
		</th>
	</tr>	
</table>

<button onclick="location='review/reviewWrite.do'"> 후기작성하기 </button>
</c:if>

<c:if test="${session_authority != 2}">
<table border="1">
	<tr>
		<td style="width:300" align="center">
			<span>${session_name}</span>님 안녕하세요
		</td>
	</tr>
	<tr>
		<th>
			<input class="inputbutton" type="button" value="로그아웃"
				onclick="location='/login/logout.do'">
		</th>
	</tr>	
</table>

</c:if>
