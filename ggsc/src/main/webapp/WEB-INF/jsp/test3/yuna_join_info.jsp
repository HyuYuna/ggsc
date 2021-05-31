<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}" />/css/style.css">
<meta name="_csrf" th:content="${_csrf.token}"/>
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
<script src="<c:out value="${pageContext.request.contextPath}" />/js/jquery-1.11.2.min.js" ></script>

<script type="text/javascript">
	$(document).ready(function() {
		var msg = "${msg}";
		if(msg != "") {
			alert(msg);
			window.close();
		}
		
	});
		
	var idCheck;

	function fn_reg(){
		
		var pw = $("#pw").val().replace(/ /gi, "");
		var pwChk = $("#pwChk").val().replace(/ /gi, "");
		var fate = $("#fate").val();
		var secret = $("#secret").val();
		var stfy = $("#stfy").val();
		var ysmId = $("#ysmId").val().replace(/ /gi, "");
		var ysmNm = $("#ysmNm").val().replace(/ /gi, "");
		var birthDt = $("#birthDt").val().replace(/ /gi, "");
		var mobile = $("#mobile").val().replace(/\D/g, "");
		
		
		if(fate.length == 0) {
			alert("fate를 선택하세요");
			$("#fate").focus();
			return;
		}
		if(secret.length == 0) {
			alert("secret를 선택하세요");
			$("#secret").focus();
			return;
		}
		if($("input:radio[name='narcissus']").is(":checked") == false ) {
			alert("수선화를 체크해주세요");
			$("#narcissus").focus();
			return;
		}
		
		if($("input:radio[name='stfy']").is(":checked") == false){
			alert("만족도를 선택하세요");
			$("#stfy").focus();
			return;
		}
		
		if(ysmId.length == 0) {
			alert("아이디를 입력하세요");
			$("#ysmId").focus();
			return;
		}
		if(ysmId.search(/\s/) != -1) {
			alert("아이디는 공백 없이 입력해주세요.");
			$("#ysmId").focus();
			return;
		}
		
		var num = pw.search(/[0-9]/g); 
		var eng = pw.search(/[a-z]/ig);

		if(pw.length < 8 || pw.length > 20){
			 alert("8자리 ~ 20자리 이내로 입력해주세요.");
			 $("#pw").focus();
			 return false;
		}else if(pw.search(/\s/) != -1){
			 alert("비밀번호는 공백 없이 입력해주세요.");
			 $("#pw").focus();
			 return false;
		}else if(num < 0 || eng < 0){
			 alert("영문,숫자를 혼합하여 입력해주세요.");
			 $("#pw").focus();
			 return false;
		}
		
		if(pw != pwChk) {
			alert("비밀번호가 동일하지 않습니다.");
			$("#pwChk").focus();
			return;
		}
		
		if(birthDt.length == 0) {
			alert("생년월일을 입력해주세요");
			$("#birthDt").focus();
			return;
		}
		
		var year = Number(birthDt.substr(0,4)); 
	    var month = Number(birthDt.substr(4,2));
	    var day = Number(birthDt.substr(6,2));
	    var today = new Date(); // 날자 변수 선언
	    var yearNow = today.getFullYear();
	    var adultYear = yearNow-20;
	 
	    if (year < 1900 || year > adultYear){
	    	alert("년도를 확인하세요. "+adultYear+"년생 이전 출생자만 등록 가능합니다.");
	        $("#birthDt").focus();
	        return;
	    }
	    if (month < 1 || month > 12) { 
	        alert("달은 1월부터 12월까지 입력 가능합니다.");
	        $("#birthDt").focus();
	        return;
	    }
	    if (day < 1 || day > 31) {
	        alert("일은 1일부터 31일까지 입력가능합니다.");
	        $("#birthDt").focus();
	        return;
	    }
	    if ((month==4 || month==6 || month==9 || month==11) && day==31) {
	        alert(month+"월은 31일이 존재하지 않습니다.");
	        $("#birthDt").focus();
	        return;
	    }
	    if (month == 2) {
	        var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
	        if (day>29 || (day==29 && !isleap)) {
	             alert(year + "년 2월은  " + day + "일이 없습니다.");
	             $("#birthDt").focus();
	             return;
	        }
	    }
		  
	    if($("input:checkbox[name='g1Gb']").is(":checked") == false ) {
		    alert("diverse를 체크해주세요");
		    $("#g1Gb").focus();
		    return;
	    }
		
	    if($("input:checkbox[name='stfys']").is(":checked") == false) {
	    	alert("만족도체크박스를 체크하세요");
	    	$("#stfys").focus();
	    	return;
	    }
		
		
		if(confirm("등록 하시겠습니까?")){
			document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/yuna_join_write.do";
	       	document.frm.submit();
		}
		
	}  	
	
	function fn_list(mnuCd){
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/test3List.do?mnuCd=" + mnuCd;
		/* document.frm.action = "/eduAtvyRptList.do";
	   	document.frm.submit(); */
	}
	
	
	function fn_idCheck() {
		var param = $("#ysmId").val();
		if(param.length <= 5) {
			alert("ID를 6자 이상으로 만드세요");
			return false;
		}
		
		var token = $("meta[name = '_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		if(param.replace(/ /gi, "").length == 0) {
			alert("ID를 입력하세요");
			return;
		}
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
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	
	
	function fn_clear() {
		$("input[type=radio]").removeAttr("checked");
		$("input[type!=radio]").val("");
	}
	
	
</script>
<style>
	td:nth-child(odd){text-align:center;} 
</style>

<body style="background:white;">
	<div class="h3-title" style="background: #1266FF;height:30px;color:white;line-height:32px;">
		&nbsp;&nbsp;&nbsp;유나가입 팝업
	</div>
	<h2 class="h2-title mg-t20 mg-l25">
		<i class="fa fa-circle"></i>유나 가입 
	</h2>
	<div style="width:240px;height:20px;float:right;text-align:right;padding-top:10px;"><img src="/images/logo.png" style="width:240px;height:35px;"></div>
	<div style="border-top:1px solid black;width:500px;margin-left:10px;margin-top:10px;margin-bottom:10px;"></div>
	<div class="box-style1" style="background:#f4f4f4;width:500px;margin-left:10px;">
		가입하세요 <p>
	</div>
		<form id="frm" name="frm" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<table class="table-write wd500 h600 mg-all10">
				<colgroup>
					<col width="15%"></col>
					<col width="35%"></col> 
					<col width="15%"></col>
					<col width="35%"></col> 
				</colgroup>
				<tr>
					<td colspan="4">셀렉트</td>
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
					<th>secret</th>
					<td>
						<select class="wd200" id="secret" name="secret">
							<option value="">선탁하세요</option>						
							<option value="1">비밀</option>						
							<option value="2">비밀번호</option>	
							<option value="3">아이디</option>	
							<option value="4">주민등록번호</option>	
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="4">라디오</td>
				</tr>
				<tr>
					<th>수선화</th>
					<td colspan="3">
						<c:forEach items="${test2List}" var="list">
							<input type="radio" id="narcissus${list.num}" name="narcissus" value="${list.num}" /><label for="narcissus${list.num }">${list.title}</label>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>만족도</th>
					<td colspan="3">
						<input type="radio" id="stfy1" name="stfy" value="1" /><label for="stfy1">1</label>
						<input type="radio" id="stfy2" name="stfy" value="2" /><label for="stfy2">2</label>
						<input type="radio" id="stfy3" name="stfy" value="3" /><label for="stfy3">3</label>
						<input type="radio" id="stfy4" name="stfy" value="4" /><label for="stfy4">4</label>
						<input type="radio" id="stfy5" name="stfy" value="5" /><label for="stfy5">5</label>
					</td>
				</tr>
				<tr>
					<td colspan="4">계정</td>
				<tr>
					<th>아이디</th>
					<td colspan="3">
						<input type="text" id="ysmId" name="ysmId" maxlength="20" style="width:164px;"  oninput="this.value = this.value.replace(/[^a-z0-9]/, '');" />
						<button type="button" class="btn-basic" onclick="fn_idCheck()">중복확인</button>				
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id="pw" name="pw" oninput="this.value = this.value.replace(/[^a-z0-9]/, '');" maxlength="20" ></td>
					<th>비밀번호 확인</th>
					<td><input type="password" id="pwChk" name="pwChk" oninput="this.value = this.value.replace(/[^a-z0-9]/, '');" maxlength="20" /></td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" id="ysmNm" name="ysmNm" style="width:170px;" onlyKorean oninput="this.value = this.value.replace(/[^ㄱ-힣/, '');" maxlength="8">
					</td>
					<th>성별</th>
					<td>
						<input type="radio" id="gender1" name="gender" value="M" ><label for="gender1">남</label>
						<input type="radio" id="gender2" name="gender" value="F" ><label for="gender2">여</label>
					</td>
				</tr>
				<tr>
					<th>생일</th>
					<td><input type="text" id="birthDt" name="birthDt" laceholder="ex)19980615" oninput="this.value = this.value.replace(/[^0-9]/, '');" maxlength="8"></td>
					<th>연락처</th>
					<td><input type="text" id="mobile" name="mobile" oninput="this.value = this.value.replace(/[^0-9]/g, '');" value="${detail.mobile }" /></td>
				</tr>
				
				<tr>
					<td colspan="4">체크박스</td>
				</tr>
				<tr>
					<th>diverse</th>
					<td colspan="3">
						<c:forEach items="${g1List}" var="list">
							<input type="checkbox" id="g1Gb${list.odr }" name="g1Gb" value="${list.odr }" ><label for="g1Gb${list.odr }">${list.ysmMclassNm}</label>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>만족도 단위 여러개 선택</th>
					<td colspan="3">
						<input type="checkbox" id="stfys1" name="stfys" value="1"><label for="stfys1">1</label>
						<input type="checkbox" id="stfys2" name="stfys" value="2"><label for="stfys2">2</label>
						<input type="checkbox" id="stfys3" name="stfys" value="3"><label for="stfys3">3</label>
						<input type="checkbox" id="stfys4" name="stfys" value="4"><label for="stfys4">4</label>
						<input type="checkbox" id="stfys5" name="stfys" value="5"><label for="stfys5">5</label>
					</td>
				</tr>
				
				<tr>
					<th>설명</th>
					<td colspan="3" style="text-align: left;"><textarea id="rcontent" name="content" cols="30" rows="20"><c:out value="${detail.content }" escapeXml="false"/></textarea></td>
				</tr>
			</table>
			<div class="btn" style="float: right; margin: 0;">
				<button type="button" class="btn-basic" onClick="javascript:fn_reg();" style="background-color: green;color:white;">저장</button>
			</div>	
		</form>
	</body>
</html>

