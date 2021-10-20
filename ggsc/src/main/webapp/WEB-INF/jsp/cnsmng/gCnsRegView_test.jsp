<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script src="/gnoincoundb/js/html2canvas.min.js" ></script>
<!-- <script src="/gnoincoundb/js/jquery-1.11.2.min.js" ></script> -->
<script src="/gnoincoundb/js/jspdf.min.js" ></script>
<script type="text/javascript">
	$(document).ready(function() {
		var loginVo = "${loginVo}";
		console.log(loginVo);
		$("#centerGb").val("${loginVo.centerGb}").attr("selected","selected");
	});
	
	function fn_reg(){

		var cnsleId = $("#cnsleId").val();
		var cnsleNm = $("#cnsleNm").val();
		var centerGb = $("#centerGb").val();
		var atvyStrtHour = $("#atvyStrtHour").val();
		var atvyStrtMin = $("#atvyStrtMin").val();
		var atvyEndHour = $("#atvyEndHour").val();
		var atvyEndMin = $("#atvyEndMin").val();
		var atvyTotMin = $("#atvyTotMin").val();
		var atdeCnt = $("#atdeCnt").val();
		var cnsCnt = $("#cnsCnt").val();
	
		if(centerGb.length == 0) {
			alert("센터구분을 입력해 주세요");
			$("#centerGb").focus();
			return;
		}
		
		
		if($("input:radio[name='olderRel']").is(":checked") == false) {
			alert("내담자와의관계를 체크해 주세요.");
			return;
		}
		
		if(atvyStrtHour.length == 0) {
			$("#atvyStrtHour").val(0);
		}
		if(atvyStrtMin.length == 0) {
			$("#atvyStrtMin").val(0);
		}
		if(atvyEndHour.length == 0) {
			$("#atvyEndHour").val(0);
		}
		if(atvyEndMin.length == 0) {
			$("#atvyEndMin").val(0);
		}
		if(atvyTotMin.length == 0) {
			$("#atvyTotMin").val(0);
		}
		if(atdeCnt.length == 0) {
			$("#atdeCnt").val(0);
		}
		if(cnsCnt.length == 0) {
			$("#cnsCnt").val(0);
		}
		
		if($("input:radio[name='cnsType']").is(":checked") == false) {
			alert("상담종류를 체크해 주세요.");
			return;
		}
		
		if(confirm("등록 하시겠습니까?")){
			document.frm.action = "/gnoincoundb/gCnsReg_test.do?mnuCd=${mnuCd}";
	       	document.frm.submit();
		}
	}
	
	function fn_list(mnuCd){
		document.location.href = "/gnoincoundb/gCnsList_test.do?mnuCd=" + mnuCd;
	}
	
	function findUserPopup(){
		var userNm = $("#cnsleNm").val();
		userNm = encodeURI(encodeURIComponent(userNm));		
		var url = "/gnoincoundb/userSelPopup_test.do?userNm=" + userNm+"&cnsTargetGb=Y&cnsPerTargetGb=Y";
		var name = "회원 찾기";
		var option = "width = 620, height = 750, top = 50, left = 100, location = yes";
		window.open(url, name, option);
		encodeURI(encodeURIComponent(jindan_name));
	}
	
</script>

