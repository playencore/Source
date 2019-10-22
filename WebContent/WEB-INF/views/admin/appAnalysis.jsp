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
		           <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1" aria-label="Name: activate to sort column ascending">신청 아이디</th>
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
						<td onclick="showDetail('${servinfo.SERV_ID}')">${servinfo.SERV_ID}</td>
						<c:if test="${empty ALLSERVINFO}">
						<div class="col m12" style="border: 1px solid #eeeeee; margin-bottom: 20px;">
							<ul class="collection with-header">
								<li class="collection-header">
									<h5 class="task-card-title mb-3" style="text-align: center;">
										조회된 내용이 없습니다.
									</h5>
								</li>
							</ul>
						</div>
						</c:if>
						<td><a id="viewstart" class='modal-close waves-effect waves-green btn-flat'>${servinfo.CUSTOMER_ID}</a></td>
						<td>${((servinfo.REVIEW.MENU_SCORE)+(servinfo.REVIEW.PRICE_SCORE)+(servinfo.REVIEW.SERV_SCORE)+(servinfo.REVIEW.RECOMMAND))/4}</td>
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
<!-- List2 -->

<div class="col m12 center"></div>
<div id="modal1" class="modal modal-fixed-footer">
	<div class="modal-content">
		<ul class="collection with-header">
			<li class="collection-header">
				<h5 class="task-card-title mb-3" style="text-align: right;" id="sugg_title">
				</h5>
				<p class="task-card-date" style="text-align: right;" id="sugg_date"></p>
			</li>
			<li class="collection-item dismissable">
				<span class="width-100" style="font-size: 14px">제안한 회사</span>
				<span class="secondary-content"><span id="sup_name"></span></span>
			</li>
			<li class="collection-item dismissable">
				<span class="width-100" style="font-size: 14px">상태</span>
				<span class="secondary-content"><span class="" id="choose_yn"></span></span>
			</li>
		</ul>
		<ul class="collection with-header">
			<li class="collection-header" style="background-color: #eee">
				<h6 class="task-card-title mb-3" style="text-align: center;">
					채택한 제안 내용
				</h6>
			</li>
			<li class="collection-item dismissable">
				<span class="width-100" style="font-size: 14px">1인당 제안 금액</span>
				<span  class="secondary-content"><span id="per_bud"></span></span>
			</li>
			<li class="collection-item dismissable" id="li_menu" style="display: none">
				<span class="width-100" style="font-size: 14px">제안 메뉴</span>
				<br>
				<p class="secondary-content">
					<table class="highlight centered">
						<thead>
						<tr>
							<th>메뉴명</th>
							<th>1 인분당 중량(g)</th>
							<th>메뉴 사진</th>
						</tr>
						</thead>
						<tbody id="menu_info">
						</tbody>
					</table>
				</p>
			</li>
		</ul>
	</div>
	<div class="modal-footer">
		<a href="#!" class="modal-close waves-effect waves-green btn-flat">닫기</a>
	</div>
</div>
<div id="modal2" class="modal2 modal-fixed-footer">
	<div class="modal-footer">
		<a href="#!" class="waves-effect waves-green btn-flat" onclick="window.location.reload()">확인</a>
	</div>
</div>
<br><br><br><br><br><br><br><br><br><br>
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
			

