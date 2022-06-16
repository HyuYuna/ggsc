<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="/gnoincoundb/js/util/paging.js"></script>
<script src="/gnoincoundb/js/html2canvas.min.js" ></script>
<script src="/gnoincoundb/js/jspdf.min.js" ></script>
    <style>
		ul.tabs{
		margin : 30px 0 30px 0;
		padding: 0px;
		list-style: none;
		border-bottom-style: solid;
		border-width: thin;
		}
		ul.tabs li{
			background: none;
			color: #222;
			display: inline-block;
			padding: 10px 15px;
			cursor: pointer;
		}
	</style>
  </head>
<script type="text/javascript">
	$(document).ready(function() {
		var page = "${page}";
		if(page == ""){
			page = 1;
		}
		
		var schCnsGb = "${vo.schCnsGb}";
		var schCenterGb = "${vo.schCenterGb}";
		var schPrevPostGb = "${vo.schPrevPostGb}";
		
		$("select[name=schCnsGb]").val(schCnsGb);
		$("select[name=schCenterGb]").val(schCenterGb);
		$("select[name=schPrevPostGb]").val(schPrevPostGb);
	});
	
	function fn_down(fileNm, sysFileNm, filePath){
		$("#fileNm").val(fileNm);
		$("#sysFileNm").val(sysFileNm);
		$("#filePath").val(filePath);
		
		document.downForm.action = "/gnoincoundb/fileDown.do";
	   	document.downForm.submit();
	}

	function fn_excelDown(){
		document.location.href = "/gnoincoundb/cnsPrevPostExcelDown.do";
	}

	
	function fn_reg(mnuCd){
		document.location.href = "/gnoincoundb/cnsPrevPostDtl.do?mnuCd=" + mnuCd;
	}
	
	function fn_search(mnuCd) {
		document.searchForm.action = "/gnoincoundb/cnsPrevPostList.do?mnuCd="+mnuCd;
       	document.searchForm.submit(); 
	}
	
	function fn_detail(num,prevPostGb){
		var mnuCd = $("#mnuCd").val();
		document.location.href = "/gnoincoundb/cnsPrevPostDtl.do?num=" + num +"&prevPostGb=" + prevPostGb + "&mnuCd=" + mnuCd;
	} 
	
	
	function list(curPage) {
		$("#currentPageNo").val(curPage);
		document.searchForm.action = "/gnoincoundb/cnsPrevPostList.do?mnuCd=${mnuCd}";
       	document.searchForm.submit();
	}
	

	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    list(1);
		  };
	});
	
	function fn_goLink(no){
		var url = "";
		
		if(no == 1){
			url = "/gnoincoundb/perCnsList.do?mnuCd=${mnuCd}";	
		}else if(no == 2){
			url = "/gnoincoundb/gCnsList.do?mnuCd=${mnuCd}";
		}else if(no == 3){
			url = "/gnoincoundb/psyCnsList.do?mnuCd=${mnuCd}";
		}else if(no == 4){
			url = "/gnoincoundb/linkageReqList.do?mnuCd=${mnuCd}";
		}else{
			url = "/gnoincoundb/cnsPrevPostList.do?mnuCd=${mnuCd}";
		}
		document.location.href = url;
	}
	
</script>

