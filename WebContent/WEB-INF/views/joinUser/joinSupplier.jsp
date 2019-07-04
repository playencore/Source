<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차리다</title>
<!--  -->
<script src = "/js/jquery-3.4.1.js"></script>
<script src = "/js/nouislider.js"></script>
<script src = "/js/materialize.js"></script>
<!-- material css-->
<link rel = "stylesheet" type = "text/css" href ="/css/nouislider.css" />
<link rel = "stylesheet" type = "text/css" href ="/css/materialize.css" />
<!-- icon -->
 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">



<script type="text/javascript">
//<!--
 
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
				<form name = "joinSupplierInput" enctype="multipart/form-data" method = "post" action = "/joinUser/joinSupplierPro.do"  >
					<div class = "col s12">
						<div class="input-field col s12">
				          <input name="supplierName" id="supplierName" type="text" class="validate" autofocus>
				          <label for="supplierName">*업체 이름</label>
				        </div>
			        </div>
			        <div class = "col s12">
						<div class="input-field col s12">
				          <input name="supplierNum" id="supplierNum" type="text" class="validate">
				          <label for="supplierlicensNum">*사업자번호</label>
				        </div>
			        </div>
			        <div class = "col s12">
						<div class="input-field col s12">
				        	<textarea name="SupplierIntro" id="SupplierIntro" class="materialize-textarea" row = "2"></textarea>
          					<label for="SupplierIntro">*업체 소개</label>
				        </div>
			        </div>
			         <div class = "col s12">
						<div class="input-field col s6">
							<input name = "minPeople" id="minPeople" type="text" class="validate">
				          	<label for="minPeople">*최소수용인원</label>
				        </div>
				        <div class="input-field col s6">
							<input name="maxPeople" id="maxPeople" type="text" class="validate">
				          	<label for="maxPeople">*최대수용인원</label>
				        </div>
			        </div>
			        <div class = "col s12">
						<div class="file-field input-field">
					      	<div class="btn">
					       		 <span>File</span>
					        	<input type="file" name= "supplierlicens">
							</div>
					      	<div class="file-path-wrapper">
					       		 <input  class="file-path validate" type="text" placeholder="사업자등록증">
					      </div>
					    </div>
			        </div>
			        <div class = "col s12">
			        	<div class="file-field input-field">
					      	<div class="btn">
					       		<span>File</span>
					        	<input type="file" multiple name = "supplierFile" >
					     	</div>
					      	<div class="file-path-wrapper">
					        	<input class="file-path validate" type="text" placeholder="업체 소개 사진 ">
					     	 </div>
						</div>
			        </div>
			        <div class = "col s12 row">
			        	<p>가능한 서비스 형태</p>
			        	<div class = "col s6">
			        		<label>
        						<input type="checkbox" name = "serviceCategory" value = "s1" />
        						<span>뷔페/케이터링</span>
      						</label>
			        	</div>
			        	<div class = "col s6">
			        		<label>
        						<input type="checkbox" name = "serviceCategory" value = "s2" />
        						<span>코스음식</span>
      						</label>
			        	</div>
			        	<div class = "col s6">
			        		<label>
        						<input type="checkbox" name = "serviceCategory" value = "s3" />
        						<span>드랍오프</span>
      						</label>
			        	</div>
			        	<div class = "col s6">
			        		<label>
        						<input type="checkbox" name = "serviceCategory" value = "s4" />
        						<span>도시락</span>
      						</label>
			        	</div>
			        </div>
			        <div class = "col s12 row">
			        	<p>음식 카테고리</p>
			        	<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "f1" />
        						<span>한정식</span>
      						</label>
			        	</div>
			        	<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "f2" />
        						<span>핑거푸드</span>
      						</label>
			        	</div>
      					<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "f3" />
        						<span>웨스턴</span>
      						</label>
			        	</div>
			        	<div class = "col l4 m2 s4">
			        		<label>
		      					<input type="checkbox" name = "foodCategory" value = "f4" />
		      					<span>일식</span>
		    				</label>
			        	</div>
			        	<div class = "col l4 m4 s4">
			        		<label>
		      					<input type="checkbox" name = "foodCategory" value = "f5" />
		      					<span>디저트류</span>
		    				</label>
			        	</div>
		    			<div class = "col l4 m4 s4">
			        		<label>
		      					<input type="checkbox" name = "foodCategory" value = "f6" />
		      					<span>커피/음료</span>
		    				</label>
			        	</div>
			        	<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "f7" />
        						<span>칵티일/와인</span>
      						</label>
			        	</div>
			        	<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "f8" />
        						<span>피자</span>
      						</label>
			        	</div>
      					<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "f9" />
        						<span>아시안퓨전</span>
      						</label>
			        	</div>
			        	<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "f10" />
        						<span>베지터리안</span>
      						</label>
			        	</div>
			        	<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "f11" />
        						<span>바베큐파티</span>
      						</label>
			        	</div>
      					<div class = "col l4 m4 s4">
			        		<label>
        						<input type="checkbox" name = "foodCategory" value = "f12" />
        						<span>기타</span>
      						</label>
			        	</div>
			        </div>
			         <div class = "col s12 row">
			        	<p>서비스 가능지역</p>
			        	<div class = "col s4">
			        		<label>
        						<input type="checkbox" name = "serviceLocation" value = "l1" />
        						<span>서울특별시</span>
      						</label>
			        	</div>
			        	<div class = "col s4">
			        		<label>
        						<input type="checkbox" name = "serviceLocation" value = "l2" />
        						<span>경기도</span>
      						</label>
			        	</div>
			        	<div class = "col s4">
			        		<label>
        						<input type="checkbox" name = "serviceLocation" value = "l3" />
        						<span>충청도</span>
      						</label>
			        	</div>
			        	<div class = "col s4">
			        		<label>
        						<input type="checkbox" name = "serviceLocation" value = "l4" />
        						<span>경상도</span>
      						</label>
			        	</div>
			        	<div class = "col s4">
			        		<label>
        						<input type="checkbox" name = "serviceLocation" value = "l5" />
        						<span>전라도</span>
      						</label>
			        	</div>
			        	<div class = "col s4">
			        		<label>
        						<input type="checkbox" name = "serviceLocation" value = "l6" />
        						<span>강원도</span>
      						</label>
			        	</div>
			        	<div class = "col s4">
			        		<label>
        						<input type="checkbox" name = "serviceLocation" value = "l7" />
        						<span>제주도</span>
      						</label>
			        	</div>
			        </div>
			       	 	 <button class="btn waves-effect waves-light" type="submit" name="action">
    						<i class="material-icons left">send</i>
    						판매자회원가입
  						</button>
  					<br>
  					<br>
				</form>
			</div>
		</div>
	</div> <!--  form  -->
</body>
</html>