<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
        
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
    <meta name="description" content="">
    <META NAME="ROBOTS" CONTENT="INDEX"/>
    <meta name="author" content="">
    <link rel="icon" href="file:///C|/Users/asdf/Documents/favicon.ico">
    <title>경기도노인종합상담센터</title>
    <!-- Bootstrap core CSS -->
    <link href="/mgnoincoun/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="/mgnoincoun/assets/css/font-awesome.min.css" rel="stylesheet">
    <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/mgnoincoun/assets/js/ie-emulation-modes-warning.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5shiv.min.js"></script>
      <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <!-- Custom styles for this template -->
    <link href="/mgnoincoun/assets/css/theme.css" rel="stylesheet">
  </head>
  <script>
	function fn_detail(num,save){
		document.location.href = "/mgnoincoun/noticeView.do?num="+num+"&save="+save;
	}
  </script>
  <body>
    <!-- 헤더 ================================================== -->
    <header class="navbar-wrapper">
      <nav class="navbar navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <a class="navbar-brand" href="/mgnoincoun/mobileMainList.do"><img src="/mgnoincoun/assets/img/logo.png" alt="경기도노인종합상담센터" /></a>
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">전체메뉴</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li><a href="/mgnoincoun/psyCnsIntro.do">이렇게 이용하세요<i class="fa fa-caret-right"></i></a></li>
                <li><a href="/mgnoincoun/psyCnsList.do">간편한 심리검사<i class="fa fa-caret-right"></i></a></li>
                <li><a href="/mgnoincoun/comfCnsInsert.do">맘편한 상담<i class="fa fa-caret-right"></i></a></li>
                <li><a href="/mgnoincoun/mypageView.do">마이 페이지<i class="fa fa-caret-right"></i></a></li>
                <li><a href="/mgnoincoun/noticeList.do">센터소식 &amp; 공지사항<i class="fa fa-caret-right"></i></a></li>
                <li><a href="/mgnoincoun/freeBbsList.do">문서자료실 &amp; 자유게시판<i class="fa fa-caret-right"></i></a></li>
                <li><a href="/mgnoincoun/cnsAskList.do">상담문의하기<i class="fa fa-caret-right"></i></a></li>
              </ul>
            </div>
          </div>
        </nav>
        <div class="social-icons pull-right">
          <ul class="nav nav-pills">
            <li><a href="/mgnoincoun/mobileMainList.do" class="btn btn-primary btn-xs"><i class="fa fa-home mr5"></i>홈</a></li>
             <c:choose>
				 <c:when test="${loginYn eq 'Y'}">
				     <li><a href="/mgnoincoun/logout.do" class="btn btn-primary btn-xs"><i class="fa fa-lock mr5"></i>로그아웃</a></li>
				     <li><a href="/mgnoincoun/mypageView.do" class="btn btn-primary  btn-xs"><i class="fa fa-user mr5"></i>마이페이지</a></li>
				 </c:when>
				 <c:otherwise>
				     <li><a href="/mgnoincoun/login.do" class="btn btn-primary btn-xs"><i class="fa fa-unlock-alt mr5"></i>로그인</a></li>
				     <li><a href="/mgnoincoun/agree.do" class="btn btn-primary  btn-xs"><i class="fa fa-user mr5"></i>회원가입</a></li>
				 </c:otherwise>
			 </c:choose>
          </ul>
        </div>
    </header><!-- header.navbar-wrapper /-->
    <!-- 메인 배너  ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item item01 active">
          <img src="/mgnoincoun/assets/img/main-img01.png" alt="함께해요!" />
          <div class="container">
            <div class="carousel-caption">
              <h1><span>경기도노인종합상담센터와</span><strong>함께해요!</strong></h1>
              <p> 경기도가 지원하고<br>
                      경기복지재단이 위탁·운영하는<br>
                      노인전문상담기관으로서<br>
                      어르신의 행복한 노후를<br>
                      돕고자 합니다.</p>
            </div>
          </div>
        </div><!-- .item01 -->
        <!--<div class="item item02">
          <img src="assets/img/main-img02.png" alt="함께해요!" />
          <div class="container">
            <div class="carousel-caption">
              <h1><span>경기도 언제 어디서나 편안하게</span><strong>어르신의 마음이<br />웃는 그 날까지<br />함께합니다.</strong></h1>
            </div>
          </div>
        </div> .item02 -->
        <!--<div class="item item03">
          <img src="assets/img/main-img03.png" alt="함께해요!" />
          <div class="container">
            <div class="carousel-caption">
              <h1><span>경기도노인종합상담센터와</span><strong>함께해요!</strong></h1>
                       <p> 경기도가 지원하고<br />
                      경기복지재단이 위탁·운영하는<br />
                      노인전문상담기관으로서<br />
                      어르신의 행복한 노후를<br />돕고자 합니다.</p>
            </div>
          </div>
        </div> .item03 -->
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->
    <!-- 바로가기 메뉴 . -->
    <div class="container-fluid">
      <div class="main-menu">
          <div class="col-xs-4 col-sm-2">
            <a class="icon-box-vertical" href="/mgnoincoun/psyCnsIntro.do">
             <i class="fa fa-question"></i>
              <h5 class="icon-box-header">이렇게<br />이용하세요</h5>
            </a>
          </div>
          <div class="col-xs-4 col-sm-2">
            <a class="icon-box-vertical" href="/mgnoincoun/psyCnsList.do">
              <i class="fa fa-list-alt"></i>
              <h5 class="icon-box-header">간편한<br />심리검사</h5>
            </a>
          </div>
          <div class="col-xs-4 col-sm-2">
            <a class="icon-box-vertical" href="/mgnoincoun/comfCnsInsert.do">
              <i class="fa fa-comments-o"></i>
              <h5 class="icon-box-header">맘편한 상담</h5>
            </a>
          </div>
          <div class="col-xs-4 col-sm-2">
            <a class="icon-box-vertical" href="/mgnoincoun/mypageView.do">
              <i class="fa fa-user-circle-o"></i>
              <h5 class="icon-box-header">마이 페이지</h5>
            </a>
          </div>
          <div class="col-xs-4 col-sm-2">
            <a class="icon-box-vertical" href="/mgnoincoun/noticeList.do">
              <i class="fa fa-newspaper-o"></i>
              <h5 class="icon-box-header">센터소식<br />&amp; 공지사항</h5>
            </a>
          </div>
          <div class="col-xs-4 col-sm-2">
            <a class="icon-box-vertical" href="/mgnoincoun/freeBbsList.do">
              <i class="fa fa-heart-o"></i>
              <h5 class="icon-box-header">문서자료실<br />&amp; 자유게시판</h5>
            </a>
          </div>
        </div>
       </div><!-- .container-fluid /-->
      <div class="container">
        <div class="panel panel-board">
         <h2 class="title">센터소식</h2>
