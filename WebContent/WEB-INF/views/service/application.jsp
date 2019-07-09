<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html  lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>단 하나의 서비스 - 차리다</title>
	<!-- css -->
  	<link rel="stylesheet" href="/css/materialize.css">
  	<link rel="stylesheet" href="/css/free.css">
  	<link rel="stylesheet" href="/css/free-v4-shims.css">
  	<link rel="stylesheet" href="/css/nouislider.css">
  	
    <style media="screen">
      @font-face {
        font-family: NanumSquareR;
        src: url(/charida2/fonts/NanumSquareR.woff) format('woff');
      }

      @font-face {
          font-family: NanumSquareL;
          src: url(/fonts/NanumSquareL.woff) format('woff');
      }

      @font-face {
          font-family: NanumSquareB;
          src: url(../fonts/NanumSquareB.woff) format('woff');
      }
      .page-header {
        padding-bottom: 9px;
        margin: 40px 0 20px;
        border-bottom: 1px solid #eee;
      }
      body{
         font-family: NanumSquareB, sans-serif;
      }
      small{
        color:#cccccc;
      }
      h5{
        margin-bottom: 1em;
      }
      [type="checkbox"]:checked + span:not(.lever):before {
		    top: -4px;
		    left: -5px;
		    width: 12px;
		    height: 22px;
		    border-top: 2px solid transparent;
		    border-left: 2px solid transparent;
		    border-right: 2px solid #ca284d;
		    border-bottom: 2px solid #ca284d;
		    -webkit-transform: rotate(40deg);
		    transform: rotate(40deg);
		    -webkit-backface-visibility: hidden;
		    backface-visibility: hidden;
		    -webkit-transform-origin: 100% 100%;
		    transform-origin: 100% 100%;
	  }
	  [type="radio"]:checked + span:after, [type="radio"].with-gap:checked + span:after {
		    background-color: #ca284d;
	  }
    </style>
    <!-- css -->
	<!--js-->
	<!-- <script src="https://kit.fontawesome.com/0ad913ff34.js"></script> -->	
	<script src="/js/jquery-3.4.1.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="/js/materialize.js"></script>
	<script type="text/javascript" src="/js/moment.min.js"></script>
	<script type="text/javascript" src="/js/nouislider.js"></script>
	<script type="text/javascript" src="/js/serv/application.js"></script>
