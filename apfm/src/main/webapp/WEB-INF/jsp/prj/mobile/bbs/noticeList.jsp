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
    <link rel="icon" href="file:///C|/Users/asdf/Documents/favicon.ico">
    <title>알려드려요&amp;자유게시판</title>
    <!-- Bootstrap core CSS -->
    <link href="/mgnoincoun/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="/mgnoincoun/assets/css/font-awesome.min.css" rel="stylesheet">
    <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/mgnoincoun/assets/js/ie-emulation-modes-warning.js"></script>
    <!-- <script src="/mgnoincoun/js/jquery-1.11.2.min.js" ></script> -->
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
  	
  	function fn_reg(param) {
  		var loginYn = "${loginYn}";
  		if(loginYn == "Y") {
	  		document.location.href = "/mgnoincoun/freeBbsInsert.do?save="+param;  			
  		} else if(loginYn =="N") {
  			alert("로그인 후에 글쓰기를 하실 수 있습니다.");
  		}
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
                <li class="active"><a href="/mgnoincoun/noticeList.do">센터소식 &amp; 공지사항<i class="fa fa-caret-right"></i></a></li>
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
    <!-- 컨텐츠  ================================================== -->
    <div class="container content-wrapper">
      <div class="page-header">
        <h1 class="title"><i class="fa fa-comments-o"></i>센터소식 &amp;공지사항</h1>
        <ol class="breadcrumb">
          <li><a href="/mgnoincoun/mobileMainList.do">Home</a></li>
          <!--<li><a href="#">센터소개</a></li>-->
          <li class="active">센터소식 &amp;공지사항</li>
        </ol>
      </div>
      <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
        <li class="nav-item active">
          <a class="nav-link" id="notice-tab" data-toggle="tab" href="#notice" role="tab" aria-controls="notice" aria-selected="true">센터소식</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="data-tab" data-toggle="tab" href="#free" role="tab" aria-controls="data" aria-selected="false">공지사항</a>
        </li>
      </ul>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade in active" id="notice" role="tabpanel" aria-labelledby="notice-tab">
         <!-- <h2 class="title">알려드려요</h2>-->
          <div class="article-list-area">
            <ul class="list_area">
              <c:if test="${centerNewsList.size() == 0 }">
		        <table  class="table table-condensed">
		          <col width="100px" />
		          <col />
		          <tbody>
		            <tr>
		              <td colspan="2" style="text-align: center; padding-top: 15px;"><strong>게시글이 없습니다</strong></td>
		            </tr>
		          </tbody>
		        </table>
			  </c:if>
			  <c:if test="${centerNewsList.size() > 0 }">
              	  <!-- loop -->
	              <c:forEach var="result" items="${centerNewsList}" varStatus="status">
		              <li class="board_box" >
		                <a href="#" onclick="javascript:fn_detail('<c:out value="${result.num}"/>','A');" class="txt_area">   
		                  <!-- 새글알림 -->
		                  <span class="icon_new_txt">
		                    <span>•</span>
		                  </span>
		                  <!-- 새글알림 //-->
		                  <!-- 제목 -->
		                  <strong class="tit"><c:out value="${result.title}" escapeXml="false"/></strong>
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
			  </c:if>
              <!-- loop //-->
            </ul><!-- .list_area -->
          </div><!-- .article-list-area -->
        </div><!-- .tab-pane -->
        <div class="tab-pane fade" id="free" role="tabpanel" aria-labelledby="data-tab">
          <!--자유게시판-->
          <div class="article-list-area">
            <ul class="list_area">
              <c:if test="${noticeList.size() == 0 }">
		        <table class="table table-condensed" style="margin-top: 15px;">
		          <col width="100px" />
		          <col />
		          <tbody>
		            <tr>
		              <td colspan="2" style="text-align: center; padding-top: 15px;"><strong>게시글이 없습니다</strong></td>
		            </tr>
		          </tbody>
		        </table>
			  </c:if>
			  <c:if test="${noticeList.size() > 0 }">
              <!-- loop -->
	              <c:forEach var="result" items="${noticeList}" varStatus="status">
		              <li class="board_box" >
		                <a href="#" onclick="javascript:fn_detail('<c:out value="${result.num}"/>','B');" class="txt_area">   
		                  <!-- 새글알림 -->
		                  <span class="icon_new_txt">
		                    <span>•</span>
		                  </span>
		                  <!-- 새글알림 //-->
		                  <!-- 제목 -->
		                  <strong class="tit"><c:out value="${result.title}" escapeXml="false"/></strong>
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
			  </c:if>
              <!-- loop //-->
            </ul><!-- .list_area -->
          </div><!-- .article-list-area -->
        </div><!-- .tab-pane /-->
      </div><!-- .tab-content /-->
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