<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/include/header.jsp"%>
<%@ taglib prefix="ui" uri="http://charida.com/paging/ui" %>

<script type="text/javascript" src="/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>


<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>

<style type="text/css">
/* Data Table */

div.material-table {
  padding: 0;
}

div.material-table .hiddensearch {
  padding: 0 14px 0 24px;
  border-bottom: solid 1px #DDDDDD;
  display: none;
}

div.material-table .hiddensearch input {
  margin: 0;
  border: transparent 0 !important;
  height: 48px;
  color: rgba(0, 0, 0, .84);
}

div.material-table .hiddensearch input:active {
  border: transparent 0 !important;
}

div.material-table table {
  table-layout: fixed;
}

div.material-table .table-header {
  height: 64px;
  padding-left: 24px;
  padding-right: 14px;
  -webkit-align-items: center;
  -ms-flex-align: center;
  align-items: center;
  display: flex;
  -webkit-display: flex;
  border-bottom: solid 1px #DDDDDD;
}

div.material-table .table-header .actions {
  display: -webkit-flex;
  margin-left: auto;
}

div.material-table .table-header .btn-flat {
    min-width: 36px;
    padding: 0 8px;
}

div.material-table .table-header input {
  margin: 0;
  height: auto;
}

div.material-table .table-header i {
  color: rgba(0, 0, 0, 0.54);
  font-size: 24px;
}

div.material-table .table-footer {
  height: 56px;
  padding-left: 24px;
  padding-right: 14px;
  display: -webkit-flex;
  display: flex;
  -webkit-flex-direction: row;
  flex-direction: row;
  -webkit-justify-content: flex-end;
  justify-content: flex-end;
  -webkit-align-items: center;
  align-items: center;
  font-size: 12px !important;
  color: rgba(0, 0, 0, 0.54);
}

div.material-table .table-footer .dataTables_length {
  display: -webkit-flex;
  display: flex;
}

div.material-table .table-footer label {
  font-size: 12px;
  color: rgba(0, 0, 0, 0.54);
  display: -webkit-flex;
  display: flex;
  -webkit-flex-direction: row
  /* works with row or column */
  
  flex-direction: row;
  -webkit-align-items: center;
  align-items: center;
  -webkit-justify-content: center;
  justify-content: center;
}

div.material-table .table-footer .select-wrapper {
  display: -webkit-flex;
  display: flex;
  -webkit-flex-direction: row
  /* works with row or column */
  
  flex-direction: row;
  -webkit-align-items: center;
  align-items: center;
  -webkit-justify-content: center;
  justify-content: center;
}

div.material-table .table-footer .dataTables_info,
div.material-table .table-footer .dataTables_length {
  margin-right: 32px;
}

div.material-table .table-footer .material-pagination {
  display: flex;
  -webkit-display: flex;
  margin: 0;
}

div.material-table .table-footer .material-pagination li:first-child {
  margin-right: 24px;
}

div.material-table .table-footer .material-pagination li a {
  color: rgba(0, 0, 0, 0.54);
}

div.material-table .table-footer .select-wrapper input.select-dropdown {
  margin: 0;
  border-bottom: none;
  height: auto;
  line-height: normal;
  font-size: 12px;
  width: 40px;
  text-align: right;
}

div.material-table .table-footer select {
  background-color: transparent;
  width: auto;
  padding: 0;
  border: 0;
  border-radius: 0;
  height: auto;
  margin-left: 20px;
}

div.material-table .table-title {
  font-size: 20px;
  color: #000;
}

