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
<meta name="_csrf" th:content="${_csrf.token}"/>
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
<title>신청자 정보 팝업</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}" />/css/style.css">
<script src="<c:out value="${pageContext.request.contextPath}" />/js/jquery-1.11.2.min.js" ></script>
<script src="<c:out value="${pageContext.request.contextPath}" />/js/custom.js" ></script>
<script type="text/javascript">

	$(document).ready(function() {
		
		var fate = "${detail.fate}";
		if(fate != ""){
			$("#fate").val(fate).prop("selected",true);
		}
		
	});

	function fn_save(type){
		var url = "";
		
		if($("#fate").val()==""){
			alert("fate를 선택해주세요.");
			$("#fate").focus();
			return;
		}
		
		if($("#ysmId").val()==""){
			alert("ID를 입력해주세요.");
			$("#ysmId").focus();
			return;
		}
		
		if($("#pw").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#pw").focus();
			return;
		}
		
		if($("#ysmNm").val()==""){
			alert("이름를 입력해주세요.");
			$("#ysmNm").focus();
			return;
		}
		
		if($('input:radio[name="gender"]').is(':checked')==false){
			alert("성별을 선택해주세요.");
			return;
		}
		
		if($('input:radio[name="narcissus"]').is(':checked')==false){
			alert("선택해주세요.");
			return;
		}
		
		if($("#birthDt").val()==""){
			alert("생년월일를 입력해주세요.");
			$("#birthDt").focus();
			return;
		}
		
		if($("#mobile").val()==""){
			alert("번호를 입력해주세요.");
			$("#mobile").focus();
			return;
		}
		
		if(idCheck != "Y" && type == "R"){
			alert("ID 중복확인을 해주세요.");
			return;
		}
		
		
		if(type == "R"){
			url = "<c:out value="${pageContext.request.contextPath}" />/test4Reg.do";
			//alert("1== "+ type);
		}else if(type == "D"){
			url = "<c:out value="${pageContext.request.contextPath}" />/test4Upd.do";
		}
		
		var param = $("#frm").serialize();
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		$.ajax({
			type : "POST",
			url : url,
			data : param,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				if(json.msg){
					alert(json.msg);
				}else{
					alert("상담접수가 완료 되었습니다.");
					opener.parent.location.reload();
					window.close();	
				}
				
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	
	function fn_idCheck() {
		var param = $("#ysmId").val();
		if(param.length == 0){
			alert("ID를 입력해주세요.");
			return false;
		}
		if(param.length <= 5){
			alert("ID를 6자 이상으로 입력해주세요.");
			return false;
		}
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		$.ajax({
			type : "POST",
			url : "<c:out value="${pageContext.request.contextPath}" />/ysmIdCheck_ajax.do",
			data : {ysmId:param},
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				var msg = json.msg;
				idCheck = json.idCheck;
				alert(msg);
				if(idCheck == "Y") {
					$("#ysmId").attr("readonly",true)
				}
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	
	
	
	function fn_delete(){
		var url = "";
		
		url = "<c:out value="${pageContext.request.contextPath}" />/test4Del.do";
		
		var param = $("#frm").serialize();
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		$.ajax({
			type : "POST",
			url : url,
			data : param,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				if(json.msg){
					alert(json.msg);
				}else{
					alert("삭제가 완료 되었습니다.");
					opener.parent.location.reload();
					window.close();	
				}
				
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	
	
	function fn_confirm() {
		
		var ysmNo = $('#ysmNo').val();
		var ysmId = "${detail.ysmId}"; 
		var ysmNm = "${detail.ysmNm}"; 
		
		
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		$.ajax({
			type : "POST",
			url : "<c:out value="${pageContext.request.contextPath}" />/ysmConfirm_ajax.do",
			data : {ysmYn:"Y" , ysmNo:ysmNo, ysmId:ysmId , ysmNm:ysmNm},
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				var msg = json.msg;
				alert(msg);
				opener.location.reload();
				location.reload();
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	
	
	
	
	function fn_clear(){
		$("input[type=radio]").removeAttr("checked");
		$("input[type!=radio]").val("");
	}
	
	
</script>
</head>
<body>
	<h2 class="h2-title mg-t20 mg-l25">
		<i class="fa fa-circle"></i>
		양승민
	</h2>
	<form id="frm" action="/test4Reg.do" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<c:if test="${type == 'D' }">
			<input type="hidden" id="ysmNo" name="ysmNo" value="${detail.ysmNo }">
		</c:if>
		<table class="table-write wd500 h600 mg-all10">
			<colgroup>
				<col width="20%"></col>
				<col width="80%"></col>
			</colgroup>
			<tbody>
				<tr>
					<td colspan="2" style="text-align: center;">YSM</td>
				</tr>
				<tr>
					<th>Fate</th>
					<td>
						<select class="wd200" id="fate" name="fate">
							<option value=''>선택하세요</option>
							<c:forEach items="${test1List }" var="list">
								<option value="${list.num }" >${list.title }</option>		
							</c:forEach>
						</select> 
					</td>
				</tr>
				<tr>
					<th>narcissus</th>
					<td>
						<c:forEach items="${test2List }" var="list">
							<input type="radio" id="narcissus${list.num}" name="narcissus" value="${list.num}" <c:if test="${list.num == detail.narcissus}">checked</c:if> /><label for="narcissus${list.num}">${list.title}</label>
						</c:forEach>
					</td>
				</tr>
				
				<c:if test="${type == 'R' }">	
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" id="ysmId" name="ysmId" oninput="this.value = this.value.replace(/[^a-z0-9]/, '');" maxlength=20 />
							<button type="button" class="btn-basic" onclick ="javascript:fn_idCheck();">중복확인</button>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" id="pw" name="pw" oninput="this.value = this.value.replace(/[^a-z0-9]/, '');" maxlength=20/></td>
					</tr>
				</c:if>
				<tr>
					<th>이름</th>
					<td><input type="text" id="ysmNm" name="ysmNm" value="${detail.ysmNm }" onlyKorean oninput="this.value = this.value.replace(/[^ㄱ-힣]/, '');" maxlength=8/></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" id="male" name="gender" value="M" <c:if test="${detail.gender == 'M' }">checked="checked"</c:if> /><label for="male">남 </label>
						<input type="radio" id="female" name="gender" value="F" <c:if test="${detail.gender == 'F' }">checked="checked"</c:if> /><label for="female">여</label>
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" id="birthDt" name="birthDt" value="${detail.birthDt }" onlyNumber maxlength=8/></td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td><input type="text" id="mobile" name="mobile" value="${detail.mobile }" onlyNumber maxlength=11 /></td>
				</tr>
				 <c:if test="${type == 'D' }">
					<tr>
						<th>확인</th>
						<td>
							<c:if test="${detail.ysmYn != 'Y'}">
								<button type="button" class="btn-basic" onclick="javascript:fn_confirm()">미확인</button>
							</c:if>
							<c:if test="${detail.ysmYn == 'Y'}">
								확인
							</c:if>
						</td>
					</tr>
				</c:if> 
			</tbody>
		</table>
	</form>
	
	<div>
		<c:if test="${type == 'R' }">	
			<button type="button" class="btn-basic" onclick="javascript:fn_clear();">초기화</button>
		</c:if>
		<c:if test="${type == 'D' }">											
			<button type="button" class="btn-basic" onclick="javascript:fn_delete()">삭제</button>
		</c:if>
			<button type="button" class="btn-basic" onclick="javascript:fn_save('${type}');">저장</button>
			<button type="button" class="btn-basic" onclick="window.close();">닫기</button>
	</div>
</body>
</html>