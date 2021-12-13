<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="file:///C|/Users/asdf/Documents/favicon.ico">
    <title>상담문의하기</title>
    <!-- Bootstrap core CSS -->
    <link href="/gnoincoun/assets/css/bootstrap.min.css" rel="stylesheet">
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
  <script>
		$(document).ready(function() {
			var ansCntn = "${detail.ansCntn}";
			var openStatYn = "${detail.openStatYn}";
			
	  		if(ansCntn == "") {
				$("#answer").css("display", "none");
	  		} else {
				$("#answer").css("display", "inline-block");
	  		}
		});
		
		function fn_fileDown() {
	  		var sysFileNm = "${detail.sysFileNm}";
	  		var filePath = "${detail.filePath}";
	  		var fileNm = "${detail.fileNm}";
	        document.location.href = "/gnoincoun/fileDown.do?sysFileNm="+sysFileNm+"&filePath="+filePath+"&fileNm="+fileNm;
	  	}
		
		function fn_movePage(num,prevYn) {
	  		document.location.href = "/gnoincoun/onlineCnsDtl.do?num="+num+"&prevYn="+prevYn;
	  	}
  </script>
  <body>
    <!-- 서브 비쥬얼 영역 -->
    <section class="title_explain hidden-xs">
      <div class="container">
        <dl>
          <dt>
            소통의 공간    </dt>
          <dd class="explanation">
            함께 나누는 사랑, 모두가 행복해집니다.    </dd>
          <dd class="explanEng">
            Communication Board    </dd>
        </dl>
      </div>
    </section>
    <!-- 서브 비쥬얼 영역 //-->
    <div class="container content-wrapper">
      <div class="page-header">
        <h1 class="title"><i class="fa fa-comments-o"></i>온라인상담</h1>
        <ol class="breadcrumb">
          <li><a href="/gnoincoun/homepageMainList.do">홈</a></li>
          <li><a href="#">소통의 공간</a></li>
          <li class="active">온라인상담</li>
        </ol>
      </div>
      <div class="content-area">
        <div class="article-area">
          <div class="board_box article-header" >
            <div class="txt_area">   
              <!-- 제목 -->
              <strong class="tit"><c:out value="${detail.title }" /> </strong>
              <!-- 제목 //-->
              <!-- 글등록정보 -->
              <div class="user_area">
                <span class="nick">
                  <span class="ellip"><span class="ellip"><c:out value="${detail.writer }" /></span></span>
                  <span class="time"><c:out value="${detail.dbInsTm }" /></span>
                  <%-- <span class="no"><c:out value="${detail.num }" /></span> --%>
                  <span class="ellip">
                 	<c:if test="${detail.openStatYn eq 'N' }">비공개</c:if>
                	<c:if test="${detail.openStatYn eq 'Y' }">공개</c:if>
                  </span>
                </span>
              </div>
              <!-- 글등록정보 //-->
            </div>
            <!--<div class="file-area">
              <a href="javascript:fn_fileDown()" class="btn btn-default mb3"><i class="fa fa-download mr5"></i>첨부파일 다운로드</a>
              <a href="" class="btn btn-default mb3"><i class="fa fa-download mr5"></i>첨부파일2 다운로드</a>
              <a href="" class="btn btn-default mb3"><i class="fa fa-download mr5"></i>첨부파일3 다운로드</a> 
            </div> -->
           </div><!-- board_box //-->
           <div class="article-body">
             <div class="article">
              	 <c:out value="${detail.cntn }"/>
             </div>
          </div><!-- .article-body /-->
          
          <div id="answer">
	          <div class="board_box article-header" >
	          </div>
	          <!-- 답변영역 -->
	          <div class="txt_area">   
	            <!-- 제목 -->
	            <strong class="tit" style="font-size:32px; font-weight:500px;">답변</strong>
	            <!-- 제목 //-->
	            <!-- 글등록정보 -->
	            <div class="user_area">
	              <span class="nick">
	                <span class="ellip"><span class="ellip"><c:out value="${detail.regNm }" /></span></span>
	                <span class="time"><c:out value="${detail.ansDbInsTm }" /></span>
	              </span>
	            </div>
	            <!-- 글등록정보 //-->
		          <div class="article-body" style="padding-top:30px;">
				      <div class="article">
				      	<c:out value="${detail.ansCntn }" escapeXml="false"/>
			          </div>
		          </div><!-- .article-body /-->              
	          </div><!-- 답변영역 // -->
          </div>          
          
        </div><!-- .article-list-area /-->
        <div class="btn-wrap line bt bb pt10 pb10 mt20 text-center">
          <button type="button" class="btn btn-default btn-lg fl" onclick="javascript:fn_movePage('<c:out value="${detail.num}"/>','Y');"><i class="fa fa-caret-left mr5"></i>이전글</button>
          <button type="button" class="btn btn-normal btn-lg" onclick="location.href='/gnoincoun/onlineCnsList.do'"><i class="fa fa-align-justify mr5"></i>목록</button>
          <button type="button" class="btn btn-default btn-lg fr" onclick="javascript:fn_movePage('<c:out value="${detail.num}"/>','N');">다음글<i class="fa fa-caret-right ml5"></i></button>
        </div>
      </div><!-- .content-area /-->
      </div>
  </body>
</html>