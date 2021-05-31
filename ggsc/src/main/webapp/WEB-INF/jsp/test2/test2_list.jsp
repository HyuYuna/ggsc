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
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/test2Dtl.do?mnuCd=" + mnuCd;
	}
	
	function fn_detail(num){
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/test2Dtl.do?num=" + num + "&mnuCd=${mnuCd}";
	}
	
	function list(curPage) {
		$("#currentPageNo").val(curPage);
		document.searchForm.action = "<c:out value="${pageContext.request.contextPath}" />/test2List.do";
       	document.searchForm.submit();
	}
	
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    list(1);
		  };
	});
</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>Narcissus</h2>
		<div class="box-style1 x-scroll-auto" >
		
		<form name="searchForm" id="searchForm" method="get" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
		</form>
		
		<form name="frm" id="frm" method="post" onsubmit="return false">
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
					<col width="4%"></col>
					<col width="4%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">등록일</th>
						<th scope="col">자료명</th> 
						<th scope="col">내용</th> 
						<th scope="col">등록자</th>
						<th scope="col">Fate</th>
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
								<td onclick="javascript:fn_detail('${result.num}')">${result.rnum }</td>
								<td onclick="javascript:fn_detail('${result.num}')">${result.dbInsTm}</td>
								<td style="text-align: left; text-indent:10px;" onclick="javascript:fn_detail('${result.num}')">
									<c:choose>
										<c:when test="${fn:length(result.title) > 60 }">
											<c:out value="${fn:substring(result.title,0,60) }..."/>
										</c:when>
										<c:otherwise>
											<c:out value="${result.title }" />
										</c:otherwise>
									</c:choose>
								</td>
								<td style="text-align: left; text-indent:10px;" onclick="javascript:fn_detail('${result.num}')">
									<c:choose>
										<c:when test="${fn:length(result.content) > 60 }">
											<c:out value="${fn:substring(result.content,0,60) }..."/>
										</c:when>
										<c:otherwise>
											<c:out value="${result.content}" />
										</c:otherwise>
									</c:choose>
								</td>
								<td onclick="javascript:fn_detail('${result.num}')">${result.writer }</td>
								<td onclick="javascript:fn_detail('${result.num}')">${result.fate }</td>
							</tr> 
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</form>
		
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