/* modal */
$(document).ready(function(){
		activeItem('마이 페이지');
		showExtendedMenu('#nav_mypage');
		activeSubItem('판매자 조회', 0);
		activeSubItem('판매자 승인/반려',0);
		activeSubItem('빅데이터 분석',1);
	    $("#viewstart").on(
				"click",
				function(event){
					suggInfo();
				});
	    //$('.modal').modal();
		//$('.modal2').modal();
	    setModal(data);
	});
	
	//상세보기 버튼 클릭시 동작(모달)
	// 신청 정보 
	function suggInfo(SERV_ID){
		$.ajax({
		    type : "post",
		    url : "/appli/getDetailInfoList.do",
		    data:{
		    	appliId:SERV_ID
		    },
		    dataType : "json",
		    error : function(data){
		        alert('상세정보 조회를 실패하셨습니다.');
		    },
		    success : function(data){
		    	updateUi(data,SERV_ID);
		    	showcompany(data);
				
		    	//$('.modal').modal('open');
		    }
		});
	}
	
	function updateUi(data,appliId){
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
		
	}

	// 채택된 판매자 정보
	function showcompany(data){
		var cards = "" ;	
		if(Object.keys(data).length == 0){
			cards = cards+ "데이터가 없습니다.";
		}
		for(var i = 0 ; i < Object.keys(data).length ; i++){
			cards = cards 
			+"<div class='card col s6'>"
			+ "<div class='card-content black-text'>"
			+	"<span class='card-title'>"
			+    data[i].COMPANYNAME
			+     "</span>"
			+	"<p>"
			+		"판매자 이름 : "+data[i].NAME+" <br>"
			+		"판매자 아이디 : "+data[i].MEM_ID+" <br>"
			+		"판매자 사업자 등록번호 : "+data[i].REGIST_NUM+" <br>"
			+	"</p>"
			+"</div>"
			+"<div class='card-action'>"
			+	"<a class = 'waves-effect waves-light modal-trigger' href='#resultModal"+i+"' >상세보기</a>"
			+"</div>"
			+"</div>"
			+"<div class = 'modallist'>"
			+"<div id='resultModal"+i+"' class='modal'>"
			+	"<div class='modal-content'>"
			+		"<ul class = 'collection with-header'>"
			+			"<li class='collection-header' style='background-color: #eee'>"
			+				"<h6 class='task-card-title mb-3' style='text-align: center'>"
			+					"-업체 상세보기-"
			+				"</h6>"
			+			"</li>"
			+			"<li class='collection-item dismissable'>"
			+				"<span class='width-100' style='font-size: 14px'>"
			+					"판매자 이름"
			+				"</span>"
			+				"<span class='secondary-content'>"
			+					data[i].NAME
			+				"</span>"
			+			"</li>"
			+			"<li class='collection-item dismissable'>"
			+				"<span class='width-100' style='font-size: 14px'>"
			+					"판매자 아이디"
			+				"</span>"
			+				"<span class='secondary-content'>"
			+					data[i].MEM_ID
			+				"</span>"
			+			"</li>"
			+			"<li class='collection-item dismissable'>"
			+				"<span class='width-100' style='font-size: 14px'>"
			+					"판매자 전화번호"
			+				"</span>"
			+				"<span class='secondary-content'>"
			+					data[i].TEL
			+				"</span>"
			+			"</li>"
			+			"<li class='collection-item dismissable'>"
			+				"<span class='width-100' style='font-size: 14px'>"
			+					"판매자 이메일"
			+				"</span>"
			+				"<span class='secondary-content'>"
			+					data[i].EMAIL
			+				"</span>"
			+			"</li>"
			+			"<li class='collection-item dismissable'>"
			+				"<span class='width-100' style='font-size: 14px'>"
			+					"판매자 주소"
			+				"</span>"
			+				"<span class='secondary-content'>"
			+					data[i].ADRESS
			+				"</span>"
			+			"</li>"
			+			"<li class='collection-item dismissable'>"
			+				"<span class='width-100' style='font-size: 14px'>"
			+					"판매자 상세주소"
			+				"</span>"
			+				"<span class='secondary-content'>"
			+					data[i].ADDRESS_DETAIL
			+				"</span>"
			+			"</li>"
			+			"<li class='collection-item dismissable'>"
			+				"<span class='width-100' style='font-size: 14px'>"
			+					"가입날짜"
			+				"</span>"
			+				"<span class='secondary-content'>"
			+					data[i].JOIN_DATE
			+				"</span>"
			+			"</li>"
			+			"<li class='collection-item dismissable'>"
			+				"<span class='width-100' style='font-size: 14px'>"
			+					"판매자 생년월일"
			+				"</span>"
			+				"<span class='secondary-content'>"
			+					data[i].BIRTH_DATE
			+				"</span>"
			+			"</li>"
			+			"<li class='collection-item dismissable'>"
			+				"<span class='width-100' style='font-size: 14px'>"
			+					"판매자 성별"
			+				"</span>"
			+				"<span class='secondary-content'>"
			+					data[i].GENDER
			+				"</span>"
			+			"</li>"
			+			"<li class='collection-item dismissable'>"
			+				"<span class='width-100' style='font-size: 14px'>"
			+					"판매자 사업자 등록 번호"
			+				"</span>"
			+				"<span class='secondary-content'>"
			+					data[i].REGIST_NUM
			+				"</span>"
			+			"</li>"
			+			"<li class='collection-item dismissable'>"
			+				"<span class='width-100' style='font-size: 14px'>"
			+					"판매자 회사 이름"
			+				"</span>"
			+				"<span class='secondary-content'>"
			+					data[i].COMPANYNAME
			+				"</span>"
			+			"</li>"
			+			"<li class='collection-item dismissable'>"
			+				"<span class='width-100' style='font-size: 14px'>"
			+					"판매자 회사 소개"
			+				"</span>"
			+				"<span class='secondary-content'>"
			+					data[i].EXPLANATION
			+				"</span>"
			+			"</li>"
			+			"<li class='collection-item dismissable'>"
			+				"<span class='width-100' style='font-size: 14px'>"
			+					"판매자 회사 최소 수용인원"
			+				"</span>"
			+				"<span class='secondary-content'>"
			+					data[i].MINUMUM_SEATING
			+				"</span>"
			+			"</li>"
			+			"<li class='collection-item dismissable'>"
			+				"<span class='width-100' style='font-size: 14px'>"
			+					"판매자 회사 최대 수용인원"
			+				"</span>"
			+				"<span class='secondary-content'>"
			+					data[i].MAXiMUM_SEATIN
			+				"</span>"
			+			"</li>"
			+		"</ul>"
			+	"</div>"
			+	"<div class='modal-footer'>"
			+		"<a href='#!' class='modal-close waves-effect waves-green btn-flat'>창닫기</a>"
			+	"</div>"
			+"</div>"
			+"</div>" ;
		}
		$("#showcard").html(cards);
	}
	
	function setModal(data){
		for(var i = 0 ; i<Object.keys(data).length ; i++){
			$('#resultModal'+i).modal();
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
	
	function numbeComma(number) {
	    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
//-->
</script>
<%@include file="/include/footer.jsp" %>
</body>
</html>