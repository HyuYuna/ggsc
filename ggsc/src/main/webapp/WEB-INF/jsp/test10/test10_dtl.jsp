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
		
		str = "${detail.g4Gb}";
		name = "g4Gb";
		fn_checked(str, name);
		
	});
		
	

	function fn_reg(param){
		
		$("#g1Gb").val($("#g1Gb").val().replace(/[^A-Za-z\d_-]+/,'')); 
		$("#g2Gb").val($("#g2Gb").val().replace(/[^A-Za-z\d_-]+/,'')); 
		$("#g3Gb").val($("#g3Gb").val().replace(/[^A-Za-z\d_-]+/,'')); 
		
		
		if(param == "S") {
			if(confirm("등록 하시겠습니까?")){
				$("#huhyunaNo").val(0);
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test10Reg.do?save=" +param;
		       	document.frm.submit();
			}
		} else if(param == "U") {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test10Reg.do?save=" +param;
		       	document.frm.submit();
			}
		} else if(param == "D") {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test10Reg.do?save=" +param;
		       	document.frm.submit();
			}
		}
		
	}  	
	
	function fn_list(mnuCd){
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/test10List.do?mnuCd=" + mnuCd;
	}
	
	
	
</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>라일락 상세 및 수정</h2>
		
		<div class="box-style1 x-scroll-auto" >
			<form id="frm" name="frm" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
				<input type="hidden" id="huhyunaNo" name="huhyunaNo" value="${detail.huhyunaNo }" />
				<input type="hidden" id="save" name="save" />
				<table class="table-write">
					<colgroup>
						<col width="25%"></col>
						<col width="75%"></col> 
					</colgroup>
					<tr>
						<th>season</th>
						<td>
							<select id="g1Gb" name="g1Gb" style="width:275px;">
								<option value="">선택하세요</option>
								<c:forEach items="${g1List }" var="list">
									<option value="${list.odr }" <c:if test="${list.odr == detail.g1Gb }">selected</c:if>>${list.ysmMclassNm}</option>										
								</c:forEach>
							</select> 
						</td>
					</tr>
					<tr>
						<th>mobile</th>
						<td>
							<select id="g2Gb" name="g2Gb" style="width:275px;">
								<option value="">선택하세요</option>
								<c:forEach items="${g2List }" var="list">
									<option value="${list.odr }" <c:if test="${list.odr == detail.g2Gb }">selected</c:if>>${list.ysmMclassNm}</option>										
								</c:forEach>
							</select> 
						</td>
					</tr>
					<tr>
						<th>transaction</th>
						<td>
							<select id="g3Gb" name="g3Gb" style="width:275px;">
								<option value=''>선택하세요</option>
								<c:forEach items="${g3List }" var="list">
									<option value="${list.odr }" <c:if test="${list.odr == detail.g3Gb }">selected</c:if>>${list.ysmMclassNm}</option>		
								</c:forEach>
							</select> 
						</td>
					</tr>
					<tr>
						<th>submission</th>
						<td>
							<c:forEach items="${g4List}" var="list">
								<input type="checkbox" id="g4Gb${list.odr}" name="g4Gb" value="${list.odr}" <c:if test="${fn:contains(detail.g4Gb, list.odr)}">checked</c:if> /><label for="g4Gb${list.odr}">${list.ysmMclassNm }</label>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<th>statement</th>
						<td>
							<c:forEach items="${g5List}" var="list" varStatus="index">
								<input type="radio" id="g5Gb${index.count}" name="g5Gb" value="${list.odr}" <c:if test="${list.odr == detail.g5Gb}">checked="checked"</c:if> /><label for="g5Gb${index.count}">${list.ysmMclassNm }</label>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<th>날짜</th>
						<td>
							<span class="form"><input type="text" class="wd100" id="datepicker1" name="ysmDt" value="${detail.ysmDt }" readOnly/></span>
							<input type="text" class="wd50 mg-l25" maxlength="2" id="ysmSttHour" name="ysmSttHour" value="${detail.ysmSttHour }" onlyNumber/>시
							<input type="text" class="wd50" maxlength="2" id="ysmSttMin" name="ysmSttMin" value="${detail.ysmSttMin }" onlyNumber/>분 ~
							<input type="text" class="wd50" maxlength="2" id="ysmEndHour" name="ysmEndHour" value="${detail.ysmEndHour }" onlyNumber/>시
							<input type="text" class="wd50" maxlength="2" id="ysmEndMin" name="ysmEndMin" value="${detail.ysmEndMin }" onlyNumber/>분
						</td>
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

