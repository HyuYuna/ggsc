<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 
<link href="<c:out value="${pageContext.request.contextPath}" />/css/style.css" rel="stylesheet">
<script src="<c:out value="${pageContext.request.contextPath}" />/js/util/paging.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		
	});

	function fn_reg(mnuCd){
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/test10Dtl.do?mnuCd=" + mnuCd;
	}
	
	function fn_detail(huhyunaNo){
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/test10Dtl.do?huhyunaNo=" + huhyunaNo + "&mnuCd=${mnuCd}";
	}
	
	function list(curPage) {
		$("#currentPageNo").val(curPage);
		document.searchForm.action = "<c:out value="${pageContext.request.contextPath}" />/test10List.do";
       	document.searchForm.submit();
	}
	
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    list(1);
		  };
	});
</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>라일락</h2>
		<div class="box-style1 x-scroll-auto" >
		
		<form name="searchForm" id="searchForm" method="get" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<input type="hidden" id="huhyunaNo" name="huhyunaNo" value="0" />
			
			<div class="search-box">
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>계절</label></span>
					<span class="label2">
					<select name="schG1Gb" style="width:275px;">
						<option value="">전체</option>
						<c:forEach items="${g1List}" var="list">
							<option value="${list.odr}" <c:if test="${list.odr == vo.schG1Gb}">selected</c:if>>${list.ysmMclassNm}</option>
						</c:forEach>
					</select>
				</span>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>라디오</label></span>
					<span class="label2">
					<select name="schG5Gb" style="width:275px;">
						<option value="">전체</option>
						<c:forEach items="${g5List}" var="list">
							<option value="${list.odr}" <c:if test="${list.odr == vo.schG5Gb}">selected</c:if>>${list.ysmMclassNm}</option>
						</c:forEach>
					</select>
					</span>
				</div>
				<br/>
				<span style="padding-left: 100px;">등록일</span> <input type="text" name="schYsmStartDt" id="datepicker1" value="${vo.schYsmStartDt}"  style="width: 100px;" /> &nbsp;&nbsp;&nbsp; ~ &nbsp;<input type="text" name="schYsmEndDt" id="datepicker2" value="${vo.schYsmEndDt}" style="width: 100px;" readOnly />
				
				<div class="btn" style="padding-bottom:15px; padding-right:120px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:list(1);">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
			</div>
		</form>
		
		
			<span style="float: left; margin: 0;">
				검색 총수 : <span id="totalPageCnt"><c:out value="${totalPageCnt }"/></span> 건 
			</span>
			<div class="btn" style="float: right; margin: 0;">
				<button type="button" class="btn-basic" onClick="javascript:fn_reg('${mnuCd}');" style="background-color:green; color:white;">등록</button>
			</div>	
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="3%"></col>
					<col width="5%"></col> 
					<col width="15%"></col>
					<col width="25%"></col>
					<col width="15%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">season</th> 
						<th scope="col">mobile</th> 
						<th scope="col">transaction</th> 
						<th scope="col">statement</th> 
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${detail.size() == 0 }">
						<tr>
							<td colspan="5">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${detail.size() > 0 }">
						<c:forEach items="${detail}" var="result">
							<tr>
								<td onclick="javascript:fn_detail('${result.huhyunaNo}')">${result.rnum }</td>
								<td>${result.season}</td>
								<td>${result.mobile}</td>
								<td>${result.transaction}</td>
								<td>${result.statement}</td>
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

