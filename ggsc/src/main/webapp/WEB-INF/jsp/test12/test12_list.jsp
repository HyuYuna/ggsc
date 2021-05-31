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
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/test12Dtl.do?mnuCd=" + mnuCd;
	}
	
	function fn_detail(yumiNo){
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/test12Dtl.do?yumiNo=" + yumiNo + "&mnuCd=${mnuCd}";
	}
	
	function list(curPage) {
		$("#currentPageNo").val(curPage);
		document.searchForm.action = "<c:out value="${pageContext.request.contextPath}" />/test12List.do";
       	document.searchForm.submit();
	}
	
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    list(1);
		  };
	});
</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>유미</h2>
		<div class="box-style1 x-scroll-auto" >
		
		<form name="searchForm" id="searchForm" method="get" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<input type="hidden" id="yumiNo" name="yumiNo" value="0" />
			<input type="hidden" id="g4Gb" name="g4Gb"  />
			<input type="hidden" id="g10Gb" name="g10Gb"  />
			<input type="hidden" id="g14Gb" name="g14Gb"  />
			
			<div class="search-box">
				<div class="search-group">
					<span style="padding-left: 100px;">등록일</span> <input type="text" name="schYsmStartDt" id="datepicker1" value="${vo.schYsmStartDt}"  style="width: 100px;" /> &nbsp;&nbsp;&nbsp; ~ &nbsp;<input type="text" name="schYsmEndDt" id="datepicker2" value="${vo.schYsmEndDt}" style="width: 100px;" readOnly />
					<span class="label">
						<select id="schType" name="schType" style="margin-left: 20px;">
							<option value="1" <c:if test="${vo.schType==1}">selected</c:if>>주소</option>
							<option value="2" <c:if test="${vo.schType==2}">selected</c:if>>텍스트</option>
							<option value="3" <c:if test="${vo.schType==3}">selected</c:if>>한마디</option>
						</select>
					</span>
					<span class="form" style="margin-left: 25px;"><input type="text" name="schText" id="schText" value="${vo.schText}" enterSearch data-button='#searchBtn'/></span>
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
					<col width="5%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">diverse</th> 
						<th scope="col">enormous</th> 
						<th scope="col">match</th> 
						<th scope="col">성별</th> 
						<th scope="col">주소</th> 
						<th scope="col">일시</th> 
						<th scope="col">텍스트</th> 
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
								<td onclick="javascript:fn_detail('${result.yumiNo}')">${result.rnum }</td>
								<td>${result.validation}</td>
								<td>${result.instruction}</td>
								<td>${result.scaling}</td>
								<td>
									<c:if test="${result.gender eq 'M' }">남</c:if>
									<c:if test="${result.gender eq 'F' }">여</c:if>
								</td>
								<td>${result.addr}</td>
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

