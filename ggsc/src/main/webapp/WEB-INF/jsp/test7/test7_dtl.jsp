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
		
		var g1Gb = "${detail.g1Gb}";
		if(g1Gb != ""){
			$("#g1Gb").val(g1Gb).prop("selected",true);
		}
			
		var g2Gb = "${detail.g2Gb}";
		if(g2Gb != ""){
			$("#g2Gb").val(g2Gb).prop("selected",true);
		}
		
		var g3Gb = "${detail.g3Gb}";
		if(g3Gb != ""){
			$("#g3Gb").val(g3Gb).prop("selected",true);
		}
		
		var str;
		var name;
		
		str = "${detail.g4Gb}";
		name = "g4Gb";
		fn_checked(str, name);
		
		str = "${detail.g5Gb}";
		name = "g5Gb";
		fn_checked(str,name);
		
		str = "${detail.g6Gb}";
		name = "g6Gb";
		fn_checked(str,name);
		
		str = "${detail.g7Gb}"
		name = "g7Gb";
		fn_checked(str,name);
		
		str = "${detail.advantage}"
		name = "advantage";
		fn_checked(str,name);
		
		str = "${detail.weakness}"
		name = "weakness";
		fn_checked(str,name);
		
	});
	
	
	function fn_checked(str, name){
		var arr = str.split(",");
		for(var i in arr){
			$("input[name=" + name + "][value = " + arr[i] + "]").prop("checked",true);
		}
		
	}
	
	
	function findYsmUser() {
		var ysmNm = $("#ysmNm").val();
		ysmNm = encodeURI(encodeURIComponent(ysmNm));	
		var url ="<c:out value= "${pageContext.request.contextPath}" />/findYsmUser.do?ysmNm=" + ysmNm+"&ysmGb=Y";
		var name ="ysm찾기"
		var option ="width=530 , height = 750 , top = 50, left = 100, location = yes";
		window.open(url,name,option);
		encodeURI(encodeURIComponent(jindan_name));
	}
		
	
	function noinClosePopup(){
		var url = "<c:out value="${pageContext.request.contextPath}" />/noinClosePopup.do";
		var name = "상담 종결";
		var option = "width = 1530, height = 950, top = 0, left = 500, location = yes";
		window.open(url, name, option);
	}
	
	

	function fn_reg(param){
		
		$("#g1Gb").val($("#g1Gb").val().replace(/[^A-Za-z\d_-]+/,'')); 
		
		
		if(param == "U") {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test7Reg.do?save=" +param;
		       	document.frm.submit();
			}
		} else if(param == "D") {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test7Reg.do?save=" +param;
		       	document.frm.submit();
			}
		}
		
	}  	
	
	function fn_list(mnuCd){
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/test7List.do?mnuCd=" + mnuCd;
	}
	
	
	
</script>
<style>
.hide { display:none; }
</style>

