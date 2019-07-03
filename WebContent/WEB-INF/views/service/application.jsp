<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html  lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>단 하나의 서비스 - 차리다</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<script type="text/javascript" src="/js/moment.min.js"></script>
	<link rel="stylesheet" href="/css/bootstrap-datetimepicker.css">
	<script type="text/javascript" src="/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript">
              $(function () {
                $("#datetimepicker1").on("dp.change", function (e) {
                    $('#datetimepicker1').data("DateTimePicker").minDate(moment().add(7,'days').format());// 현재일로부터 7일 이후만 선택가능
                });
                  $('#datetimepicker1').datetimepicker();
              });
          </script>
    <!--js-->
    <style media="screen">
      @font-face {
        font-family: NanumSquareR;
        src: url(./fonts/NanumSquareR.woff) format('woff');
      }

      @font-face {
          font-family: NanumSquareL;
          src: url(./fonts/NanumSquareL.woff) format('woff');
      }

      @font-face {
          font-family: NanumSquareB;
          src: url(./fonts/NanumSquareB.woff) format('woff');
      }
      .page-header {
        padding-bottom: 9px;
        margin: 40px 0 20px;
        border-bottom: 1px solid #eee;
      }
      .breadcrumb-item+.breadcrumb-item::before {
          display: inline-block;
          padding-right: .3rem;
          color: #6c757d;
          content: ">";
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
</head>
<body>
	<nav class="navbar navbar-expand-xl bg-primary navbar-dark">
        <div class="container">
            <!-- 브랜드 로고 -->
            <a href="http://playdata.io" class="navbar-brand"><img src="./img/play_data_white.png" alt="차리다"></a>
            <!-- 햄버거 버튼 -->
            <button class="navbar-toggler" data-toggle="collapse" data-target="#myNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-end" id="myNavbar">
                <ul class="navbar-nav">
                    <li class="nav-item"><a href="#" class="nav-link">게시판</a></li>
                    <li class="nav-item"><a href="#container" class="nav-link">갤러리</a></li>
                    <li class="nav-item"><a href="#grid_system" class="nav-link">로그인</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container">
      <!-- Page Heading/Breadcrumbs -->
       <div class="row">
           <div class="col-lg-12">
               <h2 class="page-header">서비스 신청
                   <small>기본정보 입력</small>
               </h2>
               <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">Home</a></li>
                  <li class="breadcrumb-item active" aria-current="page">서비스 신청</li>
                </ol>
              </nav>
           </div>
       </div>
       <form action="" method="post">
           <div class="row" style="justify-content: center!important;" >
               <div class="col-md-8 bg-light" style="padding-top:15px">
                   <h5>행사장위치 입력</h5>
                   <div class="form-group">
                       <div class="input-group">
                           <input type="text" class="form-control" placeholder="주소를 검색해주세요." disabled>
                           <div class="input-group-addon" style="color:#fff;background-color: #5bc0de;">
                              <button class="btn btn-info ">검색</button>
                           </div>
                       </div>
                       <div class="input-group">
                           <input type="text" class="form-control" placeholder="상세 주소를 입력해주세요.">
                       </div>
                   </div>
               </div>
           </div>
           <div class="row" style="justify-content: center!important;" >
               <div class="col-md-8 bg-light" style="padding-top:15px">
                   <h5>날짜정보 입력</h5>
                   <div class="form-group">
                      <div class='input-group date' id='datetimepicker1'>
	                      <input type='text' class="form-control" />
	                      <span class="input-group-addon">
	                          <span class="glyphicon glyphicon-calendar">ㅁㅁ</span>
	                      </span>
                 	 </div>
                   </div>
               </div>
           </div>
        </form>
        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->
</body>
</html>
