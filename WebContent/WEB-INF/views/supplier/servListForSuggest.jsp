<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>

<script>
	//<!--

$(document).ready(function(){
	
	setDatePicker() ;
	setModal();
});
	
function setModal(){
	for(var i = 0 ; i<${servlistsize} ; i++){
		$('#servModal'+i).modal();
	}
}
	
function showServeList(list){
	$("#servlist").html("") ;
	var cards = "" ;	
	for(var i = 0 ; i < ${servlistsize} ; i++){
		cards = cards 
		+"<div class='card col s12'>"
		+ "<div class='card-content black-text'>"
		+	"<span class='card-title'>"
		+    ${servlist[i].SERV_ID}
		+     "</span>"
		+	"<p>"
		+		"행사날짜" + ${servlist[i].SERV_DATE} +"<br>"
		+		"행사장소" + ${servlist[i].ADDRESS} + "<br>"
		+		"참여인원수" + ${servlist[i].PARTICIPANT} +"<br>"
		+		"1인당 금액" + ${servlist[i].PER_BUD}+"<br>"
		+	"</p>"
		+"</div>"
		+"<div class='card-action'>"
		+	"<a class = 'waves-effect waves-light modal-trigger' href='#servModal"+i+"' >상세보기</a>"
		+"</div>"
		+"</div>"
		+"<div class = 'modallist'>"
		+"<div id='servModal"+i+"' class='modal'>"
		+	"<div class='modal-content'>"
		+		"<h4>업체 상세보기</h4>"
		+		"<p>"
		+			"서비스 아이디 : "+ ${servlist[i].SERV_ID} +"<br>"
		+			"신청자 아이디 : "+ ${servlist[i].CUSTOMER_ID} +"<br>"
		+			"서비스제공 우편번호: "+ ${servlist[i].ZIPCODE} +"<br>"
		+			"서비스 제공 주소 : " + ${servlist[i].ADDRESS} +"<br>"
		+			"서비스 제공 상세 주소" + ${servlist[i].ADDRESS_DETAIL} +"<br>"
		+		"</p>"
		+	"</div>"
		+	"<div class='modal-footer'>"
		+		"<a href='#!' class='modal-close waves-effect waves-green btn-flat'>창닫기</a>"
		+	"</div>"
		+"</div>"
		+"</div>" ;
	}
	$("#servlist").html(cards);
}

function setDatePicker(){
	var deoption = {
		   minDate:new Date(moment().add(1,'days').format())
		  ,format:'yyyy-mm-dd'
		  ,i18n:{
	  		  cancel:'닫기',
	  		  clear:'초기화',
	  		  done:"확인",
	  		  months:[
	  			  '1 월',
	  			  '2 월',
	  			  '3 월',
	  			  '4 월',
	  			  '5 월',
	  			  '6 월',
	  			  '7 월',
	  			  '8 월',
	  			  '9 월',
	  			  '10 월',
	  			  '11 월',
	  			  '12 월'
	  		  ],
	  		  monthsShort:[
	  			  '1 월',
	  			  '2 월',
	  			  '3 월',
	  			  '4 월',
	  			  '5 월',
	  			  '6 월',
	  			  '7 월',
	  			  '8 월',
	  			  '9 월',
	  			  '10 월',
	  			  '11 월',
	  			  '12 월'
	  		  ],
	  		  weekdaysShort:[
	  			  '일요일',
	  			  '월요일',
	  			  '화요일',
	  			  '수요일',
	  			  '목요일',
	  			  '금요일',
	  			  '토요일'
	  		  ],
	  		  weekdaysAbbrev:['일','월','화','수','목','금','토']
	  	  }
	    } ;
		$('#startdate').datepicker(deoption);
		$("#enddate").datepicker(deoption) ;
		
	  
		//////////////////////////////////////////////////////////////////////////
		$('#startdate').on({change:function(){
			$('#enddate')[0].M_Datepicker.options.minDate = $('#startdate')[0].M_Datepicker.date
		}});
		$('#enddate').on({change:function(){
			$('#enddate')[0].M_Datepicker.options.maxDate = $('#startdate')[0].M_Datepicker.date
		}});
}

	//-->
</script>
<div class = "row ">
	<div class = "col s3">
		<br><br><br><br><br>
		행사 날짜 검색
		 <div class="card">
		 	<div class = "card-content">
				<form method="post" action="" name = "serchdate" onsubmit="">
					<p>검색 시작 날짜를 입력해주세요.</p>
					<input id = "startdate" name = "startdate" type="text" class="datepicker" readonly>
					<p>검색 종료 날짜를 입력해주세요.</p>
					<input id = "enddate" name = "enddate" type="text" class="datepicker" readonly>
				</form>
			</div>
		</div>
	</div>
	<div class = "col s7">
	<br><br><br><br><br>
	<c:if test="${empty servlist}">
		아직 신청이 없습니다.
	</c:if>
	<div id = "servlist">
		<c:if test="${!empty servlist}">
			<c:set var = "count" value = "${0}" />
			<c:forEach var="serv" items="${servlist}" >
				<div class = "col s6">
					<div class="card  ">
						<div class="card-content black-text ">
							<span class="card-title">서비스 아이디 : ${serv.SERV_ID}</span>
							<p>
								서비스 장소 : ${serv.ADDRESS} <br>
								서비스 상세 장소 : ${serv.ADDRESS_DETAIL} <br>
								1인당 금액 : ${serv.PER_BUD} <br>
								참가자수 : ${serv.PARTICIPANT} <br>
							</p>
						</div>
						<div class="card-action">
							<a class = "waves-effect waves-light modal-trigger" href="#servModal${count}" >상세보기</a>
						</div>
					</div>
				</div>
				
				<!-- Modal Structure 상세보기 -->
				<div class = "modallist">
					<div id="servModal${count}" class="modal">
						<div class="modal-content">
							<h4>신청 상세보기</h4>
							<p>
								판매자 이름 : ${serv.SERV_ID} <br>
								판매자 아이디 : ${serv.ZIPCODE} <br>
								판매자 사업자 등록번호 : ${serv.PER_BUD} <br>
							</p>
						</div>
						<div class="modal-footer">
							<a href="#!" class="modal-close waves-effect waves-green btn-flat">창닫기</a>
						</div>
					</div>
				</div>
				<c:set var = "count" value = "${count=count+1}" />
			</c:forEach>
		</c:if>
	</div>
	</div>
</div>
</body>
</html>