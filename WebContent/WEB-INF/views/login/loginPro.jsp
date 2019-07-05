<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>로그인 테스트</h2>
<h2>로그인 성공!</h2>
세션(관리자 1, 구매자2, 판매자,3) : ${id}<br>

<h1>${name}로 로그인 처리 되었습니다.</h1>
<br><br>


<table border="1">
	<tr>
		<td style="width:300" align="center">
			<span>${name}</span>님 안녕하세요
		</td>
	</tr>
	<tr>
		<th>
			<input class="inputbutton" type="button" value="로그아웃"
				onclick="location='/login/logout.do'">
		</th>
	</tr>
</table>
