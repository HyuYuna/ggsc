<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신청자 정보 팝업</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}" />/css/style.css">
<script src="<c:out value="${pageContext.request.contextPath}" />/js/jquery-1.11.2.min.js" ></script>
<script type="text/javascript">
	
	function fn_select(ysmId, ysmNm, yunaNo, fate, birthDt, mobile){
		opener.document.getElementById("ysmId").value = ysmId;
		opener.document.getElementById("ysmNm").value = ysmNm;
		opener.document.getElementById("yunaNo").value = yunaNo;
		opener.document.getElementById("fate").value = fate;
		
		if(opener.document.getElementById("yunaNo2")){
			opener.document.getElementById("yunaNo2").value = yunaNo;
		}
		
		if(opener.document.getElementById("ysmNm2")){
			opener.document.getElementById("ysmNm2").value = ysmNm;
		}
		if(opener.document.getElementById("birthDt")){
			opener.document.getElementById("birthDt").value = birthDt;
		}
		if(opener.document.getElementById("tel")){
			opener.document.getElementById("tel").value = mobile;
		}
		
		if(opener.getGb){
			opener.getGb();
		}
		
		window.close();
	}
	
	function list(curPage) {
		$("#currentPageNo").val(curPage);
		document.searchForm.action = "<c:out value="${pageContext.request.contextPath}" />/findYunaPopup.do";
       	document.searchForm.submit();
	}
</script>
</head>
<body>
	<h2 class="h2-title mg-t20 mg-l25">
		<i class="fa fa-circle"></i>
		 유나 찾기
	</h2>
		<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" method="post" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnucd"  name="mnucd" value="${mnucd }" />
			<div class="search-box">
				<div class="search-group" style="margin-left:0px;">
					<span class="label"><label>ysmId</label></span>
					<span class="label2">
						<input type="text" name="schYsmId" maxLength=12 style="width:100px;" value="${vo.schYsmId }" />
					</span>
				</div>
				<div class="search-group" style="margin-left:0px;">
					<span class="label"><label>ysmNm</label></span>
					<span class="label2">
						<input type="text" name="schYsmNm" maxLength=12 style="width:100px;" value="${vo.schYsmNm }" />
					</span>	
				</div>
				<br>
				<div class="btn" style="padding-right:10px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:list(1);">
						<i class="fa fa-search"></i>검색
					</button>
				</div>			
			</div>
		</form>
		<table class="table-style1" >
			<colgroup>
				<col width="10%"></col>
				<col width="25%"></col>
				<col width="20%"></col>
				<col width="25%"></col>
				<col width="20%"></col>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">순번</th>
					<th scope="col">yunaNo</th>
					<th scope="col">fate</th>
					<th scope="col">ID</th>
					<th scope="col">성명</th> 
				</tr>
			</thead>
			<tbody id="tby1">
				<c:if test="${list.size() == 0 }">
					<tr>
						<td colspan="5">정보가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${list.size() > 0 }">
					<c:forEach items="${list }" var="result" varStatus="rs">
						<tr onclick="javascript:fn_select('${result.ysmId}', '${result.ysmNm }', '${result.yunaNo }', '${result.fate }', '${result.birthDt }', '${result.mobile }');">
							<td>${result.rnum }</td>
							<td>${result.yunaNo }</td>
							<td>${result.fateYuna }</td>
							<td>${result.ysmId }</td>
							<td>${result.ysmNm }</td>
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
	<div>
		<button type="button" class="btn-basic" onclick="window.close();">닫기</button>
	</div>
</body>
</html>