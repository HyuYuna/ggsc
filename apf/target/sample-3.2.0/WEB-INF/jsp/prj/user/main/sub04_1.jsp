<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="file:///C|/Users/asdf/Documents/favicon.ico">
    <title>마이 페이지</title>
    <!-- Bootstrap core CSS -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/css/font-awesome.min.css" rel="stylesheet">
    <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../assets/js/ie-emulation-modes-warning.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5shiv.min.js"></script>
      <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <!-- Custom styles for this template -->
    <link href="../assets/css/theme.css" rel="stylesheet">
  </head>
  <body>
    <!-- 헤더 ================================================== -->
    <header class="navbar-wrapper">
      <nav class="navbar navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <a class="navbar-brand" href="index.html"><img src="../assets/img/logo.png" alt="경기도노인종합상담센터" /></a>
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">전체메뉴</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li><a href="sub01.html">이렇게 이용하세요<i class="fa fa-caret-right"></i></a></li>
                <li><a href="sub02.html">간편한 심리검사<i class="fa fa-caret-right"></i></a></li>
                <li><a href="sub03.html">맘편한 상담<i class="fa fa-caret-right"></i></a></li>
                <li class="active"><a href="sub04.html">마이 페이지<i class="fa fa-caret-right"></i></a></li>
                <li><a href="sub05.html">알려드려요 &amp; 자유게시판<i class="fa fa-caret-right"></i></a></li>
                <li><a href="sub06.html">마음돌봄 자료실<i class="fa fa-caret-right"></i></a></li>
              </ul>
            </div>
          </div>
        </nav>
        <div class="social-icons pull-right">
          <ul class="nav nav-pills">
            <li><a href="index.html" class="btn btn-primary btn-xs"><i class="fa fa-home mr5"></i>홈</a></li>
            <li><a href="form_login.html" class="btn btn-primary btn-xs"><i class="fa fa-unlock-alt mr5"></i>로그인</a></li>
            <li><a href="form_signup.html" class="btn btn-primary  btn-xs"><i class="fa fa-user-plus mr5"></i>회원가입</a></li>
          </ul>
        </div>
    </header><!-- header.navbar-wrapper /-->
    <!-- 컨텐츠  ================================================== -->
    <div class="container content-wrapper">
      <div class="page-header">
        <h1 class="title"><i class="fa fa-comments-o"></i>마이 페이지</h1>
        <ol class="breadcrumb">
          <li><a href="#">Home</a></li>
          <!--<li><a href="#">센터소개</a></li>-->
          <li class="active">마이 페이지</li>
        </ol>
      </div>
      <div class="btn-wrap"><!-- 임시링크  -->
        <a class="btn btn-normal btn-xs" href="sub04_1.html" role="tab">상담문의</a>
        <a class="btn btn-default btn-xs" href="sub04_2.html" role="tab">상담신청내역 상세</a>
      </div>
      <h2 class="title">상담문의</h2>
      <h3 class="title">상담문의하기</h3>
      <div class="table-wrap">
        <table  class="table table-condensed">
          <col width="100px" />
          <col />
          <tbody>
            <tr>
              <th scope="row">제목</th>
              <td><strong>제목</strong></td>
            </tr>
            <tr>
              <th scope="row">비밀번호</th>
              <td>비밀번호-</td>
            </tr>
            <tr>
              <th scope="row" class="vt">문의내용</th>
              <td>
                 문의 내용이 게재됩니다. 문의 내용이 게재됩니다. 문의 내용이 게재됩니다. 문의 내용이 게재됩니다. 문의 내용이 게재됩니다. 문의 내용이 게재됩니다. 문의 내용이 게재됩니다. 
              </td>
            </tr>
            <tr>
              <th scope="row">문의일자</th>
              <td>2020-07-02</td>
            </tr>
          </tbody>
        </table>
      </div>
      <h3 class="title">답변내용</h3>
      <div class="table-wrap">
        <table  class="table table-condensed">
          <col width="100px" />
          <col />
          <tbody>
            <tr>
              <th scope="row">제목</th>
              <td><strong>제목</strong></td>
            </tr>
            <tr>
              <th scope="row">답변자</th>
              <td>답변자</td>
            </tr>
            <tr>
              <th scope="row" class="vt">답변내용</th>
              <td>
                 답변 내용이 게재됩니다. 답변 내용이 게재됩니다. 답변 내용이 게재됩니다. 답변 내용이 게재됩니다. 답변 내용이 게재됩니다. 답변 내용이 게재됩니다. 답변 내용이 게재됩니다. 
              </td>
            </tr>
            <tr>
              <th scope="row">답변일자</th>
              <td>2020-07-02</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="btn-wrap line bt bb pt10 pb10">
        <button type="button" class="btn btn-default" onclick="location.href='index.html'">홈</button>
        <button type="button" class="fr btn btn-normal" onclick="location.href='sub04.html'">마이페이지</button>
      </div>
    </div><!-- .container.content-wrapper /-->
    <!-- FOOTER -->
    <footer>
      <div class="copyaddress">
        <ul>
          <li><b>경기도노인종합상담센터</b></li>
          <li><span>주소 : </span><a href="javascript:top_address()">경기도 수원시 장안구 경수대로 1150, 도서관 3층</a></li>
          <li><span>사업자등록번호 : </span>136-82-61243<span class="ml10">대표 : </span>김미나</li>
          <li><span> TEL : </span> <a href="javascript:top_tel()">031-222-1360</a></li>
          <li><span> FAX : </span><a href="javascript:top_fax()">070-4832-6366</a></li>
          <li><span>E-mail : </span><a href="javascript:top_email()">ggnoincoun@gmail.com</a></li>
          <li><span>개인정보담당자 : </span>김지원  </li>
          <li class="copyright">COPYRIGHT(c) <b>GNOIN</b> ALL RIGHT RESERVED</li>
        </ul>
      </div>
    </footer>

    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <!--<script src="assets/js/docs.min.js"></script>-->
    <script src="../assets/js/ie10-viewport-bug-workaround.js"></script>
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