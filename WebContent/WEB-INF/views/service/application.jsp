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
    </style>
    <!-- css -->
	<!--js-->
	<!-- <script src="https://kit.fontawesome.com/0ad913ff34.js"></script> -->	
	<script src="/js/jquery-3.4.1.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="/js/materialize.js"></script>
	<script type="text/javascript" src="/js/moment.min.js"></script>
	<script type="text/javascript" src="/js/nouislider.js"></script>
    <!--js-->
    <script type="text/javascript">

        function foldDaumPostcode() {
        	var element_wrap = document.getElementById('wrap');
        	document.getElementById('sec_addr').style.display="block";
        	document.getElementById('sec_postcode').style.display="none";
            element_wrap.style.display = 'none';
        }

        function daumPostcode() {
        	var element_wrap = document.getElementById('wrap');
            // 현재 scroll 위치를 저장해놓는다.
            var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
            new daum.Postcode({
                oncomplete: function(data) {
                    // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                   /*  if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample3_extraAddress").value = extraAddr;

                    } else {
                        document.getElementById("sample3_extraAddress").value = '';
                    } */

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('zipcode').value = data.zonecode;
                    document.getElementById("addr").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("addr2").focus();

                    // iframe을 넣은 element를 안보이게 한다.
                    // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                    element_wrap.style.display = 'none';
                    document.getElementById('sec_addr').style.display="block";
                    document.getElementById('sec_postcode').style.display="none";
                    // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                    document.body.scrollTop = currentScroll;
                },
                // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
                onresize : function(size) {
                    element_wrap.style.height = size.height+'px';
                },
                width : '100%',
                height : '100%'
            }).embed(element_wrap);

            // iframe을 넣은 element를 보이게 한다.
            element_wrap.style.display = 'block';
            document.getElementById('sec_addr').style.display="none";
            document.getElementById('sec_postcode').style.display="block";
        }
        // Or with jQuery
		var elems = null;
		var instances = null;
        $(document).ready(function(){
        	elems = document.querySelectorAll('.datepicker');
        	instances = M.Datepicker.init(elems, {
        	   minDate:new Date(moment().add(7,'days').format())
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
            });
        	$('.timepicker').timepicker({
				i18n:{
					cancel:'닫기'
					,clear:'초기화'
					,done:'확인'
				}
			});
        });
        
        function next(){
        	var cStep = $('input:hidden[name=step]').val();
        	if(cStep=="1"){
        		$('#step1_1').css('display','none');
        		$('#step1_2').css('display','none');
        		
        		$('#step2_1').css('display','block');
        	}
        	
        	$('input:hidden[name=step]').val(cStep +1);
        }
	</script>
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
					<h5>서비스 신청 <small> 기본정보 입력</small></h5>
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
										<input disabled value="검색 버튼을 눌러주세요." id="addr" name="addr" type="text" class="validate">
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
					<h5 style="margin-bottom: 50px">참가자 정보</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m2" style="padding-right: 0px">
									<input id="participant" type="number" class="validate">
									<label for="participant">참가자수</label>
								</div>
								<div class="col m1"></div>
								<div class="col m9">
									<div id="test-slider"></div>
								</div>
								<script type="text/javascript">
								//<!--
								var slider = document.getElementById('test-slider');
								  noUiSlider.create(slider, {
								   start: [20, 80],
								   connect: true,
								   step: 1,
								   orientation: 'horizontal', // 'horizontal' or 'vertical'
								   range: {
								     'min': 0,
								     'max': 100
								   },
								   format: wNumb({
								     decimals: 0
								   })
								  });
								//-->
								</script>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col m1"></div>
				<div class="col m11">
					<h5 style="margin-bottom: 50px">행사정보</h5>
					<div class="row"  style="margin-bottom: 0px;">
						<div class="col m1"></div>
						<div class="col m10">
							<div class="row" style="margin-bottom: 0px;">
								<div class="col m9" style="padding-right: 0px">
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
					<a class="waves-effect waves-light btn disabled" onclick="prev()"><i class="fas fa-caret-left" style="margin-right: 7px; font-size: 14px"></i>이전</a>
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