</head>
<body style="background-color: #dfdfdd6b">
	<!-- 네비게이션 바-->
	<ul id="dropdown1" class="dropdown-content">
	  <li><a href="#!">드롭다운 메뉴1</a></li>
	  <li><a href="#!">드롭다운 메뉴2</a></li>
	  <li class="divider"></li>
	  <li><a href="#!">드롭다운 메뉴3</a></li>
	</ul>
	<nav>
	  <div class="nav-wrapper" style="background-color:#007bff;">
	    <a href="#!" class="brand-logo">차리다</a>
	    <ul class="right hide-on-med-and-down">
	      <li><a href="sass.html">서비스 신청</a></li>
	      <li><a href="badges.html">다른거</a></li>
	      <!-- Dropdown Trigger -->
	      <li><a class="dropdown-button" href="#!" data-activates="dropdown1">드롭다운 메뉴<i class="fas fa-chevron-down" style="margin-left: 5px; font-size: 10px"></i></a></li>
	    </ul>
	  </div>
	</nav>
	<!-- 네비게이션 바-->
	
	<!-- 섹션 타이틀 -->
	<div class="container" style="background-color: white">
		
		<div class="row">
			<div class="col m12">
				<div class="section">
					<h5>서비스 신청 <small id="semi_title"> 기본정보 입력</small></h5>
					<div class="divider"></div>
				</div>
			</div>
		</div>
		<form action="" method="post">
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
					          			<label for="addr" style="font-size: 30px;line-height:0.5px;font-weight: bold;">행사 위치</label>
				          			</div>
			          			</div>
			          			<div class="col m3">
			          				<a class="btn waves-effect waves-light " style="margin-top:1.5rem;" onclick="daumPostcode()">주소 검색</a>
			          			</div>
			          			<div class="col m9">
				          			<div class="input-field">
										<input id="addr2" name="addr2" type="text" class="validate">
							         	<label for="addr2" style="font-size: 25px;line-height:0.5px;font-weight: bold;">상세주소</label>
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
										<input id="serv_date" name="serv_date" type="text" class="datepicker">
							         	<label for="serv_date" style="font-size: 25px;line-height:0.5px;font-weight: bold;">행사 일자</label>
						         	</div>
								</div>
								<div class="col m1" style="padding-right: 0px">
								</div>
								<div class="col m4" style="padding-right: 0px">
									<div class="input-field">
										<input id="serv_time" name="serv_time" type="text" class="timepicker">
							         	<label for="serv_time" style="font-size: 25px;line-height:0.5px;font-weight: bold;">행사 시간</label>
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
					<h5 style="margin-bottom: 3px">참가자 정보</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m2" style="padding-right: 0px">
									<div class="input-field" style="margin-top:30px;margin-right:20px;">
										<input id="participant" type="number" class="validate" name="participant">
										<label for="participant">참가자수</label>
									</div>
								</div>
								<div class="col m3" style="padding-right: 10px;margin-right:20px;">
									<p>여성 비율</p>
								    <div id="percent"></div>
								</div>
								<div class="col m4">
									<p>참가자 연령(최소 ~ 최대)</p>
								    <div id="age"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row" id="step2_2" style="display:none">
				<div class="col m1"></div>
				<div class="col m11">
					<h5 style="margin-bottom: 25px">서비스 형식</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m11" style="padding-right: 0px">
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="serv_type"/>
									        <span>개인 행사</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="serv_type"/>
									        <span>사교 모임</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="serv_type"/>
									        <span>리셉션</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="serv_type"/>
									        <span>기업 행사</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="serv_type"/>
									        <span>학교 행사</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="serv_type"/>
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
					<h5 style="margin-bottom: 25px">진행 형식</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m11" style="padding-right: 0px">
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('event_type')" name="event_type"/>
									        <span>개인 행사</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('event_type')" name="event_type"/>
									        <span>사교 모임</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('event_type')" name="event_type"/>
									        <span>리셉션</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('event_type')" name="event_type"/>
									        <span>기업 행사</span>
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
					<h5 style="margin-bottom: 25px">서비스 형태</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m11" style="padding-right: 0px">
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="menu_type"/>
									        <span>한정식</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="menu_type"/>
									        <span>핑거푸드</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="menu_type"/>
									        <span>웨스턴</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="menu_type"/>
									        <span>일식</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="menu_type"/>
									        <span>아시아 퓨전</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="menu_type"/>
									        <span>바베큐</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="menu_type"/>
									        <span>피자</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="menu_type"/>
									        <span>기타</span>
									    </label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
			
			<div class="row" id="step3_2" style="display:none">
				<div class="col m1"></div>
				<div class="col m11">
					<h5 style="margin-bottom: 25px">선호 메뉴</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m11" style="padding-right: 0px">
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="dessert_type"/>
									        <span>디저트</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="dessert_type"/>
									        <span>음료류</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="dessert_type"/>
									        <span>커피류</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="checkbox" onchange="changeColor(this)" name="dessert_type"/>
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
					<h5 style="margin-bottom: 25px">1인당 예상 금액</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m4" style="padding-right: 0px">
									<div class="input-field">
										<i class="fas fa-won-sign prefix"></i>
										<input id="addr2" name="addr2" type="number" class="validate" onkeyup="updateAmount(this)">
							         	<label for="addr2" style="font-size: 25px;line-height:0.5px;font-weight: bold;">인당 금액</label>
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
				<div class="col m1"></div>
				<div class="col m11">
					<h5 style="margin-bottom: 25px">장소 정보</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m11" style="padding-right: 0px">
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('event_type')" name="loc_type"/>
									        <span>실내</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('event_type')" name="loc_type"/>
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
				<div class="col m1"></div>
				<div class="col m11">
					<h5 style="margin-bottom: 25px">취사 가능 여부</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m11" style="padding-right: 0px">
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('event_type')" name="loc_type"/>
									        <span>가능</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('event_type')" name="loc_type"/>
									        <span>불가</span>
									    </label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row" id="step4_2" style="display:none">
				<div class="col m1"></div>
				<div class="col m11">
					<h5 style="margin-bottom: 25px">취사 가능 여부</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m11" style="padding-right: 0px">
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('event_type')" name="loc_type"/>
									        <span>가능</span>
									    </label>
									</div>
									<div class="chip">
										<label>
									        <input type="radio" onchange="changeColorByRadio('event_type')" name="loc_type"/>
									        <span>불가</span>
									    </label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row" id="step3_4" style="display:none">
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
			
			<div class="row" id="step3_4" style="display:none">
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
			
			<!-- btn -->
			<input type="hidden" name="step" value="1"/>
			<div class="row" style="margin-top: 60px">
				<div class="col m1"></div>
				<div class="col m2" style="padding-right: 0px">
					<a class="waves-effect waves-light btn disabled" onclick="prev()" id="btn_prev"><i class="fas fa-caret-left" style="margin-right: 7px; font-size: 14px"></i>이전</a>
				</div>
				<div class="col m5"></div>
				<div class="col m2" style="padding-right: 0px">
					<a class="waves-effect waves-light btn" href="#" onclick="javascript:next();return false;">다음 <i class="fas fa-caret-right" style="margin-left: 5px; font-size: 14px"></i></a>
				</div>
				<div class="col m1"></div>
			</div>
			<!-- <div class="row">
				<div class="col m1"></div>
				<div class="col m11">
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								
								<div class="col m2" style="padding-right: 0px">
									<a class="waves-effect waves-light btn"><i class="fas fa-caret-left" style="margin-right: 7px; font-size: 14px"></i>이전</a>
								</div>
								<div class="col m6"></div>
								<div class="col m2" style="padding-right: 0px">
									<a class="waves-effect waves-light btn">다음 <i class="fas fa-caret-right" style="margin-left: 5px; font-size: 14px"></i></a>
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div> -->
		</form>
		
	</div>
</body>
</html>
