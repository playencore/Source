<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/js/serv/application.js"></script>
	
	<!-- 섹션 타이틀 -->
	<div class="container" style="background-color: white;margin-top:2px;">
		
		<div class="row">
			<div class="col m12">
				<div class="section">
					<h5>
						서비스 신청
						<small id="sub_title"> 기본정보 입력</small>
						<small style="float: right;"> * 는 필수입력 사항입니다.</small>
					</h5>
					<div class="divider"></div>
				</div>
			</div>
		</div>
		<form action="/service/result.do" method="post" name="dForm">
			<div class="row" id="step1_1">
				<div class="col m1"></div>
				<div class="col m11">
					<h5 style="margin-bottom: 50px">행사장위치 입력</h5>
					
					<div class="row" style="margin-bottom: 0px;">
						<div class="col s1"></div>
						<div class="col m10" style="padding-right: 0px">
							
							<div class="row" id="sec_addr" style="margin-bottom: 0px;">
								<div class="col m9">
									<div class="input-field">
										<input type="hidden" id="zipcode" name="zipcode">
										<input readonly="readonly" value="검색 버튼을 눌러주세요." id="addr" name="addr" type="text" class="validate">
					          			<label for="addr" style="font-size: 30px;line-height:0.5px;font-weight: bold;">행사 위치*</label>
				          			</div>
			          			</div>
			          			<div class="col m3">
			          				<a class="btn waves-effect waves-light " style="margin-top:1.5rem;" onclick="daumPostcode()" id="btn_addr">주소 검색</a>
			          			</div>
			          			<div class="col m9">
				          			<div class="input-field">
										<input id="addr2" name="addr2" type="text" class="validate" data-length="50">
							         	<label for="addr2" style="font-size: 25px;line-height:0.5px;font-weight: bold;">상세주소*</label>
						         	</div>
			          			</div>
		          			</div>
		          			
		          			<div class="row" id="sec_postcode" style="margin-bottom: 0px;">
		          				<div class="col m10">
		          					  <div id="wrap" style="display:none;height:300px;position:relative">
						                  <img src="http://t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
						               </div>
		          				</div>
		          			</div>
		          			
						</div>
		          		<div class="col m1"></div>
					</div>
				</div>
			</div>
			
			<div class="row" id="step1_2">
				<div class="col m1"></div>
				<div class="col m11">
				<h5 style="margin-bottom: 10px">행사일시 입력</h5>
					<div class="row" >
						<div class="col m1"></div>
						<div class="col m8">
							<div class="card " style="background-color: #f1f1f0">
								<i class="fal fa-comment-alt-exclamation"></i>
						        <div class="card-action">
						     	   서비스는 최소 7일의 준비기간이 필요합니다.
						        </div>
						      </div>
						</div>
						<div class="col m2"></div>
					</div>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m4" style="padding-right: 0px">
									<div class="input-field">
										<input id="serv_date" name="serv_date" type="text" class="datepicker" readonly="readonly">
							         	<label for="serv_date" style="font-size: 25px;line-height:0.5px;font-weight: bold;">행사 일자*</label>
						         	</div>
								</div>
								<div class="col m1" style="padding-right: 0px">
								</div>
								<div class="col m4" style="padding-right: 0px">
									<div class="input-field">
										<input id="serv_time" name="serv_time" type="text" class="timepicker" readonly="readonly">
							         	<label for="serv_time" style="font-size: 25px;line-height:0.5px;font-weight: bold;">행사 시간*</label>
						         	</div>
								</div>
								<div class="col m3">
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- step 2 -->
			<div class="row" id="step2_1" style="display:none">
				<div class="col m1"></div>
				<div class="col m11">
					<h5 style="margin-bottom: 3px">참가자 정보*</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m2" style="padding-right: 0px">
									<div class="input-field" style="margin-top:30px;margin-right:20px;">
										<input id="participant" type="number" class="validate" name="participant">
										<label for="participant">참여 인원</label>
									</div>
								</div>
								<div class="col m3" style="padding-right: 10px;margin-right:20px;">
									<p>남성 비율</p>
								    <div id="percent"></div>
								    <input type="hidden" name="percent" >
								</div>
								<div class="col m4">
									<p>참가자 연령(최소 ~ 최대)</p>
								    <div id="age"></div>
								    <input type="hidden" name="age_min" >
								    <input type="hidden" name="age_max" >
								</div>
							</div>
						</div>
					</div>
					<div class="row"  style="margin-bottom: 0px;" id="age_range">
						
					</div>
				</div>
			</div>
			<div class="row" id="step2_2" style="display:none">
				<div class="col m1"></div>
				<div class="col m11">
					<h5 style="margin-bottom: 25px">행사 형식*</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m11" style="padding-right: 0px">
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('serv_type')" name="serv_type" value="SER0000010"/>
									        <span>개인 행사</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('serv_type')" name="serv_type" value="SER0000020"/>
									        <span>사교 모임</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('serv_type')" name="serv_type" value="SER0000030"/>
									        <span>리셉션</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('serv_type')" name="serv_type" value="SER0000040"/>
									        <span>기업 행사</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('serv_type')" name="serv_type" value="SER0000050"/>
									        <span>학교 행사</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('serv_type')" name="serv_type" value="SER0000090"/>
									        <span>기타</span>
									    </label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row" id="step2_3" style="display:none">
				<div class="col m1"></div>
				<div class="col m11">
					<h5 style="margin-bottom: 25px">진행 형식*</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m11" style="padding-right: 0px">
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('event_type')" name="event_type" value="EVT0000010"/>
									        <span>뷔페</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('event_type')" name="event_type" value="EVT0000020"/>
									        <span>코스 음식</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('event_type')" name="event_type" value="EVT0000030"/>
									        <span>드랍오프</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('event_type')" name="event_type" value="EVT0000040"/>
									        <span>도시락</span>
									    </label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row" id="step3_1" style="display:none">
				<div class="col m1"></div>
				<div class="col m11">
					<h5 style="margin-bottom: 25px">선호 메뉴*</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m11" style="padding-right: 0px">
									<span>대분류</span><br>
										<div class="chip">
											<label>
									        	<input type="radio" onchange="changeColorByRadio('cb_menu_typeL')" name="cb_menu_typeL" value="L01"/>
									        	<span>한식</span>
									    	</label>
										</div>
										<div class="chip">
											<label>
										        <input type="radio" onchange="changeColorByRadio('cb_menu_typeL')" name="cb_menu_typeL" value="L02"/>
										        <span>일식</span>
										    </label>
										</div>
										<div class="chip">
											<label>
										        <input type="radio" onchange="changeColorByRadio('cb_menu_typeL')" name="cb_menu_typeL" value="L03"/>
										        <span>중식</span>
										    </label>
										</div>
										<div class="chip">
											<label>
										        <input type="radio" onchange="changeColorByRadio('cb_menu_typeL')" name="cb_menu_typeL" value="L04"/>
										        <span>웨스턴</span>
										    </label>
										</div>
										<div class="chip">
											<label>
										        <input type="radio" onchange="changeColorByRadio('cb_menu_typeL')" name="cb_menu_typeL" value="L05"/>
										        <span>퓨전</span>
										    </label>
										</div>
									<br><br>
									<span>중분류</span><br>
										<div class="chip">
											<label>
										        <input type="radio" onchange="changeColorByRadio('cb_menu_typeM')" name="cb_menu_typeM" value="M01"/>
										        <span>육류</span>
										    </label>
										</div>
										<div class="chip">
											<label>
										        <input type="radio" onchange="changeColorByRadio('cb_menu_typeM')" name="cb_menu_typeM" value="M02"/>
										        <span>해산물</span>
										    </label>
										</div>
										<div class="chip">
											<label>
										        <input type="radio" onchange="changeColorByRadio('cb_menu_typeM')" name="cb_menu_typeM" value="M03"/>
										        <span>밥류</span>
										    </label>
										</div>
										<div class="chip">
											<label>
										        <input type="radio" onchange="changeColorByRadio('cb_menu_typeM')" name="cb_menu_typeM" value="M04"/>
										        <span>면류</span>
										    </label>
										</div>
										<div class="chip">
											<label>
										        <input type="radio" onchange="changeColorByRadio('cb_menu_typeM')" name="cb_menu_typeM" value="M05"/>
										        <span>채소</span>
										    </label>
										</div>
										<div class="chip">
											<label>
										        <input type="radio" onchange="changeColorByRadio('cb_menu_typeM')" name="cb_menu_typeM" value="M06"/>
										        <span>두류</span>
										    </label>
										</div>
										<div class="chip">
											<label>
										        <input type="radio" onchange="changeColorByRadio('cb_menu_typeM')" name="cb_menu_typeM" value="M07"/>
										        <span>빵류</span>
										    </label>
										</div>
									<br><br>
									<span>소분류</span><br>
										<div class="chip">
											<label>
										        <input type="radio" onchange="changeColorByRadio('cb_menu_typeS')" name="cb_menu_typeS" value="S01"/>
										        <span>국류</span>
										    </label>
										</div>
										<div class="chip">
											<label>
										        <input type="radio" onchange="changeColorByRadio('cb_menu_typeS')" name="cb_menu_typeS" value="S02"/>
										        <span>볶음</span>
										    </label>
										</div>
										<div class="chip">
											<label>
										        <input type="radio" onchange="changeColorByRadio('cb_menu_typeS')" name="cb_menu_typeS" value="S03"/>
										        <span>찜</span>
										    </label>
										</div>
										<div class="chip">
											<label>
										        <input type="radio" onchange="changeColorByRadio('cb_menu_typeS')" name="cb_menu_typeS" value="S04"/>
										        <span>구이</span>
										    </label>
										</div>
										<div class="chip">
											<label>
										        <input type="radio" onchange="changeColorByRadio('cb_menu_typeS')" name="cb_menu_typeS" value="S05"/>
										        <span>튀김</span>
										    </label>
										</div>
										<div class="chip">
											<label>
										        <input type="radio" onchange="changeColorByRadio('cb_menu_typeS')" name="cb_menu_typeS" value="S06"/>
										        <span>날것(샌드위치)</span>
										    </label>
										</div>
									<br>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
			
			<div class="row" id="step3_2" style="display:none">
				<div class="col m1"></div>
				<div class="col m11">
					<h5 style="margin-bottom: 25px">후식 및 음료</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m11" style="padding-right: 0px">
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="cb_dessert_type" value="DRT0000010"/>
									        <span>디저트</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="cb_dessert_type" value="DRT0000020"/>
									        <span>음료류</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="cb_dessert_type" value="DRT0000030"/>
									        <span>커피류</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="cb_dessert_type" value="DRT0000040"/>
									        <span>주류</span>
									    </label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row" id="step3_3" style="display:none">
				<div class="col m1"></div>
				<div class="col m11">
					<h5 style="margin-bottom: 25px">1인당 예상 금액*</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m4" style="padding-right: 0px">
									<div class="input-field">
										<i class="fas fa-won-sign prefix"></i>
										<input id="per_bud" name="per_bud" type="number" class="validate" onkeyup="updateAmount(this)">
							         	<label for="per_bud" style="font-size: 25px;line-height:0.5px;font-weight: bold;">인당 금액</label>
						         	</div>
								</div>
								<div class="col m4">
									<div class="input-field">
										<input disabled value="" id="amount" type="text" class="validate" name="amount" placeholder=" ">
          								<label for="amount">총 액</label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row" id="step4_1" style="display:none">
				<div class="col m4"></div>
				<div class="col m8">
					<h5 style="margin-bottom: 25px">장소 정보*</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m11" style="padding-right: 0px">
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('loc_type')" name="loc_type" value="Y"/>
									        <span>실내</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('loc_type')" name="loc_type" value="N"/>
									        <span>실외</span>
									    </label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row" id="step4_2" style="display:none">
				<div class="col m4"></div>
				<div class="col m8">
					<h5 style="margin-bottom: 25px">취사 가능 여부*</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m11" style="padding-right: 0px">
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('cooking_yn')" name="cooking_yn" value="Y"/>
									        <span>가능</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('cooking_yn')" name="cooking_yn" value="N"/>
									        <span>불가능</span>
									    </label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row" id="step4_3" style="display:none">
				<div class="col m4"></div>
				<div class="col m8">
					<h5 style="margin-bottom: 25px">쓰레기 배출 가능 여부*</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m11" style="padding-right: 0px">
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('discharge_yn')" name="discharge_yn" value="Y"/>
									        <span>가능</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('discharge_yn')" name="discharge_yn" value="N"/>
									        <span>불가능</span>
									    </label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row" id="step4_4" style="display:none">
				<div class="col m4"></div>
				<div class="col m8">
					<h5 style="margin-bottom: 25px">엘레베이트 유무*</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m11" style="padding-right: 0px">
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('elev_yn')" name="elev_yn" value="Y"/>
									        <span>유</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('elev_yn')" name="elev_yn" value="N"/>
									        <span>무</span>
									    </label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row" id="step4_5" style="display:none">
				<div class="col m4"></div>
				<div class="col m8">
					<h5 style="margin-bottom: 25px">주차장 유무*</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m11" style="padding-right: 0px">
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('parking_yn')" name="parking_yn" value="Y"/>
									        <span>유</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('parking_yn')" name="parking_yn" value="N"/>
									        <span>무</span>
									    </label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row" id="step5_1" style="display:none">
				<div class="col m1"></div>
				<div class="col m11">
					<h5 style="margin-bottom: 25px">추가 식기</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m11" style="padding-right: 0px">
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="cb_tableware" value="TBW0000010"/>
									        <span>커틀러리</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="cb_tableware" value="TBW0000020"/>
									        <span>앞접시</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="cb_tableware" value="TBW0000030"/>
									        <span>일회용 컵</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="cb_tableware" value="TBW0000040"/>
									        <span>냅킨</span>
									    </label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row" id="step5_2" style="display:none">
				<div class="col m1"></div>
				<div class="col m11">
					<h5 style="margin-bottom: 25px">코디네이터 신청 여부</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m11" style="padding-right: 0px">
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('codi_yn')" name="codi_yn" value="Y"/>
									        <span>신청</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('codi_yn')" name="codi_yn" value="N"/>
									        <span>미신청</span>
									    </label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row" id="step5_3" style="display:none">
				<div class="col m1"></div>
				<div class="col m11">
					<h5 style="margin-bottom: 25px">기타 대여품</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m11" style="padding-right: 0px">
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="cb_addtion" value="RTL0000010"/>
									        <span>테이블</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="cb_addtion" value="RTL0000020"/>
									        <span>의자</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="cb_addtion" value="RTL0000030"/>
									        <span>천막</span>
									    </label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row" id="step6_1" style="display:none;line-height: 30px;">
				<div class="col m1"></div>
				<div class="col m11">
					<h5 style="margin-bottom: 25px">입력 정보</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m9" style="padding-right: 0px" id="req_data">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row" id="step6_2" style="display:none">
				<div class="col m1"></div>
				<div class="col m11">
					<h5 style="margin-bottom: 25px">추가 요청사항</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m9" style="padding-right: 0px">
									<div class="input-field">
										<textarea id="req_term" name="req_term" class="materialize-textarea" cols="30" rows="10" data-length="300"></textarea>
										<label for="req_term">추가 요청사항</label>
									</div>
								</div>
								<div class="col m3" style="padding-right: 0px">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 
				데이터 추가할 떄 기본 DIV
			<div class="row" id="step6_1" style="display:none">
				<div class="col m1"></div>
				<div class="col m11">
					<h5 style="margin-bottom: 25px">선호 메뉴</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m11" style="padding-right: 0px">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
 -->
			<!-- btn -->
			<input type="hidden" name="step" value="1"/>
			<div class="row" style="margin-top: 60px">
				<div class="col m1"></div>
				<div class="col m2" style="padding-right: 0px">
					<a class="waves-effect waves-light btn disabled" onclick="prev();return false;" id="btn_prev"><i class="fas fa-caret-left" style="margin-right: 7px; font-size: 14px"></i>이전</a>
				</div>
				<div class="col m6"></div>
				<div class="col m2" style="padding-right: 0px">
					<a class="waves-effect waves-light btn" href="#" onclick="javascript:next();return false;" id="btn_next">다음 <i class="fas fa-caret-right" style="margin-left: 5px; font-size: 14px"></i></a>
					<a class="waves-effect waves-light btn" href="#" onclick="javascript:formSubmit();return false;" id="btn_submit" style="display:none">신청하기 <i class="fas fa-caret-right" style="margin-left: 5px; font-size: 14px"></i></a>
				</div>
				<!-- <div class="col m1"></div> -->
			</div>
		</form>
		<div class="row" style="height:50px">
		</div>
	</div>
	<%@include file="/include/footer.jsp" %>
</body>
</html>