<section id="content">

	<h2 class="h2-title"><i class="fa fa-check-square"></i>집단상담일지 등록</h2>
		<div class="box-style1 x-scroll-auto" >
			<div class="btn" style="float: right; margin: 0;">
				<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd }');" style="background-color: green;color:white;">목록</button>
				<button type="button" class="btn-basic" onClick="javascript:fn_reg('${mnuCd }');" style="background-color: green;color:white;">저장</button>
			</div>	
			<form id="frm" name="frm" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="caseNo" name="caseNo" value="0" />
				<input type="hidden" id="birthDt" name="birthDt" />
				<input type="hidden" id="atdeId" name="atdeId" />
				<table class="table-write">
					<colgroup>
						<col width="15%"></col>
						<col width="10%"></col> 
						<col width="25%"></col>
						<col width="15%"></col>
						<col width="35%"></col>
					</colgroup>
					
					<tr>
						<th>상담구분 <span style="color: red;">*</span></th>
						<td colspan="2">
							<select class="wd300" name="cnsGb">
								<c:forEach items="${cnsGbList }" var="result">
									<option value="${result.odr }">${result.mclassNm }</option>
								</c:forEach>
							</select>
						</td>
					
						
						<th>센터구분 <span style="color: red;">*</span></th>
						<td>
							<select class="wd300" id="centerGb" name="centerGb">
								<option value="" selected>전체</option>
								<c:forEach items="${cnsCenterList }" var="result">
									<c:choose>
									<c:when test="${authCd > 1 }">
										<c:if test="${ result.num eq vo.schCenterGb }" >
											<option value="${result.num }" >${result.centerGb }</option>
										</c:if>
									</c:when>
									<c:when test="${authCd <= 1 }">								
										<option value="${result.num }" >${result.centerGb }</option>
									</c:when>
									</c:choose>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>프로그램명</th>
						<td colspan="2">
							<input type="text" class="wd300" id="pgrmNm" name="pgrmNm" />&nbsp;&nbsp;/&nbsp;&nbsp;<input type="text" class="wd50" id="cnsCnt" name="cnsCnt" oninput="this.value = this.value.replace(/[0-9/, '');" maxlength="2" />회기 
						</td>
						<th>활동일시</th>
						<td>
							<span class="form"><input type="text" class="wd200" id="datepicker1" name="atvyDt" value="" readonly/></span><br>
							(<input type="text" class="wd50" id="atvyStrtHour" name="atvyStrtHour" maxlength="2" onlyNumber />시<input type="text" class="wd50" id="atvyStrtMin" name="atvyStrtMin" onlyNumber maxlength="2" />분 ~
							<input type="text" class="wd50" id="atvyEndHour" name="atvyEndHour" maxlength="2" onlyNumber />시<input type="text" class="wd50" id="atvyEndMin" name="atvyEndMin" onlyNumber maxlength="2" />분)
							(총 <input type="text" class="wd50" id="atvyTotMin" name="atvyTotMin" maxlength="3" onlyNumber />분) 
						</td>
					</tr>
					<tr>
						<th>활동장소</th>
						<td colspan="2">
							 <input type="text" id="atvyPlace" name="atvyPlace" style="width: 400px;"/>
						</td>
						<th>내담자와의관계 <span style="color: red;">*</span></th>
						<td>
							<input type="radio" id="olderRel1" name="olderRel" value="1" /><label for="olderRel1">노인본인</label><input type="radio" id="olderRel2" name="olderRel" value="2" /><label for="olderRel2">배우자</label>
							<input type="radio" id="olderRel3" name="olderRel" value="3" /><label for="olderRel3">자녀</label><input type="radio" id="olderRel4" name="olderRel" value="4" /><label for="olderRel4">친인척</label>
							<input type="radio" id="olderRel5" name="olderRel" value="5" /><label for="olderRel5">이웃</label><input type="radio" id="olderRel6" name="olderRel" value="6" /><label for="olderRel6">유관기관</label>
						</td>
					</tr>
					<tr>
						<th>리더구분</th>
						<td colspan="4">
							<select class="wd200" id="leaderGb" name="leaderGb">
								<c:forEach items="${leaderGbList }" var="rs">
									<option value="${rs.odr }">${rs.mclassNm }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>진행자</th>
						<td colspan="2">
							 <input type="text" class="wd200" id="anchor" name="anchor" />
						</td>
						<th>작성자</th>
						<td>
							<input type="text" class="wd200" id="inputNm" name="inputNm" value="${loginVo.userNm }" readonly /> 
						</td>
					</tr>
					<tr>
						<th>참석자</th>
						<td colspan="2">
							<input type="text" class="wd200" id="atdeCnt" name="atdeCnt" onlyNumber maxlength="3"/>명 
						</td>
						<th>참석자명</th>
						<td>
							<!-- <input type="text" id="atdeNm" name="atdeNm" style="width: 89%;" readonly/><button type="button" class="btn-basic" style="padding: 2px 6px;" onclick="javascript:findUserPopup();">찾기</button> -->
							<textarea id="atdeNm" name="atdeNm" style="width: 89%;" readonly></textarea><button type="button" class="btn-basic" style="padding: 2px 6px;" onclick="javascript:findUserPopup();">찾기</button>
						</td>
					</tr>
					<tr>
						<th>활동주제</th>
						<td colspan="2">
							<input type="text" id="atvyTitle" name="atvyTitle" />
						</td>
						<th>상담종류<span style="color: red;">*</span></th>
						<td>
							<input type="radio" id="cnsType1" name="cnsType" value="1" /><label for="cnsType1">사별애도</label>
							<input type="radio" id="cnsType2" name="cnsType" value="2" /><label for="cnsType2">죽음준비</label>
							<input type="radio" id="cnsType3" name="cnsType" value="3" /><label for="cnsType3">관계개선·의사소통</label>
							<input type="radio" id="cnsType4" name="cnsType" value="4" /><label for="cnsType4">심리·정서</label>
							<input type="radio" id="cnsType5" name="cnsType" value="5" /><label for="cnsType5">자아통합</label><br>
							<input type="radio" id="cnsType6" name="cnsType" value="6" /><label for="cnsType6">치매예방</label>
							<input type="radio" id="cnsType7" name="cnsType" value="7" /><label for="cnsType7">기타</label>
						</td>
					</tr>
					<tr>
						<th>활동목표</th>
						<td colspan="4">
							<textarea id="atvyGoal" name="atvyGoal"></textarea>
						</td>
					</tr>
					<tr>
						<th>프로그램내용</th>
						<td colspan="4">
							<textarea id="pgrmCntn" name="pgrmCntn"></textarea>
						</td>
					</tr>
					<tr>
						<th>평가</th>
						<td colspan="4">
							<textarea id="evat" name="evat"></textarea>
						</td>
					</tr>
					<tr>
						<th>향후계획</th>
						<td colspan="4">
							<textarea id="afterPlan" name="afterPlan"></textarea>
						</td>
					</tr>
					<tr>
						<th>비고</th>
						<td colspan="4">
							<textarea id="etc" name="etc"></textarea> 
						</td>
					</tr>
				</table>
				
			</form>
		</div>
		<!-- end -->
	</section>

</html>

