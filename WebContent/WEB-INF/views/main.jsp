<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>
<style>
.parallax-container {
    position: relative;
    overflow: hidden;
    height: 600px;
}
nav ul a {
    -webkit-transition: background-color .3s;
    transition: background-color .3s;
    font-size: 1rem;
    color: #000;
    display: block;
    padding: 0 15px;
    cursor: pointer;
}
nav .brand-logo {
    position: absolute;
    color: #000;
    display: inline-block;
    font-size: 2.1rem;
    padding: 0;
}
.nav-wrapper{
	background-color: #fff;
}
.mainIcon {
    text-align: center;
    width: 226px;
    color: rgb(116, 116, 116);
    padding: 40px 0px;
}
.includeIcon {
    position: relative;
    width: 80px;
    height: 80px;
    box-shadow: rgb(204, 204, 204) 2px 2px 3px 0px;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    background-color: rgb(255, 255, 255);
    background-size: 80%;
    margin: 0px auto 24px;
    border-radius: 100%;
    background-repeat: no-repeat;
    background-position: 50% 50%;
}
.iconTitle {
    text-align: center;
    margin-bottom: 16px;
    font-size: 16px;
    line-height: 24px;
    font-weight: 800;
}
.subTitle {
    font-size: 16px;
    line-height: 24px;
    font-weight: 400;
}
.iconBox {
    position: relative;
    display: block;
    overflow: hidden;
    margin: 0px;
    padding: 0px;
    outline: none !important;
}
.iconContainer {
    text-align: center;
    padding-top: 24px;
    background-color: rgb(252, 251, 249);
    overflow-x: auto;
    background-size: cover;
    background-repeat: no-repeat;
}
.iconHeader {
    font-size: 20px;
    line-height: 32px;
    font-weight: 700;
    text-align: left;
    width: 1140px;
    padding-bottom: 16px;
    border-bottom: 1px solid rgb(227, 227, 227);
    margin: 0px auto;
}
.iconSection {
    cursor: default;
    width: 1140px;
    margin: 0px auto;
}
.iconDatas {
    position: relative;
    display: block;
    box-sizing: border-box;
    user-select: none;
    touch-action: pan-y;
    -webkit-tap-highlight-color: transparent;
    outline: none !important;
}
.slick-list {
    position: relative;
    display: block;
    overflow: hidden;
    margin: 0px;
    padding: 0px;
    outline: none !important;
}
.slick-track {
    position: relative;
    top: 0px;
    left: 0px;
    display: block;
    margin-left: auto;
    margin-right: auto;
}
.slick-slide {
    display: none;
    float: left;
    height: 100%;
    min-height: 1px;
}
.box {
    margin: 0 auto;
    border: 2px solid #fff;
    width: 800px;
    max-width: 90%;
    padding: 100px 50px;
    text-align: center;
}
.headline-3 {
    position: relative;
    padding-bottom: 50px;
    margin-bottom: 60px;
    text-align: center;
    visibility: visible !important;
    color: #fff;
}
.headline-3 h2 {
    font-weight: 700;
}
</style>
<script type="text/javascript">
//<!--  
$(document).ready(function(){
	$('.parallax').parallax();
});

//-->
</script>
<div style="clear: both">
	<div class="parallax-container">
		<div class="parallax"><img src="/images/main/main6.jpg"></div>
		<div style="position: absolute;color: white;left: 10%;top: 15%;font-size: 50px;">단 하나의</div>
		<div style="position: absolute;color: white;left: 10%;top: 25%;font-size: 50px;">당신만을 위한 서비스</div>
	</div>
</div>
<div class="iconContainer">
	<div class="iconHeader">
		음식 고민
	</div>
	<div class="iconSection">
		<div class="iconDatas" >
			<div class="slick-list" style="margin-left: 35px;">
				<div class="slick-track" style="width: 5700px; opacity: 1;">
					<div style="width: 1112px;">
						<div style="float:left;margin: 0 30px;">
							<div class="mainIcon" tabindex="-1" style="width: 100%; display: inline-block;">
								<div class="includeIcon" style="background-image: url(/images/main/icon1.png);">
								</div>
								<div >
									<div class="iconTitle">
										회사 행사에<br>기억에 남는 음식이 필요해요.
									</div>
								</div>
								<div class="subTitle">
									#행사 #뷔페
								</div>
							</div>
						</div>
						
						<div style="float:left;margin: 0 30px;">
							<div class="mainIcon" tabindex="-1" style="width: 100%; display: inline-block;">
								<div class="includeIcon"  style="background-image: url(/images/main/icon2.png);">
								</div>
								<div >
									<div class="iconTitle">
										동아리 모임에서<br>특별한 음식을 준비하고 싶어요.
									</div>
								</div>
								<div class="subTitle">
									#소모임 #특별식
								</div>
							</div>
						</div>
						
						<div style="float:left;margin: 0 30px;">
							<div class="mainIcon" tabindex="-1" style="width: 100%; display: inline-block;">
								<div class="includeIcon" style="background-image: url(/images/main/icon3.png);">
								</div>
								<div >
									<div class="iconTitle">
										친한 친구들과<br>나들이 갈때 필요한 음식 준비
									</div>
								</div>
								<div class="subTitle">
									#소풍 #특별한 음식
								</div>
							</div>
						</div>
						
						<div style="float:left;margin: 0 30px;">
							<div class="mainIcon" tabindex="-1" style="width: 100%; display: inline-block;">
								<div class="includeIcon" style="background-image: url(/images/main/icon4.png);">
								</div>
								<div >
									<div class="iconTitle">
										화창한 날<br>특별한 사람들과 먹을 특별한 음식
									</div>
								</div>
								<div class="subTitle">
									#음식준비 귀찮아
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row" style="background-color: #b8d2cd;padding: 40px 0;">
	<div class="box">
		<div class="headline-3">
			<h2>
				당신의 단 하루를 위해서
			</h2>
			<p style="color:#fff; font-size:14px;"><b>차리다</b></p>
		</div>
		<p style="font-size:16px;color:#fff;">
			셀프 스몰웨딩, 개인파티, 대규모파티, 기업행사에 이르기까지 <br>
			독창적이고 이야기 있는 케이터링 서비스를 제공 해 드립니다.
		</p>
	</div>
</div>
<%@include file="/include/footer.jsp" %>
</body>
</html>