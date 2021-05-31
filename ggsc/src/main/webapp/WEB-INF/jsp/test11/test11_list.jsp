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
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/test11Dtl.do?mnuCd=" + mnuCd;
	}
	
	function fn_detail(yukiNo){
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/test11Dtl.do?yukiNo=" + yukiNo + "&mnuCd=${mnuCd}";
	}
	
	function list(curPage) {
		$("#currentPageNo").val(curPage);
		document.searchForm.action = "<c:out value="${pageContext.request.contextPath}" />/test11List.do";
       	document.searchForm.submit();
	}
	
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    list(1);
		  };
	});
</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>유키</h2>
		<div class="box-style1 x-scroll-auto" >
		
		<form name="searchForm" id="searchForm" method="get" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<input type="hidden" id="yukiNo" name="yukiNo" value="0" />
			<input type="hidden" id="g4Gb" name="g4Gb"  />
			<input type="hidden" id="g10Gb" name="g10Gb"  />
			<input type="hidden" id="g14Gb" name="g14Gb"  />
			
			<div class="search-box">
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>validation</label></span>
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
					<span class="label"><label>ensure</label></span>
					<span class="label2">
					<select name="schG13Gb" style="width:275px;">
						<option value="">전체</option>
						<c:forEach items="${g13List}" var="list">
							<option value="${list.odr}" <c:if test="${list.odr == vo.schG13Gb}">selected</c:if>>${list.ysmMclassNm}</option>
						</c:forEach>
					</select>
					</span>
				</div>
				<br/>
				<span style="padding-left: 100px;">등록일</span> <input type="text" name="schYsmStartDt" id="datepicker1" value="${vo.schYsmStartDt}"  style="width: 100px;" /> &nbsp;&nbsp;&nbsp; ~ &nbsp;<input type="text" name="schYsmEndDt" id="datepicker2" value="${vo.schYsmEndDt}" style="width: 100px;" readOnly />
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>적고싶은것</label></span>
					<span class="label2">
						<input type="text" name="schContent" value="${vo.schContent}" >
					</span>
				</div>
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
					<col width="20%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">validation</th> 
						<th scope="col">instruction</th> 
						<th scope="col">scaling</th> 
						<th scope="col">ensure</th> 
						<th scope="col">일시</th> 
						<th scope="col">적고싶은것</th> 
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${detail.size() == 0 }">
						<tr>
							<td colspan="7">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${detail.size() > 0 }">
						<c:forEach items="${detail}" var="result">
							<tr>
								<td onclick="javascript:fn_detail('${result.yukiNo}')">${result.rnum }</td>
								<td>${result.validation}</td>
								<td>${result.instruction}</td>
								<td>${result.scaling}</td>
								<td>${result.ensure}</td>
								<td>${result.ysmDt}</td>
								<td>${result.content}</td>
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

