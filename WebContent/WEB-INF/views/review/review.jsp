<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>

<<script type="text/javascript">
//<!--
$(document).ready(function(){
	    $("#searchCategory").formSelect();
	    $("#searchstart").on(
				"click",
				function(event){
					searchReview();
				}); //
	});
	
function searchReview(){
	var searchCategory = $("#searchCategory").val() ;
	var searchContent = $("#searchcontent").val() ;
	if(contentvalidataion(searchCategory,searchContent) != 1){
		$.ajax(
				{
					type : "POST",
					url: "/review/serchreview.do",
					data : 
					{
						"searchCategory":searchCategory, 
						"searchContent":searchContent,
					},
					dataType:"json",
					success:function(data){
						showlist(data);
						setModal(data);
					},
					error: function(data){
						alert("검색에 실패 했습니다. 다시 시도해주세요") ;
					}
				}		
			);
	}	
}
function contentvalidataion(category, content){
	if(category == 'MENU_SCORE' || category == 'PRICE_SCORE' || category == 'SERV_SCORE' ){
		if( isNaN(content) == true ){
			alert("스코어 검색은 숫자만 입력 가능합니다.")
			return 1 ;
		}else if( content > 6 || content < 0 || content=='' ){
			alert("스코어 검색은 0~5점 사이만 가능합니다.")
			return 1 ;
		}
	}
}


//-->
</script>

	<!-- 세션검사 -->
<%-- 	<h2>후기보기 페이지입니다.</h2>
	<hr color="gray">
	회원 분류 : ${session_name}<br>
	아이디 : ${session_id}<br>
	세션 코드 : ${session_authority}
	<hr color="gray">
	${reviews}<br><br>
 --%>	
	 
<div class="container" style="background-color: white;margin-top:2px;">	
	<%-- 서비스 후기 알려줌 --%>
	<div class="row">
		<div class="col m12">
			<div class="section">
				<h5>
					서비스 후기
					<small id="sub_title"> CHA-RI-DA</small>
					<small style="float: right;"> Food Catering Service</small>
				</h5>
				<div class="divider"></div>
			</div>
		</div>
	</div>
	<%-- 여기서 부터 입력 searchreview에 append --%>
	<!--
	<div class = "row">
		<div class = "col m12" >
			<div class = "col m2"></div>
			<div class = "col m10">
			<p style = "padding-left:10px">후기 조회</p>
				<div class = "col m3" style = "padding-top:15px">
					<select id = "searchCategory">
						<option value="" disabled selected>검색 카테고리 선택</option>
						<option value="NAME">업체 이름</option>
						<option value="TITLE">후기 제목</option>
						<option value="CONTENT">후기 내용</option>
						<option value="MENU_SCORE">음식만족도 별점</option>
						<option value="PRICE_SCORE">가격 만족도</option>
						<option value="SERV_SCORE">서비스 만족도</option>
					</select>
					<label>검색 카테고리</label>
				</div>
				<div class="input-field col m6">
					<i class="material-icons prefix">search</i>
					<input id="searchcontent" type="text" class="">
					<label for="icon_prefix">검색내용 작성</label>
				</div>
				<div class = "col s3" style = "padding-top:15px" >
					<a id="searchstart" class="waves-effect waves-light btn">검색</a>
				</div>
			</div>
			<div class = "col m2"></div>
		</div>
	</div>
	-->
	<%-- defalut 여기에 --%>
	<div class = "row">
		<div class= "col m12" id = "searchreview" >
			<c:forEach var="ReviewDto" items="${reviews}">
				<div class="container" >
				 <div class="card big">
				    <div class="col s12 m12">
				      <div class="card blue-grey darken-1">
				        <div class="card-content white-text">
				          <center><span class="card-title">서비스 후기</span></center>
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
				        <!-- <div class="card-action">
				          <center><a class="waves-effect waves-light btn modal-trigger" href="#modal1">상세보기</a></center>
				        </div> -->
				      </div>
				    </div>
				  </div>
				</div>	
			</c:forEach>
		</div>
	</div>
	
<%-- 콘테이너 --%>
</div>
    <%@include file="/include/footer.jsp" %>

</body>
</html>