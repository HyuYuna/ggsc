<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
  <script>
		$(document).ready(function() {
			var searchCondition = "${vo.searchCondition}";
			var searchKeyword = "${vo.searchKeyword}";
			if(searchCondition != "") {
				$('#searchCondition').val('${vo.searchCondition}').attr('selected','selected');				
			}
			if(searchKeyword != "") {
				$('#searchKeyword').val(searchKeyword);				
			}
		});
		
	  	function fn_detail(num){
			document.location.href = "/gnoincoun/docLibraryDtl.do?num="+num;
		}
	  	
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	$("#pageIndex").val(pageNo);
        	
        	var searchCondition = "${vo.searchCondition}";
			var searchKeyword = "${vo.searchKeyword}";
        	if(searchKeyword != "") {
        		$('#searchConditionFrm').val(searchCondition);
        		$('#searchKeywordFrm').val(searchKeyword);
        	}
        	
        	document.frm.action = "/gnoincoun/docLibraryList.do";
           	document.frm.submit();
        }
        
        function fn_searchForm() {
        	document.searchForm.action = "/gnoincoun/docLibraryList.do";
           	document.searchForm.submit();
        }
        
		/* function fn_fileDown(sysFileNm,filePath,fileNm) {
	        document.location.href = "/gnoincoun/fileDown.do?sysFileNm="+sysFileNm+"&filePath="+filePath+"&fileNm="+fileNm;
	  	} */
		function fn_fileDown(sysFileNm, filePath, fileNm){
			$("#fileNm").val(fileNm);
			$("#sysFileNm").val(sysFileNm);
			$("#filePath").val(filePath);
			document.downForm.action = "/gnoincoundb/fileDown2.do";
	       	document.downForm.submit();
		}
  </script>
<style>
	#paging {text-align: center;}
</style>
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
	<div class="container">
		<div class="page-header">
        	<h1 class="title"><i class="fa fa-comments-o"></i>문서자료실</h1>
      	</div>
       <div class="content">
      <form id="frm" name="frm" method="get">
      <input type="hidden" id="searchConditionFrm" name="searchCondition" />
      <input type="hidden" id="searchKeywordFrm" name="searchKeyword" />
      <input type="hidden" id="pageIndex" name="pageIndex" />
        <div class="table-wrap table-list">
       		<table class="table table-board">
	            <colgroup>
	              <col class="hidden-xs" style="width: 80px" />
	              <col  />
	              <col style="width: 120px" />
	              <col class="hidden-xs" style="width: 100px" />
	              <col class="hidden-xs"  style="width: 80px" />
	            </colgroup>
	            <thead class="hidden-xs">
	              <tr>
	                <th scope="col" class="num hidden-xs">번호</th>
	                <th scope="col" class="subject">제목</th>
	                <th scope="col" class="time">등록일</th>
	                <th scope="col" class="file hidden-xs">첨부파일</th>
	                <th scope="col" class="no hidden-xs">조회수</th>
	              </tr>
	            </thead>
	            <tbody>
		            <c:forEach var="result" items="${docLibraryList}" varStatus="status">
			            <tr onclick="javascript:fn_detail('<c:out value="${result.num}"/>');">
			              <td class="num hidden-xs"><c:out value="${paginationInfo.totalRecordCount+1 - ((vo.pageIndex-1) * vo.pageSize + status.count)}"/><%-- <c:out value="${result.num}"/> --%></td>
			              <td class="subject"><c:out value="${result.title}" escapeXml="false" /></td>
			              <td class="time"><c:out value="${result.dbInsTm}"/></td>
			              <td class="file hidden-xs">
				              <c:if test="${result.fileNm != null }">
				              	<a href="javascript:fn_fileDown('<c:out value="${result.sysFileNm}"/>','<c:out value="${result.filePath}"/>','<c:out value="${result.fileNm}"/>')" class="btn btn-default btn-sm"><i class="fa fa-download mr5"></i><span>다운로드</span></a>
				              </c:if>			              	
			              </td>
			              <td class="no hidden-xs"><c:out value="${result.viewCount }"/></td>
			            </tr>
		            </c:forEach>
	            </tbody>
            </table>
        </div>
        <!-- paging -->
	   <div class="blog-pagination" id="paging">
             <ul class="pagination">
               	<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
             	<form:hidden path="pageIndex" />
           </ul>
       </div>
       </form>
        <!-- paging //-->
        <!-- .search-wrap -->
        <form id="searchForm" name="searchForm" method="post">
	        <div class="search-wrap form-inline text-center">
	          <div class="form-group select">
	            <select class="form-control" id="searchCondition" name="searchCondition">
	              <option value="1">전체</option>
	              <option value="2">제목</option>
	              <option value="3">내용</option>
	            </select>
	          </div>
	          <div class="input-group search-group">
	            <div class="form-group">
	              <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="Search">
	            </div>
	            <div class="input-group-btn">
	             <button type="button" onclick="javascript:fn_searchForm();" class="btn btn-default btn-search"><i class="fa fa-search mr5"></i>검색하기</button>
	            </div>
	          </div><!-- /input-group -->
	        </div><!-- .search-wrap //-->
        </form>
      </div><!-- .content /-->
	</div>
</section> <!-- End section -->