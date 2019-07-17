<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>
	<script type="text/javascript">
	  //<!--
	   $(document).ready(function(){
	    $('.modal').modal();
	  });         
	  //-->
	  </script>
	  
	<!-- 세션검사 -->	  
<%-- 	<h2>구매자 - 작성가능한 목록 페이지입니다.</h2>
	<hr color="gray">
	회원 분류 : ${session_name }<br>
	아이디 : ${session_id }<br>
	세션 코드 : ${session_authority }
	<hr color="gray">
 --%>	
	
<div class="section"></div>

<div class="container" style="background-color: white;margin-top:2px;">	
	<div class="row">
		<div class="col m12">
			<div class="section">
				<h5>
					${session_name}님의 후기 미작성 된 서비스
					<small id="sub_title"> CHA-RI-DA</small>
					<small style="float: right;"> Food Catering Service</small>
				</h5>
				<div class="divider"></div>
			</div>
		</div>
	</div>	

<c:forEach var="MatchingDto" items="${reviews}">
	<div class="container">
	 <div class="card big">
	    <div class="col s12 m4">
	      <div class="card blue-grey darken-1">
	        <div class="card-content white-text">
	          <center><span class="card-title">후기작성 가능한 서비스</span></center>
	          <hr color="gray"><br>
				<%-- 서비스 진행상태 : ${MatchingDto.progress_code} --%>
				<c:if test="${MatchingDto.progress_code =='00000000' }">
				서비스 진행상태 : 매칭실패<br>
				</c:if>
				신청일 : ${MatchingDto.app_date}
				<hr color="white">
				<!-- #################### 행사형식 start #################### -->
				<c:if test="${MatchingDto.event_type_code == 'SER0000010'}">
					행사형식 : 개인행사 <br>
				</c:if>
				<c:if test="${MatchingDto.event_type_code == 'SER0000020'}">
					행사형식 : 사교모임 <br>
				</c:if>
				<c:if test="${MatchingDto.event_type_code == 'SER0000030'}">
					행사형식 : 리셉션 <br>
				</c:if>
				<c:if test="${MatchingDto.event_type_code == 'SER0000040'}">
					행사형식 : 기업행사 <br>
				</c:if>
				<c:if test="${MatchingDto.event_type_code == 'SER0000050'}">
					행사형식 : 학교행사 <br>
				</c:if>
				<c:if test="${MatchingDto.event_type_code == 'SER0000090'}">
					행사형식 : 기타 <br>
				</c:if>			
				<!-- #################### 행사형식 end #################### -->
				
				
				<!-- #################### 진행형식 start #################### -->
				<c:if test="${MatchingDto.serv_type_code == 'EVT0000010'}">
					진행형식 : 뷔페 <br>
				</c:if>
				<c:if test="${MatchingDto.serv_type_code == 'EVT0000020'}">
					진행형식 : 코스 음식 <br>
				</c:if>
				<c:if test="${MatchingDto.serv_type_code == 'EVT0000030'}">
					진행형식 : 드랍오프 <br>
				</c:if>
				<c:if test="${MatchingDto.serv_type_code == 'EVT0000040'}">
					진행형식 : 도시락 <br>
				</c:if>			
				<!-- #################### 진행형식 end #################### -->
				
				
				<hr color="white">
				
				주소 : (${MatchingDto.zipcode}) ${MatchingDto.address } ${MatchingDto.address_detail}<br>
				<hr color="white">
				요청 고객수 : ${MatchingDto.participant }명<br>
				<hr color="gray">
	        </div>
	        <div class="card-action">
	          <center><a class="waves-effect waves-light btn modal-trigger" href="#modal1">상세보기</a></center>
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


 <!-- Modal Structure -->
