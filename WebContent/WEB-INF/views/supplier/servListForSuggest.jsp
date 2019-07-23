<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>
<style>
	.modal.modal-fixed-footer {
	    padding: 0;
	    height: 80%;
	}
	.modal {
	    display: none;
	    position: fixed;
	    left: 0;
	    right: 0;
	    background-color: #fafafa;
	    padding: 0;
	    max-height: 80%;
	    width: 55%;
	    margin: auto;
	    overflow-y: auto;
	    border-radius: 2px;
	    will-change: top, opacity;
	}
	.pagination li.active {
    background-color: #26a69a;
}
</style>

<script>
	//<!--
var menucountarr = new Array() ;

$(document).ready(function(){
	//구분자
	for(var i = 0 ; i< ${servlistsize} ; i++){
		menucountarr[i] = new Array();
	}
	
	setDatePicker() ;
	setModal();
	 $('select').formSelect();
	 
	
	$("#serchservlist").on(
		"click",
		function(){
			var stdate = $("#startdate").val() ;
			var eddate = $("#enddate").val() ;
			if( stdate!="" && eddate!="" ){
				$.ajax(
						{
							type : "POST",
							url: "/supplier/servlistserch.do",
							data : 
							{
								"stdate":stdate, 
								"eddate":eddate	
							},
							dataType:"json",
							success:function(result){
								alert("검색에 성공했습니다.") ;
								$("#startdate").val('') ;
								$("#enddate").val('') ;
								resetDatePicker()
								showServeList(result);
								searchResultModal(result);
							},
							error: function(data){
								$("#startdate").val('') ;
								$("#enddate").val('') ;
								alert("검색에 실패 했습니다. 다시 시도해주세요") ;
							}
						}		
					);
			}else{
				alert("두개 다 입력하셔야합니다.");
			}
			
		}
	);
		
});
	
function setModal(){
	for(var i = 0 ; i<${servlistsize} ; i++){
		$('#servModal'+i).modal();
		$('#suggestModal'+i).modal({dismissible: false});
	}
}

function searchResultModal(result){
	for(var i = 0 ; i<Object.keys(result.data).length ; i++){
		$('#servlistModal'+i).modal();
		$('#suggestModal'+i).modal({dismissible: false});
	}
}
	
