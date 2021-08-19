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
			document.location.href = "/gnoincoun/noticeDtl.do?num="+num;
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
        	
        	document.frm.action = "/gnoincoun/noticeList.do";
           	document.frm.submit();
        }
        
        function fn_searchForm() {
        	document.searchForm.action = "/gnoincoun/noticeList.do";
           	document.searchForm.submit();
        }
        
		function fn_reg() {
			var loginYn = "${loginYn}";
			if(loginYn == "Y") {
				document.location.href = "/gnoincoun/noticeWrite.do";
			} else if(loginYn == "N") {
				alert("로그인 후에 글쓰기를 하실 수 있습니다.");
				// location.href="/gnoincoun/login.do";
			}
		}        
        
  </script>
<style>
	#wrap {width: 50%; margin: auto; height: 594px;}
</style>
<section class="service-2 section">
	<div id="wrap">
        <h2 class="title">로그인</h2>
	  	      <form id="frm" name="frm" method="get">
      <input type="hidden" id="searchConditionFrm" name="searchCondition" />
      <input type="hidden" id="searchKeywordFrm" name="searchKeyword" />      
      <input type="hidden" id="pageIndex" name="pageIndex" />
        <div class="table-wrap table-list">
       		<table class="table">
	            <colgroup>
	              <col class="hidden-xs" style="width: 80px" />
	              <col  />
	              <col style="width: 120px" />
	              <col class="hidden-xs"  style="width: 80px" />
	            </colgroup>
	            <thead class="hidden-xs">
	              <tr>
	                <th scope="col" class="num hidden-xs">번호</th>
	                <th scope="col" class="subject">제목</th>
	                <th scope="col" class="time">등록일</th>
	                <th scope="col" class="no hidden-xs">조회수</th>
	              </tr>
	            </thead>
	            <tbody>
		            <c:forEach var="result" items="${noticeList}" varStatus="status">
			            <tr>
			              <td class="num hidden-xs"><c:out value="${paginationInfo.totalRecordCount+1 - ((vo.pageIndex-1) * vo.pageSize + status.count)}"/><%-- <c:out value="${result.num}"/> --%></td>
			              <td class="subject"><a href="javascript:fn_detail('<c:out value="${result.num}"/>');" class="tit"><c:out value="${result.title}"/></a></td>
			              <td class="time"><c:out value="${result.dbInsTm}"/></td>
			              <td class="no hidden-xs"><c:out value="${result.viewCount }"/></td>
			            </tr>
		            </c:forEach>
	            </tbody>
            </table>
        </div>
	   <div class="blog-pagination" id="paging">
             <ul class="pagination">
               	<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
             	<form:hidden path="pageIndex" />
           </ul>
       </div>
       
       </form>
        <!-- paging //-->
        <div class="btn-wrap line bt bb pt10 pb10 mt20 text-center hidden-xs">
          <button type="button" class="btn btn-primary btn-lg fr" onclick="javascript:fn_reg()">글쓰기</button>
        </div>
         <!-- 모바일용 -->
        <div class="btn-wrap p15 visible-xs">
          <button type="button" onclick="javascript:fn_reg()" class="btn btn-primary btn-lg w100p">글쓰기</button>
        </div>
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
	</div>
</section> <!-- End section -->