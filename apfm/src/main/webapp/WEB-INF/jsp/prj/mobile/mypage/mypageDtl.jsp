<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="file:///C|/Users/asdf/Documents/favicon.ico">
    <title>마이 페이지 상세보기</title>
    <!-- Bootstrap core CSS -->
    <link href="/mgnoincoun/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="/mgnoincoun/assets/css/font-awesome.min.css" rel="stylesheet">
    <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/mgnoincoun/assets/js/ie-emulation-modes-warning.js"></script>
    <script src="/mgnoincoun/js/jquery-1.11.2.min.js" ></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5shiv.min.js"></script>
      <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <!-- Custom styles for this template -->
    <link href="/mgnoincoun/assets/css/theme.css" rel="stylesheet">
  </head>
  <script>
	  $(document).ready(function() {
		  
			var msg = "${msg}";
			if(msg.length > 0) {
				alert(msg);
				document.location.href = "/mgnoincoun/login.do";
			}
		  
		  var gender = "${detail.gender}";
		  if(gender=="M") {
			  $("#gender").text("남자");
		  } else if(gender=="F") {
			  $("#gender").text("여자");
		  }
		 
	  });
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
                <li class="active"><a href="/mgnoincoun/mypageView.do">마이 페이지<i class="fa fa-caret-right"></i></a></li>
                <li><a href="/mgnoincoun/freeBbsList.do">알려드려요 &amp; 자유게시판<i class="fa fa-caret-right"></i></a></li>
                <li><a href="/mgnoincoun/careLibraryList.do">마음돌봄 자료실<i class="fa fa-caret-right"></i></a></li>
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
    <!-- 컨텐츠  ================================================== -->
    <div class="container content-wrapper">
      <div class="page-header">
        <h1 class="title"><i class="fa fa-comments-o"></i>마이 페이지</h1>
        <ol class="breadcrumb">
          <li><a href="/mgnoincoun/mobileMainList.do">Home</a></li>
          <!--<li><a href="#">센터소개</a></li>-->
          <li class="active">마이 페이지</li>
        </ol>
      </div>
      <div class="btn-wrap"><!-- 임시링크  -->
        <a class="btn btn-default btn-xs" href="/mgnoincoun/cnsAskList.do" role="tab">상담문의</a>
        <!-- <a class="btn btn-normal btn-xs" href="sub04_2.html" role="tab">상담신청내역 상세</a> -->
      </div>
      <h2 class="title">상담신청내역 상세</h2>
      <h3 class="title">상담신청내역</h3>
      <div class="table-wrap">
        <table class="table table-condensed">
          <col width="100px" />
          <col />
          <tbody>
            <tr>
              <th scope="row">상담센터</th>
              <td><strong><c:out value="${detail.centerNm }" /></strong></td>
            </tr>
            <tr>
              <th scope="row">상담구분</th>
              <td>
              	<c:out value="${detail.cnsGbNm }" />
              </td>
            </tr>
            <tr>
              <th scope="row">이름</th>
              <td>
              	<c:out value="${fn:substring(detail.cnsleNm,0,1) }" />
              	*
              	<c:out value="${fn:substring(detail.cnsleNm,2,8) }" />
              </td>
            </tr>
            <tr>
                <th scope="row">성별</th>
                <td><span id="gender"></span></td>
              </tr>
              <tr>
                <th scope="row">생년월일</th>
                <td>
                	<c:out value="${fn:substring(detail.birthDt,0,2) }" />**
                	<c:out value="${fn:substring(detail.birthDt,4,6) }" />**
                </td>
              </tr>
              <tr>
                <th scope="row">이메일</th>
                <td>
                	<c:out value="${fn:substring(detail.email,0,4) }" />
                	<c:forEach begin="5" end="${fn:length(detail.email) }" step="1">
                	*
                	</c:forEach>
                </td>
              </tr>
              <tr>
                <th scope="row" >전화번호</th>
                <td>
                	<c:out value="${fn:substring(detail.mobile,0,3) }" />****
                	<c:out value="${fn:substring(detail.mobile,7,13) }" />
                </td>
              </tr>
              <th scope="row">신청일자</th>
              <td><c:out value="${fn:substring(detail.writeDt,0,4) }"/>-<c:out value="${fn:substring(detail.writeDt,4,6) }"/>-<c:out value="${fn:substring(detail.writeDt,6,8) }"/></td>
            </tr>
            <tr>
              <th scope="row" rowspan="2">다음예약일자</th>
              <td class=""><c:out value="${fn:substring(detail.cnsRsvtDt,0,4) }"/>-<c:out value="${fn:substring(detail.cnsRsvtDt,5,7) }"/>-<c:out value="${fn:substring(detail.cnsRsvtDt,8,10) }"/> <c:out value="${detail.cnsRsvtStrtHour }" />시 <c:out value="${detail.cnsRsvtStrtMin }" />분</td>
            </tr>
            <!-- <tr>
              <td class=""><button type="button" class="btn btn-normal btn-xs">예약변경하기</button></td>
            </tr> -->
            <tr>
              <th scope="row">상담상태</th>
              <td>
              	<c:out value="${detail.cnsStatNm }" />
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="btn-wrap line bt bb pt10 pb10">
        <button type="button" class="btn btn-default" onclick="location.href='/mgnoincoun/'">홈</button>
        <button type="button" class="fr btn btn-normal" onclick="location.href='/mgnoincoun/mypageView.do'">마이페이지</button>
      </div>
    </div><!-- .container.content-wrapper /-->
    <!-- FOOTER -->
    <footer>
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