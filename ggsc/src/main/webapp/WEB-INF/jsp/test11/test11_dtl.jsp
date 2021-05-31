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
				$("#yukiNo").val(0);
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test11Reg.do?save=" +param;
		       	document.frm.submit();
			}
		} else if(param == "U") {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test11Reg.do?save=" +param;
		       	document.frm.submit();
			}
		} else if(param == "D") {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test11Reg.do?save=" +param;
		       	document.frm.submit();
			}
		}
		
	}  	
	
	function fn_list(mnuCd){
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/test11List.do?mnuCd=" + mnuCd;
	}
	
	
	
</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>유키 상세 및 수정</h2>
		
		<div class="box-style1 x-scroll-auto" >
			<form id="frm" name="frm" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
				<input type="hidden" id="yukiNo" name="yukiNo" value="${detail.yukiNo }" />
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
					</colgroup>
				<tr>
					<th>상담자</th>
					<td colspan="2"><input type="text" class="wd200" name="userId" value="${map.userId}" readonly /></td>
					<th>상담자명</th>
					<td colspan="3"><input type="text" class="wd200" name="userNm" value="${map.userNm}" readonly /></td>
				</tr>
				<tr>
					<th>날짜</th>
					<td colspan="6">
						<span class="form"><input type="text" class="wd100" id="datepicker1" name="ysmDt" value="${detail.ysmDt }" readOnly/></span>
						<input type="text" class="wd50 mg-l25" maxlength="2" id="ysmSttHour" name="ysmSttHour" value="${detail.ysmSttHour }" onlyNumber/>시
						<input type="text" class="wd50" maxlength="2" id="ysmSttMin" name="ysmSttMin" value="${detail.ysmSttMin }" onlyNumber/>분 ~
						<input type="text" class="wd50" maxlength="2" id="ysmEndHour" name="ysmEndHour" value="${detail.ysmEndHour }" onlyNumber/>시
						<input type="text" class="wd50" maxlength="2" id="ysmEndMin" name="ysmEndMin" value="${detail.ysmEndMin }" onlyNumber/>분
					</td>
				</tr>
				<tr>
					<th rowspan="2">select</th>
					<th>validation</th>
					<td colspan="2">
						<select id="g1Gb" name="g1Gb">
							<option value="">선택하세요</option>
							<c:forEach items="${g1List }" var="list">
								<option value="${list.odr }" <c:if test="${list.odr == detail.g1Gb }">selected</c:if>>${list.ysmMclassNm}</option>										
							</c:forEach>
						</select> 
					</td>
					<th>instruction</th>
					<td colspan="2">
						<select id="g2Gb" name="g2Gb" >
							<option value="">선택하세요</option>
							<c:forEach items="${g2List }" var="list">
								<option value="${list.odr }" <c:if test="${list.odr == detail.g2Gb }">selected</c:if>>${list.ysmMclassNm}</option>										
							</c:forEach>
						</select> 
					</td>
				</tr>
				<tr>
					<th>scaling</th>
					<td colspan="2">
						<select id="g3Gb" name="g3Gb">
							<option value=''>선택하세요</option>
							<c:forEach items="${g3List }" var="list">
								<option value="${list.odr }" <c:if test="${list.odr == detail.g3Gb }">selected</c:if>>${list.ysmMclassNm}</option>		
							</c:forEach>
						</select> 
					</td>
					<th>demand</th>
					<td colspan="2">
						<select id="g4Gb" name="g4Gb">
							<option value="1" <c:if test="${ 1 == detail.g4Gb }">selected</c:if>>인위1</option>
							<option value="2" <c:if test="${ 2 == detail.g4Gb }">selected</c:if>>인위2</option>
							<option value="3" <c:if test="${ 3 == detail.g4Gb }">selected</c:if>>인위3</option>
							<option value="4" <c:if test="${ 4 == detail.g4Gb }">selected</c:if>>인위4</option>
						</select>
					</td>
				</tr>
				<tr>
					<th rowspan="2">checkbox</th>
					<th>pros and cons</th>
					<td colspan="2">
						<c:forEach items="${g5List}" var="list">
							<input type="checkbox" id="g5Gb${list.odr}" name="g5Gb" value="${list.odr}" <c:if test="${fn:contains(detail.g5Gb, list.odr)}">checked</c:if> /><label for="g5Gb${list.odr}">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
					<th>module</th>
					<td colspan="2">
						<c:forEach items="${g6List}" var="list">
							<input type="checkbox" id="g6Gb${list.odr}" name="g6Gb" value="${list.odr}" <c:if test="${fn:contains(detail.g6Gb, list.odr)}">checked</c:if> /><label for="g6Gb${list.odr}">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>authorship</th>
					<td>
						<c:forEach items="${g7List}" var="list">
							<input type="checkbox" id="g7Gb${list.odr}" name="g7Gb" value="${list.odr}" <c:if test="${fn:contains(detail.g7Gb, list.odr)}">checked</c:if> /><label for="g7Gb${list.odr}">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
					
					<th>enterprise</th>
					<td>
						<c:forEach items="${g8List}" var="list">
							<input type="checkbox" id="g8Gb${list.odr}" name="g8Gb" value="${list.odr}" <c:if test="${fn:contains(detail.g8Gb, list.odr)}">checked</c:if> /><label for="g8Gb${list.odr}">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
					
					<th>vary</th>
					<td>
						<input type ="checkbox" id="g9Gb1" name="g9Gb" value="1" <c:if test="${fn:contains(detail.g9Gb, list.odr)}">checked</c:if> /><label for="g9Gb1">인위적1</label>
						<input type ="checkbox" id="g9Gb2" name="g9Gb" value="2" <c:if test="${fn:contains(detail.g9Gb, list.odr)}">checked</c:if> /><label for="g9Gb2">인위적2</label>
						<input type ="checkbox" id="g9Gb3" name="g9Gb" value="3" <c:if test="${fn:contains(detail.g9Gb, list.odr)}">checked</c:if> /><label for="g9Gb3">인위적3</label>
						<input type ="checkbox" id="g9Gb4" name="g9Gb" value="4" <c:if test="${fn:contains(detail.g9Gb, list.odr)}">checked</c:if> /><label for="g9Gb4">인위적4</label>
					</td>
				</tr>
				<tr>
					<th rowspan="2">radio</th>
					<th>browse</th>
					<td colspan="2">
						<c:forEach items="${g11List}" var="list">
							<input type="radio" id="g11Gb${list.odr}" name="g11Gb" value="${list.odr}" <c:if test="${list.odr == detail.g11Gb}">checked="checked"</c:if> /><label for="g11Gb${list.odr}">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
					<th>tied</th>
					<td colspan="2">
						<c:forEach items="${g12List}" var="list">
							<input type="radio" id="g12Gb${list.odr}" name="g12Gb" value="${list.odr}" <c:if test="${list.odr == detail.g12Gb}">checked="checked"</c:if> /><label for="g12Gb${list.odr}">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>ensure</th>
					<td colspan="2">
						<c:forEach items="${g13List}" var="list">
							<input type="radio" id="g13Gb${list.odr}" name="g13Gb" value="${list.odr}" <c:if test="${list.odr == detail.g13Gb}">checked="checked"</c:if> /><label for="g13Gb${list.odr}">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
					<th>accommodate</th>
					<td colspan="2">
						<input type="radio" id="g14Gb1" name="g14Gb" value="1" <c:if test="${detail.g14Gb == '1' }">checked="checked"</c:if> /><label for="g14Gb1">인위적인1</label>
						<input type="radio" id="g14Gb2" name="g14Gb" value="2" <c:if test="${detail.g14Gb == '2' }">checked="checked"</c:if> /><label for="g14Gb2">인위적인213</label>
						<input type="radio" id="g14Gb3" name="g14Gb" value="3" <c:if test="${detail.g14Gb == '3' }">checked="checked"</c:if> /><label for="g14Gb3">인위적인423</label>
						<input type="radio" id="g14Gb4" name="g14Gb" value="4" <c:if test="${detail.g14Gb == '4' }">checked="checked"</c:if> /><label for="g14Gb4">인위적인213</label>
					</td>
				</tr>
				<tr>
					<th>적고싶은것</th>
					<td colspan="6"><textarea name="content">${detail.content}</textarea></td>
				</tr>
				<tr>
					<th>쓰고싶은것</th>
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

