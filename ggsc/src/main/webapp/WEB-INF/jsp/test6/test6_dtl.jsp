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
		if(g2Gb != ""){
			$("#g1Gb").val(g1Gb).prop("selected",true);
		}
		
		var g2Gb = "${detail.g2Gb}";
		if(g2Gb != ""){
			$("#g2Gb").val(g2Gb).prop("selected",true);
		}
		
		var str;
		var name;
		
		str = "${detail.g3Gb}";
		name = "g3Gb"
		fn_checked(str,name);
		
		str = "${detail.g4Gb}";
		name = "g4Gb"
		fn_checked(str,name);
		
		str = "${detail.g5Gb}";
		name = "g5Gb"
		fn_checked(str,name);
		
		str = "${detail.g6Gb}";
		name = "g6Gb"
		fn_checked(str,name);
		
	});
	
	
	function fn_checked(str, name){
		if(str != ""){
			var arr = str.split(",");
			for(var i in arr) {
				$("input[name=" + name + "][value =" + arr[i] + "]").prop("checked",true);
			}
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
		
	
	function fn_reg(param){
		
		$("#g1Gb").val($("#g1Gb").val().replace(/[^A-Za-z\d_-]+/,'')); 
		
		
		if(param == "S") {
			if(confirm("등록 하시겠습니까?")){
				$("#num").val(0);
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test6Reg.do?save=" +param;
		       	document.frm.submit();
			}
		} else if(param == "U") {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test6Reg.do?save=" +param;
		       	document.frm.submit();
			}
		} else if(param == "D") {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test6Reg.do?save=" +param;
		       	document.frm.submit();
			}
		}
		
	}  	
	
	function fn_list(mnuCd){
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/test6List.do?mnuCd=" + mnuCd;
	}
	
	
</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>
		<c:if test="${empty detail.num}">신드라 등록</c:if>
		<c:if test="${!empty detail.num}">신드라 상세 및 수정</c:if>
	</h2>
		<div class="box-style1 x-scroll-auto" >
			<form id="frm" name="frm" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
				<input type="hidden" id="num" name="num" value="${detail.num }" />
				<input type="hidden" id="save" name="save" />
				<table class="table-write">
					<colgroup>
						<col width="10%"></col>
						<col width="15%"></col> 
						<col width="25%"></col>
						<col width="10%"></col>
						<col width="25%"></col>
					</colgroup>
				<tr>
					<th>내 이름</th>
					<td colspan="2"><input type="text" class="wd200" name="userNm" value="${map.userNm }" readonly />
					<th>내 아이디</th>
					<td><input type="text" class="wd200" name="userId" value="${map.userId }" readonly />
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
					<td>
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
						<select id="g1Gb" name="g1Gb">
							<option value=''>선택하세요</option>
							<c:forEach items="${g1List }" var="list">
								<option value="${list.odr }" /><label for="g1Gb${list.odr}">${list.ysmMclassNm }</label>
							</c:forEach>
						</select>
					</td>
					<th>enormous</th>
					<td>
						<select id="g2Gb" name="g2Gb">
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
						<c:forEach items="${g3List}" var="list">
							<input type="radio" id="g3Gb${list.odr}" name="g3Gb" value="${list.odr }"  /> <label for="g3Gb${list.odr}">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
					<th>arise</th>
					<td>
						<input type="radio" id="g4Gb1" name="g4Gb" value="1" /> <label for="g4Gb1">인위적인라디오1</label>
						<input type="radio" id="g4Gb2" name="g4Gb" value="2" /> <label for="g4Gb2">인위적인라디오2</label>
						<input type="radio" id="g4Gb3" name="g4Gb" value="3" /> <label for="g4Gb3">인위적인라디오3</label>
						<input type="radio" id="g4Gb4" name="g4Gb" value="4" /> <label for="g4Gb4">인위적인라디오4</label>
					</td>
				</tr>
				<tr>
					<th>checkbox</th>
					<th>interval</th>
					<td>
						<c:forEach items="${g5List }" var="list">
							<input type="checkbox" id="g5Gb${list.odr}" name="g5Gb" value="${list.odr }" /><label for="g5Gb${list.odr }">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
					<th>patent</th>
					<td>
						<input type="checkbox" id="g6Gb1" name="g6Gb" value="1" /><label for="g6Gb1">인위적인체크박스1</label>
						<input type="checkbox" id="g6Gb2" name="g6Gb" value="2" /><label for="g6Gb2">인위적인체크박스2</label>
						<input type="checkbox" id="g6Gb4" name="g6Gb" value="3" /><label for="g6Gb3">인위적인체크박스3</label>
						<input type="checkbox" id="g6Gb5" name="g6Gb" value="4" /><label for="g6Gb4">인위적인체크박스4</label>
					</td>
				</tr>
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

