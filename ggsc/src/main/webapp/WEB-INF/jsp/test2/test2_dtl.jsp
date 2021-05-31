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

<script src="<c:out value="${pageContext.request.contextPath}" />/js/html2canvas.min.js" ></script>
<script src="<c:out value="${pageContext.request.contextPath}" />/js/jspdf.min.js" ></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		$('#fate').val('${detail.fate}').attr('selected','selected');
		$('input:radio[name=g1Gb]:input[value="${detail.g1Gb}"]').attr("checked", true);
	});
		
	

	function fn_reg(param){
		
		
		if(param == "S") {
			if(confirm("등록 하시겠습니까?")){
				$("#num").val(0);
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test2Reg.do?save=" +param;
		       	document.frm.submit();
			}
		} else if(param == "U") {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test2Reg.do?save=" +param;
		       	document.frm.submit();
			}
		} else if(param == "D") {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test2Reg.do?save=" +param;
		       	document.frm.submit();
			}
		}
		 
	}  	
	
	function fn_narcissusCheck() {
		var param = $("#title").val();
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		if(param.replace(/ /gi, "").length == 0){
			alert("센터명을 입력해주세요.");
			return;
		}
		$.ajax({
			type : "POST",
			url : "<c:out value="${pageContext.request.contextPath}" />/narcissusCheck_ajax.do",
			data : {title:param},
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				var msg = json.msg;
				narcissusCheck = json.narcissusCheck;
				alert(msg);
				if(narcissusCheck == "Y") {
					$("#narcissusCheck").val("Y");
					$("#title").attr("readonly",true);
				}
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
		
	}
	
	
	
	function fn_list(mnuCd){
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/test2List.do?mnuCd=" + mnuCd;
		/* document.frm.action = "/eduAtvyRptList.do";
	   	document.frm.submit(); */
	}
	
</script>
</head>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>
		<c:if test="${empty detail.title }">수선화 등록</c:if>
		<c:if test="${!empty detail.title }">수선화 상세보기</c:if>
	</h2>
		
		<div class="box-style1 x-scroll-auto" >				
			<input type="hidden" id="narcissusCheck" value="" />
			<form id="frm" name="frm" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
				<input type="hidden" id="num" name="num" value="${detail.num }" />
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
									<option value="${list.num }" >${list.title }</option>		
								</c:forEach>
							</select> 
						</td>
					</tr>
					<tr>
						<th>diverse</th>
						<td>
							<c:forEach items="${g1List}" var="list">
								<input type="radio" id="g1Gb${list.odr }" name="g1Gb" value="${list.odr }"   /><label for="g1Gb${list.odr }">${list.ysmMclassNm }</label>
							</c:forEach>							
						</td>
					<tr>
						<th>자료명</th>
						<td>
							<input type="text" id="title" name="title" maxlength="50" style="width:350px;" oninput="this.value = this.value.replace(/[^ㄱ-힣a-zA-Z]/, '');" value="${detail.title }" />
							<button type="button" class="btn-basic" style="line-height:17px;" onclick="fn_narcissusCheck()">중복확인</button>
						</td>
					</tr>
					<tr>
						<th>일시</th>
						<td>
							<span class="form"><input type="text" class="wd100" id="datepicker1" name="narcissusDt" value="${detail.narcissusDt }" readOnly/></span>
							<input type="text" class="wd50 mg-l25" maxlength="2" id="narcissusSttHour" name="narcissusSttHour" value="${detail.narcissusSttHour }" onlyNumber/>시
							<input type="text" class="wd50" maxlength="2" id="narcissusSttMin" name="narcissusSttMin" value="${detail.narcissusSttMin }" onlyNumber/>분 ~
							<input type="text" class="wd50" maxlength="2" id="narcissusEndHour" name="narcissusEndHour" value="${detail.narcissusEndHour }" onlyNumber/>시
							<input type="text" class="wd50" maxlength="2" id="narcissusEndMin" name="narcissusEndMin" value="${detail.narcissusEndMin }" onlyNumber/>분
						</td>
					</tr>
					<tr>
						<th>홈페이지</th>
						<td>
							<input type="text" id="homepage" name="homepage" maxlength="30" style="width:350px;" value="${detail.homepage }" />
							<c:if test="${!empty detail.num }">
								<button type="button" class="btn-basic"  style="line-height: 17px;" onclick="location.href='https://${detail.homepage }';">새창열기</button>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>설명</th>
						<td style="text-align: left;"><textarea id="rcontent" name="content" cols="100" rows="20"><c:out value="${detail.content }" escapeXml="false"/></textarea></td>
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