<c:forEach var="MatchingDto" items="${reviews}">
  <div id="modal1" class="modal">
    <div class="modal-content">
    
      <center><h5>서비스 상세보기</h5></center>
      <hr color="black">
      		<c:if test="${MatchingDto.progress_code == '00000000' }">
			서비스 진행상태 : 매칭실패<br>
			<hr color="gray">
			</c:if>
			<!-- #################### 행사형식 start #################### -->
			<c:if test="${MatchingDto.event_type_code == 'SER0000010'}">
				행사형식 : 개인행사 <br>
			</c:if>
			<c:if test="${MatchingDto.event_type_code == 'SER0000020'}">
				행사형식 : 사교모임 <br>
			</c:if>
			<c:if test="${MatchingDto.event_type_code == 'SER0000030'}">
				행사형식 : 리셉션 <br>
			</c:if>
			<c:if test="${MatchingDto.event_type_code == 'SER0000040'}">
				행사형식 : 기업행사 <br>
			</c:if>
			<c:if test="${MatchingDto.event_type_code == 'SER0000050'}">
				행사형식 : 학교행사 <br>
			</c:if>
			<c:if test="${MatchingDto.event_type_code == 'SER0000090'}">
				행사형식 : 기타 <br>
			</c:if>			
			<!-- #################### 행사형식 end #################### -->
			
			
			<!-- #################### 진행형식 start #################### -->
			<c:if test="${MatchingDto.serv_type_code == 'EVT0000010'}">
				진행형식 : 뷔페 <br>
			</c:if>
			<c:if test="${MatchingDto.serv_type_code == 'EVT0000020'}">
				진행형식 : 코스 음식 <br>
			</c:if>
			<c:if test="${MatchingDto.serv_type_code == 'EVT0000030'}">
				진행형식 : 드랍오프 <br>
			</c:if>
			<c:if test="${MatchingDto.serv_type_code == 'EVT0000040'}">
				진행형식 : 도시락 <br>
			</c:if>			
			<!-- #################### 진행형식 end #################### -->
			
			
			<!-- #################### DESSERT_YN start #################### -->
			<c:if test="${MatchingDto.dessert_yn =='Y'}">
				후식 선택 여부 : 선택함<br>
			</c:if>
			<c:if test="${MatchingDto.dessert_yn =='N'}">
				후식 선택 여부 : 선택안함<br>
			</c:if>
			<!-- #################### DESSERT_YN end #################### -->
			
			
			<!-- #################### INTERIOR_YN start #################### -->	
			<c:if test="${MatchingDto.interior_yn =='Y'}">
				실내 여부 : 실내<br>
			</c:if>	
			<c:if test="${MatchingDto.interior_yn =='N'}">
				실내 여부 : 야외<br>
			</c:if>		
			<!-- #################### INTERIOR_YN end #################### -->
			
			
			<!-- #################### COOKING_YN start #################### -->
			<c:if test="${MatchingDto.cooking_yn =='Y'}">
				취사 여부 : 취사 가능<br>
			</c:if>
			<c:if test="${MatchingDto.cooking_yn =='N'}">
				취사 여부 : 취사 불가능<br>
			</c:if>
			<!-- #################### COOKING_YN end #################### -->
			
			
			<!-- #################### DISCHARGE_YN start #################### -->
			<c:if test="${MatchingDto.discharge_yn=='Y'}">
				쓰레기 배출 여부 : 배출 가능<br>
			</c:if>
			<c:if test="${MatchingDto.discharge_yn=='N'}">
				쓰레기 배출 여부 : 배출 불가능<br>
			</c:if>
			<!-- #################### DISCHARGE_YN end #################### -->
			
			
			<!-- #################### ELEVATOR_YN start #################### -->
			<c:if test="${MatchingDto.elevator_yn=='Y'}">
				엘레베이터 여부 : 엘레베이터 있음<br>
			</c:if>
			<c:if test="${MatchingDto.elevator_yn=='N'}">
				엘레베이터 여부 : 엘레베이터 없음<br>
			</c:if>
			<!-- #################### ELEVATOR_YN end #################### -->
			
			
			<!-- #################### PARKING_YN start #################### -->
			<c:if test="${MatchingDto.parking_yn=='Y'}">
				주차 여부 : 주차 가능<br>
			</c:if>
			<c:if test="${MatchingDto.parking_yn=='N'}">
				주차 여부 : 주차 불가능<br>
			</c:if>
			<!-- #################### PARKING_YN end #################### -->
			
			
			<!-- #################### TABLEWARE_YN start #################### -->
			<c:if test="${MatchingDto.tableware_yn =='Y'}">
				추가 식기 신청 여부 : 신청함<br>
			</c:if>
			<c:if test="${MatchingDto.tableware_yn =='N'}">
				추가 식기 신청 여부 : 신청 안함<br>
			</c:if>
			<!-- #################### TABLEWARE_YN end #################### -->
			
			
			<!-- #################### COORDINATOR_YN start #################### -->
			<c:if test="${MatchingDto.coordinator_yn=='Y'}">
				코디네이터 신청 여부 : 코디네이터 신청함<br>
			</c:if>
			<c:if test="${MatchingDto.coordinator_yn=='N'}">
				코디네이터 신청 여부 : 코디네이터 신청 안함<br>
			</c:if>
			<!-- #################### COORDINATOR_YN end #################### -->
			
			
			<!-- #################### OTHER_ORDER_YN start #################### -->
			<c:if test="${MatchingDto.other_order_yn=='Y'}">
				기타 주문 여부 : 주문함<br>
			</c:if>
			<c:if test="${MatchingDto.other_order_yn=='N'}">
				기타 주문 여부 : 주문 안함<br>
			</c:if>
			<!-- #################### OTHER_ORDER_YN end #################### -->
			
			
			<hr color="gray">
			주소 : (${MatchingDto.zipcode}) ${MatchingDto.address } ${MatchingDto.address_detail}<br>
			<hr color="gray">
			요청 고객수 : ${MatchingDto.participant }명<br>
			<hr color="gray">
			최소 연령대 : ${MatchingDto.age_min }대<br>
			최대 연령대 : ${MatchingDto.age_max }대<br>
			<hr color="gray">
			남성 비율 : ${MatchingDto.per_men }%<br>
			여성 비율 : ${100 - MatchingDto.per_men }%<br>
			
		<hr color="black">
    </div>
    <div class="modal-footer">
		<a href="/review/reviewWrite.do?serv_id=${MatchingDto.serv_id}">후기작성하기</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<!-- <a href="/customer/matchingFail.do">닫기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
    </div>
  </div>  
</c:forEach>

    <%@include file="/include/footer.jsp" %>

</body>
</html>