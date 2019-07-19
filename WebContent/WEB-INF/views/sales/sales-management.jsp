<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" uri="http://charida.com/paging/ui" %>
<%@include file="/include/header.jsp" %>
<script src="/js/chart/chart.js"></script>
<script type="text/javascript">
//<!--
var elems = null;
var instances = null;
var lineChart;
	
$(function(){
	activeItem('마이 페이지');
	showExtendedMenu('#nav_mypage');
	activeSubItem('매출 관리',0);
	activeItem('서비스 신청');
	
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

function getSaleInfo(){
	if(isNull($("#col_condition").val())){
		showToast("조회 조건을 선택해주세요.");
		return ;
	}
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
      responsive: true,
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
                  fontColor: "#fff"
               }
            }
         ]
      }
   };
	$.ajax({
	    
	    type : "post",
	    url : "/sales/sales-management/graph.do",
	    data:{
	    	startDate:$("#start_date").val()
	    	,endDate:$("#end_date").val()
	    	,colCondition:$("#col_condition").val()
	    },
	    dataType : "json",
	    error : function(data){
	        alert('상세정보 조회를 실패하셨습니다.');
	    },
	    success : function(data){
	    	var labelTxt = "[";
	    	var serieTxt = "[";
	    	data.forEach(function(e,i){
	    		labelTxt += "'"+e.DAY+"',";
	    		serieTxt += "'"+e.SUM_PAY+"',";
	    	});
	    	labelTxt += "]";
	    	serieTxt += "]";
	    	
	    	chartDatas = {
    		      labels: eval(labelTxt),
    		      datasets: [
    		         {
    		            label: "일별 매출",
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
    		         }/* ,
    		         {
    		            label: "Second dataset",
    		            data: [60, 20, 90, 80, 50, 85, 40],
    		            borderDash: [15, 5],
    		            backgroundColor: "rgba(128, 222, 234, 0.2)",
    		            borderColor: "#80deea",
    		            pointBorderColor: "#80deea",
    		            pointBackgroundColor: "#00bcd4",
    		            pointHighlightFill: "#80deea",
    		            pointHoverBackgroundColor: "#80deea",
    		            borderWidth: 2,
    		            pointBorderWidth: 2,
    		            pointHoverBorderWidth: 4,
    		            pointRadius: 4
    		         } */
    		      ]
    		   };
	    	var chartConfig = {
   		      type: "line",
   		      options: chartOptions,
   		      data: chartDatas
   		   };
   		   lineChart = new Chart(ctx, chartConfig);
   			getTable();
	    }     
	});
}
function getTable(){
	$.ajax({
	    
	    type : "post",
	    url : "/sales/sales-management/table.do",
	    data:{
	    	startDate:$("#start_date").val()
	    	,endDate:$("#end_date").val()
	    	,colCondition:$("#col_condition").val()
	    },
	    dataType : "json",
	    error : function(data){
	        alert('상세정보 조회를 실패하셨습니다.');
	    },
	    success : function(data){
	    	var table="";
	    	data.forEach(function(e,i){
	    		table +="<tr>";
	    		table +="<td>" +e.PAY_DATE+"</td>";
	    		table +="<td>￦ " +numbeComma(e.AMOUNT)+"</td>";
	    		table +="<td>￦ " +numbeComma(e.VAT)+"</td>";
	    		table +="<td>￦ " +numbeComma(e.RATIO)+"</td>";
	    		table +="<td>￦ " +numbeComma(e.SUPPLY_PAYMENT)+"</td>";
	    		table +="</tr>";
	    	});
	    	$('#tby_result').html(table);
	    }
	});
}
function numbeComma(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
function showToast(msg){
	 M.toast({html: msg, classes: 'rounded',displayLength:3000});
	 $('#toast-container').css({left:(window.outerWidth - $('#toast-container').width())/2});
}
//-->
</script>
<div class="container" style="margin-top:0;margin-bottom: 30px" >
	<div class="row">
		<div class="col m12" style="background-color: white;">
			<div class="row">
				<div class="col m12" style="border: 1px solid #eeeeee">
					<h5 style="margin-bottom: 30px">매출 관리</h5>
				</div>
				<div class="col m12 center" >
					<div class="input-field" style="display: inline-block;width: 10%;padding-right: 10px">
					    <select name="col_condition" id ="col_condition">
					      <option value="" disabled selected>조회 조건</option>
					      <option value="1">일 별</option>
					      <option value="2">월 별</option>
					    </select>
					  </div>
					검색 기간  : 
					<div class="input-field" style="display: inline-block;width: 8%;">
						<input id="start_date" name="start_date" type="text" class="datepicker" readonly="readonly">
		         	</div>
		         	~ 
		         	<div class="input-field" style="display: inline-block;width: 8%;">
						<input id="end_date" name="end_date" type="text" class="datepicker2" readonly="readonly">
		         	</div>
		         	<div class="input-field" style="display: inline-block;width: 8%;">
		         		<a class="waves-effect waves-light btn" onclick="getSaleInfo()">검색</a>
		         	</div>
				</div>
				<div class="col m12" style="padding: 8px;">
			         <div class="card animate fadeUp" style="overflow: hidden;">
			            <div class="card-move-up waves-effect waves-block waves-light">
			               <div class="move-up cyan darken-1">
			                  <div>
			                     <span class="chart-title white-text">매출 그래프</span>
			                     
			                  </div>
			                  <div class="trending-line-chart-wrapper" ><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div><canvas id="revenue-line-chart" height="350" width="942" class="chartjs-render-monitor" style="display: block; height: 350px; width: 754px;"></canvas></div>
			               </div>
			            </div>
			            <div class="card-content" style="height: 90px">
			               <a class="btn-floating btn-move-up waves-effect waves-light red accent-2 z-depth-4 right">
			                  <i class="material-icons activator">filter_list</i>
			               </a>
			               <!-- <div class="col s12 m3 l3">
			                  <div id="doughnut-chart-wrapper"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
			                     <canvas id="doughnut-chart" height="135" width="202" class="chartjs-render-monitor" style="display: block; height: 108px; width: 162px;"></canvas>
			                     <div class="doughnut-chart-status">
			                        <p class="center-align font-weight-600 mt-4">4500</p>
			                        <p class="ultra-small center-align">Sold</p>
			                     </div>
			                  </div>
			               </div>
			               <div class="col s12 m2 l2">
			                  <ul class="doughnut-chart-legend">
			                     <li class="mobile ultra-small"><span class="legend-color"></span>Mobile</li>
			                     <li class="kitchen ultra-small"><span class="legend-color"></span> Kitchen</li>
			                     <li class="home ultra-small"><span class="legend-color"></span> Home</li>
			                  </ul>
			               </div>
			               <div class="col s12 m5 l6">
			                  <div class="trending-bar-chart-wrapper"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div><canvas id="trending-bar-chart" height="131" width="441" class="chartjs-render-monitor" style="display: block; height: 105px; width: 353px;"></canvas></div>
			               </div> -->
			            </div>
			            <div class="card-reveal" style="display: none; transform: translateY(0%);">
			               <span class="card-title grey-text text-darken-4">매출 전표<i class="material-icons right">close</i>
			               </span>
			               <table class="responsive-table">
			                  <thead>
			                     <tr>
			                        <th data-field="id">완료일시</th>
			                        <th data-field="month">결제 금액</th>
			                        <th data-field="item-sold">부가가치세</th>
			                        <th data-field="item-price">수수료</th>
			                        <th data-field="total-profit">매출 금액</th>
			                     </tr>
			                  </thead>
			                  <tbody id = "tby_result">
			                     <tr>
			                        <td>2019-01-01</td>
			                        <td>￦ 3,999,1000</td>
			                        <td>￦ 120,000</td>
			                        <td>￦ 123,123</td>
			                        <td>￦ 2,898,123</td>
			                     </tr>
			                  </tbody>
			               </table>
			            </div>
			         </div>
			      </div>
			</div>
		</div>
	</div>
</div>
<%@include file="/include/footer.jsp" %>