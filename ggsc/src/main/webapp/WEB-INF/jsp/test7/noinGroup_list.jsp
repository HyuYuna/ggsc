<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 
<link href="<c:out value="${pageContext.request.contextPath}" />/css/style.css" rel="stylesheet">
<script src="<c:out value="${pageContext.request.contextPath}" />/js/util/paging.js"></script>

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
		
		
	});

	function fn_reg(mnuCd){
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/noinGroupDtl.do?mnuCd=" + mnuCd;
	}
	
	function fn_detail(num){
		var mnuCd = $("#mnuCd").val();
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/noinGroupDtl.do?num=" + num + "&mnuCd=" + mnuCd;
	}
	
	function list(curPage) {
		$("#currentPageNo").val(curPage);
		document.searchForm.action = "<c:out value="${pageContext.request.contextPath}" />/noinGroupList.do?mnuCd=${mnuCd}";
       	document.searchForm.submit();
	}
	
	function fn_goLink(no){
		var url = "";
		
		if(no == 1){
			url = "<c:out value="${pageContext.request.contextPath}" />test7List.do?mnuCd=${mnuCd}";	
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
	<h2 class="h2-title"><i class="fa fa-check-square"></i>노인상담</h2>
		<div class="box-style1 x-scroll-auto" >
		
		<form name="searchForm" id="searchForm" method="get" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<input type="hidden" id="num" name="num" value="0" />
			<input type="hidden" id="g1Gb" name="g1Gb"  />
			<input type="hidden" id="g2Gb" name="g2Gb"  />
			<input type="hidden" id="g3Gb" name="g3Gb"  />
			
			<div class="search-box">
				<div class="search-group">
					<span style="padding-left: 100px;">등록일</span> <input type="text" name="schYsmStartDt" id="datepicker1" value="${vo.schYsmStartDt}"  style="width: 100px;" /> &nbsp;&nbsp;&nbsp; ~ &nbsp;<input type="text" name="schYsmEndDt" id="datepicker2" value="${vo.schYsmEndDt}" style="width: 100px;" readOnly />
					<span class="label">
						<select id="schType" name="schType" style="margin-left: 20px;">
							<option value="1" <c:if test="${vo.schType==1}">selected</c:if>>주소</option>
							<option value="2" <c:if test="${vo.schType==2}">selected</c:if>>텍스트</option>
							<option value="3" <c:if test="${vo.schType==3}">selected</c:if>>텍스트2</option>
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
		
			<div>
				<ul class="tabs">
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(1);">노인상담</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin; background-color: gray;">집단노인상담</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(3);">추가의뢰</li>
				</ul>
			</div>
			
		
			
			
			<h3 class="h3-title"><i class="fa fa-star"></i>노인상담</h3>
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="3%"></col>
					<col width="5%"></col> 
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
						<th scope="col">ysmNo</th>
						<th scope="col">상태</th> 
						<th scope="col">enormous</th> 
						<th scope="col">match</th> 
						<th scope="col">성별</th> 
						<th scope="col">주소</th> 
						<th scope="col">강점</th> 
						<th scope="col">텍스트</th> 
					</tr>
				</thead>
				<tbody id="tby1">
					<c:if test="${t7detail.size() == 0 }">
						<tr>
							<td colspan="9">정보가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${t7detail.size() > 0 }">
						<c:forEach items="${t7detail}" var="result">
						<tr>
								<td>${result.rnum }</td>
								<td>${result.ysmNo }</td>
								<td>${result.validation}</td>
								<td>${result.instruction}</td>
								<td>${result.scaling}</td>
								<td>
									<c:if test="${result.gender eq 'M' }">남</c:if>
									<c:if test="${result.gender eq 'W' }">여</c:if>
								</td>
								<td>${result.addr}</td>
								<td>${result.advantage}</td>
								<td>${result.content}</td>
							</tr> 
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			
			<br/>
			
			<div class="btn" style="float: right; margin: 0;">
				<button type="button" class="btn-basic" onClick="javascript:fn_reg('${mnuCd }');" style="background-color: green;color:white;">노인상담등록</button>
			</div>	
			
			<h3 class="h3-title"><i class="fa fa-star"></i>노인집단상담</h3>
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
						<th scope="col">상담 제목</th> 
						<th scope="col">상담자</th> 
						<th scope="col">상담날짜</th> 
						<th scope="col">답변제목</th> 
						<th scope="col">답변자</th> 
						<th scope="col">답변날짜</th> 
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
							<tr onclick="javascript:fn_detail('${result.num}')">
								<td>${result.rnum }</td>
								<td>${result.title}</td>
								<td>${result.noinCnsr}</td>
								<td>${result.noinDt}</td>
								<td>${result.rtitle}</td>
								<td>${result.rplyCnsr}</td>
								<td>${result.rplyDt}</td>
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

