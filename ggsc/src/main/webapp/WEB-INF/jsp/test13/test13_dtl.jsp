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
		
		$("#g13Gb").val($("#g13Gb").val().replace(/[^A-Za-z\d_-]+/,'')); 
		$("#g14Gb").val($("#g14Gb").val().replace(/[^A-Za-z\d_-]+/,'')); 
		$("#g15Gb").val($("#g15Gb").val().replace(/[^A-Za-z\d_-]+/,'')); 
		
		
		
		
		
		
		if(param == "S") {
			if(confirm("등록 하시겠습니까?")){
				$("#appleNo").val(0);
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test13Reg.do?save=" +param;
		       	document.frm.submit();
			}
		} else if(param == "U") {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test13Reg.do?save=" +param;
		       	document.frm.submit();
			}
		} else if(param == "D") {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test13Reg.do?save=" +param;
		       	document.frm.submit();
			}
		}
		
	}  	
	
	function fn_list(mnuCd){
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/test13List.do?mnuCd=" + mnuCd;
	}
	
	
	
</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>
		<c:if test="${empty detail.appleNo}">사과 등록</c:if>
		<c:if test="${!empty detail.appleNo}">사과 상세 및 수정</c:if>
	</h2>
		<div class="box-style1 x-scroll-auto" >
			<form id="frm" name="frm" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
				<input type="hidden" id="appleNo" name="appleNo" value="${detail.appleNo }" />
				<input type="hidden" id="save" name="save" />
				<table class="table-write">
					<colgroup>
						<col width="15%"></col>
						<col width="10%"></col> 
						<col width="10%"></col> 
						<col width="15%"></col>
						<col width="10%"></col> 
						<col width="10%"></col> 
						<col width="10%"></col> 
						<col width="10%"></col> 
					</colgroup>
				<tr>
					<th rowspan="3">텍스트</th>
					<th>내용</th>
					<td colspan="6"><textarea name="content">${detail.content}</textarea></td>
				</tr>
				<tr>
					<th>문제</th>
					<td colspan="2"><input type="text" name="problem" id="problem" value="${detail.problem}" /></td>
					<th>사례</th>
					<td><input type="text" name="addr" id="addr" value="${detail.addr}" /></td>
					<th>생일</th>
					<td>
						<span class="form"><input type="text" class="wd200" id="datepicker3" name="birthDt" value="${detail.brithDt }" readOnly /></span>
					</td>
				</tr>
				<tr>
					<th>후기</th>
					<td colspan="6"><textarea name="epilogue">${detail.epilogue}</textarea></td>
				</tr>
				
				<tr>
					<th>날짜</th>
					<th>첫번쨰 날짜</th>
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
					<th>두번쨰 날짜</th>
					<td colspan="3">
						<span class="form"><input type="text" class="wd100" id="datepicker2" name="ysm2Dt" value="${detail.ysm2Dt }" readOnly/></span>
						<select class="wd50 mg-125" id="week2Cd" name="week2Cd">
							<option value="1" selected="selected">월</option>
							<option value="2">화</option>
							<option value="3">수</option>
							<option value="4">목</option>
							<option value="5">금</option>
							<option value="6">토</option>
							<option value="7">일</option>
						</select>
						<br/>
						<input type="text" class="wd50 mg-l25" maxlength="2" id="ysm2SttHour" name="ysm2SttHour" value="${detail.ysm2SttHour }" onlyNumber/>시
						<input type="text" class="wd50" maxlength="2" id="ysm2SttMin" name="ysm2SttMin" value="${detail.ysm2SttMin }" onlyNumber/>분 ~
						<input type="text" class="wd50" maxlength="2" id="ysm2EndHour" name="ysm2EndHour" value="${detail.ysm2EndHour }" onlyNumber/>시
						<input type="text" class="wd50" maxlength="2" id="ysm2EndMin" name="ysm2EndMin" value="${detail.ysm2EndMin }" onlyNumber/>분
					</td>
					
				</tr>
				<tr>
					<th rowspan="3">라디오</th>
					<th>경험 유무</th>
					<td colspan="2">
						<input type="radio" id="yes" name="example" value="Y" <c:if test="${detail.example == 'Y' }">checked="checked"</c:if> /><label for="male">예 </label>
						<input type="radio" id="no" name="example" value="N" <c:if test="${detail.example == 'N' }">checked="checked"</c:if> /><label for="female">아니요</label>
					</td>
					<th>diverse</th>
					<td>
						<c:forEach items="${g1List}" var="list">
							<input type="radio" id="g1Gb${list.odr}" name="g1Gb" value="${list.odr}" <c:if test="${list.odr == detail.g1Gb}">checked="checked"</c:if> /><label for="g1Gb${list.odr}">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
					<th>enormous</th>
					<td>
						<c:forEach items="${g2List}" var="list">
							<input type="radio" id="g2Gb${list.odr}" name="g2Gb" value="${list.odr}" <c:if test="${list.odr == detail.g2Gb}">checked="checked"</c:if> /><label for="g2Gb${list.odr}">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>match</th>
					<td colspan="2">
						<c:forEach items="${g3List}" var="list">
							<input type="radio" id="g3Gb${list.odr}" name="g3Gb" value="${list.odr}" <c:if test="${list.odr == detail.g3Gb}">checked="checked"</c:if> /><label for="g3Gb${list.odr}">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
					<th>arise</th>
					<td colspan="3">
						<c:forEach items="${g4List}" var="list">
							<input type="radio" id="g4Gb${list.odr}" name="g4Gb" value="${list.odr}" <c:if test="${list.odr == detail.g4Gb}">checked="checked"</c:if> /><label for="g4Gb${list.odr}">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>interval</th>
					<td colspan="3">
						<c:forEach items="${g5List}" var="list">
							<input type="radio" id="g5Gb${list.odr}" name="g5Gb" value="${list.odr}" <c:if test="${list.odr == detail.g5Gb}">checked="checked"</c:if> /><label for="g5Gb${list.odr}">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
					<th>patent</th>
					<td colspan="3">
						<c:forEach items="${g6List}" var="list">
							<input type="radio" id="g6Gb${list.odr}" name="g6Gb" value="${list.odr}" <c:if test="${list.odr == detail.g6Gb}">checked="checked"</c:if> /><label for="g6Gb${list.odr}">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>회차</th>
					<th>select</th>
					<td colspan="2">
						<select class="wd200" id="g16Gb" name="g16Gb">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</td>
					<th>라디오</th>
					<td colspan="3">
						<input type="radio" id="g17Gb1" name="g17Gb" value="1" <c:if test="${detail.g17Gb == '1' }">checked="checked"</c:if> /><label for="g17Gb1">1</label>
						<input type="radio" id="g17Gb2" name="g17Gb" value="2" <c:if test="${detail.g17Gb == '2' }">checked="checked"</c:if> /><label for="g17Gb1">2</label>
						<input type="radio" id="g17Gb3" name="g17Gb" value="3" <c:if test="${detail.g17Gb == '3' }">checked="checked"</c:if> /><label for="g17Gb1">3</label>
						<input type="radio" id="g17Gb4" name="g17Gb" value="4" <c:if test="${detail.g17Gb == '4' }">checked="checked"</c:if> /><label for="g17Gb1">4</label>
						<input type="radio" id="g17Gb5" name="g17Gb" value="5" <c:if test="${detail.g17Gb == '5' }">checked="checked"</c:if> /><label for="g17Gb1">5</label>
					</td>
				</tr>
				<tr>
					<th rowspan="3">checkbox</th>
					<th>term</th>
					<td colspan="2">
						<c:forEach items="${g7List}" var="list">
							<input type="checkbox" id="g7Gb${list.odr}" name="g7Gb" value="${list.odr}" <c:if test="${fn:contains(detail.g7Gb, list.odr)}">checked</c:if> /><label for="g7Gb${list.odr}">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
					<th>exceed</th>
					<td colspan="3">
						<c:forEach items="${g8List}" var="list">
							<input type="checkbox" id="g8Gb${list.odr}" name="g8Gb" value="${list.odr}" <c:if test="${fn:contains(detail.g8Gb, list.odr)}">checked</c:if> /><label for="g8Gb${list.odr}">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
				</tr>
				
				<tr>
					<th>emit</th>
					<td colspan="2">
						<c:forEach items="${g9List}" var="list">
							<input type="checkbox" id="g9Gb${list.odr}" name="g9Gb" value="${list.odr}" <c:if test="${fn:contains(detail.g9Gb, list.odr)}">checked</c:if> /><label for="g9Gb${list.odr}">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
					<th>contemporary</th>
					<td colspan="3">
						<c:forEach items="${g10List}" var="list">
							<input type="checkbox" id="g10Gb${list.odr}" name="g10Gb" value="${list.odr}" <c:if test="${fn:contains(detail.g10Gb, list.odr)}">checked</c:if> /><label for="g10Gb${list.odr}">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>plot</th>
					<td colspan="2">
						<c:forEach items="${g11List}" var="list">
							<input type="checkbox" id="g11Gb${list.odr}" name="g11Gb" value="${list.odr}" <c:if test="${fn:contains(detail.g11Gb, list.odr)}">checked</c:if> /><label for="g11Gb${list.odr}">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
					<th>available</th>
					<td colspan="3">
						<c:forEach items="${g12List}" var="list">
							<input type="checkbox" id="g12Gb${list.odr}" name="g12Gb" value="${list.odr}" <c:if test="${fn:contains(detail.g12Gb, list.odr)}">checked</c:if> /><label for="g12Gb${list.odr}">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>select</th>
					<th>recognize</th>
					<td colspan="2">
						<select id="g13Gb" name="g13Gb">
							<option value="">선택하세요</option>
							<c:forEach items="${g13List }" var="list">
								<option value="${list.odr }" <c:if test="${list.odr == detail.g13Gb }">selected</c:if>>${list.ysmMclassNm}</option>										
							</c:forEach>
						</select> 
					</td>
					<th>convey</th>
					<td>
						<select id="g14Gb" name="g14Gb">
							<option value="">선택하세요</option>
							<c:forEach items="${g14List }" var="list">
								<option value="${list.odr }" <c:if test="${list.odr == detail.g14Gb }">selected</c:if>>${list.ysmMclassNm}</option>										
							</c:forEach>
						</select> 
					</td>
					<th>assessment</th>
					<td>
						<select id="g15Gb" name="g15Gb">
							<option value="">선택하세요</option>
							<c:forEach items="${g15List }" var="list">
								<option value="${list.odr }" <c:if test="${list.odr == detail.g15Gb }">selected</c:if>>${list.ysmMclassNm}</option>										
							</c:forEach>
						</select> 
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

