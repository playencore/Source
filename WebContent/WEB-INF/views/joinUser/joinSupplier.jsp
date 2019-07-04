<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차리다</title>
<!-- material css-->
<link rel = "stylesheet" type = "text/css" href ="/css/nouislider.css" />
<link rel = "stylesheet" type = "text/css" href ="/css/materialize.css" />
<!--  -->
<script src = "/js/jquery-3.4.1.js"></script>
<script src = "/js/nouislider.js"></script>
<script src = "/js/materialize.js"></script>


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


</head>



<body class = "grey lighten-2">
	<br><br>
	<div class ="row">
		<div class = "col s12">
			<div class = "col s4"></div>
			<div class = "col s4 card-panel">
			<p class ="header">&nbsp;&nbsp;&nbsp;회원가입</p>
				<form name = "joinSupplierInput" method = "post" action = "">
					<div class = "row col s12">
						<div class="input-field col s12">
				          <input id="supplierName" type="text" class="validate" autofocus>
				          <label for="last_name">업체 이름</label>
				        </div>
			        </div>
			        <div class = "row col s12">
						<div class="input-field col s12">
				          <input id="supplierNum" type="text" class="validate">
				          <label for="last_name">사업자번호</label>
				        </div>
			        </div>
			        <div class = "row col s12">
						<div class="input-field col s12">
				        	<textarea id="SupplierIntro" class="materialize-textarea" row = "2"></textarea>
          					<label for="SupplierIntro">업체 소개</label>
				        </div>
			        </div>
			         <div class = "row col s12">
						<div class="input-field col s12">
				        	 <div id="test-slider"></div>
				        </div>
			        </div>
				</form>
			</div>
		</div>
	</div> <!--  form  -->

</body>
</html>