function showServeList(result){
	$("#servlist").html("");
	var menuslist = JSON.stringify(result.menulist);
	var menuss = JSON.parse(menuslist);
	var slist = "" ;
	for(var i = 0 ; i < Object.keys(result.data).length ; i++){
		slist = slist
		+		"<div class = 'col s6'>"
		+			"<div class='card'>"
		+				"<div class='card-content black-text'>"
		+					"<span class='card-title'>서비스 아이디 :"+result.data[i].SERV_ID+"</span>"
		+					"<p>"
		+						"서비스 장소 :"+result.data[i].ADDRESS+"<br>"
		+						"서비스 상세 장소"+result.data[i].ADDRESS_DETAIL+"<br>"
		+						"1인당 금액 :"+result.data[i].PER_BUD+"<br>"
		+						"서비스 제공 일시 :"+result.data[i].APP_DATE+"<br>"
		+					"</p>"
		+				"</div>"
		+				"<div class='card-action'>"
		+					"<a class = 'waves-effect waves-light modal-trigger' href='#servlistModal"+i+"' >상세보기</a>"
		+					"<a id = 'suggestMenu' class = 'waves-effect waves-light modal-trigger' href='#suggestModal"+i+"' >제안하기</a>"
		+				"</div>"
		+			"</div>"
		+		"</div>"
		+		"<div class = 'modallist'>"
		+			"<div id='servlistModal"+i+"' class='modal'>"
		+				"<div class='modal-content'>"
		+					"<ul class = 'collection with-header'>"
		+						"<li class='collection-header' style='background-color: #eee'>"
		+							"<h6 class='task-card-title mb-3' style='text-align: center'>"
		+							"-신청내용-"
		+							"</h6>"
		+						"</li>"
		+						"<li class='collection-item dismissable'>"
		+							"<span class='width-100' style='font-size: 14px'>"
		+								"신청_id"
		+							"</span>"
		+							"<span class='secondary-content'>"
		+								result.data[i].SERV_ID
		+							"</span>"
		+						"</li>"
		+						"<li class='collection-item dismissable'>"
		+							"<span class='width-100' style='font-size: 14px'>"
		+								"서비스 제공 우편번호"
		+							"</span>"
		+							"<span class='secondary-content'>"
		+								result.data[i].ZIPCODE
		+							"</span>"
		+						"</li>"
		+						"<li class='collection-item dismissable'>"
		+							"<span class='width-100' style='font-size: 14px'>"
		+								"서비스 제공 주소"
		+							"</span>"
		+							"<span class='secondary-content'>"
		+								result.data[i].ADDRESS
		+							"</span>"
		+						"</li>"
		+						"<li class='collection-item dismissable'>"
		+							"<span class='width-100' style='font-size: 14px'>"
		+								"서비스 제공 상세주소"
		+							"</span>"
		+							"<span class='secondary-content'>"
		+								result.data[i].ADDRESS_DETAIL
		+							"</span>"
		+						"</li>"
		+						"<li class='collection-item dismissable'>"
		+							"<span class='width-100' style='font-size: 14px'>"
		+								"판매자 선호 메뉴"
		+							"</span>"
		+							"<span class='secondary-content'>";
										if(result.data[i].PREFLIST !=null){
											for(var j  = 0 ; j < Object.keys(result.data[i].PREFLIST).length ; j++){
												if(result.data[i].PREFLIST[j] != null){
													slist=slist+result.data[i].PREFLIST[j]
												}
											}
										}
		slist=slist								
		+							"</span>"
		+						"</li>"
		+						"<li class='collection-item dismissable'>"
		+							"<span class='width-100' style='font-size: 14px'>"
		+								"1인당 예산"
		+							"</span>"
		+							"<span class='secondary-content'>"
		+								result.data[i].PER_BUD
		+							"</span>"
		+						"</li>"
		+						"<li class='collection-item dismissable'>"
		+							"<span class='width-100' style='font-size: 14px'>"
		+								"참가자수"
		+							"</span>"
		+							"<span class='secondary-content'>"
		+								result.data[i].PARTICIPANT
		+							"</span>"
		+						"</li>"
		+						"<li class='collection-item dismissable'>"
		+							"<span class='width-100' style='font-size: 14px'>"
		+								"연령층"
		+							"</span>"
		+							"<span class='secondary-content'>"
		+								result.data[i].AGE_MIN+" ~ "+result.data[i].AGE_MAX
		+							"</span>"
		+						"</li>"
		+						"<li class='collection-item dismissable'>"
		+							"<span class='width-100' style='font-size: 14px'>"
		+								"참가자 남여 비율"
		+							"</span>"
		+							"<span class='secondary-content'>"
		+								"[남:여]"+result.data[i].PER_MEN+" : "+(10-result.data[i].PER_MEN)
		+							"</span>"
		+						"</li>"
		+						"<li class='collection-item dismissable'>"
		+							"<span class='width-100' style='font-size: 14px'>"
		+								"서비스 형식"
		+							"</span>"
		+							"<span class='secondary-content'>"
		+								result.data[i].SERV_TYPE
		+							"</span>"
		+						"</li>"
		+						"<li class='collection-item dismissable'>"
		+							"<span class='width-100' style='font-size: 14px'>"
		+								"행사 형식"
		+							"</span>"
		+							"<span class='secondary-content'>"
		+								result.data[i].EVENT_TYPE
		+							"</span>"
		+						"</li>"
		+						"<li class='collection-item dismissable'>"
		+							"<span class='width-100' style='font-size: 14px'>"
		+								"후식"
		+							"</span>"
		+							"<span class='secondary-content'>";
										if(result.data[i].DRTLIST !=null){
											for(var j  = 0 ; j < Object.keys(result.data[i].DRTLIST).length ; j++){
												slist=slist+result.data[i].DRTLIST[j] 
											}
										}
		slist=slist
		+							"</span>"
		+						"</li>"
		+						"<li class='collection-item dismissable'>"
		+							"<span class='width-100' style='font-size: 14px'>"
		+								"서비스 제공일시"
		+							"</span>"
		+							"<span class='secondary-content'>"
		+								result.data[i].APP_DATE
		+							"</span>"
		+						"</li>"
		+						"<li class='collection-item dismissable'>"
		+							"<span class='width-100' style='font-size: 14px'>"
		+								"실내여부"
		+							"</span>"
		+							"<span class='secondary-content'>"
		+								result.data[i].INTERIOR_YN
		+							"</span>"
		+						"</li>"
		+						"<li class='collection-item dismissable'>"
		+							"<span class='width-100' style='font-size: 14px'>"
		+								"취사여부"
		+							"</span>"
		+							"<span class='secondary-content'>"
		+								result.data[i].COOKING_YN
		+							"</span>"
		+						"</li>"
		+						"<li class='collection-item dismissable'>"
		+							"<span class='width-100' style='font-size: 14px'>"
		+								"쓰레기 배출 여부"
		+							"</span>"
		+							"<span class='secondary-content'>"
		+								result.data[i].DISCHARGE_YN
		+							"</span>"
		+						"</li>"
		+						"<li class='collection-item dismissable'>"
		+							"<span class='width-100' style='font-size: 14px'>"
		+								"엘리베이터 여부"
		+							"</span>"
		+							"<span class='secondary-content'>"
		+								result.data[i].ELEVATOR_YN
		+							"</span>"
		+						"</li>"
		+						"<li class='collection-item dismissable'>"
		+							"<span class='width-100' style='font-size: 14px'>"
		+								"주차장 여부"
		+							"</span>"
		+							"<span class='secondary-content'>"
		+								result.data[i].PARKING_YN
		+							"</span>"
		+						"</li>"
		+						"<li class='collection-item dismissable'>"
		+							"<span class='width-100' style='font-size: 14px'>"
		+								"추가 식기"
		+							"</span>"
		+							"<span class='secondary-content'>";
										if(result.data[i].TBWLIST != null){
											for(var j  = 0 ; j < Object.keys(result.data[i].TBWLIST).length ; j++){
												slist=slist+result.data[i].TBWLIST[j] 
											}
										}
		slist=slist									
		+							"</span>"
		+						"</li>"
		+						"<li class='collection-item dismissable'>"
		+							"<span class='width-100' style='font-size: 14px'>"
		+								"코디 네이터 신청 여부 "
		+							"</span>"
		+							"<span class='secondary-content'>"
		+								result.data[i].COORDINATOR_YN
		+							"</span>"
		+						"</li>"
		+						"<li class='collection-item dismissable'>"
		+							"<span class='width-100' style='font-size: 14px'>"
		+								"요청 사항 "
		+							"</span>"
		+							"<span class='secondary-content'>";
										if(result.data[i].REQUESTED_TERM !=null){
											slist=slist+result.data[i].REQUESTED_TERM+"" 
										}
		slist=slist
		+							"</span>"
		+						"</li>"
		+					"</ul>" ;
		
		
								
		slist=slist						
		+				"</div>"
		+				"<div class='modal-footer'>"
		+					"<a href='#!' class='modal-close waves-effect waves-green btn-flat'>창닫기</a>"
		+				"</div>"
		+			"</div>"
		+		"</div>" 
		+	"<div class = 'modallist'>"
		+		"<div id='suggestModal"+i+"' class='modal'>"
		+			"<div class='modal-content' id = 'selectmenu'>"
		+				"서비스 제안하기 <p>*등록한 메뉴만 제안 가능합니다.</p>"
		+				"<div class = 'row'>"
		+					"<div class = 'col s5'>"
		+						"<select id='selectfood' name = 'foodselect"+i+"' class='icons'>"
		+							"<option value='' disabled selected>메뉴를 선택해주세요.</option>";
									for(var j=0 ; j < menuss.length; j++ ){
										slist=slist+"<option value='"+menuss[j].name+"/"+menuss[j].weight+"/"+menuss[j].explanation+"/"+menuss[j].file_id+"/"+result.data[i].SERV_ID+"' id ='"+menuss[j].menu_id+"' data-icon='/file/file-down/"+menuss[j].file_id+"'>"+menuss[j].name+"</option>";
									}
		slist=slist
		+						"</select>"
		+					"</div>"
		+					"<div class = 'col s3'>"
		+						"<a id = 'addmenu' class='waves-effect waves-light btn' onclick='setmenuaddlist("+i+")' >제안 메뉴 설정하기</a>"
		+					"</div>"
		+				"</div>";
		slist=slist
		+				"<div class = 'row'>"
		+					"<div class= 'col s12'>"
		+						"<table id ='setmenulisttable'>"
		+							"<tr>"
		+								"<th>메뉴 이름</th>"
		+								"<th>메뉴 중량</th>"
		+								"<th width='40%'>메뉴 설명</th>"
		+								"<th>메뉴 사진</th>"
		+							"</tr>"
		+							"<tbody id = 'addrow"+i+"'>"
		+							"</tbody>"
		+							"<tr>"
		+								"<th colspan='4'>"
		+									"인당 금액 : <input type = 'text' name = 'perbud"+i+"' placeholder='인당 가격을 넣어주세요'>"
		+								"</th>"
		+							"</tr>"
		+						"</table>"
		+					"</div>"
		+				"</div>"
		+				"<br><br><br><br><br>"
		+			"</div>"
		+			"<div class='modal-footer'>"
		+				"<a onclick='menusubmit("+i+")' class=' waves-effect waves-green btn-flat'>제안하기</a>"
		+				"<a onclick='resetcount()' class='modal-close waves-effect waves-green btn-flat'>창닫기</a>"
		+			"</div>"
		+		"</div>"
		+	"</div>" ;
		
	}
	$("#servlist").html(slist);
	$('select').formSelect();
	
}

