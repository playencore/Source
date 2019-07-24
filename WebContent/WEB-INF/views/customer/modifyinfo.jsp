<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>
<script src="/js/addresssearch.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/js/mail/sendmail.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		ckpasswd();
		reckpasswd();
		emailcheck()

	});

	function ckpasswd() {
		$("input[name=passwd]").on(
				'keyup',
				function() {
					var check = "";
					var recheck = ""
					var passwdcheck = $("input[name=passwd]").val();
					var repasswdcheck = $("input[name=passwdcheck]").val();
					if (passwdcheck.length < 4) { // 비밀번호란이 비어있는지 체크
						result = "비밀번호를 4자 이상 입력해주세요.";
						check = "red"
							$("input[name=passwdflag]").val("0") ;
					} else if (passwdcheck.length > 20) { // 최대글자수를 넘었는지 검사
						result = "최대길이를 초과하였습니다.";
						check = "red"
							$("input[name=passwdflag]").val("0") ;
					} else {
						result = "사용가능한 비밀번호입니다.";
						$("input[name=passwdflag]").val("1") ;
						check = "green"
					}
					// passwd 란에 출력
					$("#passwd_comment").text(result).css("color", check);
					// repasswd 란에 출력할 내용 결정
					if (passwdcheck != repasswdcheck) { // 비밀번호와 비밀번호확인이 일치하는지 검사
						repasswdresult = "비밀번호가 일치하지 않습니다.";
						recheck = "red"
						$("input[name=passwdflag]").val("0") ;
					} else { // 비밀번호와 비밀번호확인이 일치하는지 검사
						repasswdresult = "비밀번호가 일치합니다.";
						recheck = "green"
							$("input[name=passwdflag]").val("1") ;
					}
					// repasswd 란에 출력
					$("#passwdcheck_comment").text(repasswdresult).css("color",
							recheck);
				});
	}

	function reckpasswd() {
		// repasswd 관련 keyup 이벤트 감지
		$('input[name=passwdcheck]').on(
				'keyup',
				function() {
					var pwdcheck = "";
					var rqwcheck = "";
					pwdcheck = $("input[name=passwd]").val();
					rpwdcheck = $("input[name=passwdcheck]").val();

					if (pwdcheck != rpwdcheck) {
						$("#passwdcheck_comment").text("비밀번호를 일치시키세요").css("color", "red");
						$("input[name=passwdflag]").val("0") ;
					} else {
						$("#passwdcheck_comment").text("비밀번호가 일치합니다.").css("color", "green");
						$("input[name=passwdflag]").val("1") ;
					}

				});
	}

	function emailcheck() {

		$("input[name=email]").on(
				"keyup",
				function() {
					var baseemail = "${meminfo.email}";
					$("#email_comment").text("이메일 변경시 다시 한번 인증해주세요.").css(
							"color", "red");
					var emailval = $("input[name=email]").val();

					if (emailval !== baseemail) {
						$("input[name=emailkeycheck]").val("0");
					} else {
						$("input[name=emailkeycheck]").val("1");
						$("#email_comment").text("기존의 이메일입니다. 인증을 하실 필요 없습니다.")	.css("color", "green");
					}

				});

	}
	
	function makeRandom(min, max){
		var RandVal = Math.floor(Math.random()*(max-min+1)) + min;
		return RandVal;
	}
	// 메일 내용
	function insertcode(authNum){
		return "인증번호는 [ "+authNum+" ] 입니다.";
	}

	function sendemail() {
		if( $("input[name=emailkeycheck]").val() != 1 ) {
			var email = $("input[name=email]").val();
			var code = makeRandom(1000, 9999);
			$("input[name=emailcode]").val(code);	
			var content = insertcode(code);

			$.ajax({
				type : "post",
				url : "/mail/send-mail.do",
				async : false,
				data : {
					content : content,
					mail : email
				}, // HTTP 요청과 함께 서버로 보낼 데이터(URL뒤에 붙이는 내용)
				success : function(result) {
					alert("이메일이 요청 되었습니다." );
				},
				error : function(result) {
					alert("이메일 요청이 취소되었습니다. 방어벽 확인해주세요.");
				}
			});
		}else{
			alert("이메일 인증이 필요하지 않습니다.") ;
		}
	}
	function codecompare(){
		targetcode = $("input[name=emailcode]").val();
		enteredcode = $("input[name=emailcheck]").val();
		if( targetcode == enteredcode ){
//		if( true ){
			$("#bt_sendemail").click(function () {return false;});
			$("#emailcheck_comment").html("<span style='color:blue'>" + "인증되었습니다." + "</span>");
			$("input[name=emailkeycheck]").val("1");
			$("#email_comment").text("이메일 인증이 완료되었습니다.").css("color", "green");
			
		} else {
			alert("인증번호가 다릅니다. 다시 시도해주세요");
			$("#emailcheck_comment").html( "<span style='color:red'>" + "인증에 실패하였습니다." + "</span>");
		}
	}
		
	function getTextLength(str) {
			var len = 0;
	
			for (var i = 0; i < str.length; i++) {
				if (escape(str.charAt(i)).length == 6) {
					len++;
				}
					len++;
			}
				return len;
		}

	function modifyinput(){
		if($("input[name=passwdflag]").val() !=="1"){
			alert("비밀번호를 확인해주세요.") ;
			$("input[name=passwdflag]").focus() ;
			return false ;
		}else if( $("input[name=name]").val() == null || $("input[name=name]").val().equals =="" ){
			alert("이름을 입력해주세요") ;
			$("input[name=name]").focus();
			return false ;
		}else if( $("input[name=emailkeycheck]").val() != "1" ){
			alert("주소를 확인해주세요.") ;
			$("input[name=address]").focus();
			return false ;
		}else if( $("input[name=address_detail]").val() == null || $("input[name=address_detail]").val().equals =="" ){
			alert("상세주소를 입력해주세요.") ;
			$("input[name=address_detail]").focus();
			return false ;
		}else if( $("input[name=tel]").val() == null || $("input[name=tel]").val().equals =="" ){
			alert("전화번호를 입력해주세요.") ;
			$("input[name=tel]").focus();
			return false ;
		}else if( $("input[name=birth_date]").val() == null || $("input[name=birth_date]").val().equals =="" ){
			alert("생년월일을 입력해주세요.") ;
			$("input[name=birth_date]").focus();
			return false ;
		}else if( $("select[name=job]").val() == null || $("input[name=birth_date]").val().equals =="0" ){
			alert("직업을 선택해주세요") ;
			$("select[name=job]").focus();
			return false ;
		}else if( getTextLength( $("input[name=name]").val() ) > 20  ){
			alert("이름의 길이는 최대(한글기준) 6자입니다.")
			$("input[name=name]").focus();
			return false;
		}else if( getTextLength( $("input[name=tel]").val() ) > 13 ){
			alert("전화번호를 확인해주세요.");
			$("input[name=name]").focus();
			return false;
		}else if( getTextLength( $("input[name=birth_date]").val() ) > 8 ){
			alert("생년월일을 확인해주세요.");
			$("input[name=birth_date]").focus();
			return false ;
		}
	}
		
		
