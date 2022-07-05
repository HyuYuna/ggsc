<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap core CSS -->
    <!--<link href="/gnoincoun/assets/css/bootstrap.min.css" rel="stylesheet">-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link href="/gnoincoun/assets/css/font-awesome.min.css" rel="stylesheet">
    <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/gnoincoun/assets/js/ie-emulation-modes-warning.js"></script>
    <script src="/gnoincoun/js/jquery-1.11.2.min.js" ></script>
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5shiv.min.js"></script>
      <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <!-- Custom styles for this template -->
    <link href="/gnoincoun/assets/css/theme.css" rel="stylesheet">
  </head>
  
  <header class="navbar-wrapper">
      <nav class="navbar navbar-static-top">
        <div class="navbar-header">
          <div class="container">
            <a class="navbar-brand" href="/gnoincoun/homepageMainList.do"><img src="/gnoincoun/assets/img/logo.png" alt="경기도노인종합상담센터" /></a>
            <div class="social-icons pull-right">
              <ul class="nav nav-pills">
                <li><a href="/gnoincoun/homepageMainList.do" class="btn btn-primary btn-xs"><i class="fa fa-home mr5"></i>홈</a></li>
                <c:choose>
				    <c:when test="${loginYn eq 'Y'}">
				        <li><a href="/gnoincoun/logout.do" class="btn btn-primary btn-xs"><i class="fa fa-lock mr5"></i>로그아웃</a></li>
				        <li><a href="/gnoincoun/mypageView.do" class="btn btn-primary  btn-xs"><i class="fa fa-user mr5"></i>마이페이지</a></li>
				    </c:when>
				    <c:otherwise>
				        <li><a href="/gnoincoun/login.do" class="btn btn-primary btn-xs"><i class="fa fa-unlock-alt mr5"></i>로그인</a></li>
				        <li><a href="/gnoincoun/agree.do" class="btn btn-primary  btn-xs"><i class="fa fa-user mr5"></i>회원가입</a></li>
				    </c:otherwise>
				</c:choose> 
              </ul>
            </div>
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">전체메뉴</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
          </div>
        </div>

        <div id="navbar" class="collapse navbar-collapse">
          <div class="container">
          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">센터소개<i class="fa fa-angle-down"></i></a>
              <ul class="dropdown-menu"  role="menu">
                <li class="dropdown-item">
	                <a href="/gnoincoun/salutation.do">인사말
	                <i class="fa fa-caret-right"></i></a>
                </li>
				<li class="dropdown-item">
					<a href="/gnoincoun/operatCorp.do">운영법인
					<i class="fa fa-caret-right"></i></a>
				</li>
				<li class="dropdown-item">
					<a href="/gnoincoun/missionVis.do">미션과 비젼 
					<i class="fa fa-caret-right"></i></a>
				</li>
				<li class="dropdown-item">
					<a href="/gnoincoun/centerFoot.do">걸어온길
					<i class="fa fa-caret-right"></i></a>
				</li>
				<li class="dropdown-item">
					<a href="/gnoincoun/peopleTg.do">함께하는 사람들
					<i class="fa fa-caret-right"></i></a>
				</li>
				<li class="dropdown-item">
					<a href="/gnoincoun/centerMap.do">시군센터
					<i class="fa fa-caret-right"></i></a>
				</li>
				<li class="dropdown-item">
					<a href="/gnoincoun/directions.do">오시는길
					<i class="fa fa-caret-right"></i></a>
				</li>
              </ul>
            </li>
            <li>
              <a href="/gnoincoun/oldCnsCenter.do">시&middot;군 노인상담센터</a>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">사업소개<i class="fa fa-angle-down"></i></a>
              <ul class="dropdown-menu"  role="menu">
                <li class="dropdown-item">
	                <a href="/gnoincoun/busiIntroList.do">시군지원사업
	                <i class="fa fa-caret-right"></i></a>
                </li>
				<li class="dropdown-item">
					<a href="/gnoincoun/busiIntroList.do?gubun=noin">24시노인온상담
					<i class="fa fa-caret-right"></i></a>
				</li>
				<li class="dropdown-item">
					<a href="/gnoincoun/busiIntroList.do?gubun=mid">중장년마음돌봄 전화상담
					<i class="fa fa-caret-right"></i></a>
				</li>
				<li class="dropdown-item">
					<a href="/gnoincoun/busiIntroList.do?gubun=gender">성인지교육사업
					<i class="fa fa-caret-right"></i></a>
				</li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">소통의 공간<i class="fa fa-angle-down"></i></a>
              <ul class="dropdown-menu"  role="menu">
                <li class="dropdown-item"><a href="/gnoincoun/centerNewsList.do">센터소식<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/noticeList.do">공지사항<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/docLibraryList.do">문서자료실<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/freeBoardList.do">자유게시판<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/onlineCnsList.do">온라인상담<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/comfCnsWrite.do">맘편한 상담<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/psyInfo.do">간편한 심리검사<i class="fa fa-caret-right"></i></a></li>
                <li class="dropdown-item"><a href="/gnoincoun/eduAppWrite.do">교육신청<i class="fa fa-caret-right"></i></a></li>
              </ul>
            </li>
          </ul>
            </div>
        </div><!-- navbar-collapse -->
      </nav>
    </header>
    <div style="margin-bottom:100px;">
    </div>
  
	
	<script src="/gnoincoun/assets/js/jquery.min.js"></script>
    <script src="/gnoincoun/assets/js/bootstrap.min.js"></script>
    <!--<script src="assets/js/docs.min.js"></script>-->
    <script src="/gnoincoun/assets/js/ie10-viewport-bug-workaround.js"></script>
    <script>
      $(document).ready(function(){ 
        // 로그인 회원가입 관리자 메뉴  
          $('.navbar-toggle').on('click', function() {
            $('.social-icons').fadeToggle(200);
          });
        
        // 첨부파일 
        var fileTarget = $('.filebox .upload-hidden'); 
        fileTarget.on('change', function(){  // 값이 변경되면 
          if(window.FileReader){ // modern browser 
            var filename = $(this)[0].files[0].name; 
          } 
          else {  // old IE 
              var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출 
          } 
          // 추출한 파일명 삽입 
          $(this).siblings('.upload-name').val(filename); 
          }); 
        
        
        });
	</script>
<style>
	.logo-box img{
	width: auto; height: auto;
	max-width: 350px;
}
</style>