function setDatePicker(){
	var deoption = {
		   minDate:new Date(moment().add(1,'days').format())
		  ,autoClose:true
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

function resetDatePicker(){
	$(".date").datepicker('destroy');
	setDatePicker();
}

function setmenuaddlist(count){
	var foodct = menucountarr[count].length ;
 	var menuinfo = $("select[name = foodselect"+count+"]").val().split("/") ;
 	var tableadd = ""
	+"<tr>"
	+	"<td>"
	+		"<input type = 'text' name = 'suggmenuname"+foodct+"' value = '"+menuinfo[0]+"' readonly>"
	+	"</td>"
	+	"<td>"
	+		"<input type = 'text' name = 'suggweight"+foodct+"' value = '"+menuinfo[1]+"'>"
	+	"</td>"
	+	"<td>"
	+		"<textarea style = 'margin-top:2%' name='suggmenuexplanation"+foodct+"' class='materialize-textarea'>"+menuinfo[2]+"</textarea>"
	+	"</td>"
	+	"<td>"
	+		"<img name = 'suggfile_id' class='materialboxed' height='50' width='50' src='/file/file-down/"+menuinfo[3]+"'>"
	+	"</td>"
	+"</tr>" ;
	$("#addrow"+count).append(tableadd);
	var arrindex = menucountarr[count].length ;
	menucountarr[count][arrindex] = menuinfo ;
	//alert(menucountarr[count][arrindex][0]) ;
	
}

function menusubmitvalidataion(ct){
	var result = 0 ;
	for(var i = 0 ; i < menucountarr[ct].length ; i++){
		if( $("input[name=suggweight"+i+"]").val() == null || $("input[name=suggweight"+i+"]").val() ==""){
			M.toast({html: "메뉴의 중량을 모두 입력해주세요."});
			return 1;
		}
	}
	
	for(var i = 0 ; i < menucountarr[ct].length ; i++){
		if( $("textarea[name=suggmenuexplanation"+i+"]").val() == null || $("textarea[name=suggmenuexplanation"+i+"]").val() ==""){
			M.toast({html: '메뉴의 설명을 모두 입력해주세요.'});
			return 1;
		}
	}
	
	if($("input[name = perbud"+ct+"]").val() == null || $("input[name = perbud"+ct+"]").val() == "" ){
		M.toast({html: '1인당 금액을 입력해주세요.'})
		return 1 ;
	}
	return result ;
}

function menusubmit(ct){
	if( menusubmitvalidataion(ct) == 1 ){
		return
	}else{
	var jsonn = JSON.stringify(menucountarr[ct]) ;
	var perbud = $("input[name = perbud"+ct+"]").val() ;
	var memid = "${mem_id}" ;
	
	  $.ajax(
			{
				type : "POST",
				url: "/supplier/suggmenu.do",
				data : 
				{
					"mem_id" : memid,
					"per_bud" : perbud,
					"suggarr" : jsonn
				},
				dataType:"json",
				success:function(data){
					alert(data.result);
				},
				error: function(data){
					alert("다시 시도해주세요.") ;
				}
			}		
		); 
	}
}

	//-->
</script>
<div class = "row ">
	<div class = "col s3">
		<br><br><br><br><br>
		행사 날짜 검색
		 <div class="card">
		 	<div class = "card-content">
				<p>검색 시작 날짜를 입력해주세요.</p>
				<input id = "startdate" name = "startdate" type="text" class="datepicker"  readonly>
				<p>검색 종료 날짜를 입력해주세요.</p>
				<input id = "enddate" name = "enddate" type="text" class="datepicker" readonly>
				<button id = "serchservlist" class="btn waves-effect waves-light">
						<i class="material-icons right">search</i> 검색
				</button>
			</div>
		</div>
	</div>
	<div class = "col s7">
	<br><br><br><br><br>
	<c:if test="${empty servlist}">
		아직 신청이 없습니다.
	</c:if>
	<div id = "servlist" style="padding-top:2.45%">
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
								서비스 제공 일시 : ${serv.APP_DATE}
							</p>
						</div>
						<div class="card-action">
							<a class = "waves-effect waves-light modal-trigger" href="#servModal${count}" >상세보기</a>
							<a id = "suggestMenu" class = "waves-effect waves-light modal-trigger" href="#suggestModal${count}" >제안하기</a>
						</div>
					</div>
				</div>
				
				<!-- Modal Structure 상세보기 -->
				<div class = "modallist">
					<div id="servModal${count}" class="modal">
						<div class="modal-content">
							<h4>신청 상세보기</h4>
							<ul class = "collection with-header">
								<li class="collection-header" style="background-color: #eee">
									<h6 class="task-card-title mb-3" style="text-align: center;">
											-신청내용-
									</h6>
								</li>
								<li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	신청_id
									 </span>
									 <span class="secondary-content">
										 ${serv.SERV_ID}
									 </span>
								 </li>
								 <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	서비스 제공 우편번호
									 </span>
									 <span class="secondary-content">
										${serv.ZIPCODE}
									 </span>
								 </li>
								 <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	서비스 제공 주소
									 </span>
									 <span class="secondary-content">
										${serv.ADDRESS}
									 </span>
								 </li>
								 <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	서비스 제공 상세주소
									 </span>
									 <span class="secondary-content">
										${serv.ADDRESS_DETAIL}
									 </span>
								 </li>
								 <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	판매자 선호 메뉴 
									 </span>
									 <span class="secondary-content">
										<c:forEach var = "PREFLIST" items="${serv.PREFLIST}">
											${PREFLIST} 
										</c:forEach>
									 </span>
								 </li>
								 <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	1인당 예산
									 </span>
									 <span class="secondary-content">
										${serv.PER_BUD}
									 </span>
								 </li>
								 <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	참가자수
									 </span>
									 <span class="secondary-content">
										${serv.PARTICIPANT}
									 </span>
								 </li>
								 <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	연령층
									 </span>
									 <span class="secondary-content">
										${serv.AGE_MIN} ~ ${serv.AGE_MAX}
									 </span>
								 </li>
								 <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	참가자 남여 비율
									 </span>
									 <span class="secondary-content">
										[남:여]  ${serv.PER_MEN} : ${10-serv.PER_MEN}
									 </span>
								 </li>
								 <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	서비스 형식
									 </span>
									 <span class="secondary-content">
										${serv.SERV_TYPE}
									 </span>
								 </li>
								  <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	행사 형식
									 </span>
									 <span class="secondary-content">
										${serv.EVENT_TYPE}
									 </span>
								 </li>
								 <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	후식
									 </span>
									 <span class="secondary-content">
										<c:forEach var = "DRT" items="${serv.DRTLIST}">
											${DRT} 
										</c:forEach>
									 </span>
								 </li>
								  <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	서비스 제공일시
									 </span>
									 <span class="secondary-content">
										${serv.APP_DATE}
									 </span>
								 </li>
								 <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	실내여부
									 </span>
									 <span class="secondary-content">
										${serv.INTERIOR_YN}
									 </span>
								 </li>
								 <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	취사여부
									 </span>
									 <span class="secondary-content">
										${serv.COOKING_YN }
									 </span>
								 </li>
								 <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	쓰레기 배출 여부
									 </span>
									 <span class="secondary-content">
										${serv.DISCHARGE_YN}
									 </span>
								 </li>
								 <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	엘리베이터 여부
									 </span>
									 <span class="secondary-content">
										${serv.ELEVATOR_YN}
									 </span>
								 </li>
								 <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	추가 식기 
									 </span>
									 <span class="secondary-content">
										<c:forEach var = "TBW" items="${serv.TBWLIST}">
											${TBW} 
										</c:forEach>
									 </span>
								 </li>
								 <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	코디 네이터 신청 여부
									 </span>
									 <span class="secondary-content">
										${serv.COORDINATOR_YN}
									 </span>
								 </li>
								 <li class="collection-item dismissable">
									 <span class="width-100" style="font-size: 14px">
									 	요청 사항 
									 </span>
									 <span class="secondary-content">
										${serv.REQUESTED_TERM} 
									 </span>
								 </li>
							</ul>
						</div>
						<div class="modal-footer">
							<a href="#!" class="modal-close waves-effect waves-green btn-flat">창닫기</a>
						</div>
					</div>
				</div>
				
				<!-- suggest modal -->
				<div class = "modallist">
					<div id="suggestModal${count}" class="modal">
						<div class="modal-content" id = "selectmenu">
							서비스 제안하기 <p>*등록한 메뉴만 제안 가능합니다.</p>
							<div class = "row">
								<div class = "col s5">
									<select name = "foodselect${count}" class="icons">
										<option value="" disabled selected>메뉴를 선택해주세요.</option>
										<c:forEach var = "foodlist" items="${suppfoodlist}">
											<option  value="${foodlist.name}/${foodlist.weight}/${foodlist.explanation}/${foodlist.file_id}/${serv.SERV_ID}" id = "${foodlist.menu_id}" data-icon="/file/file-down/${foodlist.file_id}"> ${foodlist.name}</option>
										</c:forEach>
									</select>
								</div>
								<div class = "col s3">
									<a id = "addmenu" class="waves-effect waves-light btn" onclick="setmenuaddlist(${count})" >제안 메뉴 설정하기</a>
								</div>
							</div>
							<div class = "row">
								<div class= "col s12">
									<table id ="setmenulisttable">
										<tr>
											<th>메뉴 이름</th>
											<th>메뉴 중량</th>
											<th width="40%">메뉴 설명</th>
											<th>메뉴 사진</th>
										</tr>
										<tbody id = "addrow${count}">
										
										</tbody>
										<tr>
											<th colspan="4">
												인당 금액 : <input type = "text" name = "perbud${count}" placeholder="인당 가격을 넣어주세요">
											</th>
										</tr>
									</table>
								</div>
							</div>
							<br><br><br><br><br>
						</div>
						<div class="modal-footer">
							<a onclick="menusubmit(${count})" class=" waves-effect waves-green btn-flat">제안하기</a>
							<a onclick="resetcount()" class="modal-close waves-effect waves-green btn-flat">창닫기</a>
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

