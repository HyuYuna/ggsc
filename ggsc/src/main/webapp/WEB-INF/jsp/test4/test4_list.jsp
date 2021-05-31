<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script src="<c:out value="${pageContext.request.contextPath}" />/js/html2canvas.min.js" ></script>
<script src="<c:out value="${pageContext.request.contextPath}" />/js/jspdf.min.js" ></script>
<script src="<c:out value="${pageContext.request.contextPath}" />/js/util/paging.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() {
		var page = "${page}";
		if(page == ""){
			page = 1;
		}
	
		$("#totalPageCnt").html("${totalPageCnt}");
		
	});

	
	function fn_popup(type, ysmNo){
		var oepnwin;
		var url = "<c:out value="${pageContext.request.contextPath}" />/test4Dtl.do?type=" + type + "&ysmNo=" + ysmNo;
		var name = "test4Dtl.do";
		var option = "width = 530, height = 750, top = 50, left = 250, location = yes";
		oepnwin = window.open(url, name, option);
	}
	
	function list(curPage) {
		
		$("#currentPageNo").val(curPage);
		document.searchForm.action = "<c:out value="${pageContext.request.contextPath}" />/test4List.do";
       	document.searchForm.submit();
	}
	
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    list(1);
		  };
	});
	
</script>

<section id="content">

	<h2 class="h2-title"><i class="fa fa-check-square"></i>Ysm</h2>
		
		<div class="box-style1 x-scroll-auto" >
				<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" method="get" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			
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
				<br/>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>신청자명</label></span>
					<span class="label2">
						<input type="text" name="schYsm" style="width:275px;" value='${vo.schYsm}' onKeyDown='if(event.keyCode==13){this.form.submit()}' ">
					</span>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label">등록일</span> <input type="text" name="schStartDate" id="datepicker1" value="${vo.schStartDate }" style="width: 100px;" readOnly/> &nbsp;&nbsp;&nbsp; ~ &nbsp;<input type="text" name="schEndDate" id="datepicker2" value="${vo.schEndDate}" style="width: 100px;" readOnly/>
				</div>
				<div class="btn" style="padding-bottom:15px; padding-right:150px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:list(1);">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
			</div>
		</form>
		
			<span style="float:left; margin: 0;">
				검색 총수 : <span id="totalPageCnt"></span> 건 
			</span>
			<div class="btn" style="float: right; margin: 0;">
				<button type="button" class="btn-basic" onClick="javascript:fn_popup('R', 0);" style="background-color: green;color:white;">등록</button>
			</div>	
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="3%"></col>
					<col width="15%"></col> 
					<col width="7%"></col>
					<col width="4%"></col>
					<col width="12%"></col>
					<col width="8%"></col>
					<col width="8%"></col>
					<col width="5%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">등록일</th>
						<th scope="col">이름</th> 
						<th scope="col">성별</th>
						<th scope="col">연락처</th>  
						<th scope="col">Fate</th>
						<th scope="col">Narcissus</th>
						<th scope="col">접수확인</th>
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${detail.size() == 0 }">
						<tr>
							<td colspan="8">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${detail.size() > 0 }">
						<c:forEach items="${detail}" var="result">
							<tr onclick="javascript:fn_popup('D', '${result.ysmNo}');">
								<td>${result.rnum }</td>
								<td>${result.dbInsTm}</td>
								<td>${result.ysmNm}</td>
								<td>${result.gender }</td>
								<td>${result.mobile }</td>
								<td>${result.fate }</td>
								<td>${result.narcissus }</td>
								<td><c:if test="${result.ysmYn == 'Y' }">확인</c:if><c:if test="${result.ysmYn != 'Y' }">미확인</c:if></td>
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