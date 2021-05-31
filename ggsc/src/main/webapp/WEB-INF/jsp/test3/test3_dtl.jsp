<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}" />/css/style.css">
<script src="<c:out value="${pageContext.request.contextPath}" />/js/jquery-1.11.2.min.js" ></script>
<script type="text/javascript">

	$(document).ready(function() {
		
		var ysmId = "${ysmId}";
		list(ysmId);
		
		$("#sBtn").css("display", "none");
		$("#test3Dtl_table").css("display", "none");
		
		
	});
		
	

	function fn_reg(param){
		
		
		if(param == "S") {
			
			
			var ysmNm = $("#ysmNm").val();
			
			if(ysmNm.length == 0) {
				alert("이름을 입력하세요");
				$("#ysmNm").focus();
				return;
			}
			
			if($("input:radio[name='gender']").is(":checked") == false) {
				alert("성별을 체크해 주세요.");
				$("#gender").focus();
				return;
			}
			
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test3Dtl.do?save=" +param;
		       	document.frm.submit();
			}
		} else if(param == "U") {
			$("#tby1").html("");
			$("#test3View_table").css("display", "none");
			$("#test3Dtl_table").css("display", "inline-block");
			$("#sBtn").css("display", "inline-block");
			$("#uBtn").css("display", "none");
		} 
		
	}  	
	
	function list(ysmId){
		var param = {ysmId : ysmId};
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		$.ajax({
			type : "POST",
			url : "<c:out value="${pageContext.request.contextPath}" />/test3Dtl_ajax.do",
			data : param,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				var pwLength = json.detail.pw.length;
				var viewPw = "";
				var word = "*";
				for(i=0; i<pwLength; i++) {
					viewPw = viewPw+word;
				}
				
				var html = '';
				
				// 전공
				var g1Gb = '';
				var g1GbResult = json.detail.g1Gb;
				var g1GbSplit = g1GbResult.split(",");
				for (var idx in g1GbSplit) {
					if(g1GbSplit[idx] == "1") {
						g1Gb += "progress,";
					}else if(g1GbSplit[idx] == "2") {
						g1Gb += "close,";
					}else if(g1GbSplit[idx] == "3") {
						g1Gb += "reoffer,";
					}else if(g1GbSplit[idx] == "4") {
						g1Gb += "accumulate,";
					}
				}
				g1Gb = g1Gb.substr(0, g1Gb.length -1);
				
				// 인정자격증
				var stfys = '';
				var stfysResult = json.detail.stfys;
				var stfysSplit = stfysResult.split(",");
				for (var idx in stfysSplit) {
					if(stfysSplit[idx] == "1") {
						stfys += "1,";
					}else if(stfysSplit[idx] == "2") {
						stfys += "2,";
					}else if(stfysSplit[idx] == "3") {
						stfys += "3,";
					}else if(stfysSplit[idx] == "4") {
						stfys += "4,";
					}else if(stfysSplit[idx] == "5") {
						stfys += "5,";
					}
				}
				stfys = stfys.substr(0, stfys.length -1);
				
				
				if(json.detail.ysmId != "") {
					html += '<tr>';
					html += '<th>운명</th>'+'<td colspan="3">' + json.detail.fate + '</td>';
					html += '</tr>';
					html += '<tr>';
					html += '<th> 다양성 </th>'+'<td>' + json.detail.diverse + '</td>';
					html += '<th> 만족도 여러개 </th>'+'<td>' + json.detail.stfys + '</td>';
					html += '</tr>';
					html += '<tr>';
					html += '<th> ID </th>'+'<td>' + json.detail.ysmId + '</td>';
					html += '<th> 이름 </th>'+'<td>' + json.detail.ysmNm + '</td>';
					html += '</tr>';
					html += '<tr>';
					html += '<th> 비밀번호 </th>'+'<td>' + viewPw + '</td>';
					if(json.detail.gender == 'M') {
						html += '<th> 성별 </th>'+'<td colspan="3">남자</td>';
					} else if(json.detail.gender == 'F') {
						html += '<th> 성별 </th>'+'<td colspan="3">여자</td>';
					}
					html += '</tr>';
					html += '<tr>';
					if(json.detail.ysmYn == 'Y') {
						html += '<th> 승인처리 </th>'+'<td colspan="3"><span id="ysmYn" value="' + json.detail.ysmYn + '">승인</span></td>';
						$("#appBtnY").css("display", "none");
					} else if(json.detail.ysmYn == 'N') {
						html += '<th> 승인처리 </th>'+'<td colspan="3"><span id="ysmYn" value="' + json.detail.ysmYn + '">미승인</span></td>';
						$("#appBtnN").css("display", "none");
					}
					html += '</tr>';
				}
				$("#tby1").html(html);
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	
	
	function fn_ysmYn(param) {
		if(param == 'Y') {
			if(confirm("유나가입을 승인하시겠습니까?")){
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test3Dtl.do?ysmYn=" + param;
		       	document.frm.submit(); 
		       	alert("승인완료 됐습니다.");
		       	opener.location.reload();
			}			
		} else if(param == 'N') {
			if(confirm("유나가입을 승인취소 하시겠습니까?")){
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test3Dtl.do?ysmYn=" + param;
		       	document.frm.submit(); 
		       	alert("승인취소 처리 됐습니다.");
		       	opener.location.reload();
			}	
		}
	}
	
</script>

<style>
	td:nth-child(odd){text-align:center;} 
</style>

</head>

<body style="background:white;">
	<div class="h3-title" style="background: #1266FF;height:30px;color:white;line-height:32px;">
		&nbsp;&nbsp;&nbsp;유나 상세정보 및 승인처리 팝업
	</div>
	<h2 class="h2-title mg-t20 mg-l25">
		<i class="fa fa-circle"></i>유나 상세정보 및 승인처리
	</h2>
	<div style="width:200px;height:20px;float:right;text-align:right;padding-bottom:10px;"><img src="<c:out value="${pageContext.request.contextPath}" />/images/logo.png" style="width:200px; height:35px; margin-top: 10px;"></div>
	<div style="border-top:1px solid black;width:500px;margin-left:10px;margin-top:10px;"></div>
	<div id="test3View_table" >
		<table class="table-write wd500 h500 mg-all10">
			<colgroup> 
				<col width="15%"></col>
				<col width="35%"></col> 
				<col width="15%"></col>
				<col width="35%"></col>
			</colgroup>
			<tbody id="tby1">
			
			</tbody>
		</table>
	</div>
		<div id="test3Dtl_table" >
			<form id="frm" name="frm" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="ysmId" name="ysmId" value="${detail.ysmId }" />
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
						<th>아이디</th>
						<td><input type="text" value="${detail.ysmId}" readonly></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" value="${detail.pw}" readonly></td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
							<input type="radio" id="gender1" name="gender" value="M" <c:if test="${detail.gender == 'M' }">checked="checked"</c:if> /><label for="gender1">남</label>
							<input type="radio" id="gender2" name="gender" value="F" <c:if test="${detail.gender == 'F' }">checked="checked"</c:if> /><label for="gender2">여</label>
						</td>
					</tr>
					<tr>
						<th>생일</th>
						<td><input type="text" value="${detail.birthDt}" ></td>
					</tr>
					<tr>
						<th>narcissus</th>
						<td>
							<c:forEach items="${test2List }" var="list">
								<input type="radio" id="narcissus${list.num}" name="narcissus" value="${list.num}" <c:if test="${list.num == detail.narcissus}">checked</c:if> /><label for="narcissus${list.num}">${list.title}</label>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<th>설명</th>
						<td style="text-align: left;"><textarea id="rcontent" name="content" cols="100" rows="20"><c:out value="${detail.content }" escapeXml="false"/></textarea></td>
					</tr>
				</table>
				<div class="btn" style="float: right; margin: 0;">
					<button type="button" class="btn-basic" onClick="window.close();">닫기</button>
					<button type="button" class="btn-basic" id="uBtn" onClick="javascript:fn_reg('U');" style="background-color: green;color:white;">수정</button>	
					<button type="button" class="btn-basic" id="sBtn" onClick="javascript:fn_reg('S');" style="background-color: green;color:white;">저장</button>
					<button type="button" class="btn-basic" id="appBtnY" onclick="javascript:fn_ysmYn('Y');">승인</button>
					<button type="button" class="btn-basic" id="appBtnN" onclick="javascript:fn_ysmYn('N');">승인취소</button>
				</div>	
			</form>
		</div>
		<!-- end -->
	</body>
</html>

