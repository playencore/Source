<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--  -->
<script src = "/js/jquery-3.4.1.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src = "/js/nouislider.js"></script>
<script src = "/js/materialize.js"></script>
<script src = "/js/dropify.js"></script>

<!-- material css-->
<link rel = "stylesheet" type = "text/css" href ="/css/nouislider.css" />
<link rel = "stylesheet" type = "text/css" href ="/css/materialize.css" />
<link rel = "stylesheet" type = "text/css" href ="/css/dropify.css" />
<!-- icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>차리다</title>
<script type="text/javascript">
	//<!--
$(document).ready(function(){
	   
		$('#modal1').modal();
		$('select').formSelect();
		
});	
	
	
function foldDaumPostcode() {
	var element_wrap = document.getElementById('wrap');
	document.getElementById('sec_addr').style.display="block";
	document.getElementById('sec_postcode').style.display="none";
    element_wrap.style.display = 'none';
    $('#modal1').modal('close');
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

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("address_detail").focus();

            // iframe을 넣은 element를 안보이게 한다.
            // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
            element_wrap.style.display = 'none';
            document.getElementById('sec_addr').style.display="block";
            document.getElementById('sec_postcode').style.display="none";
            // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
            document.body.scrollTop = currentScroll;
            $('#modal1').modal('close');
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
	
	
	//-->
</script>
</head>
<body class = "grey lighten-2">
	<br><br>
	<div class ="row">
		<div class = "col s12">
			<div class = "col s4"></div>
			<div class = "col s4 card-panel">
			<p class ="header">&nbsp;&nbsp;&nbsp;회원가입</p>
				<form name = "joinMemberForm"  method = "post" action = "/joinUser/joinSupplierPro.do" onsubmit="return supplierinput() "  >
					<div id = "memberForm">
						<input type = "hidden" name = "authority" value ="2">
						<div class = "col s12">
							<div class="input-field col s12">
					          <input name="mem_id" id="mem_id" type="text" class="validate">
					          <label for="name">*아이디</label>
					          <span class="helper-text" id="name"></span>
					        </div>
				        </div>
				        <div class = "col s12">
							<div class="input-field col s12">
					          <input name="passwd" id="passwd" type="password" class="validate">
					          <label for="passwd">*비밀번호</label>
					          <span class="helper-text" id="supplierlicensNumval"></span>
					        </div>
				        </div>
				        <div class = "col s12">
							<div class="input-field col s12">
					          <input name="passwdcheck" id="passwdcheck" type="password" class="validate" >
					          <label for="passwdcheck">*비밀번호 확인</label>
					          <span class="helper-text" id="passwdcheck"></span>
					        </div>
				        </div>
				        <div class = "col s12">
							<div class="input-field col s12">
					          <input name="name" id="name" type="text" class="validate">
					          <label for="name">*이름</label>
					          <span class="helper-text" id="name"></span>
					        </div>
				        </div>
				        <div class = "col s12">
							<div class="input-field col s8">
					          <input name="email" id="email" type="email" class="validate">
					          <label for="email">*이메일</label>
					          <span class="helper-text" id="email"></span>
					        </div>
					        <div class = "col s4">
					        	<a class="waves-effect waves-light btn" style="margin-top:20px">이메일 인증 </a>
					        </div>
				        </div>
				        <div class = "col s12">
							<div class="input-field col s8">
					          <input name="emailcheck" id="emailcheck" type="text" class="">
					          <label for="emailcheck">*이메일 인증번호 입력</label>
					          <span class="helper-text" id="email"></span>
					        </div>
					        <div class = "col s4">
					        	<a class="waves-effect waves-light btn" style="margin-top:20px">이메일 확인</a>
					        </div>
				        </div>
				        <!--  주소 넣기 -->
				     	<div>
							<div class="col s12" >
								<div id="sec_addr" style="margin-bottom: 0px;">
									<div class="col s8">
										<div class="input-field">
											<input type="hidden" id="zipcode" name="zipcode">
											<input readonly="readonly" value="검색 버튼을 눌러주세요." id="address" name="address" type="text" class="validate">
						          			<label for="address" >*주소입력</label>
					          			</div>
				          			</div>
				          			<div id = "serchadress" class="col s4">
				          				<a class="btn waves-effect waves-light modal-trigger " href="#modal1" onclick="daumPostcode()" style="margin-top:15px;margin-left:10px" id="btn_addr">주소 검색</a>
				          			</div>
				          			<div class="col s12">
					          			<div class="input-field">
											<input id="address_detail" name="address_detail" type="text" class="validate" data-length="50">
								         	<label for="address_detail" >*상세주소</label>
							         	</div>
				          			</div>
			          			</div>
							</div>
						</div>
						<div class = "col s12">
							<div class="input-field col s12">
					          <input name="tel" id="tel" type="text" class="validate">
					          <label for="tel">*전화번호</label>
					          <span class="helper-text" id="tel">-를 제외한 번호만 입력하세요</span>
					        </div>
				        </div>
				        <div class = "col s12">
							<div class="input-field col s12">
					          <input name="birth_date" id="birth_date" type="text" class="validate">
					          <label for="birth_date">*생년월일</label>
					          <span class="helper-text" id="birth_date">ex)19000101</span>
					        </div>
				        </div>
				        <br>
				        &nbsp; &nbsp; &nbsp;*성별
				        <div class = "col s12">
							<div class = "col s6">
								<p>
									<label>
										<input class="with-gap" name="gender" type="radio" value = "0" checked />
										<span>남자</span>
									</label>
								</p>
							</div>
							<div class = "col s6">	
								<p>
									<label>
										<input class="with-gap" name="gender" type="radio" value ="1" />
										<span>여자</span>
									</label>
								</p>
							</div>
				        </div>
				        <br>
						<div class="input-field col s12" style="margin-left:10px;">
							<select name = "job">
								<option value="" disabled selected>직업을 선택해주세요</option>
								<option value="1">학생</option>
								<option value="2">회사원</option>
								<option value="3">주부</option>
								<option value="4">기타</option>
							</select>
							<label>직업을 선택해주세요</label>
						</div>
				        <div class = "col s6">
			        	 <button class="btn waves-effect waves-light" type="submit"  >
    						<i class="material-icons right">send</i>
    						구매자회원가입
  						</button>
  						<br>
  						<br>
			        </div>	
  					</div>
  					<br>
  					<br>
				</form>
			</div> <!-- 여기까지 -->
		</div>
	</div> <!--  form  -->
</body>


<!-- Modal Structure -->
<div id="modal1" class="modal">
	<div class="modal-content">
		<div class="row" id="sec_postcode" style="margin-bottom: 0px;">
			<div class="col s12">
				  <div id="wrap" style="display:none;height:300px;position:relative">
		           <img src="http://t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
		        </div>
			</div>
		</div>
	</div>
</div>

</html>