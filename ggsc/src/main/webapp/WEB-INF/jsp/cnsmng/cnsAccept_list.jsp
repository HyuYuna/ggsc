<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script src="/gnoincoundb/js/html2canvas.min.js" ></script>
<script src="/gnoincoundb/js/jspdf.min.js" ></script>
<script src="/gnoincoundb/js/util/paging.js"></script>
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
<script type="text/javascript">
	$(document).ready(function() {
		var page = "${page}";
		if(page == ""){
			page = 1;
		}
		
		var schCnsGb = "${vo.schCnsGb}";
		var schCenterGb = "${vo.schCenterGb}";
		
		$("select[name=schCnsGb]").val(schCnsGb);
		$("select[name=schCenterGb]").val(schCenterGb);
		$("#totalPageCnt").html("${totalPageCnt}");
		
	});

	function fn_excelDown(){
		document.location.href = "/gnoincoundb/cnsAcptExcelDown.do";
	}
	/*
	function linkPage(pageNo) {
		search(pageNo);
	}
	
	function search(pageNo) {
		$("#currentPageNo").val(pageNo);
		$("#frm").submit();
	}
	*/
	
	function fn_goLink(no) {
		var url = "";
		
		if(no == 1) {
			url = "/gnoincoundb/cnsAcceptList.do?mnuCd=${mnuCd}";
		} else if (no == 2) {
			url = "/gnoincoundb/exiCnsAcceptList.do?mnuCd=${mnuCd}";
		} else if (no == 3) {
			url = "/gnoincoundb/cnsInfoList.do?mnuCd=${mnuCd}";
		}
		document.location.href = url;
	}
	
	function fn_popup(type, caseNo){
		var url = "/gnoincoundb/cnsAcceptDtl.do?type=" + type + "&caseNo=" + caseNo;
		var name = "???????????????";
		var option = "width = 530, height = 750, top = 50, left = 250, location = yes";
		window.open(url, name, option);
	}
	
	function list(curPage) {
		$("#currentPageNo").val(curPage);
		document.searchForm.action = "/gnoincoundb/cnsAcceptList.do";
       	document.searchForm.submit();
	}
	
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    list(1);
		  };
	});
	
</script>

<section id="content">

	<h2 class="h2-title"><i class="fa fa-check-square"></i>??????????????????</h2>
		
		<div class="box-style1 x-scroll-auto" >
				<!-- ???????????? -->
		<form name="searchForm" id="searchForm" action="" method="get" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<div class="search-box">
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>????????????</label></span>
					<span class="label2">
						 <select name="schCnsGb" style="width:275px;">
						 	<option value="">??????</option>
						 	<c:forEach items="${cnsGbList }" var="result">
								<option value="${result.odr }">${result.mclassNm }</option>
							</c:forEach>
						</select>
					</span>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>????????????</label></span>
					<span class="label2">
						<select name="schCenterGb" style="width:275px;">
							<option value="">??????</option>
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
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>????????????</label></span>
					<span class="label2">
						<input type="text" name="schAcptNm" style="width:275px;" value='${vo.schAcptNm}' onKeyDown='if(event.keyCode==13){this.form.submit()}' ">
					</span>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label">?????????</span> <input type="text" name="schStartDate" id="datepicker1" value="${vo.schStartDate }" style="width: 100px;" readOnly/> &nbsp;&nbsp;&nbsp; ~ &nbsp;<input type="text" name="schEndDate" id="datepicker2" value="${vo.schEndDate}" style="width: 100px;" readOnly/>
				</div>
				<div class="btn" style="padding-bottom:15px; padding-right:150px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:list(1);">
						<i class="fa fa-search"></i>??????
					</button>
				</div>
			</div>
		</form>
		<div>
			<ul class="tabs">
				<li style="border-style: solid; border-bottom-style:none; border-width: thin; background-color: gray;">??????????????????</li>
				<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(2);">??????????????????</li>
				<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(3);">??????????????????</li>
			</ul>
		</div>
			<span style="float:left; margin: 0;">
				?????? ?????? : <span id="totalPageCnt"></span> ??? 
			</span>
			<div class="btn" style="float: right; margin: 0;">
				<button type="button" class="btn-basic" onClick="javascript:fn_popup('R', 0);" style="background-color: green;color:white;">??????</button>
				<button type="button" class="btn-basic" onClick="fn_excelDownload(10, document.searchForm);" style="background-color: green;color:white;">Excel ????????????</button>
			</div>	
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="5%"></col>
					<col width="10%"></col> 
					<col width="5%"></col>
					<col width="15%"></col>
					<col width="5%"></col>
					<col width="35%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="10%"></col>
				</colgroup>
							
				<thead>
					<tr>
						<th scope="col">??????</th>
						<th scope="col">?????????</th>
						<th scope="col">??????</th> 
						<th scope="col">?????????</th>
						<th scope="col">??????</th>
						<th scope="col">??????</th>
						<th scope="col">????????????</th>
						<th scope="col">????????????</th>
						<th scope="col">????????????</th>
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${acceptList.size() == 0 }">
						<tr>
							<td colspan="9">????????? ????????????.</td>
						</tr>
					</c:if>
					<c:if test="${acceptList.size() > 0 }">
						<c:forEach items="${acceptList }" var="result">
							<tr onclick="javascript:fn_popup('D', '${result.caseNo}');">
								<td>${result.rnum }</td>
								<td>${result.userNm }</td>
								<td>${result.gender}</td>
								<td data-pattern='mobile' style="text-align: left; text-indent:10px;">${result.mobile }</td>
								<td>${result.age }???</td>
								<td style="text-align: left; text-indent:10px;">${result.addr }</td>
								<td><c:if test="${result.cnsHistYn == 'Y' }">???</c:if><c:if test="${result.cnsHistYn != 'Y' }">???</c:if></td>
								<td><c:if test="${result.acptYn == 'Y' }">??????</c:if><c:if test="${result.acptYn != 'Y' }">?????????</c:if></td>
								<td>${result.dbInsTm2 }</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>

			</table>
			<div class="paginate" id="page1">
				<div id="paging">
                    <ul class="pagination">
                      	<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="list" />
                      	<form:hidden path="pageIndex" />
                    </ul>
                </div>
			</div>
			<!-- // ????????? -->
		</div>
		<!-- end -->
	</section>
</html>

