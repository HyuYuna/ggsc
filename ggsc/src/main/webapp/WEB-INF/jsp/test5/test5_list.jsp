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
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/oasis.do?mnuCd=" + mnuCd;
	} 
	
	function list(curPage) {
		$("#currentPageNo").val(curPage);
		document.searchForm.action = "<c:out value="${pageContext.request.contextPath}" />/test5List.do";
       	document.searchForm.submit();
	}
	
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    list(1);
		  };
	});
</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>Dust</h2>
		<div class="box-style1 x-scroll-auto" >
		
		<form name="searchForm" id="searchForm" method="get" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<input type="hidden" id="ysmNo" name="ysmNo" value="0" />
			
			<div class="search-box">
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>Fate</label></span>
					<span class="label2">
						 <select name="schFate" style="width:275px;">
							<option value="">전체</option>
							<c:forEach items="${test1List }" var="list">
								<option value="${list.num }" <c:if test="${list.num == vo.schFate}">selected</c:if>>${list.title }</option>
							</c:forEach>
						</select>
					</span>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>narcissus</label></span>
					<span class="label2">
						<select name="schNarcissus" style="width:275px;">
							<option value="">전체</option>
							<c:forEach items="${test2List }" var="list">
								<option value="${list.num }" <c:if test="${list.num == vo.schNarcissus}">selected</c:if>>${list.title }</option>
							</c:forEach>
						</select>
					</span>
				</div>
				
				<div class="btn" style="padding-bottom:15px; padding-right:120px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:list(1);">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
			</div>
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
					<col width="5%"></col>
					<col width="15%"></col>
					<col width="15%"></col>
					<col width="15%"></col>
					<col width="7%"></col>
					<col width="10%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">Fate</th>
						<th scope="col">Narcissus</th>
						<th scope="col">oasis</th> 
						<th scope="col">radiohead</th> 
						<th scope="col">boowhal</th>
						<th scope="col">상담대상자</th> 
						<th scope="col">등록일</th>
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
								<td>${result.rnum2 }</td>
								<td>${result.fate }</td>
								<td>${result.narcissus }</td>
								<td>
									<c:choose>
										<c:when test="${result.oasisYn != null }">
											작성완료
										</c:when>
										<c:otherwise>
											<button type="button" class="btn-basic btn-danger" onclick="location.href='<c:out value="${pageContext.request.contextPath}" />/oasis.do?mnuCd=${mnuCd}'">작성하기</button>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${result.radioYn != null }">
											작성완료
										</c:when>
										<c:otherwise>
											<button type="button" class="btn-basic btn-danger"  onclick="location.href='<c:out value="${pageContext.request.contextPath}" />/radiohead.do?mnuCd=${mnuCd}'">작성하기</button>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${result.boowhalYn != null }">
											작성완료
										</c:when>
										<c:otherwise>
											<button type="button" class="btn-basic btn-danger"  onclick="location.href='<c:out value="${pageContext.request.contextPath}" />/boowhal.do?mnuCd=${mnuCd}'">작성하기</button>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:if test="${result.ysmGb eq 'Y' }">
										<button type="button" class="btn-basic btn-success">대상</button>
									</c:if>
								</td>
								<td>${result.dbTm}</td>
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

