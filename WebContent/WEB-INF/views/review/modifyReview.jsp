<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>

<script type="text/javascript">
	//<!--
	$(document).ready(
		function(){
 			$('.dropify').dropify(); //파일 업로드
			
			
		}// ready function
	);//ready
	
	function reviewinput(){
		if($("input[name=servRoot]").val()==null || $("input[name=servRoot]").val() == ""){
			alert("서비스 이용경로를 입력해주세요.");
			$("input[name=servRoot]").focus();
			return false;
		}else if($("input[name=title]").val()==null || $("input[name=title]").val() == ""){
			alert("제목을 입력해주세요.");
			$("input[name=title]").focus();
			return false;
		}else if($("textarea[name=content]").val()==null || $("textarea[name=content]").val() == ""){
			alert("후기내용을 입력해주세요.");
			$("textarea[name=content]").focus();
			return false;
		}else if( $("input:radio[name=menuScore]:checked").length == 0 ){
			alert("음식만족도를 체크해주세요.");
			return false ;
		}else if( $("input:radio[name=priceScore]:checked").length == 0 ){
			alert("가격만족도를 체크해주세요.");
			return false ;
		}else if( $("input:radio[name=serviceScore]:checked").length == 0 ){
			alert("서비스만족도를 체크해주세요.");
			return false ;
		}else if( $("input:radio[name=recommend]:checked").length == 0 ){
			alert("지인 추천항목을 체크해주세요..");
			return false ;
		}else if($("#reviewPicture").attr("enctype") != null ){
			if( $("input:file[name=servicePicture1]").val() == ""
				|| $("input:file[name=servicePicture1]").val() == null ) {
				alert("후기 수정을 할 수 없습니다. 다음을 확인해주세요. \n 1.후기사진을 하나 이상 첨부해 주세요. \n 2.후기사진 첨부는 첫 번째 칸 부터 첨부해 주세요.");
				return false;
			}
		}
	}
	function showPicture(){
		$("#tr1").show();
		$("#tr2").show();
		$("#tr3").show();
		$("#tr4").show();
		$("#tr5").show();
		$("#tr6").show();
		document.getElementById('reviewPicture').setAttribute("enctype","multipart/form-data");
		}
	//-->
	
</script>

<div class="section"></div>
<div class="section"></div>

<form method="post" onsubmit="return reviewinput()" action="/review/modifyReviewPro.do?serv_id=${serv_id}" id="reviewPicture">

<div class="container" style="background-color: white;margin-top:2px;">

<div class="row">
	<div class="col m12">
		<div class="section">
			<h5>
				후기 수정 
				<small id="sub_title"> CHA-RI-DA </small>
				<small style="float: right;"> * 는 필수입력 사항입니다.</small>
			</h5>
			<div class="divider"></div>
		</div>
	</div>
</div>

<div class="section"></div>
	<table border="1" class="container">
		<tr>
			<th colspan="2" align="center">서비스 후기등록</th>			
		</tr>
