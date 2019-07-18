<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>

<div class="container" style="margin-top:30px;margin-bottom: 30px" >
	<div class="row">
		<div class="col m2"></div>
		<div class="col m8" style="background-color: white;">
			<div class="card">
		        <div class="card-image">
		          <img src="/images/serv/result.jpg">
		          <span class="card-title">차리다</span>
		        </div>
		        <div class="card-content">
		          
		          <p>신청번호로 신청이 완료되었습니다. 판매자 매칭은 최대 하루까지 소요될 수 있습니다.<br><br> 신청번호 : ${appId }</p>
		        </div>
		        <div class="card-action">
		          <a href="/service/cus-app-list.do">신청내역 보기</a>
		        </div>
		      </div>
		</div>
	</div>
</div>
<%@include file="/include/footer.jsp" %>
</body>
</html>