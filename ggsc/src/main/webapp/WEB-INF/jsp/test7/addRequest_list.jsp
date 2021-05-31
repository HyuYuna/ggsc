<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="<c:out value="${pageContext.request.contextPath}" />/js/util/paging.js"></script>
<script src="<c:out value="${pageContext.request.contextPath}" />/js/html2canvas.min.js" ></script>
<script src="<c:out value="${pageContext.request.contextPath}" />/js/jspdf.min.js" ></script>

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
		if(page == "") {
			page = 1;
		}
		
		var schAddReqGb = "${vo.schAddReqGb}";
		$("select[name=schAddReqGb]").val(schAddReqGb);
		
	});

	function fn_reg(mnuCd){
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/addRequestDtl.do?mnuCd=" + mnuCd;
	}
	
	function fn_detail(num,addReqGb){
		var mnuCd = $("#mnuCd").val();
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/addRequestDtl.do?num=" + num + "&addReqGb=" + addReqGb + "&mnuCd=" + mnuCd;
	}
	
	function list(curPage) {
		$("#currentPageNo").val(curPage);
		document.searchForm.action = "<c:out value="${pageContext.request.contextPath}" />/addRequestList.do";
       	document.searchForm.submit();
	}
	
	function fn_goLink(no){
		var url = "";
		
		if(no == 1){
			url = "<c:out value="${pageContext.request.contextPath}" />/test7List.do?mnuCd=${mnuCd}";	
		}else if(no == 2) {
			url = "<c:out value="${pageContext.request.contextPath}" />/noinGroupList.do?mnuCd=${mnuCd}";
		}else if(no == 3){
			url = "<c:out value="${pageContext.request.contextPath}" />/addRequestList.do?mnuCd=${mnuCd}";
		}
		document.location.href = url;
	}
	
	
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    list(1);
		  };
	});
</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>추가의뢰서</h2>
		<div class="box-style1 x-scroll-auto" >
		
		<form name="searchForm" id="searchForm" method="get" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<div class="search-box">
				<div class="search-group">
					<span style="padding-left: 100px;">등록일</span> <input type="text" name="schYsmStartDt" id="datepicker1" value="${vo.schYsmStartDt}"  style="width: 100px;" /> &nbsp;&nbsp;&nbsp; ~ &nbsp;<input type="text" name="schYsmEndDt" id="datepicker2" value="${vo.schYsmEndDt}" style="width: 100px;" readOnly />
					<span class="label"><label>의뢰구분</label></span>
					<span class="label2">
						<select name="schAddReqGb" style="width:275px;">
							<option value="">전체</option>
							<option value="1">내부의뢰</option>
							<option value="2">외부의뢰</option>
						</select>
					</span>
				</div>
				
				<br/>
				
				<div class="btn" style="padding-bottom:15px; padding-right:120px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:list(1);">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
			</div>
		</form>
		
			<div>
				<ul class="tabs">
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(1);">노인상담</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(2);">집단노인상담</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin; background-color: gray;">추가의뢰</li>
				</ul>
			</div>
			
			<h3 class="h3-title"><i class="fa fa-star"></i>신드라</h3>
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="3%"></col>
					<col width="5%"></col> 
					<col width="5%"></col> 
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">ysmNo</th>
						<th scope="col">ysmId</th> 
						<th scope="col">narcissus</th> 
						<th scope="col">scaling</th> 
						<th scope="col">성별</th> 
						<th scope="col">사용자이름</th> 
						<th scope="col">사용자아이디</th> 
						<th scope="col">텍스트</th> 
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${t6detail.size() == 0 }">
						<tr>
							<td colspan="9">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${t6detail.size() > 0 }">
						<c:forEach items="${t6detail}" var="result">
							<tr>
								<td>${result.rnum }</td>
								<td>${result.ysmNo }</td>
								<td>${result.ysmId}</td>
								<td>${result.narcissus}</td>
								<td>${result.scaling}</td>
								<td>
									<c:if test="${result.gender eq 'M' }">남</c:if>
									<c:if test="${result.gender eq 'W' }">여</c:if>
								</td>
								<td>${map.userId}</td>
								<td>${map.userNm}</td>
								<td>${result.content}</td>
							</tr> 
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			
			<br/>
			
			<div style="float: right; display: inline-block;">
				<button type="button" class="btn-basic" onClick="javascript:fn_reg('${mnuCd }');" style="background-color: green;color:white;">신규등록</button>
			</div>
			
			<h3 class="h3-title"><i class="fa fa-star"></i>추가의뢰서</h3>
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="10%"></col> 
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
					<col width="10%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">의뢰 구분</th> 
						<th scope="col">아이디</th> 
						<th scope="col">구분나누기</th> 
						<th scope="col">사과</th> 
						<th scope="col">이름</th> 
						<th scope="col">작성일</th> 
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
							<tr onclick="javascript:fn_detail('${result.num}','${result.addReqGb}');">
								<td>${result.rnum }</td>
								<c:if test="${result.addReqGb == '1' }"><td>내부의뢰</td></c:if>
								<c:if test="${result.addReqGb == '2' }"><td>외부의뢰</td></c:if>
								<td>${result.ysmId}</td>
								<c:if test="${result.addReqGb == '1' }"><td>${result.validation }</td></c:if>
								<c:if test="${result.addReqGb == '2' }"><td>${result.instruction }</td></c:if>
								<td>${result.epilogue}</td>
								<td>${result.ysmNm}</td>
								<td>${result.dbInsTm}</td>
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

