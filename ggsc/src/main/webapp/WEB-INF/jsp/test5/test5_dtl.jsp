<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script src="<c:out value="${pageContext.request.contextPath}" />/js/html2canvas.min.js" ></script>
<script src="<c:out value="${pageContext.request.contextPath}" />/js/jspdf.min.js" ></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		
		str = "${detail.fate}";
		name = "fate";
		fn_checked(str, name);
		
		str = "${detail.narcissus}";
		name = "narcissus";
		fn_checked(str, name);
		
	});
		
	

	function fn_reg(param){
		
		
		if(param == "S") {
			if(confirm("등록 하시겠습니까?")){
				$("#ysmNo").val(0);
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test5Reg.do?save=" +param;
		       	document.frm.submit();
			}
		} else if(param == "U") {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test5Reg.do?save=" +param;
		       	document.frm.submit();
			}
		} else if(param == "D") {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test5Reg.do?save=" +param;
		       	document.frm.submit();
			}
		}
		
	}  	
	
	function fn_list(mnuCd){
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/test5List.do?mnuCd=" + mnuCd;
		/* document.frm.action = "/eduAtvyRptList.do";
	   	document.frm.submit(); */
	}
	
	
</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>DUST 상세 및 수정</h2>
		
		<div class="box-style1 x-scroll-auto" >
			<form id="frm" name="frm" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
				<input type="hidden" id="ysmNo" name="ysmNo" value="${detail.ysmNo }" />
				<input type="hidden" id="save" name="save" />
				<table class="table-write">
					<colgroup>
						<col width="25%"></col>
						<col width="75%"></col> 
					</colgroup>
					<tr>
						<th>Fate</th>
						<td>
							<select class="wd200" id="fate" name="fate">
								<option value=''>선택하세요</option>
								<c:forEach items="${test1List }" var="list">
									<option value="${list.num }" <c:if test="${ list.num eq detail.fate }">selected</c:if> >${list.title }</option>		
								</c:forEach>
							</select> 
						</td>
					</tr>
					<tr>
						<th>자료명</th>
							<td><input type="text" id="title" name="title" maxlength="50" value="${detail.title }"/></td>
					</tr>
					
					
					<tr>
						<th>설명</th>
						<td style="text-align: left;"><textarea id="rcontent" name="content" cols="100" rows="20"><c:out value="${detail.content }" escapeXml="false"/></textarea></td>
					</tr>
				</table>
				<div class="btn" style="float: right; margin: 0;">
					<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd}');" style="background-color: green;color:white;">목록</button>
					<c:if test="${ userId == detail.regId}">
							<button type="button" class="btn-basic" onClick="javascript:fn_reg('U');" style="background-color: green;color:white;">수정</button>	
							<button type="button" class="btn-basic" onClick="javascript:fn_reg('D');" style="background-color: green;color:white;">삭제</button>	
					</c:if>
					<c:if test="${detail == null}">
						<button type="button" class="btn-basic" onClick="javascript:fn_reg('S');" style="background-color: green;color:white;">저장</button>
					</c:if>
				</div>	
			</form>
		</div>
		<!-- end -->
	</section>
</html>