div.material-table table tr td {
  padding: 0 0 0 56px;
  height: 48px;
  font-size: 13px;
  color: rgba(0, 0, 0, 0.87);
  border-bottom: solid 1px #DDDDDD;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

div.material-table table tr td a {
  color: inherit;
}

div.material-table table tr td a i {
  font-size: 18px;
  color: rgba(0, 0, 0, 0.54);
}

div.material-table table tr {
  font-size: 12px;
}

div.material-table table th {
  font-size: 12px;
  font-weight: 500;
  color: #757575;
  cursor: pointer;
  white-space: nowrap;
  padding: 0;
  height: 56px;
  padding-left: 56px;
  vertical-align: middle;
  outline: none !important;
}

div.material-table table th.sorting_asc,
div.material-table table th.sorting_desc {
  color: rgba(0, 0, 0, 0.87);
}

div.material-table table th.sorting:after,
div.material-table table th.sorting_asc:after,
div.material-table table th.sorting_desc:after {
  font-family: 'Material Icons';
  font-weight: normal;
  font-style: normal;
  font-size: 16px;
  line-height: 1;
  letter-spacing: normal;
  text-transform: none;
  display: inline-block;
  word-wrap: normal;
  -webkit-font-feature-settings: 'liga';
  -webkit-font-smoothing: antialiased;
  content: "arrow_back";
  -webkit-transform: rotate(90deg);
  display: none;
  vertical-align: middle;
}

div.material-table table th.sorting:hover:after,
div.material-table table th.sorting_asc:after,
div.material-table table th.sorting_desc:after {
  display: inline-block;
}

div.material-table table th.sorting_desc:after {
  content: "arrow_forward";
}

div.material-table table tbody tr:hover {
  background-color: #EEE;
}

div.material-table table th:first-child,
div.material-table table td:first-child {
  padding: 0 0 0 24px;
}

div.material-table table th:last-child,
div.material-table table td:last-child {
  padding: 0 14px 0 0;
}

div.dt-button-info {
  position: fixed;
  top: 50%;
  left: 50%;
  width: 400px;
  margin-top: -100px;
  margin-left: -200px;
  text-align: center;
  z-index: 21;
  color: rgba(0, 0, 0, 0.6);
}

@media screen and (max-width: 640px) {
  div.dt-buttons {
    float: none !important;
    text-align: center;
  }
}
/* Modal */

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
.modal2 {
    display: none;
    position: fixed;
    left: 0;
    right: 0;
    background-color: #fafafa;
    padding: 0;
    max-height: 45%;
    width: 30%;
    margin: auto;
    overflow-y: auto;
    border-radius: 2px;
    will-change: top, opacity;
}
.z-depth-5, .modal2 {
   -webkit-box-shadow: 0 24px 38px 3px rgba(0, 0, 0, 0.14), 0 9px 46px 8px rgba(0, 0, 0, 0.12), 0 11px 15px -7px rgba(0, 0, 0, 0.2);
   box-shadow: 0 24px 38px 3px rgba(0, 0, 0, 0.14), 0 9px 46px 8px rgba(0, 0, 0, 0.12), 0 11px 15px -7px rgba(0, 0, 0, 0.2);
}
.modal2.modal-fixed-footer {
    padding: 0;
    height: 45%;
}
.modal2.modal-fixed-footer .modal-content {
    position: absolute;
    height: calc(100% - 56px);
    max-height: 100%;
    width: 100%;
    overflow-y: auto;
}
.modal2 .modal-content {
    padding: 24px;
}
.modal2.modal-fixed-footer .modal-footer {
    border-top: 1px solid rgba(0, 0, 0, 0.1);
    position: absolute;
    bottom: 0;
}
.modal2 .modal-footer {
    border-radius: 0 0 2px 2px;
    background-color: #fafafa;
    padding: 4px 6px;
    height: 56px;
    width: 100%;
    text-align: right;
}
</style>
<script src="/js/chart/chart.js"></script>
<script type="text/javascript">

var elems = null;
var instances = null;
var lineChart;

$(function(){
	elems = document.querySelectorAll('.datepicker');
	instances = M.Datepicker.init(elems, {
	  format:'yyyy-mm-dd'
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
    });
	$('.datepicker2').datepicker({
		  format:'yyyy-mm-dd'
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
		    });
	$('.datepicker').on({change:function(){
		$('.datepicker2')[0].M_Datepicker.options.minDate = $('.datepicker')[0].M_Datepicker.date
	}});
	$('.datepicker2').on({change:function(){
		$('.datepicker')[0].M_Datepicker.options.maxDate = $('.datepicker2')[0].M_Datepicker.date
	}});
	$(document).ready(function(){
	    $('select').formSelect();
	  });
});	

function isNull(value){
	if(value == null || value == ""){
		return true;
	}
	return false;
}

function getAnalysis(){
	if(isNull($("#start_date").val())){
		showToast("시작일을 선택해주세요.");
		return ;
	}
	if(isNull($("#end_date").val())){
		showToast("종료일을 선택해주세요.");
		return ;
	}
   var ctx = $("#revenue-line-chart");
   var chartDatas;
   var chartOptions = {
      responsive: false,
      legend: {
         display: false
      },
      hover: {
         mode: "label"
      },
      scales: {
         xAxes: [
            {
               display: true,
               gridLines: {
                  display: false
               },
               ticks: {
                  fontColor: "#fff"
               }
            }
         ],
         yAxes: [
            {
               display: true,
               fontColor: "#fff",
               gridLines: {
                  display: true,
                  color: "rgba(255,255,255,0.3)"
               },
               ticks: {
                  beginAtZero: false,
                  fontColor: "#fff",
                  callback: function(value, index, values) {
                      return  numbeComma(value) + '%' ;
                  }
               }
            }
         ],
         tooltips: {
        	callbacks: {
        		label: function(t, e) {
        			 var i = e.datasets[t.datasetIndex].label || "";
        			 if (i) {
                         i += ': ';
                         i +=t.yLabel + '%';
                     }
        			 return i;
        		}
        	}
         }
      }
   };
	$.ajax({
	    type : "post",
	    url : "/admin/analysis/graph.do",
	    data:{
	    	startDate:$("#start_date").val()
	    	,endDate:$("#end_date").val()
	    },
	    dataType : "json",
	    error : function(data){
	        alert('상세정보 조회를 실패하셨습니다.');
	    },
	    success : function(data){
	    	if(data.length == 0){
	    		$('#sec_none').css('display','block');
	    		$('#sec_data').css('display','none');
	    		return;
	    	}
	    	var labelTxt = "[";
	    	var serieTxt = "[";
	    	var total = 0;
	    	var info ;
	    	data.forEach(function(e,i){
	    		if(i !== data.length-1){
	    		labelTxt += "'"+e.SERV_ID+"',";
	    		serieTxt += "'"+e.RECOMMENDRATE+"',";
	    		}else{
	    			info = e
	    			var ctx1 = document.getElementById("myChart").getContext('2d');
	    			mychart(ctx1,e,1,data.length);
	    			var ctx2 = document.getElementById("myChart2").getContext('2d');
	    			mychart(ctx2,e,2,data.length);
	    			/*
	    			- Chart를 생성하면서, 
	    			- ctx를 첫번째 argument로 넘겨주고, 
	    			- 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
	    			*/
	    			
	    		}
	    		//total += e.SUM_PAY;
	    	});
	    	//if(total == 0 ){
	    	//	$('#sec_none').css('display','block');
	    	//	$('#sec_data').css('display','none');
	    	//	return;
	    	//}
	    	labelTxt += "]";
	    	serieTxt += "]";
	    	
	    	chartDatas = {
    		      labels: eval(labelTxt),
    		      datasets: [
    		         {
    		            label: "신청 아이디",
    		            data: eval(serieTxt),
    		            backgroundColor: "rgba(128, 222, 234, 0.5)",
    		            borderColor: "#d1faff",
    		            pointBorderColor: "#d1faff",
    		            pointBackgroundColor: "#00bcd4",
    		            pointHighlightFill: "#d1faff",
    		            pointHoverBackgroundColor: "#d1faff",
    		            borderWidth: 2,
    		            pointBorderWidth: 2,
    		            pointHoverBorderWidth: 4,
    		            pointRadius: 4
    		         }
    		      ]
    		   };
	    	var chartConfig = {
   		      type: "line",
   		      options: chartOptions,
   		      data: chartDatas
   		   };
   		   lineChart = new Chart(ctx, chartConfig);
   		   //getTable();
   		   $('#sec_none').css('display','none');
		   $('#sec_data').css('display','block');
		   getTable(data)
		   
	    }     
	});
}
function mychart(ctx,e,choose,length){
	if(choose == 1){
		var x1 = (e.CHOOSECOUNT / (length-1) )*100
		var x2 = 100 - x1
		var labeltemp = "채택 중 추천 비율"
		var label1 = "추천 중 채택"
		var label2 = "비 추천 채택"
	}else{
		var x1 = e.CHOOSEPRICESCOREAVG
		var x2 = e.NOTCHOOSEPRICESCOREAVG
		var labeltemp = "추천/비추천 가격 소비자 후기 만족도 평균"
		var label1 = "추천 가격 소비자 가격 후기 만족도 평균"
		var label2 = "비추천 가격 소비자 가격 후기 만족도 평균"
	}
	var myChart = new Chart(ctx, {
	    type: 'bar',
	    data: {
	        labels: [label1, label2],
	        datasets: [{
	            label: labeltemp,
	            data: [x1 , x2  ],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        maintainAspectRatio: true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero:true
	                }
	            }]
	        }
	    }
	});
}

