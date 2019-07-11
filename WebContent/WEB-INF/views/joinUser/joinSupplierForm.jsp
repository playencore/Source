<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src = "/js/dropify.js"></script>

<script type="text/javascript">
	//<!--
$(document).ready(function(){
	$("input[name=regist_num]").on(
				"keyup",
				function( event ){
					var regist_num = $("input[name=regist_num]").val() ;
					$.ajax(
						{
							type : "POST",
							url: "/joinUser/checkRegist_num.do",
							data : {"regist_num" : regist_num },
							dataType:"json",
							success:function(data){
								$("#supplierlicensNumval").html(data.result).attr("style",data.color) ;
							},
							error: function(data){
								$("#supplierlicensNumval").html("다시 시도해주세요.").attr("style","color:red") ;
							}
						}		
					);
				}
			); // 업체넘버 중복 방지 ajax
		
	    $('select').formSelect();
			
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
		  }); // range
		  
		 slider.noUiSlider.on('update', function(values, handle) {
		    // value for updated handle is in values[handle]
		   	$("input[name=minimum_seating]").val(values[0]);
		 	$("input[name=maximum_seating]").val(values[1]);
		});
		  
		$('.dropify').dropify(); //파일 업로드
		$('#modal1').modal();
		$('input#companyname, textarea#explanation').characterCounter();		
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
	
	function showSupplierForm(){
		 $("#memberForm").hide();
		 $("#supplierForm").show() ;
	}
	function showMemberForm(){
		$("#memberForm").show();
		$("#supplierForm").hide() ;
	}
	
	function supplierinput(){
		if( $("input[name=companyname]").val() == null || $("input[name=companyname]").val() == ""   ){
			 alert( "업체명을 입력해주세요." ) ;
			 $("input[name=companyname]").focus() ;
			return false;
		}else if( $("#supplierlicensNumval").css("color") !="rgb(0, 128, 0)" ){
			alert("사업자 번호를 확인해주세요.") ;
			$("input[name=regist_num]").focus() ;
			return false ;
		}else if( $("input:file[name=cert_file_id]").val() =="" || $("input:file[name=cert_file_id]").val() == null  ){
			alert("사업자 등록증을 입력해주세요") ;
			return false ;
		}else if( $("#cp").val() =="" || $("#cp").val() == null  ){
			alert("업체 소개 사진을 하나 이상 입력해주세요 ") ;
			return false ;
		}else if( $("input:checkbox[name=serviceCategory]:checked").length == 0 ){
			alert("서비스 가능한 형태를 하나 이상 체크해주세요.");
			$("#sc").focus();
			return false ;
		}else if( $("input:checkbox[name=foodCategory]:checked").length == 0 ){
			alert("서비스 가능한 음식 카테고리를 하나 이상 체크해주세요.");
			$("#fc").focus();
			return false ;
		}else if( $("input:checkbox[name=serviceLocation]:checked").length == 0 ){
			alert("서비스 가능한 지역을 하나 이상 체크해주세요.");
			$("#sl").focus();
			return false ;
		}
		
	}
	
	//-->
