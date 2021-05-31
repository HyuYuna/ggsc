<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="<c:out value="${pageContext.request.contextPath}" />/css/style.css" rel="stylesheet">
<script src="<c:out value="${pageContext.request.contextPath}" />/editor/js/summernote_0.8.3.js"></script>
<script src="<c:out value="${pageContext.request.contextPath}" />/editor/js/summernote_0.8.3.min.js"></script>
<script src="<c:out value="${pageContext.request.contextPath}" />/editor/lang/summernote-ko-KR.js"></script>
<script src="<c:out value="${pageContext.request.contextPath}" />/editor/js/bootstrap_3.3.5.js"></script>
<link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}" />/editor/css/summernote_0.8.3.css">
<link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}" />/editor/css/bootstrap_3.3.5.css">
<title>글쓰기</title>

<script type="text/javascript">
	$(document).ready(function() {
	 
	   $("#rcontent").focus();
	  
	   var writer = "${detail.writer}";
	   if(writer != "") {
		   $("#saveBtn").css("display", "none");
	   } else {
		   $("#updateBtn").css("display", "none");
		   $("#deleteBtn").css("display", "none");
	   }
	  
	 
	});
	
	
	function fn_reg(param){
		
		
		if(param == "S") {
			if(confirm("등록 하시겠습니까?")){
				$("#num").val(0);
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test1Reg.do?save=" +param;
		       	document.frm.submit();
			}
		} else if(param == "U") {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test1Reg.do?save=" +param;
		       	document.frm.submit();
			}
		} else if(param == "D") {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/test1Reg.do?save=" +param;
		       	document.frm.submit();
			}
		}
		
	}  	
	
	function fn_list(mnuCd){
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/test1List.do?mnuCd=" + mnuCd;
	}  	
	
	
</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>
		<c:if test="${empty detail.num }">Fate 등록</c:if>
		<c:if test="${!empty detail.num }">Fate 상세 및 수정</c:if>
	</h2>

	<form id="frm" name="frm" method="post" encType="multipart/form-data">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
		<input type="hidden" id="num" name="num" value="${detail.num }" />
		<table class="table-write" >
			<colgroup>
				<col width="10%" />
				<col width="*" />		
			</colgroup>
			<tr>
				<th>자료명</th>
				<td><input type="text" id="title" name="title" maxlength="50" value="${detail.title }"/></td>
			</tr>
			<tr>
				<th>설명</th>
				<td style="text-align: left;"><textarea id="rcontent" name="content" cols="100" rows="20"><c:out value="${detail.content }" escapeXml="false"/></textarea></td>
			</tr>
		</table>
	</form>
	<div class="btn" style="text-align: right; display: block;">
		<button type="button" class="btn-basic" id="saveBtn" onClick="javascript:fn_reg('S');" style="background-color:green;color:white;">등록</button>
		<c:if test="${ userId == detail.regId}">
			<button type="button" class="btn-basic" id="updateBtn" onClick="javascript:fn_reg('U');" style="background-color:green;color:white;">수정</button>
			<button type="button" class="btn-basic" id="deleteBtn" onClick="javascript:fn_reg('D');" style="background-color:green;color:white;">삭제</button>
		</c:if>
		<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd}');" style="background-color:#fc692f;color:white;">목록</button>
	</div>	
</section>
</html>