<!--         <div class="article-list-area">
          <ul class="list_area">
            loop
            <li class="board_box" >
              <a href="view.html" onclick="" class="txt_area">   
                새글알림
                <span class="icon_new_txt">
                  <span>•</span>
                </span>
                새글알림 //
                제목
                <strong class="tit">2020년 경기도노인종합상담센터 4차 직원(기간제) 채용 임용예정자 공고 </strong>
                제목 //
                글등록정보
                <div class="user_area">
                  <span class="nick">
                    <span class="ellip"><span class="ellip">홍길동</span></span>
                    <span class="time">2020.11.09 (월)</span>
                    <span class="no">5</span>
                  </span>
                </div>
                글등록정보 //
              </a>
            </li>
            loop //
          </ul>.list_area
        </div>.article-list-area -->
		<div class="article-list-area">
            <ul class="list_area">
              <!-- loop -->
              <c:forEach var="result" items="${CenterNewsListA}" varStatus="status">
	              <li class="board_box" >
	                <a href="#" onclick="javascript:fn_detail('<c:out value="${result.num}"/>','A');" class="txt_area">   
	                  <!-- 새글알림 -->
	                  <span class="icon_new_txt">
	                    <span>•</span>
	                  </span>
	                  <!-- 새글알림 //-->
	                  <!-- 제목 -->
	                  <strong class="tit"><c:out value="${result.title}" escapeXml="false" /></strong>
	                  <!-- 제목 //-->
	                  <!-- 글등록정보 -->
	                  <div class="user_area">
	                    <span class="nick">
	                      <span class="ellip"><span class="ellip"><c:out value="${result.writer}"/></span></span>
	                      <span class="time"><c:out value="${result.dbInsTm}"/></span>
	                      <span class="no"><c:out value="${result.num}"/></span>
	                    </span>
	                  </div>
	                  <!-- 글등록정보 //-->
	                </a>
	              </li>
			  </c:forEach>
              <!-- loop //-->
            </ul><!-- .list_area -->
          </div><!-- .article-list-area -->        
        </div><!-- .panel /-->
       <!-- <div class="gg-relate input-group">
          <div class="input-group-btn">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">유관기관<span class="caret"></span></button>
            <ul class="dropdown-menu" role="menu">
              <li><a href="https://www.gg.go.kr/">경기도청</a></li>
            </ul>
          </div>
          <button class="btn btn-default" type="button">이동</button>
        </div> --><!-- /input-group -->
    </div><!-- .container /-->
    <!-- FOOTER -->
    <footer>
      <div class="container">
        <div class="copyaddress">
          <ul>
            <li><b>경기도노인종합상담센터</b></li>
            <li><span>주소 : </span><a href="javascript:top_address()">경기도 수원시 장안구 경수대로 1150, 도서관 3층</a></li>
            <li><span>사업자등록번호 : </span>722-82-00367<span class="ml10">대표 : </span>김미나</li>
            <li><span> TEL : </span> <a href="javascript:top_tel()">031-222-1360</a></li>
            <li><span> FAX : </span><a href="javascript:top_fax()">070-4832-6366</a></li>
            <li><span>E-mail : </span><a href="javascript:top_email()">ggnoincoun@gmail.com</a></li>
            <li><span>개인정보담당자 : </span>김지원  </li>
            <li class="copyright">COPYRIGHT(c) <b>GNOIN</b> ALL RIGHT RESERVED</li>
          </ul>
        </div>
      </div><!-- .container /-->
    </footer>

    <script src="/mgnoincoun/assets/js/jquery.min.js"></script>
    <script src="/mgnoincoun/assets/js/bootstrap.min.js"></script>
    <!--<script src="assets/js/docs.min.js"></script>-->
    <script src="/mgnoincoun/assets/js/ie10-viewport-bug-workaround.js"></script>
    <script>
      $(document).ready(function(){ 
          // 로그인 회원가입 관리자 메뉴  
          $('.navbar-toggle').on('click', function() {
            $('.social-icons').fadeToggle(200);
          });
      });
		</script>
  </body>
</html>