//-->
</script>

<br>
<br>
<div class="row">
	<div class="col s12">
		<div class="col s4"></div>
		<div class="col s4 card-panel">
			<p class="header">&nbsp;&nbsp;&nbsp;기본정보 변경</p>
			<form name="modifyMemberForm" method="post" action="/member/updateinfo.do" onsubmit="return modifyinput() ">
				<div id="memberForm">
					<div class="col s12">
						<div class="input-field col s12">
							<input value="${meminfo.mem_id}" name="mem_id" id="mem_id" type="text" class="" readonly> 
							<label for="mem_id">*아이디</label>
							<span class="helper-text" id="mem_id_comment"></span>
						</div>
					</div>
					<div class="col s12">
						<div class="input-field col s12">
							<input value="${meminfo.passwd}" name="passwd" id="passwd" type="password" class="validate"> 
							<label for="passwd">*비밀번호</label>
							<span class="helper-text" id="passwd_comment"></span>
						</div>
					</div>
					<div class="col s12">
						<div class="input-field col s12">
							<input placeholder="비밀번호 변경이 없을시 기존의 비밀번호를 입력하세요" name="passwdcheck" id="passwdcheck" type="password"
								class="validate"> 
								<label for="passwdcheck">*비밀번호 확인</label> 
								<span class="helper-text" id="passwdcheck_comment"></span>
							<input type="hidden" value = "1" name = "passwdflag">	
						</div>
					</div>
					<div class="col s12">
						<div class="input-field col s12">
							<input value="${meminfo.name}" name="name" id="name" type="text" 	class="validate"> 
							<label for="name">*이름</label> 
							<span class="helper-text" id="name_comment"></span>
						</div>
					</div>
					<div class="col s12">
						<div class="input-field col s8">
							<input value="${meminfo.email}" name="email" id="email" type="email" class="validate"> 
							<label for="email">*이메일</label>
							<span class="helper-text" id="email_comment"></span>
						</div>
						<div class="col s4">
							<a class="waves-effect waves-light btn" style="margin-top: 20px"
								onclick="sendemail();">이메일 인증 </a>
						</div>
					</div>
					<div class="col s12">
						<div class="input-field col s8">
							<input type="hidden" name="emailcode" value=""> 
							<input type="hidden" value="1" name="emailkeycheck"> 
							<input name="emailcheck" id="emailcheck" type="text" class="">
							<label for="emailcheck">*이메일 인증번호 입력</label> 
							<span class="helper-text" id="emailcheck_comment"></span>
						</div>
						<div class="col s4">
							<a id="bt_sendemail" class="waves-effect waves-light btn"
								style="margin-top: 20px" onclick="codecompare();">인증번호 확인</a>
						</div>
					</div>
					<!--  주소 넣기 -->
					<div>
						<div class="col s12">
							<div id="sec_addr" style="margin-bottom: 0px;">
								<div class="col s8">
									<div class="input-field">
										<input value="${meminfo.zipcode}" type="hidden" id="zipcode"
											name="zipcode"> <input value="${meminfo.address}"
											readonly="readonly" placeholder="검색 버튼을 눌러주세요." id="address"
											name="address" type="text" class="validate"> <label
											for="address">*주소입력</label>
									</div>
								</div>
								<div id="bt_serchadress" class="col s4">
									<a class="btn waves-effect waves-light modal-trigger "
										href="#modal1" onclick="daumPostcode()"
										style="margin-top: 15px; margin-left: 10px" id="btn_addr">주소
										검색</a>
								</div>
								<div class="col s12">
									<div class="input-field">
										<input value="${meminfo.address_detail}" id="address_detail"
											name="address_detail" type="text" class="validate"
											data-length="50"> <label for="address_detail">*상세주소</label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col s12">
						<div class="input-field col s12">
							<input value="${meminfo.tel}" name="tel" id="tel" type="text"
								class="validate"> <label for="tel">*전화번호</label> <span
								class="helper-text" id="tel_comment">-를 제외한 번호만 입력하세요</span>
						</div>
					</div>
					<div class="col s12">
						<div class="input-field col s12">
							<input readonly value="${meminfo.birth_date}" name="birth_date"
								id="birth_date" type="text" class="validate"> <label
								for="birth_date">*생년월일</label> <span class="helper-text"
								id="birth_date_comment">ex)19000101</span>
						</div>
					</div>
					<br> &nbsp; &nbsp; &nbsp;*성별
					<div class="col s12">
						<c:if test="${meminfo.gender == 0}">
							<div class="col s6">
								<p>
									<label> <input readonly class="with-gap" name="gender"
										type="radio" value="0" checked /> <span>남자</span>
									</label>
								</p>
							</div>
						</c:if>
						<c:if test="${meminfo.gender == 1}">
							<div class="col s6">
								<p>
									<label> <input readonly class="with-gap" name="gender"
										type="radio" value="0" checked /> <span>여자</span>
									</label>
								</p>
							</div>
						</c:if>
					</div>
					<br>
					<div id="job" class="input-field col s12"
						style="margin-left: 10px;">
						<select name="job">
							<option value="0" disabled selected>직업을 선택해주세요</option>
							<option value="1">학생</option>
							<option value="2">회사원</option>
							<option value="3">주부</option>
							<option value="4">기타</option>
						</select> <label>직업을 선택해주세요</label>
					</div>
					<div class="col s6">
						<button class="btn waves-effect waves-light" type="submit">
							<i class="material-icons right">send</i>정보수정
						</button>
						<br> <br>
					</div>
				</div>
				<br> <br>
			</form>
		</div>
		<!-- 여기까지 -->
	</div>
</div>
<!--  form  -->

<!-- Modal Structure -->
<div id="modal1" class="modal">
	<div class="modal-content">
		<div class="row" id="sec_postcode" style="margin-bottom: 0px;">
			<div class="col s12">
				<div id="wrap"
					style="display: none; height: 300px; position: relative">
					<img src="http://t1.daumcdn.net/postcode/resource/images/close.png"
						id="btnFoldWrap"
						style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
						onclick="foldDaumPostcode()" alt="접기 버튼">
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>