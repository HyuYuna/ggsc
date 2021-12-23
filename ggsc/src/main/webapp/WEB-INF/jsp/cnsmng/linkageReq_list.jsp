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
		$("select[name=schCnsGb]").val(schCnsGb);
		$("select[name=schCenterGb]").val(schCenterGb);
	});
	
	function fn_down(fileNm, sysFileNm, filePath){
		$("#fileNm").val(fileNm);
		$("#sysFileNm").val(sysFileNm);
		$("#filePath").val(filePath);
		
		document.downForm.action = "/gnoincoundb/fileDown.do";
	   	document.downForm.submit();
	}

	function fn_excelDown(){
		document.location.href = "/gnoincoundb/cnsAcptExcelDown.do";
	}

	function fn_popup(type, caseNo){
		var url = "/gnoincoundb/cnsAcceptDtl.do?type=" + type + "&caseNo=" + caseNo;
		var name = "신청자정보";
		var option = "width = 530, height = 750, top = 50, left = 500, location = yes";
		window.open(url, name, option);
	}
	
	function fn_reg(mnuCd){
		document.location.href = "/gnoincoundb/linkageReqDtl.do?mnuCd=" + mnuCd;
	}
	
	function fn_search(mnuCd) {
		document.searchForm.action = "/gnoincoundb/linkageReqList.do?mnuCd="+mnuCd;
       	document.searchForm.submit(); 
	}
	
	function fn_detail(num,linkReqGb){
		var mnuCd = $("#mnuCd").val();
		document.location.href = "/gnoincoundb/linkageReqDtl.do?num=" + num +"&linkReqGb=" + linkReqGb + "&mnuCd=" + mnuCd;
	}
	
	function list(curPage) {
		$("#currentPageNo").val(curPage);
		document.searchForm.action = "/gnoincoundb/linkageReqList.do?mnuCd=${mnuCd}";
       	document.searchForm.submit();
	}
	
	/* function list() {
		// $("#currentPageNo").val(curPage);
		// var param = $("#searchForm").serialize(); //ajax로 넘길 data
		// data : param .
		$.ajax({
			type : "POST",
			url : "/psyCnsList_ajax.do",
			dataType : "json",
			success : function(json) {
				var html = '';
				$.each(json.examDocList, function(i, d) {
					var num = 0;
					num = (json.totalPageCnt - d.rnum) + 1;
					html += '<tr onclick="javascript:fn_reg(\''+ d.num +'\');">';
					html += '<td>' + num + '</td>';
					html += '<td>' + d.zoneGb + '</td>';
					html += '<td>' + d.sigunNm + '</td>';
					html += '<td>' + d.addr + '</td>';
					html += '<td>' + d.homepage + '</td>';
					html += '<td>' + d.tel + '</td>';
					html += '<td>' + d.useYn + '</td>';
					html += '<td>' + d.dbInsTm + '</td>';
					html += '</tr>';
					
				});
				if (json.examDocList.length == 0) {
					html += '<tr><td colspan="6">정보가 없습니다.</td></tr>';
				}
				$("#tby2").html(html);
	
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	} */
	
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
			url = "/gnoincoundb/superVisionList.do?mnuCd=${mnuCd}";
		}
		document.location.href = url;
	}
	
</script>