<!-- 		<tr>
			<th>서비스 형태 *</th>
				<td><input type="text" name="servRoot"
				placeholder="개인행사, 사교모임, 리셉션,기업행사, 학교행사, 기타  " >
			</td>
		</tr>
 -->		<tr>
			<th>이용 경로 *</th>
				<td><input type="text" name="servRoot"
				placeholder="ex) 인터넷 검색, 지인추천, 광고 등" value="${review.serv_root }">
			</td>
		</tr>
		<tr>
			<th>제목 *</th>
			<td><input type="text" name="title" placeholder="제목을 입력해주세요. (100자 이내)" value="${review.title }"></td>
		</tr>
		<tr>
			<th>후기 *</th>
			<td>
				<textarea style="width:290; height:100%" name="content" rows="5"
				placeholder="2000자 이내로 작성해 주세요.">${review.content }</textarea>
			</td>
		</tr>
	</table>
	
	<br>
	<h6 class="container">만족도 평가 *</h6>
	<hr color="gray" class="container">
	<div id="menu_score" class="row container">
		<div class="col s12">
			<p id="food"> [ 음식 만족도 ]</p>	
			<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "menuScore" 
		    		<c:if test="${review.menu_score == 0}">checked="checked" </c:if>
		    		value = "0"/>
		    		<span>0.0 점</span>
				</label>
	       	</div>	
			<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "menuScore" 
		    		<c:if test="${review.menu_score == 1}">checked="checked" </c:if>
		    		value = "1" />
		    		<span>1.0 점</span>
				</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "menuScore" 
		    		<c:if test="${review.menu_score == 2}">checked="checked" </c:if>
		    		value = "2" />
		    		<span>2.0 점</span>
	  			</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "menuScore" 
		    		<c:if test="${review.menu_score == 3}">checked="checked" </c:if>
		    		value = "3" />
		    		<span>3.0 점</span>
	  		</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "menuScore" 
		    		<c:if test="${review.menu_score == 4}">checked="checked" </c:if>
		    		value = "4" />
		    		<span>4.0 점</span>
	  			</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "menuScore" 
		    		<c:if test="${review.menu_score == 5}">checked="checked" </c:if>
		    		value = "5" />
		    		<span>5.0 점</span>
	  			</label>
	       	</div>       	
       	</div>
	</div>
	<hr color="gray" class="container">
	<div id="price_score" class="row container">
		<div class="col s12">
			<p id="price"> [ 가격 만족도 ]</p>		
			<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "priceScore" 
		    		<c:if test="${review.price_score == 0}">checked="checked" </c:if>
		    		value = "0" />
		    		<span>0.0 점</span>
				</label>
	       	</div>

			<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "priceScore" 
		    		<c:if test="${review.price_score == 1}">checked="checked" </c:if>
		    		value = "1" />
		    		<span>1.0 점</span>
				</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "priceScore" 
		    		<c:if test="${review.price_score == 2}">checked="checked" </c:if>
		    		value = "2" />
		    		<span>2.0 점</span>
	  			</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "priceScore" 
		    		<c:if test="${review.price_score == 3}">checked="checked" </c:if>
		    		value = "3" />
		    		<span>3.0 점</span>
	  		</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "priceScore" 
		    		<c:if test="${review.price_score == 4}">checked="checked" </c:if>
		    		value = "4" />
		    		<span>4.0 점</span>
	  			</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "priceScore" 
		    		<c:if test="${review.price_score == 5}">checked="checked" </c:if>
		    		value = "5" />
		    		<span>5.0 점</span>
	  			</label>
	       	</div>       	
       	</div>
	</div>
	<hr color="gray" class="container">
	<div id="service_score" class="row container">
		<div class="col s12">
			<p id="serv"> [ 서비스 만족도 ]</p>	
			<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "serviceScore" 
		    		<c:if test="${review.serv_score == 0}">checked="checked" </c:if>
		    		value = "0" />
		    		<span>0.0 점</span>
				</label>
	       	</div>

			<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "serviceScore" 
		    		<c:if test="${review.serv_score == 1}">checked="checked" </c:if>
		    		value = "1" />
		    		<span>1.0 점</span>
				</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "serviceScore" 
		    		<c:if test="${review.serv_score == 2}">checked="checked" </c:if>
		    		value = "2" />
		    		<span>2.0 점</span>
	  			</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "serviceScore" 
		    		<c:if test="${review.serv_score == 3}">checked="checked" </c:if>
		    		value = "3" />
		    		<span>3.0 점</span>
	  		</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "serviceScore" 
		    		<c:if test="${review.serv_score == 4}">checked="checked" </c:if>
		    		value = "4" />
		    		<span>4.0 점</span>
	  			</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "serviceScore" 
		    		<c:if test="${review.serv_score == 5}">checked="checked" </c:if>
		    		value = "5" />
		    		<span>5.0 점</span>
	  			</label>
	       	</div>       	
       	</div>
	</div>
	<hr color="gray" class="container">
	<div class="row container">
		<div class="col s12">
			<p id="recommand"> Q. 지인에게 '차리다' 서비스를 추천하실 의향이 있으신가요?</p>		
			<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "recommend" 
		    		<c:if test="${review.recommand == 1}">checked="checked" </c:if>
		    		value = "1" />
		    		<span>있다</span>
				</label>
	       	</div>
	       	<div class = "col s6">
	       		<label>
		    		<input type="radio" name = "recommend" 
		    		<c:if test="${review.recommand == 0}">checked="checked" </c:if>
		    		value = "0" />
		    		<span>없다</span>
	  			</label>
	       	</div>	       	
       	</div>
	</div>
	<hr color="gray" class="container">
	
	<div class="row container">
		 <div class = "col s12">
	        <br>
	        	<p> [ 서비스 사진 ] </p>
				<c:forEach var="pictures" items="${pictures}">
				<img src="/file/file-down/${pictures}" width="150">
				</c:forEach>
				<div class="section"></div>
				
				<input type='button' value="후기사진 수정을 원하시면  여기를 클릭해주세요"  class="btn waves-effect waves-light" name="picture"
				onclick="showPicture()">
				<br><br>

	        	<div class = "col s4" id="tr1" style="display : none">
	        		<input name ="servicePicture1" type="file"  class="dropify" data-height="100">
	        	</div>
	        	<div class = "col s4" id="tr2" style="display : none">
	        		<input name ="servicePicture2" type="file"  class="dropify" data-height="100"> 
	        	</div>
	        	<div class = "col s4" id="tr3" style="display : none">
	        		<input name ="servicePicture3" type="file"  class="dropify" data-height="100"> 
	        	</div>
	       </div><br>
	       <div class = "col s12">
	        <br>
	        	<div class = "col s4" id="tr4" style="display : none">
	        		<input name ="servicePicture4" type="file"  class="dropify" data-height="100"> 
	        	</div>
	        	<div class = "col s4" id="tr5" style="display : none">
	        		<input name ="servicePicture5" type="file"  class="dropify" data-height="100"> 
	        	</div>
	        	<div class = "col s4" id="tr6" style="display : none">
	        		<input name ="servicePicture6" type="file"  class="dropify" data-height="100"> 
	        	</div>
	      </div>
	</div>
	<br>
	<hr color="gray" class="container">
	<br>
	<div class="container">
	 <button class="btn waves-effect waves-light" type="submit"  >
    <i class="material-icons left">send</i>후기 수정하기
  	</button>
	</div>
	
<div class="section"></div>
<div class="section"></div>
	
</div>
<div class="section"></div>	
<div class="section"></div>	
</form>
<script src = "/js/dropify.js"></script>
<%@include file="/include/footer.jsp" %>
</body>
</html>