<section id="content">

	<h2 class="h2-title"><i class="fa fa-check-square"></i>사전·사후 검사 관리</h2>
	
		<div class="box-style1 x-scroll-auto" >
		<form name="downForm" id="downForm" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="fileNm" name="fileNm" value="" />
			<input type="hidden" id="sysFileNm" name="sysFileNm" value="" />
			<input type="hidden" id="filePath" name="filePath" value="" />
		</form>
		<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" action="/cnsPrevPostList.do" method="get" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<div class="search-box">
				<div class="search-group" style="margin-left:170px;">
					<span class="label"><label>구분</label></span>
					<span class="label2">
						 <select name="schPrevPostGb" style="width:275px;">
						 	<option value="">전체</option>
						 	<option value="1">사전검사</option>
						 	<option value="2">사후검사</option>
						</select>
					</span>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>센터구분</label></span>
					<span class="label2">
						<select name="schCenterGb" style="width:275px;">
							<option value="">전체</option>
							<c:forEach items="${cnsCenterList }" var="result">
								<c:choose>
								<c:when test="${authCd > 1 }">
									<c:if test="${ result.num eq vo.schCenterGb }" >
										<option value="${result.num }" >${result.centerGb }</option>
									</c:if>
								</c:when>
								<c:when test="${authCd <= 1 }">								
									<option value="${result.num }" >${result.centerGb }</option>
								</c:when>
								</c:choose>
							</c:forEach>
						</select>
					</span>
				</div>
				<br>
				<div class="btn" style="padding-bottom:15px;padding-right:50px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:fn_search('${mnuCd}');">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
				<div class="search-group" style="margin-left:170px;">
					<span class="label"><label>내담자명</label></span>
					<span class="label2">
						<input type="text" name="schCnsleNm" style="width:275px;" value="${vo.schCnsleNm}" enterSearch data-button='#searchBtn'>
					</span>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label">검사일자</span> <input type="text" name="schStartDate" id="datepicker1" value="${vo.schStartDate }" style="width: 100px;" readOnly/> &nbsp;&nbsp;&nbsp; ~ &nbsp;<input type="text" name="schEndDate" id="datepicker2" value="${vo.schEndDate}" style="width: 100px;" readOnly/>
				</div>
			</div>
		</form>
			<div>
				<ul class="tabs">
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(1);">개인상담</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(2);">집단상담</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(3);">심리검사</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(4);">연계의뢰서</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin; background-color: gray;">사전·사후 검사</li>
				</ul>
			</div>
			
			<h3 class="h3-title" style="display: inline-block;"><i class="fa fa-star"></i>사전 사후 검사</h3>
			<div style="float: right; display: inline-block;">
				<button type="button" class="btn-basic" onClick="javascript:fn_reg('${mnuCd }');" style="background-color: green;color:white;">신규등록</button>
				<button type="button" class="btn-basic" onClick="fn_excelDownload(32, document.searchForm);" style="background-color: green;color:white;">Excel 다운로드</button>
			</div>
			
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="3%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="10%"></col>
					<col width="8%"></col>
					<col width="4%"></col>
					<col width="5%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">순번</th>
						<th scope="col">검사 구분</th>
						<th scope="col">내담자명</th>
						<th scope="col">주호소 문제</th>
						<th scope="col">검사일자</th>
						<th scope="col">회기</th>
						<th scope="col">pdf</th>
					</tr>
				</thead>
				<tbody id="tby2">
					<c:if test="${list.size() == 0 }">
						<tr>
							<td colspan="6">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${list.size() > 0 }">
						<c:forEach items="${list }" var="result">
							<tr>
								<td onclick="javascript:fn_detail('${result.num}','${result.prevPostGb}');">${result.rnum }</td>
								<td onclick="javascript:fn_detail('${result.num}','${result.prevPostGb}');">
									<c:choose>
										<c:when test="${result.prevPostGb == '1' }">
											사전 검사
										</c:when>
										<c:when test="${result.prevPostGb == '2' }">
											사후 검사
										</c:when>
									</c:choose>
								</td>
								<td onclick="javascript:fn_detail('${result.num}','${result.prevPostGb}');">${result.cnsleNm }</td>
								<td onclick="javascript:fn_detail('${result.num}','${result.prevPostGb}');">${result.majorApplCdNm }</td>
								<td onclick="javascript:fn_detail('${result.num}','${result.prevPostGb}');">${result.inspectDt }</td>
								<td onclick="javascript:fn_detail('${result.num}','${result.prevPostGb}');">${result.inspectCnt }</td>
								<td>
									<button type="button" id="pdfBtn" class="btn-basic btn-primary" onclick="javascript:fn_pdfDownload(42, '${result.num }')">PDF 다운</button>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			
			<!-- // 페이징 -->
			<div class="paginate" id="page1">
				<div id="paging">
                    <ul class="pagination">
                      	<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="list" />
                      	<form:hidden path="pageIndex" />
                    </ul>
                </div>
			</div>
		</div>
		<!-- end -->

	</section>

</html>