<script>
$(document).on('change','#g1Gb',function(){
	$("[data-type='hideClass1']").addClass('hide');
	$("[data-type='hideClass1'][data-class='" + $(this).val() + "']").removeClass('hide');
});
</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>
		<c:if test="${empty detail.num}">노인상담 등록</c:if>
		<c:if test="${!empty detail.num}">노인상담 상세 및 수정</c:if>
	</h2>
		<div class="box-style1 x-scroll-auto" >
			<form id="frm" name="frm" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
				<input type="hidden" id="num" name="num" value="${detail.num }" />
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
					<th><label>state</label></th>
					<td colspan="2">
						<select class="wd200" id="g1Gb" name="g1Gb">
							<c:forEach items="${g1List}" var="list">
								<option value="${list.odr}">${list.ysmMclassNm }</option>
							</c:forEach>	
						</select>
					</td>
					<th class="hide" data-type="hideClass1" data-class='2'><label>close</label></th>
					<td class="hide" data-type="hideClass1" data-class='2' colspan="2">
						<span class="form"><input type="text" class="wd100" id="datepicker2" name="ysm2Dt" value="" /></span>
						<a href="javascript:noinClosePopup();" style='color:red'>&nbsp;&nbsp;▶ 상담종결 작성</a>
					</td>
					
					<th class="hide" data-type="hideClass1" data-class='3'><label>reoffer</label></th>
					<td class="hide" data-type="hideClass1" data-class='3' colspan="2">
						<select class="wd200 mg-125" id="rfGb" name="rfGb">
							<option value="1" selected="selected">선택</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select>
					</td>
					<th class="hide" data-type="hideClass1" data-class="4"><label>accumulate</label>
					<td class="hide" data-type="hideClass1" data-class="4" colspan="2">
						<span class="form"><input type="text" class="wd200" id="datepicker3" name="ysm3Dt" value="" /> </span>
					</td>
				</tr>
				<tr>
					<th rowspan="3">YSM</th>
					<th>이름</th>
					<td><input type="text" class="wd200" id="ysmNm" name="ysmNm" value="${detail.ysmNm}" readonly /><button type="button" class="btn-basic" style="padding: 2px 6px;" onclick="javascript:findYsmUser();">찾기</button></td>
					<th>ID</th>
					<td><input type="text" id="ysmId" name="ysmId" style="width:200px;" value="${detail.ysmId}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>narcissus</th>
					<td><input type="text" id="narcissus" name="narcissus" value="${detail.narcissus}" style="width: 200px;" readonly="readonly" /></td>
					<th>ysmNo</th>
					<td><input type="text" id="ysmNo" name="ysmNo" style="width: 200px;"  value="${detail.ysmNo}" readonly="readonly" /></td>
				</tr>
				<tr>
					<th>날짜</th>
					<td>
						<input type="text" id="datepicker1" class="wd100" name="ysmDt" value="${detail.ysmDt}" readOnly/>
						<select class="wd50 mg-125" id="weekCd" name="weekCd">
							<option value="1" selected="selected">월</option>
							<option value="2">화</option>
							<option value="3">수</option>
							<option value="4">목</option>
							<option value="5">금</option>
							<option value="6">토</option>
							<option value="7">일</option>
						</select>
					</td>
					<th>시간</th>
					<td>
						<input type="text" id="sttHour" name="sttHour" class="wd30" onlyNumber maxlength=2 value="${detail.sttHour }">시
						<input type="text" id="sttMin" name="sttMin" class="wd30" onlyNumber maxLength=2 value="${detail.sttMin }">분 ~
						<input type="text" id="endHour" name="endHour" class="wd30" onlyNumber maxLength=2 value="${detail.endHour }">분 
						<input type="text" id="endMin" name="endMin" class="wd30" onlyNumber maxLength=2 value="${detail.endMin }">분 
					</td>
				</tr>
				<tr>
					<th style="text-align:center">성별</th>
					<td colspan="2">
						<input type="radio" id="male" name="gender" value="M" <c:if test="${detail.gender == 'M' }">checked="checked"</c:if> /> <label for="male">남</label>
						<input type="radio" id="female" name="gender" value="W" <c:if test="${detail.gender == 'W' }">checked="checked"</c:if> /> <label for="female">여</label>
					</td>
					<th>주소</th>
					<td colspan="2">
						<input type="text" id="addr" name="addr" value="${detail.addr}" />
					</td>
				</tr>
				<tr>
					<th>select</th>
					<th>diverse</th>
					<td>
						<select id="g2Gb" name="g2Gb">
							<option value=''>선택하세요</option>
							<c:forEach items="${g2List }" var="list">
								<option value="${list.odr }" /><label for="g2Gb${list.odr}">${list.ysmMclassNm }</label>
							</c:forEach>
						</select>
					</td>
					<th>enormous</th>
					<td>
						<select id="g3Gb" name="g3Gb">
							<option value=''>선택하세요</option>
							<option value='1'>인위적인1</option>
							<option value='2'>인위적인2</option>
							<option value='3'>인위적인3</option>
							<option value='4'>인위적인4</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>radio</th>
					<th>match</th>
					<td>
						<c:forEach items="${g4List}" var="list">
							<input type="radio" id="g4Gb${list.odr}" name="g4Gb" value="${list.odr }" /> <label for="g4Gb${list.odr}">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
					<th>arise</th>
					<td>
						<input type="radio" id="g5Gb1" name="g5Gb" value="1" /> <label for="g5Gb1">인위적인라디오1</label>
						<input type="radio" id="g5Gb2" name="g5Gb" value="2" /> <label for="g5Gb2">인위적인라디오2</label>
						<input type="radio" id="g5Gb3" name="g5Gb" value="3" /> <label for="g5Gb3">인위적인라디오3</label>
						<input type="radio" id="g5Gb4" name="g5Gb" value="4" /> <label for="g5Gb4">인위적인라디오4</label>
					</td>
				</tr>
				<tr>
					<th>checkbox</th>
					<th>interval</th>
					<td>
						<c:forEach items="${g6List }" var="list">
							<input type="checkbox" id="g6Gb${list.odr}" name="g6Gb" value="${list.odr }" /><label for="g6Gb${list.odr }">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
					<th>patent</th>
					<td>
						<input type="checkbox" id="g7Gb1" name="g7Gb" value="1" /><label for="g7Gb1">인위적인체크박스1</label>
						<input type="checkbox" id="g7Gb2" name="g7Gb" value="2" /><label for="g7Gb2">인위적인체크박스2</label>
						<input type="checkbox" id="g7Gb4" name="g7Gb" value="3" /><label for="g7Gb3">인위적인체크박스3</label>
						<input type="checkbox" id="g7Gb5" name="g7Gb" value="4" /><label for="g7Gb4">인위적인체크박스4</label>
					</td>
				</tr>
				<tr>
					<th>radio number</th>
					<th>advantage</th>
					<td>
						<input type="radio" id="advantage1" name="advantage" value="1" <c:if test="${detail.advantage == '1' }">checked="checked"</c:if> /><label for="advantage1">1</label>
						<input type="radio" id="advantage2" name="advantage" value="2" <c:if test="${detail.advantage == '2' }">checked="checked"</c:if> /><label for="advantage2">2</label> 
						<input type="radio" id="advantage3" name="advantage" value="3" <c:if test="${detail.advantage == '3' }">checked="checked"</c:if> /><label for="advantage3">3</label>
						<input type="radio" id="advantage4" name="advantage" value="4" <c:if test="${detail.advantage == '4' }">checked="checked"</c:if> /><label for="advantage4">4</label>
						<input type="radio" id="advantage5" name="advantage" value="5" <c:if test="${detail.advantage == '5' }">checked="checked"</c:if> /><label for="advantage5">5</label>
					</td>
					<th>weakness</th>
					<td>
						<input type="radio" id="weakness1" name="weakness" value="1" <c:if test="${detail.weakness == '1' }">checked="checked"</c:if> /><label for="weakness1">1</label>
						<input type="radio" id="weakness2" name="weakness" value="2" <c:if test="${detail.weakness == '2' }">checked="checked"</c:if> /><label for="weakness2">2</label> 
						<input type="radio" id="weakness3" name="weakness" value="3" <c:if test="${detail.weakness == '3' }">checked="checked"</c:if> /><label for="weakness3">3</label>
						<input type="radio" id="weakness4" name="weakness" value="4" <c:if test="${detail.weakness == '4' }">checked="checked"</c:if> /><label for="weakness4">4</label>
						<input type="radio" id="weakness5" name="weakness" value="5" <c:if test="${detail.weakness == '5' }">checked="checked"</c:if> /><label for="weakness5">5</label>
					</td>
				<tr>
					<th>텍스트</th>
					<td colspan="4"><textarea name="content">${detail.content}</textarea></td>
				</tr>
				<tr>
					<th>텍스트2</th>
					<td colspan="4">
						<input type="text" id="title" name="title" value="${detail.title}" />
					</td>
				</tr>
				</table>
				<div class="btn" style="float: right; margin: 0;">
					<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd}');" style="background-color: green;color:white;">목록</button>
						<button type="button" class="btn-basic" onClick="javascript:fn_reg('U');" style="background-color: green;color:white;">수정</button>	
						<button type="button" class="btn-basic" onClick="javascript:fn_reg('D');" style="background-color: green;color:white;">삭제</button>	
				</div>
			</form>
		</div>
		<!-- end -->
	</section>
</html>

