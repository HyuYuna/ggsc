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
				$("#yumiNo").val(0);
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test12Reg.do?save=" +param;
		       	document.frm.submit();
			}
		} else if(param == "U") {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test12Reg.do?save=" +param;
		       	document.frm.submit();
			}
		} else if(param == "D") {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test12Reg.do?save=" +param;
		       	document.frm.submit();
			}
		}
		
	}  	
	
	function fn_list(mnuCd){
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/test12List.do?mnuCd=" + mnuCd;
	}
	
	
	
</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>
		<c:if test="${empty detail.yumiNo}">유미 등록</c:if>
		<c:if test="${!empty detail.yumiNo}">유미 상세 및 수정</c:if>
	</h2>
		<div class="box-style1 x-scroll-auto" >
			<form id="frm" name="frm" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
				<input type="hidden" id="yumiNo" name="yumiNo" value="${detail.yumiNo }" />
				<input type="hidden" id="save" name="save" />
				<table class="table-write">
					<colgroup>
						<col width="15%"></col>
						<col width="10%"></col> 
						<col width="25%"></col>
						<col width="15%"></col>
						<col width="35%"></col>
					</colgroup>
				<tr>
					<th>diverse</th>
					<td colspan="2">
						<select id="g1Gb" name="g1Gb">
							<option value=''>선택하세요</option>
							<c:forEach items="${g1List }" var="list">
								<option value="${list.odr }" <c:if test="${list.odr == detail.g1Gb }">selected</c:if>>${list.ysmMclassNm}</option>		
							</c:forEach>
						</select> 
					</td>
					<th colspan="2" class='hide' data-type='hideClass1' data-class='2'></th>
				</tr>
				<tr>
					<th>enormous</th>
					<td colspan="2">
						<select id="g2Gb" name="g2Gb" >
							<option value="">선택하세요</option>
							<c:forEach items="${g2List }" var="list">
								<option value="${list.odr }" <c:if test="${list.odr == detail.g2Gb }">selected</c:if>>${list.ysmMclassNm}</option>										
							</c:forEach>
						</select> 
					</td>
					<th>match</th>
					<td>
						<select id="g3Gb" name="g3Gb">
							<option value=''>선택하세요</option>
							<c:forEach items="${g3List }" var="list">
								<option value="${list.odr }" <c:if test="${list.odr == detail.g3Gb }">selected</c:if>>${list.ysmMclassNm}</option>		
							</c:forEach>
						</select> 
					</td>
				</tr>
				<tr>
					<th>날짜</th>
					<td colspan="2">
						<span class="form"><input type="text" class="wd100" id="datepicker1" name="ysmDt" value="${detail.ysmDt }" readOnly/></span>
						<select class="wd50 mg-125" id="weekCd" name="weekCd">
							<option value="1" selected="selected">월</option>
							<option value="2">화</option>
							<option value="3">수</option>
							<option value="4">목</option>
							<option value="5">금</option>
							<option value="6">토</option>
							<option value="7">일</option>
						</select>
						<br/>
						<input type="text" class="wd50 mg-l25" maxlength="2" id="ysmSttHour" name="ysmSttHour" value="${detail.ysmSttHour }" onlyNumber/>시
						<input type="text" class="wd50" maxlength="2" id="ysmSttMin" name="ysmSttMin" value="${detail.ysmSttMin }" onlyNumber/>분 ~
						<input type="text" class="wd50" maxlength="2" id="ysmEndHour" name="ysmEndHour" value="${detail.ysmEndHour }" onlyNumber/>시
						<input type="text" class="wd50" maxlength="2" id="ysmEndMin" name="ysmEndMin" value="${detail.ysmEndMin }" onlyNumber/>분
					</td>
					<th>생일</th>
					<td>
						<span class="form"><input type="text" class="wd200" id="datepicker7" name="birthDt" value="${detail.birthDt }" readOnly/></span>
					</td>
				</tr>
				<tr>
					<th>arise</th>
					<td colspan="2">
						<select id="g4Gb" name="g4Gb">
							<option value=''>선택하세요</option>
							<c:forEach items="${g4List }" var="list">
								<option value="${list.odr }" <c:if test="${list.odr == detail.g4Gb }">selected</c:if>>${list.ysmMclassNm}</option>		
							</c:forEach>
						</select> 
					</td>
					<th>회차</th>
					<td>
						<select class="wd200" id="g5Gb" name="g5Gb">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td colspan="2">
						<input type="radio" id="male" name="gender" value="M" <c:if test="${detail.gender == 'M' }">checked="checked"</c:if> /><label for="male">남 </label>
						<input type="radio" id="female" name="gender" value="F" <c:if test="${detail.gender == 'F' }">checked="checked"</c:if> /><label for="female">여</label>
					</td>
					<th>주소</th>
					<td>
						<input type="text" id="addr" name="addr" value="${detail.addr}" />
					</td>
				</tr>
				<tr>
					<th>term</th>
					<td colspan="2">
						<c:forEach items="${g7List}" var="list">
							<input type="radio" id="g7Gb${list.odr}" name="g7Gb" value="${list.odr}" <c:if test="${list.odr == detail.g7Gb}">checked="checked"</c:if> /><label for="g7Gb${list.odr}">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
					<th>exceed</th>
					<td colspan="2">
						<c:forEach items="${g8List}" var="list">
							<input type="radio" id="g8Gb${list.odr}" name="g8Gb" value="${list.odr}" <c:if test="${list.odr == detail.g8Gb}">checked="checked"</c:if> /><label for="g8Gb${list.odr}">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>Fate</th>
					<td colspan="2">
						<c:forEach items="${test1List }" var="list">
							<input type="radio" id="fate${list.num}" name="fate" value="${list.num}" <c:if test="${list.num == detail.fate}">checked</c:if> /><label for="fate${list.num}">${list.title}</label>
						</c:forEach>
					</td>
					<th>narcissus</th>
					<td>
						<c:forEach items="${test2List }" var="list">
							<input type="checkbox" id="narcissus${list.num}" name="narcissus" value="${list.num}" <c:if test="${fn:contains(detail.narcissus, list.num)}">checked</c:if> /><label for="narcissus${list.num}">${list.title}</label>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>available</th>
					<td colspan="2">
						<c:forEach items="${g12List}" var="list">
							<input type="checkbox" id="g12Gb${list.odr}" name="g12Gb" value="${list.odr}" <c:if test="${fn:contains(detail.g12Gb, list.odr)}">checked</c:if> /><label for="g12Gb${list.odr}">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
					
					<th>recognize</th>
					<td>
						<c:forEach items="${g13List}" var="list">
							<input type="checkbox" id="g13Gb${list.odr}" name="g13Gb" value="${list.odr}" <c:if test="${fn:contains(detail.g13Gb, list.odr)}">checked</c:if> /><label for="g13Gb${list.odr}">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>정서적편안함정도</th>
					<td colspan="4">
						<input type="radio" id="g14Gb1" name="g14Gb" value="1" <c:if test="${detail.g14Gb == '1' }">checked="checked"</c:if> /><label for="g14Gb1">1</label>
						<input type="radio" id="g14Gb2" name="g14Gb" value="2" <c:if test="${detail.g14Gb == '2' }">checked="checked"</c:if> /><label for="g14Gb2">2</label>
						<input type="radio" id="g14Gb3" name="g14Gb" value="3" <c:if test="${detail.g14Gb == '3' }">checked="checked"</c:if> /><label for="g14Gb3">3</label>
						<input type="radio" id="g14Gb4" name="g14Gb" value="4" <c:if test="${detail.g14Gb == '4' }">checked="checked"</c:if> /><label for="g14Gb4">4</label>
						<input type="radio" id="g14Gb5" name="g14Gb" value="5" <c:if test="${detail.g14Gb == '5' }">checked="checked"</c:if> /><label for="g14Gb5">5</label>
					</td>
				</tr>
				<tr>
					<th>도움 받은 정도</th>
					<td colspan="4">
						<input type="radio" id="g15Gb1" name="g15Gb" value="1" <c:if test="${detail.g15Gb == '1' }">checked="checked"</c:if> /><label for="g15Gb1">1</label>
						<input type="radio" id="g15Gb2" name="g15Gb" value="2" <c:if test="${detail.g15Gb == '2' }">checked="checked"</c:if> /><label for="g15Gb2">2</label>
						<input type="radio" id="g15Gb3" name="g15Gb" value="3" <c:if test="${detail.g15Gb == '3' }">checked="checked"</c:if> /><label for="g15Gb3">3</label>
						<input type="radio" id="g15Gb4" name="g15Gb" value="4" <c:if test="${detail.g15Gb == '4' }">checked="checked"</c:if> /><label for="g15Gb4">4</label>
						<input type="radio" id="g15Gb5" name="g15Gb" value="5" <c:if test="${detail.g15Gb == '5' }">checked="checked"</c:if> /><label for="g15Gb5">5</label>
					</td>
				</tr>
				<tr>
					<th>텍스트</th>
					<td colspan="6"><textarea name="content">${detail.content}</textarea></td>
				</tr>
				<tr>
					<th>마지막한마디</th>
					<td colspan="6">
						<input type="text" id="title" name="title" value="${detail.title}" />
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