function getTable(data) {
	var table="";
	var infotabel = "" ;
	data.forEach(function(e,i){
		if( i != data.length-1 ){
			table +="<tr>";
			table +="<td>" +e.SERV_ID+"</td>";
			table +="<td>￦ " +numbeComma(e.PER_BUD)+"</td>";
			table +="<td>￦ " +numbeComma(e.SUGG_PER_BUD)+"</td>";
			table +="<td>￦ " +numbeComma(e.MINPRICE) +"~ ￦"+numbeComma(e.MAXPRICE)+"</td>";
			if(Number( e.SUGG_PER_BUD ) >= Number( e.MINPRICE ) && Number(e.SUGG_PER_BUD) <= Number( e.MAXPRICE ) ){
				table +="<td>"+"추천 제안"+"</td>";
			}else{
				table +="<td>"+"비 추천 제안"+"</td>";
			}
			table +="<td> " +e.REVIEW_PRICE_SCORE+"</td>";
			table +="</tr>";
		}else{
			info = e ;
			infotabel +="<tr>";
			infotabel +="<td>" +(data.length-1)+"</td>";
			infotabel +="<td> " +(info.CHOOSECOUNT / (data.length-1) )*100+"</td>";
			infotabel +="<td> " +info.CHOOSEPRICESCOREAVG+"</td>";
			infotabel +="<td> " +info.NOTCHOOSEPRICESCOREAVG+"</td>";
			infotabel +="</tr>";
		}
	$('#tby_result').html(table);
	$('#tby_result1').html(infotabel);
	});
}

