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
<script src = "/js/join/join-basic.js?version=0.03"></script>
<script src = "/js/mail/sendmail.js?version=0.01"></script>
<script src = "/js/addresssearch.js"></script>

<!-- material css-->
<link rel = "stylesheet" type = "text/css" href ="/css/nouislider.css" />
<link rel = "stylesheet" type = "text/css" href ="/css/materialize.css" />
<link rel = "stylesheet" type = "text/css" href ="/css/dropify.css" />
<!-- icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>차리다</title>
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
					          <label for="mem_id">*아이디</label>
					          <span class="helper-text" id="mem_id_comment"></span>
					        </div>
				        </div>
				        <div class = "col s12">
							<div class="input-field col s12">
					          <input name="passwd" id="passwd" type="password" class="validate">
					          <label for="passwd">*비밀번호</label>
					          <span class="helper-text" id="passwd_comment"></span>
					        </div>
				        </div>
				        <div class = "col s12">
							<div class="input-field col s12">
					          <input name="passwdcheck" id="passwdcheck" type="password" class="validate" >
					          <label for="passwdcheck">*비밀번호 확인</label>
					          <span class="helper-text" id="passwdcheck_comment"></span>
					        </div>
				        </div>
				        <div class = "col s12">
							<div class="input-field col s12">
					          <input name="name" id="name" type="text" class="validate">
					          <label for="name">*이름</label>
					          <span class="helper-text" id="name_comment"></span>
					        </div>
				        </div>
				        <div class = "col s12">
							<div class="input-field col s8">
					          <input name="email" id="email" type="email" class="validate">
					          <label for="email">*이메일</label>
					          <span class="helper-text" id="email_comment"></span>
					        </div>
					        <div class = "col s4">
					        	<a class="waves-effect waves-light btn" style="margin-top:20px" onclick="sendemail();" contenteditable="true">이메일 인증 </a>
					        </div>
				        </div>
				        <div class = "col s12">
							<div class="input-field col s8">
							  <input type="hidden" name="emailcode" value="">
					          <input name="emailcheck" id="emailcheck" type="text" class="">
					          <label for="emailcheck">*이메일 인증번호 입력</label>
					          <span class="helper-text" id="emailcheck_comment"></span>
					        </div>
					        <div class = "col s4">
					        	<a id="bt_sendemail" class="waves-effect waves-light btn" style="margin-top:20px" onclick="codecompare();">인증번호 확인</a>
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
					          <span class="helper-text" id="tel_comment">-를 제외한 번호만 입력하세요</span>
					        </div>
				        </div>
				        <div class = "col s12">
							<div class="input-field col s12">
					          <input name="birth_date" id="birth_date" type="text" class="validate">
					          <label for="birth_date">*생년월일</label>
					          <span class="helper-text" id="birth_date_comment">ex)19000101</span>
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