<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    

<script src="/gnoincoun/editor/js/summernote_0.8.3.js"></script>
<script src="/gnoincoun/editor/js/summernote_0.8.3.min.js"></script>
<script src="/gnoincoun/editor/lang/summernote-ko-KR.js"></script>
<script src="/gnoincoun/editor/js/bootstrap_3.3.5.js"></script>
<link rel="stylesheet" href="/gnoincoun/editor/css/summernote_0.8.3.css">

<script type="text/javascript">
	$(document).ready(function() {
	   $('#rcontent').summernote({
	        minHeight: 400,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR',
	   });
	});
	function fn_fileDown(sysFileNm, filePath, fileNm) {
		$("#fileNm").val(fileNm);
		$("#sysFileNm").val(sysFileNm);
		$("#filePath").val(filePath);
		document.downForm.action = "/gnoincoundb/fileDown2.do";
		document.downForm.submit();
	}
	
	function fn_movePage(num, prevYn) {
		document.location.href = "/gnoincoun/freeBoardDtl.do?num=" + num + "&prevYn=" + prevYn;
	}
</script>

<section class="title_explain hidden-xs">
	<div class="container">
		<dl>
			<dt>소통의 공간</dt>
			<dd class="explanation">함께 나누는 사랑, 모두가 행복해집니다.</dd>
			<dd class="explanEng">Communication Board</dd>
		</dl>
	</div>
</section>
<section class="service-2 section">
	<form name="downForm" id="downForm" method="get" enctype="multipart/form-data">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" id="fileNm" name="fileNm" value="" />
		<input type="hidden" id="sysFileNm" name="sysFileNm" value="" />
		<input type="hidden" id="filePath" name="filePath" value="" />
	</form>
    <div class="container content-wrapper" style="margin-top: 0px;">
      <div class="page-header">
        <h1 class="title"><i class="fa fa-comments-o"></i>자유게시판</h1>
        <ol class="breadcrumb">
          <li><a href="/gnoincoun/homepageMainList.do">홈</a></li>
          <li><a href="#">소통의 공간</a></li>
          <li class="active">자유게시판</li>
        </ol>
      </div>
      <div class="content-area">
        <div class="article-area">
          <div class="board_box article-header" >
            <div class="txt_area">   
              <!-- 제목 -->
              <strong class="tit"><c:out value="${freeBoard.title }" escapeXml="false" /> </strong>
              <!-- 제목 //-->
              <!-- 글등록정보 -->
              <div class="user_area">
                <span class="nick">
                  <span class="ellip"><span class="ellip"><c:out value="${freeBoard.writer }" /></span></span>
                  <span class="time"><c:out value="${freeBoard.dbInsTm }" /></span>
                  <span class="no"><c:out value="${freeBoard.num }" /></span>
                </span>
              </div>
              <!-- 글등록정보 //-->
            </div>
            <div class="file-area">
	            <c:forEach var="row" items="${file}" varStatus="var">
	            	<p>${row.fileNm} &nbsp; <a href="javascript:fn_fileDown('<c:out value="${row.sysFileNm}"/>','<c:out value="${row.filePath}"/>','<c:out value="${row.fileNm}"/>')"  class="btn btn-default mb3"><i class="fa fa-download mr5"></i>첨부파일 다운로드</a></p>
	            </c:forEach>
              <!-- <a href="" class="btn btn-default mb3"><i class="fa fa-download mr5"></i>첨부파일2 다운로드</a>
              <a href="" class="btn btn-default mb3"><i class="fa fa-download mr5"></i>첨부파일3 다운로드</a> -->
            </div>
          </div><!-- board_box //-->
          <div class="article-body">
            <div class="article">
              	<textarea id="rcontent" name="content" readonly="readonly" ><c:out value="${freeBoard.cntn }" escapeXml="false" /></textarea>
              	<%-- <textarea rows="15" cols="100" readonly="readonly" style="border:0;"><c:out value="${freeBoard.cntn }" escapeXml="false"/></textarea> --%>
            </div>
          </div><!-- .article-body /-->
            
        </div><!-- .article-list-area /-->
        <div class="btn-wrap line bt bb pt10 pb10 mt20 text-center">
          <button type="button" class="btn btn-default btn-lg fl" onclick="javascript:fn_movePage('<c:out value="${freeBoard.num}"/>','Y');"><i class="fa fa-caret-left mr5"></i>이전글</button>
          <button type="button" class="btn btn-normal btn-lg" onclick="location.href='/gnoincoun/freeBoardList.do'"><i class="fa fa-align-justify mr5"></i>목록</button>
          <button type="button" class="btn btn-default btn-lg fr" onclick="javascript:fn_movePage('<c:out value="${freeBoard.num}"/>','N');">다음글<i class="fa fa-caret-right ml5"></i></button>
        </div>
      </div><!-- .content-area /-->
    </div><!-- .container.content-wrapper /-->
</section> <!-- End section -->