function numbeComma(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function showToast(msg){
	 M.toast({html: msg, classes: 'rounded',displayLength:3000});
	 $('#toast-container').css({left:(window.outerWidth - $('#toast-container').width())/2});
}

</script>
<br><br>
<div class = "row  card" >
	<div class = "col s12 " style="margin:1%">
		<div class = "col s1"></div>
		<div class = "col s2">
			<h5>
				빅데이터 분석
			</h5>
		</div>
	</div>
</div>
<!--  고재량 작업 영역 -->                                          
<div class = "row"  >
	<div class = "col s12">
		<h4>기간분석</h4>
	</div>
	<div class = "col s12">
		<div class = "col s12">
			검색 기간  : 
			<div class="input-field" style="display: inline-block;width: 8%;">
				<input id="start_date" name="start_date" type="text" class="datepicker" readonly="readonly">
         	</div>
         	~ 
         	<div class="input-field" style="display: inline-block;width: 8%;">
				<input id="end_date" name="end_date" type="text" class="datepicker2" readonly="readonly">
         	</div>
         	<div class="input-field" style="display: inline-block;width: 8%;">
         		<a class="waves-effect waves-light btn" onclick='getAnalysis()'>검색</a>
         	</div>
		</div>
	</div>
</div>
<div class = "row">
	<div class = "col s12">
		<div class="col m12" style="padding: 8px; display: none" id="sec_data">
	         <div class="card animate fadeUp" style="overflow: hidden;">
	            <div class="card-move-up waves-effect waves-block waves-light col s4 ">
	               <div class="move-up cyan darken-1">
	                  <div>
	                     <span class="chart-title white-text">예측률 그래프<br><br></span>
	                  </div>
	                  <div class="trending-line-chart-wrapper" >
	                  	<canvas id="revenue-line-chart" height="380px" width="500px" class="chartjs-render-monitor" style="display: block; height: 350px; width: 500px;">
	                  	</canvas>
	                  </div>
	               </div>
	            </div>
	            <div  class = "col s4">
   					<canvas id="myChart" height="380px" width="500px" ></canvas>
				</div>
				<div  class = "col s4">
   					<canvas id="myChart2" height="380px" width="500px" ></canvas>
				</div>
	            <div class="card-content" style="height: 90px">
	               <a class="btn-floating btn-move-up waves-effect waves-light red accent-2 z-depth-4 right">
	                  <i class="material-icons activator">filter_list</i>
	               </a>
	            </div>
	            <div class="card-reveal" style="display: none; transform: translateY(0%);">
	               <span class="card-title grey-text text-darken-4">기간내 데이터 정보<i class="material-icons right">close</i>
	               </span>
	               <table class="responsive-table">
	                  <thead>
	                     <tr>
	                        <th data-field="serv-id">서브 아이디</th>
	                        <th data-field="app-price">신청 가격</th>
	                        <th data-field="sugg-price">제안 가격</th>
	                        <th data-field="reco-price">추천가격</th>
	                        <th data-field="reco-choose">추천 가격대 채택 여부</th>
	                        <th data-field="review-score">리뷰 가격 만족도 </th>
	                     </tr>
	                  </thead>
	                  <tbody id = "tby_result">
	                     
	                  </tbody>
	               </table>
	               <br><br>
	               <table class="responsive-table">
	                  <thead>
	                     <tr>
	                        <th data-field="serv count">기간내 서비스 수</th>
	                        <th data-field="app-price">채택 중 추천 비율</th>
	                        <th data-field="sugg-price">가격추천대 리뷰 가격 만족도</th>
	                        <th data-field="reco-price">가격 비추천대 리뷰 가격 만족도</th>
	                     </tr>
	                  </thead>
	                  <tbody id = "tby_result1">
	                     
	                  </tbody>
	               </table>
	            </div>
	         </div>
	      </div>
	</div>
</div>
<!--  고재량 작업 영역 -->
	
<div class="row">
	 <div id="admin" class="col s12">
	   <div class="card material-table">
	     <div class="table-header">
	       <span class="table-title">검색</span>
	       <div class="actions">
	         <a href="#" class="search-toggle waves-effect btn-flat nopadding"><i class="material-icons">search</i></a>
	       </div>
	     </div>
	     <div id="datatable_wrapper" class="dataTables_wrapper no-footer">
	     <table id="datatable" class="dataTable no-footer" role="grid" aria-describedby="datatable_info">
	       <thead>
	         <tr role="row">
	           <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1" aria-label="Name: activate to sort column ascending">접수 아이디</th>
	           <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending">신청자 아이디</th>
	           <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending">후기 평점</th>
	           <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending">이벤트 종류 </th>
	           <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1" aria-label="Start dae: activate to sort column ascending">서비스 종류</th>
	           <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending">참가자 수</th>
	           <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending">신청 금액(1인)</th>
	           <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending">채택 금액(1인)</th>
	           <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending">추천 금액대</th>
	         </tr>
	       </thead>
	       <tbody>
	       <c:forEach var="servinfo" items="${ALLSERVINFO}" >
			<tr role="row" class="odd">
				<td><a onclick="showDetail('${servinfo.SERV_ID}')" class='modal-close waves-effect waves-green btn-flat'>${servinfo.SERV_ID}</a></td>
				<td>${servinfo.CUSTOMER_ID}</td>
				<td>${((servinfo.REVIEW.MENU_SCORE)+(servinfo.REVIEW.PRICE_SCORE)+(servinfo.REVIEW.SERV_SCORE))/3}</td>
				<td>${servinfo.ETYPENAME.CODE_NAME}</td>
				<td>${servinfo.STYPENAME.CODE_NAME}</td>
				<td>${servinfo.PARTICIPANT}</td>
				<td>${servinfo.PER_BUD}</td>
				<td>${servinfo.CHOOSESUGG.PER_BUD}</td>
				<td>${servinfo.MINPRICE} ~ ${servinfo.MAXPRICE}</td>
			</tr>
       </c:forEach>
	       </tbody>
	     </table>
	     </div>
	   </div>
	 </div>
</div>
	
<!--Modal -->
<div id="modal1" class="modal modal-fixed-footer">
	<div class="modal-content">
		<ul class="collection with-header">
			<li class="collection-header">
				<!-- 신청번호 -->
				<h5 class="task-card-title mb-3" style="text-align: right;" id="app_title">
				</h5>
				<!-- 작성일 -->
				<p class="task-card-date" style="text-align: right;" id="app_date"></p>
			</li>
			<li class="collection-item dismissable">
				<!-- 신청자 -->
				<span class="width-100" style="font-size: 14px">신청자 이름</span>
				<span class="secondary-content"><span id="app_name"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 최종수정일 -->
				<span class="width-100" style="font-size: 14px">최종 수정일</span>
				<span class="secondary-content"><span id="modified_date"></span></span>
			</li>
		</ul>
		
		<!-- 업체정보 -->
		<ul class="collection with-header">
			<li class="collection-header" style="background-color: #eee">
				<h6 class="task-card-title mb-3" style="text-align: center;">
					업체 정보
				</h6>
			</li>
			<li class="collection-item dismissable" id="suggListNull" style="display: block">
				<span class="width-100" style="font-size: 14px">아직 제안이 없습니다.</span>
			</li>
			<li class="collection-item dismissable" id="suggListNotNull" style="display: none">
				<table class="highlight centered">
					<thead id="sugg_info_head">
					</thead>
					<tbody id="sugg_info_body">
					</tbody>
				</table>
			</li>

		</ul>
		
		<!-- 일정정보 -->
		<ul class="collection with-header">
			<li class="collection-header" style="background-color: #eee">
				<h6 class="task-card-title mb-3" style="text-align: center;">
					일정 정보
				</h6>
			</li>
			<li class="collection-item dismissable">
				<!-- 서비스 제공일 -->
				<span class="width-100" style="font-size: 14px">서비스 제공일</span>
				<span class="secondary-content"><span id="serv_date"></span></span>
			</li>
		</ul>
		<!-- 현장정보 -->
		<ul class="collection with-header">
			<li class="collection-header" style="background-color: #eee">
				<h6 class="task-card-title mb-3" style="text-align: center;">
					현장 정보
				</h6>
			</li>
			<li class="collection-item dismissable">
				<!-- 1주소 : 서울 도봉구 xx동 산23-2 -->
				<span class="width-100" style="font-size: 14px">주소</span>
				<span class="secondary-content"><span id="address"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 1상세주소 : oo빌라 3층  -->
				<span class="width-100" style="font-size: 14px">상세주소</span>
				<span class="secondary-content"><span id="address_detail"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 2공간 : 실내/실외  -->
				<span class="width-100" style="font-size: 14px">공간</span>
				<span class="secondary-content"><span id="interior_yn"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 2주차장 : 유/무  -->
				<span class="width-100" style="font-size: 14px">주차장 유무</span>
				<span class="secondary-content"><span id="parking_yn"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 2엘리베이터 : 유/무 -->
				<span class="width-100" style="font-size: 14px">엘리베이터 유무</span>
				<span class="secondary-content"><span id="elevator_yn"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 2쓰레기배출 : 가능/불가능 -->
				<span class="width-100" style="font-size: 14px">쓰레기배출 여부</span>
				<span class="secondary-content"><span id="discharge_yn"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 2취사 : 가능/불가능 -->
				<span class="width-100" style="font-size: 14px">취사 여부</span>
				<span class="secondary-content"><span id="cooking_yn"></span></span>
			</li>
			
		</ul>
		<!-- 참석자정보 -->
		<ul class="collection with-header">
			<li class="collection-header" style="background-color: #eee">
				<h6 class="task-card-title mb-3" style="text-align: center;">
					참석자 정보
				</h6>
			</li>
			<li class="collection-item dismissable">
				<!-- 1인원 : 100명 -->
				<span class="width-100" style="font-size: 14px">인원수</span>
				<span class="secondary-content"><span id="participant"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 2 1인당 20,000원 -->
				<span class="width-100" style="font-size: 14px">1인당 금액</span>
				<span class="secondary-content"><span id="per_bud"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 2총 2,000,000원 -->
				<span class="width-100" style="font-size: 14px">총 금액</span>
				<span class="secondary-content"><span id="per_totalbud"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 1연령 : 30대~40대 -->
				<span class="width-100" style="font-size: 14px">연령대</span>
				<span class="secondary-content"><span id="age_minmax"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 1성비 : 남 100% / 여 0% -->
				<span class="width-100" style="font-size: 14px">성비 : 남</span>
				<span class="secondary-content"><span id="per_men"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 2성비 : 남 100% / 여 0% -->
				<span class="width-100" style="font-size: 14px">성비 : 여</span>
				<span class="secondary-content"><span id="per_women"></span></span>
			</li>

		</ul>
		<!-- 행사정보 -->
		<ul class="collection with-header">
			<li class="collection-header" style="background-color: #eee">
				<h6 class="task-card-title mb-3" style="text-align: center;">
					행사 정보
				</h6>
			</li>
			<li class="collection-item dismissable">
				<!-- 1서비스 형식(진행형식) 택1:뷔페, 코스, 드랍오프, 도시락 -->
				<span class="width-100" style="font-size: 14px">진행형식</span>
				<span class="secondary-content"><span id="serv_type_code"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 1행사 형식 택1 : 개인/사교/리셉션/기업/학교/기타 -->
				<span class="width-100" style="font-size: 14px">행사형식</span>
				<span class="secondary-content"><span id="event_type_code"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 2코디네이터 신청 : 유/무 -->
				<span class="width-100" style="font-size: 14px">코디네이터 신청유무</span>
				<span class="secondary-content"><span id="coordinator_yn"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 2추가식기 신청 : 0~ -->
				<span class="width-100" style="font-size: 14px">추가식기 신청</span>
				<span class="secondary-content"><span id="tableware_yn"></span></span>
			</li>
			<li class="collection-item dismissable">
				<!-- 2후식선택 : 0~ -->
				<span class="width-100" style="font-size: 14px">후식 신청</span>
				<span class="secondary-content"><span id="dessert_yn"></span></span>
			</li>
		</ul>
		<!-- 요청사항 -->
		<ul class="collection with-header">
			<li class="collection-header" style="background-color: #eee">
				<h6 class="task-card-title mb-3" style="text-align: center;">
					요청사항
				</h6>
			</li>
			
			<!-- 1내용 -->
			
			<li class="collection-item dismissable">
				<span class="width-100" style="font-size: 14px">추가요청사항</span>
				<span class="secondary-content"><span id="requested_team"></span></span>
			</li>
		</ul>
		<ul class="collection with-header" id="ul_app">
			
		</ul>

	</div> 
	<div class="modal-footer">
		<!-- 닫기버튼 -->
		<a href="#!" class="modal-close waves-effect waves-green btn-flat">닫기</a>
	</div>
</div>
<div id="modal2" class="modal modal-fixed-footer">
	<div class="modal-content">
		<ul class="collection with-header" id="ul_payment">
			
		</ul>
	</div>
	<div class="modal-footer">
		<!-- 모달 2 [닫기] -->
		<ul>
			<li>
				<a href="#!" class="modal-close waves-effect waves-green btn-flat">닫기</a>
			</li>
		</ul>
	</div>
</div>

<br><br><br>
<script id = "rendered-js">
//<!--
function movePage(pageNo){
	document.dForm.pageNo.value = pageNo;
	document.dForm.submit();
} 
		(function(window, document, undefined) {

			  var factory = function($, DataTable) {
			    "use strict";
			    $('.search-toggle').click(function() {
			      if ($('.hiddensearch').css('display') == 'none')
			        $('.hiddensearch').slideDown();
			      else
			        $('.hiddensearch').slideUp();
			    });

			    /* Set the defaults for DataTables initialisation */
			    $.extend(true, DataTable.defaults, {
			      dom: "<'hiddensearch'f'>" +
			        "tr"+
			        "<'table-footer'Blip'>",
			      renderer: 'material'
			    });
			    /* Default class modification */
			    $.extend(DataTable.ext.classes, {
			      sWrapper: "dataTables_wrapper",
			      sFilterInput: "form-control input-sm",
			      sLengthSelect: "form-control input-sm"
			    });

			    /* Bootstrap paging button renderer */
			    DataTable.ext.renderer.pageButton.material = function(settings, host, idx, buttons, page, pages) {
			      var api = new DataTable.Api(settings);
			      var classes = settings.oClasses;
			      var lang = settings.oLanguage.oPaginate;
			      var btnDisplay, btnClass, counter = 0;

			      var attach = function(container, buttons) {
			        var i, ien, node, button;
			        var clickHandler = function(e) {
			          e.preventDefault();
			          if (!$(e.currentTarget).hasClass('disabled')) {
			            api.page(e.data.action).draw(false);
			          }
			        };

			        for (i = 0, ien = buttons.length; i < ien; i++) {
			          button = buttons[i];

			          if ($.isArray(button)) {
			            attach(container, button);
			          } else {
			            btnDisplay = '';
			            btnClass = '';

			            switch (button) {

			              case 'first':
			                btnDisplay = lang.sFirst;
			                btnClass = button + (page > 0 ?
			                  '' : ' disabled');
			                break;

			              case 'previous':
			                btnDisplay = '<i class="material-icons">chevron_left</i>';
			                btnClass = button + (page > 0 ?
			                  '' : ' disabled');
			                break;

			              case 'next':
			                btnDisplay = '<i class="material-icons">chevron_right</i>';
			                btnClass = button + (page < pages - 1 ?
			                  '' : ' disabled');
			                break;

			              case 'last':
			                btnDisplay = lang.sLast;
			                btnClass = button + (page < pages - 1 ?
			                  '' : ' disabled');
			                break;

			            }

			            if (btnDisplay) {
			              node = $('<li>', {
			                  'class': classes.sPageButton + ' ' + btnClass,
			                  'id': idx === 0 && typeof button === 'string' ?
			                    settings.sTableId + '_' + button : null
			                })
			                .append($('<a>', {
			                    'href': '#',
			                    'aria-controls': settings.sTableId,
			                    'data-dt-idx': counter,
			                    'tabindex': settings.iTabIndex
			                  })
			                  .html(btnDisplay)
			                )
			                .appendTo(container);

			              settings.oApi._fnBindAction(
			                node, {
			                  action: button
			                }, clickHandler
			              );

			              counter++;
			            }
			          }
			        }
			      };

			      // IE9 throws an 'unknown error' if document.activeElement is used
			      // inside an iframe or frame.
			      var activeEl;

			      try {
			        // Because this approach is destroying and recreating the paging
			        // elements, focus is lost on the select button which is bad for
			        // accessibility. So we want to restore focus once the draw has
			        // completed
			        activeEl = $(document.activeElement).data('dt-idx');
			      } catch (e) {}

			      attach(
			        $(host).empty().html('<ul class="material-pagination"/>').children('ul'),
			        buttons
			      );

			      if (activeEl) {
			        $(host).find('[data-dt-idx=' + activeEl + ']').focus();
			      }
			    };

			    /*
			     * TableTools Bootstrap compatibility
			     * Required TableTools 2.1+
			     */
			    if (DataTable.TableTools) {
			      // Set the classes that TableTools uses to something suitable for Bootstrap
			      $.extend(true, DataTable.TableTools.classes, {
			        "container": "DTTT btn-group",
			        "buttons": {
			          "normal": "btn btn-default",
			          "disabled": "disabled"
			        },
			        "collection": {
			          "container": "DTTT_dropdown dropdown-menu",
			          "buttons": {
			            "normal": "",
			            "disabled": "disabled"
			          }
			        },
			        "print": {
			          "info": "DTTT_print_info"
			        },
			        "select": {
			          "row": "active"
			        }
			      });

			      // Have the collection use a material compatible drop down
			      $.extend(true, DataTable.TableTools.DEFAULTS.oTags, {
			        "collection": {
			          "container": "ul",
			          "button": "li",
			          "liner": "a"
			        }
			      });
			    }

			  }; // /factory

			  // Define as an AMD module if possible
				  if (typeof define === 'function' && define.amd) {
				    define(['jquery', 'datatables'], factory);
				  } else if (typeof exports === 'object') {
				    // Node/CommonJS
				    factory(require('jquery'), require('datatables'));
				  } else if (jQuery) {
				    // Otherwise simply initialise as normal, stopping multiple evaluation
				    factory(jQuery, jQuery.fn.dataTable);
				  }

			})(window, document);



			$(document).ready(function() {
			  $('#datatable').dataTable({
			    "oLanguage": {
			      "sSearch": "",
			      "sSearchPlaceholder": "검색",
			      "sInfo": "_START_ -_END_ of _TOTAL_",
			      "sLengthMenu": '<span>Rows per page:</span><select class="browser-default">' +
			        '<option value="10">10</option>' +
			        '<option value="20">20</option>' +
			        '<option value="30">30</option>' +
			        '<option value="40">40</option>' +
			        '<option value="50">50</option>' +
			        '<option value="-1">All</option>' +
			        '</select></div>'
			    },
			    bAutoWidth: false,

					buttons: [
						 {
							 	 text: '<span style="color:#4d4d4d; margin-right:15px">Print<span>',
								 extend: 'print',
								 className: '',
								 title: '',
								//  autoPrint: false,
								 customize: function ( win ) {
										 $(win.document.body)
												 .css( 'font-size', '10pt' )
												 .prepend(
														 '<h4>Title Test</h4>',
                           //  Background table picture in print version is here
														 '<img src="http://i.imgur.com/w931ov4.png" style="position: fixed;  top: 50%;  left: 50%;  transform: translate(-50%, -50%);" />'	
												 );

										 $(win.document.body).find( 'table' )
												 .addClass( 'compact' )
												 .css( 'font-size', 'inherit');
								 }
						 },
						 {
							 text: '<span style="color:#4d4d4d; margin-right:15px">Excel<span>',
							 extend: 'excelHtml5',
						 },
						 {
							 text: '<span style="color:#4d4d4d; margin-right:15px">Csv<span>',
							 extend: 'csvHtml5',
						 },
						 {

							 text: '<span style="color:#4d4d4d; margin-right:15px">Copy<span>',
							 extend: 'copyHtml5',

						 },
				 ]
				});
			});
//-->	
</script>

<script type="text/javascript">
//<!--
/* modal */
$(document).ready(function(){
		activeItem('마이 페이지');
		showExtendedMenu('#nav_mypage');
		activeSubItem('빅데이터 분석',0);
	    /* $("#viewstart").on(
				"click",
				function(event){
					showDetail();
				}); */
	    $('#modal1').modal();
		$('#modal2').modal();
	});
	
	//상세보기 버튼 클릭시 동작(모달)
	// 신청 정보 
	function showDetail(SERV_ID){
		$.ajax({
		    type : "post",
		    url : "/appli/getDetailInfoList.do",
		    data:{
		    	appliId:SERV_ID
		    },
		    //dataType : "json",
		    error : function(data){
		        alert('상세정보 조회를 실패하셨습니다.');
		    },
		    success : function(data){
		    	detailInfo(data,SERV_ID);
		    	$('#modal1').modal('open');
		    }
		});
	}
	
	function detailInfo(data,appliId){
		$('#app_title').text("신청번호 " + appliId);
		$('#app_date').text(data.APP_DATE);	// APP_DATE: 2019-07-17 17:59:50
		$('#app_name').text(data.NAME);
		$('#modified_date').text(data.MODIFIED_DATE);	// MODIFIED_DATE: 2019-07-17 17:59:50
		
		// 일정정보
		$('#serv_date').text(data.SERV_DATE);	// 서비스 제공일 SERV_DATE: 2019-07-25 20:30:00
		
		// 현장정보
		$('#address').text(data.ADDRESS);	// 주소 ADDRESS: "서울 서초구 서초대로46길 3"
		$('#address_detail').text(data.ADDRESS_DETAIL);	// ADDRESS_DETAIL: "앤코앙23호"
		$('#interior_yn').text(data.INTERIOR_YN);	// INTERIOR_YN: "Y"
		$('#parking_yn').text(data.PARKING_YN);	// PARKING_YN: "Y"
		$('#elevator_yn').text(data.ELEVATOR_YN);	// ELEVATOR_YN: "Y"
		$('#discharge_yn').text(data.DISCHARGE_YN);	// DISCHARGE_YN: "Y"
		$('#cooking_yn').text(data.COOKING_YN);	// COOKING_YN: "Y"
		
		//참석자정보
		$('#participant').text(data.PARTICIPANT+" 명");	// 참가인원 PARTICIPANT: 100
		$('#per_bud').text(data.PER_BUD+" 원");	// 1인당 금액 PER_BUD: "30,000"
		var str_per_bud = data.PER_BUD;
		var int_per_bud = str_per_bud.replace(",","");
		var total = data.PARTICIPANT * int_per_bud;
		total = numbeComma(total);
		$('#per_totalbud').text(total+" 원");
		
		$('#age_max').text(data.AGE_MAX);	// AGE_MAX: 60
		$('#age_min').text(data.AGE_MIN);	// AGE_MIN: 26
		$('#age_minmax').text(data.AGE_MIN+" ~ "+data.AGE_MAX+" 세");
		var men = data.PER_MEN * 10
		$('#per_men').text(men+" %");	// 남자성비 PER_MEN: 3
		var women = (10 - data.PER_MEN) * 10;
		$('#per_women').text(women+" %");	// 남자성비 PER_MEN: 3
		
		//행사정보
		$('#serv_type_code').text(data.SERV_TYPE_NAME);	//진행(서비스)형식 타입코드 SERV_TYPE_CODE: "SER0000010"
		$('#event_type_code').text(data.EVENT_TYPE_NAME);	// 행사형식코드 EVENT_TYPE_CODE: "EVT0000010"
		$('#coordinator_yn').text(data.COORDINATOR_YN);	// 코디네이터 COORDINATOR_YN: "Y"
		$('#tableware_yn').text(data.TABLEWARE_YN);	// 추가식기 TABLEWARE_YN: "Y"
		$('#dessert_yn').text(data.DESSERT_YN);	// 후식 DESSERT_YN: "Y"
	
		// 추가요청사항
		$('#requested_team').text(data.REQUESTED_TERM);	// REQUESTED_TERM: "추가 요청사항은 없습니다."
		
		$('#customer_id').text(data.CUSTOMER_ID);	// CUSTOMER_ID: "gggggg"
		$('#serv_id').text(data.SERV_ID);	// SERV_ID: "S190717-0001"
		
		// 업체정보
		var sugglist = data.suggInfo;
		
		var suggListHead = "";
		var suggListBody = "";
		if(sugglist.length != 0){
			$('#suggListNull').css('display','none');
			$('#suggListNotNull').css('display','block');
				suggListHead += "<tr>";
				suggListHead += "<th>제안일</th>";
				suggListHead += "<th>업체명</th>";
				suggListHead += "<th>업체평점</th>";
				suggListHead += "<th>제안금액</th>";
				suggListHead += "<th>채택여부</th>";
				suggListHead += "<th>메뉴상세</th>";
				suggListHead += "</tr>";
				sugglist.forEach((function(suggMap,i){
				var suggTotal = suggMap.PER_BUD * data.PARTICIPANT;
				suggListBody += "<tr>" +
							"<td>" +suggMap.SUGG_DATE+ "</td>"+
							"<td>" +suggMap.NAME+"</td>";
							if (suggMap.AVGSCORE != undefined) {
				suggListBody +=	"<td>" +suggMap.AVGSCORE+"</td>";
							} else {
				suggListBody +=	"<td>평점 없음</td>";
							}
				suggListBody += "<td>" +suggMap.PER_BUD+" 원"+"</td>"+
								"<td>" +suggMap.CHOOSE_YN+ "</td>" +
								"<td><a class=\"waves-effect waves-light btn-small\" style=\"border-radius: 25px;\"" +
								" onclick=\"openmenu('"+suggMap.SUGG_ID+"','"+suggTotal+"','"+suggMap.SERV_ID+"');\">보기</a></td>" +
							
								"</tr>";
			}))
			
			$('#sugg_info_head').html(suggListHead);
			$('#sugg_info_body').html(suggListBody);
			
		} else {
			$('#suggListNull').css('display','block');
			$('#suggListNotNull').css('display','none');
		}
		
	}
		
	function createtable(){
		return '<li class="collection-item dismissable" id="li_menu" align="center">'
		+'<span class="width-100" style="font-size: 20px">제안 메뉴</span>'
		+'</li>'
		+'<li class="collection-item dismissable" id="li_menu">'
		+'<br>'
		+'<p class="secondary-content">'
		+'<table class="highlight centered">'
		+'<thead>'
		+'<tr>'
		+'<th>메뉴명</th>'
		+'<th>1 인분당 중량(g)</th>'
		+'<th>메뉴 사진</th>'
		+'<th>메뉴 설명</th>'
		+'</tr>'
		+'</thead>'
		+'<tbody id="menu_info">'
		+'</tbody>'
		+'</table>'
		+'</p>'
		+'</li>';
	}
	
	function openmenu(SUGG_ID, TOTAL, SERV_ID){
		$.ajax({
		    
		    type : "post",
		    url : "/appli/get-menu-info.do",
		    data:{
		    	suggId:SUGG_ID,
		    },
		    dataType : "json",
		    error : function(data){
		        alert('업로드에 실패했습니다.');
		    },
		    success : function(data){
		    	var li = "";
		    	li += createtable();
		    	$('#ul_payment').html(li);
		    	var menuBody = "";
		    	data.forEach((function(e,i){
					menuBody += "<tr>";
					menuBody += "<td>" +e.NAME+ "</td>";
					menuBody += "<td>" +numbeComma(e.WEIGHT)+ "</td>";
					menuBody += "<td>" 
						+ "<img alt='' src='/file/file-down/" 
						+ e.FILE_ID
						+ "' width='75px' height='75px'>"
						+ "</td>";
					menuBody += "<td>" +e.EXPLANATION+ "</td>";
					
					menuBody += "</tr>";
				}));
				$('#menu_info').html(menuBody);
				$('#modal2').modal('open');
		    }     
		});
	}
	
	
	
	function createHeader(data){
		return '<li class="collection-header" style="background-color: #eee">'
			 + '<h6 class="task-card-title mb-3" style="text-align: center;">'
			 + data
			 +'</h6>'
			 +'</li>';
	}

	function createBody(title,content){
		return '<li class="collection-item dismissable">'
			 + '<span class="width-100" style="font-size: 14px">'
			 + title
			 +'</span>'
			 + '<span class="secondary-content">'
			 + content
			 +'</span>'
			 + '</li>';
	}
	
	function numbeComma(number) {
	    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
//-->
</script>
<%@include file="/include/footer.jsp" %>
</body>
</html> 