<section id="content">

	<h2 class="h2-title"><i class="fa fa-check-square"></i>연계의뢰서관리</h2>
	
		<div class="box-style1 x-scroll-auto" >
		<form name="downForm" id="downForm" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="fileNm" name="fileNm" value="" />
			<input type="hidden" id="sysFileNm" name="sysFileNm" value="" />
			<input type="hidden" id="filePath" name="filePath" value="" />
		</form>
		<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" action="/linkageReqList.do" method="get" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<div class="search-box">
				<div class="search-group" style="margin-left:170px;">
					<span class="label"><label>구분</label></span>
					<span class="label2">
						 <select name="schLinkReqGb" style="width:275px;">
						 	<option value="">전체</option>
						 	<option value="1">내부연계</option>
						 	<option value="2">외부연계</option>
						</select>
					</span>
					<!-- <span class="form"><input type="text" name="schText" id="schText" value="" /></span> -->
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
					<span class="label">등록일</span> <input type="text" name="schStartDate" id="datepicker1" value="${vo.schStartDate }" style="width: 100px;" readOnly/> &nbsp;&nbsp;&nbsp; ~ &nbsp;<input type="text" name="schEndDate" id="datepicker2" value="${vo.schEndDate}" style="width: 100px;" readOnly/>
				</div>
			</div>
		</form>
			<div>
				<ul class="tabs">
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(1);">개인상담</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(2);">집단상담</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(3);">심리검사</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin; background-color: gray;">연계의뢰서</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(5);">수퍼비전</li>
				</ul>
			</div>
			
			<%-- <h3 class="h3-title" style="display: inline-block;"><i class="fa fa-star"></i>상담내용</h3>
			<div style="float: right; display: inline-block;">
				<button type="button" class="btn-basic" onClick="javascript:fn_reg('${mnuCd }');" style="background-color: green;color:white;">PDF 다운로드</button>
			</div>
				
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="5%"></col>
					<col width="7%"></col> 
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
					<col width="7%"></col>
				</colgroup>
							
				<thead>
					<tr>
						<th scope="col">순번</th>
						<th scope="col">case.No</th>
						<th scope="col">내담자명</th>
						<th scope="col">상담구분</th> 
						<th scope="col">총상담회기</th>
						<th scope="col">최근상담일</th>
						<th scope="col">상담진행상태</th>
						<th scope="col">상담자</th>
						<th scope="col">성별</th>
						<th scope="col">현재연령</th>
						<th scope="col">학력</th>
						<th scope="col">자살위험도</th>
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${list.size() == 0 }">
						<tr>
							<td colspan="11">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${list.size() > 0 }">
						<c:forEach items="${list }" var="result">
							<tr>
								<td>${result.rnum }</td>
								<td>${result.caseNo }</td>
								<td>${result.cnsleNm }</td>
								<td>${result.cnsGbCd }</td>
								<td>${result.cnsCnt }회기</td>
								<td>${result.cnsDt }</td>
								<td>${result.cnsStatCd }</td>
								<td>${result.cnsrNm }</td>
								<td>
									<c:if test="${result.gender eq 'M' }">남</c:if>
									<c:if test="${result.gender eq 'F' }">여</c:if>
								</td>
								<td>${result.age }세</td>
								<td>${result.eduCd }</td>
								<td>${result.killsRskn }</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table> --%>
			
			<h3 class="h3-title" style="display: inline-block;"><i class="fa fa-star"></i>연계의뢰서</h3>
			<div style="float: right; display: inline-block;">
				<button type="button" class="btn-basic" onClick="javascript:fn_reg('${mnuCd }');" style="background-color: green;color:white;">신규등록</button>
				<button type="button" class="btn-basic" onClick="fn_excelDownload(30, document.searchForm);" style="background-color: green;color:white;">Excel 다운로드</button>
			</div>
			
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="3%"></col>
					<col width="3%"></col>
					<col width="12%"></col> 
					<col width="4%"></col>
					<col width="4%"></col>
					<col width="10%"></col>
					<col width="4%"></col>
					<col width="4%"></col>
					<col width="5%"></col>
					<col width="4%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">순번</th>
						<th scope="col">구분</th>
						<th scope="col">의뢰부서</th>
						<th scope="col">담당</th>
						<th scope="col">의뢰일자</th> 
						<th scope="col">협조부서</th>
						<th scope="col">회신기한</th>
						<th scope="col">PDF</th>
						<th scope="col">연계의뢰서</th>
						<th scope="col">공문</th>
					</tr>
				</thead>
				<tbody id="tby2">
					<c:if test="${linkList.size() == 0 }">
						<tr>
							<td colspan="10">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${linkList.size() > 0 }">
						<c:forEach items="${linkList }" var="result">
							<tr>
								<td>${result.rnum }</td>
								<c:if test="${result.linkReqGb == '1' }"><td onclick="javascript:fn_detail('${result.num}','${result.linkReqGb}');">내부연계</td></c:if>
								<c:if test="${result.linkReqGb == '2' }"><td onclick="javascript:fn_detail('${result.num}','${result.linkReqGb}');">외부연계</td></c:if>
								<td onclick="javascript:fn_detail('${result.num}','${result.linkReqGb}');" style="text-align: left;">${result.reqDept}</td>
								<td onclick="javascript:fn_detail('${result.num}','${result.linkReqGb}');">${result.reqDeptPer }</td>
								<td onclick="javascript:fn_detail('${result.num}','${result.linkReqGb}');">${result.reqDt }</td>
								<td onclick="javascript:fn_detail('${result.num}','${result.linkReqGb}');">${result.helpDept }</td>
								<td onclick="javascript:fn_detail('${result.num}','${result.linkReqGb}');">${result.relyTerm }</td>
								<c:if test="${result.linkReqGb == '1'}"><td><button type="button" id="pdfBtn" class="btn-basic btn-primary" onclick="javascript:fn_pdfDownload(37, '${result.num }')">PDF 다운</button></td></c:if>
								<c:if test="${result.linkReqGb == '2'}"><td><button type="button" id="pdfBtn" class="btn-basic btn-primary" onclick="javascript:fn_pdfDownload(38, '${result.num }')">PDF 다운</button></td></c:if>
								<%-- <td>
									<button type="button" id="pdfBtn" class="btn-basic btn-primary" onclick="javascript:fn_pdfDownload(24, '${result.num }')">PDF 다운</button>
								</td> --%>
								<td>
									<%-- <c:if test="${result.fileNm2 != null }">
										<button type="button" class="btn-basic" onClick="fn_down('${result.fileNm2}','${result.sysFileNm2}','${result.filePath2 }')">연계의뢰서</button>
									</c:if> --%>
									<c:if test="${result.fileNm2 != null and result.fileNm2 != ''}">
										<button type="button" class="btn-basic" onClick="fn_down('${result.fileNm2}','${result.sysFileNm2}','${result.filePath2 }')">연계의뢰서</button>
									</c:if>
								</td>
								<td>
									<c:if test="${result.fileNm3 != null and result.fileNm3 != ''}">
										<button type="button" class="btn-basic" onClick="fn_down('${result.fileNm3}','${result.sysFileNm3}','${result.filePath3 }')">공문</button>
									</c:if>
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

