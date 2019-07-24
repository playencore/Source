<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>

	<!-- 세션검사 -->
<%-- 	<h2>해당 구매자가 등록한 후기보기 페이지입니다.</h2>
	<hr color="gray">
	회원 분류 : ${session_name}<br>
	아이디 : ${session_id}<br>
	세션 코드 : ${session_authority}
	<hr color="gray">
	${reviews}<br><br>
 --%>	
	
	<script type="text/javascript">
	//<!--
	<c:if test="${check == 0}">
		alert("게시물 삭제에 실패했습니다. 잠시후 다시 시도해주세요.");
		window.location.replace();
	</c:if>	
	<c:if test="${check == 1}">
		alert("해당 게시글이 삭제되었습니다.");		
	</c:if>
	<c:if test="${modify == 0}">
		alert("게시물 수정에 실패했습니다. 잠시후 다시 시도해주세요.");
		window.location.replace();
	</c:if>	
	<c:if test="${modify == 1}">
		alert("해당 게시글이 수정되었습니다.");
		window.location.replace();
	</c:if>
	 $(document).ready(function(){
			activeItem('마이 페이지');
			showExtendedMenu('#nav_mypage');
			activeSubItem('작성한 후기',0);
	  });
	//-->
	</script>
<div class="section"></div>
<div class="container" style="background-color: white;margin-top:2px;">	
	<div class="row">
		<div class="col m12">
			<div class="section">
				<h5>
					${session_name}님의 후기
					<small id="sub_title"> CHA-RI-DA</small>
					<small style="float: right;"> Food Catering Service</small>
				</h5>
				<div class="divider"></div>
			</div>
		</div>
	</div>	
	
	<c:forEach var="ReviewDto" items="${reviews}">
	
	<div class="container">
	 <div class="card big">
	    <div class="col s12 m4">
	      <div class="card blue-grey darken-1">
	        <div class="card-content white-text">
	          <center><span class="card-title">${session_name}님이 작성한 서비스 후기</span></center>
	          <hr color="gray">
				서비스 코드 : ${ReviewDto.serv_id} <br>
				<hr color="white">
				후기 제목 : ${ReviewDto.title} <br>
				<hr color="white">
				후기 내용 : ${ReviewDto.content} <br>
				<hr color="white">				
				서비스 이용경로 : ${ReviewDto.serv_root} <br>
				<hr color="white">
				
				<%-- 음식 만족도 : ${ReviewDto.menu_score } 점 <br> --%>
				<c:if test="${ReviewDto.menu_score eq 0}">
				음식 만족도 : ☆☆☆☆☆ <br>
				</c:if>
				<c:if test="${ReviewDto.menu_score eq 1}">
				음식 만족도 : ★☆☆☆☆ <br>
				</c:if>
				<c:if test="${ReviewDto.menu_score eq 2}">
				음식 만족도 : ★★☆☆☆ <br>
				</c:if>
				<c:if test="${ReviewDto.menu_score eq 3}">
				음식 만족도 : ★★★☆☆ <br>
				</c:if>
				<c:if test="${ReviewDto.menu_score eq 4}">
				음식 만족도 : ★★★★☆ <br>
				</c:if>
				<c:if test="${ReviewDto.menu_score eq 5}">
				음식 만족도 : ★★★★★ <br>
				</c:if>
				<%-- 가격 만족도 : ${ReviewDto.price_score } 점 <br> --%>
				<c:if test="${ReviewDto.price_score eq 0}">
				가격 만족도 : ☆☆☆☆☆ <br>
				</c:if>
				<c:if test="${ReviewDto.price_score eq 1}">
				가격 만족도 : ★☆☆☆☆ <br>
				</c:if>
				<c:if test="${ReviewDto.price_score eq 2}">
				가격 만족도 : ★★☆☆☆ <br>
				</c:if>
				<c:if test="${ReviewDto.price_score eq 3}">
				가격 만족도 : ★★★☆☆ <br>
				</c:if>
				<c:if test="${ReviewDto.price_score eq 4}">
				가격 만족도 : ★★★★☆ <br>
				</c:if>
				<c:if test="${ReviewDto.price_score eq 5}">
				가격 만족도 : ★★★★★ <br>
				</c:if>
				
				<%-- 서비스 만족도 : ${ReviewDto.serv_score } 점 <br> --%>
				<c:if test="${ReviewDto.serv_score eq 0}">
				서비스 만족도 : ☆☆☆☆☆ <br>
				</c:if>
				<c:if test="${ReviewDto.serv_score eq 1}">
				서비스 만족도 : ★☆☆☆☆ <br>
				</c:if>
				<c:if test="${ReviewDto.serv_score eq 2}">
				서비스 만족도 : ★★☆☆☆ <br>
				</c:if>
				<c:if test="${ReviewDto.serv_score eq 3}">
				서비스 만족도 : ★★★☆☆ <br>
				</c:if>
				<c:if test="${ReviewDto.serv_score eq 4}">
				서비스 만족도 : ★★★★☆ <br>
				</c:if>
				<c:if test="${ReviewDto.serv_score eq 5}">
				서비스 만족도 : ★★★★★ <br>
				</c:if>
				<hr color="white">
				<%-- 지인 추천 여부 : ${ReviewDto.recommand }	<br> --%>
				<c:if test="${ReviewDto.recommand eq 1}">
				지인 추천 여부 : 지인에게 추천할 의향이 있습니다.
				</c:if>
				<c:if test="${ReviewDto.recommand eq 0}">
				지인 추천 여부 : 지인에게 추천할 의향이 없습니다.
				</c:if>	
				<hr color="white"><br>
				<div class="container">
				<c:forEach var="pictures" items="${ReviewDto.picture}">
				<img src="/file/file-down/${pictures}" width="170">
				</c:forEach> 
				</div>
				<br>
				<hr color="white"><br>
				작성 시간 : ${ReviewDto.review_date } <br>
				
	        </div>
	        <div class="card-action">
	          <center>
	          <a class="waves-effect waves-light btn modal-trigger" 
	          href="/review/modifyReview.do?serv_id=${ReviewDto.serv_id}">수정하기</a>
	          <a class="waves-effect waves-light btn modal-trigger" 
	          href="/review/deleteReview.do?serv_id=${ReviewDto.serv_id}">삭제하기</a>
	          </center>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>			
	</c:forEach>
	<div class="section"></div>
</div>

<div class="section"></div>
<div class="section"></div>


<%@include file="/include/footer.jsp" %>
</body>
</html>