</script>
	<br><br>
	<div class ="row">
		<div class = "col s12">
			<div class = "col s4"></div>
			<div class = "col s4 card-panel">
			<p class ="header">&nbsp;&nbsp;&nbsp;회원가입</p>
				<form name = "joinsupplierForm"  method = "post" action = "/joinUser/joinSupplierPro.do" enctype="multipart/form-data" onsubmit="return supplierinput() "  >
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
					          <span class="helper-text" id="passwd"></span>
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
							<div class="input-field col s12">
					          <input name="email" id="email" type="email" class="validate">
					          <label for="email">*이메일</label>
					          <span class="helper-text" id="email"></span>
					        </div>
				        </div>
				        <!--  주소 넣기 -->
				     	<div>
							<div class="col s12" >
								<div id="sec_addr" style="margin-bottom: 0px;">
									<div class="col s8">
										<div class="input-field">
											<input type="hidden" id="zipcode" name="zipcode">
											<input readonly="readonly" value="검색 버튼을 눌러주세요." id="address" name="address" type="text" class="">
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
							<select>
								<option value="" disabled selected>직업을 선택해주세요</option>
								<option value="1">학생</option>
								<option value="2">회사원</option>
								<option value="3">주부</option>
								<option value="4">기타</option>
							</select>
							<label>직업을 선택해주세요</label>
						</div>
				        	<br><br>
				       	 	 <a class="waves-effect waves-light btn" 
				       	 	 onclick="return showSupplierForm()" 
				       	 	 id="btn_next">다음 
				       	 	 <i class="fas fa-caret-right" style="margin-left: 5px; font-size: 14px"></i></a>
	  					<br>
	  					<br>
  					</div>
  					<div id = "supplierForm" style="display:none">
  						<div class = "col s12">
						<div class="input-field col s12">
				          <input name="companyname" id="companyname" type="text" class="validate" data-length="13">
				          <label for="companyname">*업체 이름</label>
				          <span class="helper-text" id="companynamecheck"></span>
				        </div>
			        </div>
			        <div class = "col s12">
						<div class="input-field col s12">
				          <input name="regist_num" id="regist_num" type="number" class="validate" placeholder="-를 제외한 숫자만 입력해주세요.">
				          <label for="regist_num">*사업자번호</label>
				          <span class="helper-text" id="supplierlicensNumval"></span>
				        </div>
			        </div>
			        <div class = "col s12">
						<div class="input-field col s12">
				        	<textarea name="explanation" id="explanation" class="validate materialize-textarea" data-length="130"></textarea>
          					<label for="explanation">업체 소개</label>
          					<span class="helper-text" id="explanationcheck"></span>
				        </div>
			        </div>
			        
			         <div class = "col s12 ">
			         	<p> 서비스 가능 인원 범위 </p>
			         	<br>
			         	<div id="test-slider" class = "col s12"></div>
						<div class="input-field col s6">
							<input type="text" name="minimum_seating" value="1"  class="validate center-align" readOnly >
				          	<label for="minimum_seating"></label>
				          	<span class="helper-text">*최소수용인원</span>
				          	
				        </div>
				        <div class="input-field col s6">
							<input name="maximum_seating"  type="text" class="validate center-align" readOnly >
				          	<label for="maximum_seating"></label>
				          	<span class="helper-text" >*최대수용인원</span>
				        </div>
			        </div>
			        
			        <div class = "col s12">
			        <p> 사업자 등록증 </p>
					      <input name ="cert_file_id" type="file"  class="dropify" data-height="100"> 
			        </div>
			        
			        <div class = "col s12">
			        <br>
			        	<p> 업체 소개 사진</p>
			        	<div class = "col s4">
			        		<input name ="supplierInfoFile1" type="file"  class="cp dropify" data-height="100"> 
			        	</div>
			        	<div class = "col s4">
			        		<input name ="supplierInfoFile2" type="file"  class="cp dropify" data-height="100"> 
			        	</div>
			        	<div class = "col s4">
			        		<input name ="supplierInfoFile3" type="file"  class="cp dropify" data-height="100"> 
			        	</div>
			        </div>
			        <div class = "col s12 row">
			        <br>
			        	<p id ="sc" >가능한 서비스 형태</p>
			        	<div class = "col s6">
			        		<label>
        						<input type="checkbox" name = "serviceCategory" value = "ST00000001" />
        						<span>뷔페/케이터링</span>
      						</label>
			        	</div>
			        	<div class = "col s6">
			        		<label>
        						<input type="checkbox" name = "serviceCategory" value = "ST00000002" />
        						<span>코스음식</span>
      						</label>
			        	</div>
			        	<div class = "col s6">
			        		<label>
        						<input type="checkbox" name = "serviceCategory" value = "ST00000003" />
        						<span>드랍오프</span>
      						</label>
			        	</div>
			        	<div class = "col s6">
			        		<label>
        						<input type="checkbox" name = "serviceCategory" value = "ST00000004" />
        						<span>도시락</span>
      						</label>
			        	</div>
			        </div>
			        <div class = "col s12 row">
			        	<p id ="fc">음식 카테고리</p>
			        	<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "FT00000001" />
        						<span>한정식</span>
      						</label>
			        	</div>
			        	<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "FT00000002" />
        						<span>핑거푸드</span>
      						</label>
			        	</div>
      					<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "FT00000003" />
        						<span>웨스턴</span>
      						</label>
			        	</div>
			        	<div class = "col l4 m2 s4">
			        		<label>
		      					<input type="checkbox" name = "foodCategory" value = "FT00000004" />
		      					<span>일식</span>
		    				</label>
			        	</div>
			        	<div class = "col l4 m4 s4">
			        		<label>
		      					<input type="checkbox" name = "foodCategory" value = "FT00000005" />
		      					<span>디저트류</span>
		    				</label>
			        	</div>
		    			<div class = "col l4 m4 s4">
			        		<label>
		      					<input type="checkbox" name = "foodCategory" value = "FT00000006" />
		      					<span>커피/음료</span>
		    				</label>
			        	</div>
			        	<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "FT00000007" />
        						<span>칵티일/와인</span>
      						</label>
			        	</div>
			        	<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "FT00000008" />
        						<span>피자</span>
      						</label>
			        	</div>
      					<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "FT00000009" />
        						<span>아시안퓨전</span>
      						</label>
			        	</div>
			        	<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "FT00000010" />
        						<span>베지터리안</span>
      						</label>
			        	</div>
			        	<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "FT00000011" />
        						<span>바베큐파티</span>
      						</label>
			        	</div>
      					<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "FT00000012" />
        						<span>기타</span>
      						</label>
			        	</div>
			        </div>
			         <div class = "col s12 row">
			        	<p id = "sl">서비스 가능지역</p>
			        	<div class = "col s4">
			        		<label>
        						<input type="checkbox" name = "serviceLocation" value = "SLT0000001" />
        						<span>서울특별시</span>
      						</label>
			        	</div>
			        	<div class = "col s4">
			        		<label>
        						<input type="checkbox" name = "serviceLocation" value = "SLT0000002" />
        						<span>경기도</span>
      						</label>
			        	</div>
			        	<div class = "col s4">
			        		<label>
        						<input type="checkbox" name = "serviceLocation" value = "SLT0000003" />
        						<span>충청도</span>
      						</label>
			        	</div>
			        	<div class = "col s4">
			        		<label>
        						<input type="checkbox" name = "serviceLocation" value = "SLT0000004" />
        						<span>경상도</span>
      						</label>
			        	</div>
			        	<div class = "col s4">
			        		<label>
        						<input type="checkbox" name = "serviceLocation" value = "SLT0000005" />
        						<span>전라도</span>
      						</label>
			        	</div>
			        	<div class = "col s4">
			        		<label>
        						<input type="checkbox" name = "serviceLocation" value = "SLT0000006" />
        						<span>강원도</span>
      						</label>
			        	</div>
			        	<div class = "col s4">
			        		<label>
        						<input type="checkbox" name = "serviceLocation" value = "SLT0000007" />
        						<span>제주도</span>
      						</label>
			        	</div>
			        </div>
			        <div class = "col s6">
			        	<a class="waves-effect waves-light btn" href="#" 
				       	 	 onclick="return showMemberForm()" 
				       	 	 id="btn_next">이전 
				       	 	 <i class="fas fa-caret-left" style="margin-left: 5px; font-size: 14px"></i></a>
			        </div>
			        <div class = "col s6">
			        	 <button class="btn waves-effect waves-light" type="submit"  >
    						<i class="material-icons right">send</i>
    						판매자회원가입
  						</button>
  						<br>
  						<br>
			        </div>
  					<br>
  					<br>
  					</div>
				</form>
			</div> <!-- 여기까지 -->
		</div>
	</div> <!--  form  -->
	
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
<%@include file="/include/footer.jsp" %>
</body>

</html>