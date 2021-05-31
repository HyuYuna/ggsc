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
		
	var page = "${page}";
	if(page == ""){
		page = 1;
	}
	
	$("#replyInfo").css("display", "none");
	$("#update").css("display", "none");
	$("#delete").css("display", "none");
	$("#replySaveBtn").css("display", "none");
	$("#replyUpdateBtn").css("display", "none");
	$("#replyDeleteBtn").css("display", "none");
	
	var title = "${detail.title}";
	if(title != "") {
		$("#save").css("display", "none");
		$("#update").css("display", "inline-block");
		$("#delete").css("display", "inline-block");
		$("#replyInfo").css("display", "inline-block");
		$("#replySaveBtn").css("display", "inline-block");
	}
	
	var answerYn = "${detail.answerYn}";
	if(answerYn == "Y") {
		$("#replyDeleteBtn").css("display", "inline-block");
		$("#replyUpdateBtn").css("display", "inline-block");
		$("#replySaveBtn").css("display", "none");
	}

	});	
	
	function fn_reg(param){
		
		if(param == "S") {
			if(confirm("등록 하시겠습니까?")){
				$("#num").val(0);
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/noinGroupReg.do?save=" +param;
		       	document.frm.submit();
			}
		} else if(param == "U") {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/noinGroupReg.do?save=" +param;
		       	document.frm.submit();
			}
		}  else if(param == "R") {
			if(confirm("수정 하시겠습니까?")){
				document.frm2.action = "<c:out value="${pageContext.request.contextPath}" />/noinGroupReg.do?save=" +param;
		       	document.frm2.submit();
			}
		} else if(param == "RU") {
			if(confirm("수정 하시겠습니까?")){
				document.frm2.action = "<c:out value="${pageContext.request.contextPath}" />/noinGroupReg.do?save=" +param;
		       	document.frm2.submit();
			}
		}
		
	}  
	
	
	function fn_delete(param) {
		
		if(param == "D") {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/noinGroupDel.do?save=" +param;
		       	document.frm.submit();
			}
		} else if(param == "RD") {
			if(confirm("삭제 하시겠습니까?")) {
				document.frm2.action = "<c:out value="${pageContext.request.contextPath}" />noinGroupDel.do?save=" + param;
				document.frm2.submit();
			}
		}
	}
	
	
	
	function fn_list(mnuCd){
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/noinGroupList.do?mnuCd=" + mnuCd;
	}
	
	
	
</script>

<section id="content">

	<h2 class="h2-title"><i class="fa fa-check-square"></i>노인집단상담</h2>
		
		<div class="box-style1 x-scroll-auto" >
			
			<form id="frm" name="frm" method="post" enctype="multipart/form-data">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
				<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
				<input type="hidden" id="num" name="num" value="${detail.num }" />
				
			<div class="doc-wrap" style="width: 100%; margin: auto;">
		        <div class="doc-box mt20" id="reqInfo">
		             <!-- 의뢰정보 영역 시작  -->
		            <div class="tbl-title mt20">
		             	  <h3 class="h3-title" style="display: inline-block;"><i class="fa fa-star"></i>의뢰정보</h3>
		            </div>
		            <table class="table-write" style="margin-top:1px;">
		                <colgroup>
		                    <col style="width: 10%;" />
		                    <col style="width: 35%;" />
		                    <col style="width: 10%;" />
		                    <col style="width: 35%;" />
		                </colgroup>
		                <tbody>
		                    <tr>
		                        <th scope="col">제목</th>
		                        <td colspan="3">
		                            <input type="text" id="title" name="title" class="inp txt-center" style="width: 450px;" value="${detail.title }" maxlength="50">
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="col">상담사</th>
		                        <td>
		                            <input type="text" id="noinCnsr" name="noinCnsr" class="inp txt-center" style="width: 250px;" value="${detail.noinCnsr }" onlyKorean oninput="this.value = this.value.replace(/[^ㄱ-힣/, '');" maxlength="8">
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="col">날짜</th>
		                        <td colspan="3">
		                            <input type="text" id="datepicker1" name="noinDt" class="inp txt-center" style="width:170px;" value="${detail.noinDt }" readonly>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="col">내용</th>
		                        <td colspan="3">
		                            <textarea id="noinCntn" name="noinCntn" class="h120" ><c:out value="${detail.noinCntn }" /></textarea>
		                        </td>
		                    </tr>
		                </tbody>
		            </table>
			      </div>
		      </div>
	         </form>
	         <div style="text-align: right;">
	         	<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd }');" style="background-color:#fc692f;color:white;">목록</button>
	         	<button type="button" class="btn-basic" id="save" onClick="javascript:fn_reg('S');" style="background-color: green;color:white;">저장</button>
				<button type="button" class="btn-basic" id="update" onClick="javascript:fn_reg('U');" style="background-color: green;color:white;">수정</button>
				<button type="button" class="btn-basic" id="delete" onClick="javascript:fn_delete('D');"  style="background-color: green;color:white;">삭제</button>
			</div>
		      <!-- 의뢰정보 영역 끝  -->
		         
		      <!-- 답변정보 영역  시작 -->
		      <div class="doc-wrap" style="width: 100%;margin: auto;">
		          <div class="doc-box mt20" id="replyInfo" style="width: 100%;">
			         <form id="frm2" name="frm2" method="post">
			         	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			         	<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			         	<input type="hidden" id="num" name="num" value="${detail.num }" /> 
			             <div class="tbl-title mt20">
			             	  <h3 class="h3-title" style="display: inline-block;"><i class="fa fa-star"></i>답변정보</h3>
			            </div>
			            <table class="table-write" style="margin-top:1px;">
			                <colgroup>
			                    <col style="width: 10%;" />
			                    <col style="width: 35%;" />
			                    <col style="width: 10%;" />
			                    <col style="width: 35%;" />
			                </colgroup>
			                <tbody>
			                    <tr>
			                        <th scope="col">제목</th>
			                        <td colspan="3">
			                            <input type="text" id="title" name="title" class="inp txt-center" style="width: 450px;" maxlength="50" value="${replyDtl.title }">
			                        </td>
			                    </tr>
			                    <tr>
			                        <th scope="col">답변자</th>
			                        <td>
			                            <input type="text" id="rplyCnsr" name="rplyCnsr" class="inp txt-center" style="width: 250px;" value="${replyDtl.rplyCnsr }" onlyKorean oninput="this.value = this.value.replace(/[^ㄱ-힣/, '');" maxlength="8">
			                        </td>
			                    </tr>
			                    <tr>
			                        <th scope="col">등록일자</th>
			                        <td colspan="3">
			                            <input type="text" id="datepicker2" name="rplyDt" class="inp txt-center" style="width:170px;" value="${replyDtl.rplyDt }" readonly>
			                        </td>
			                    </tr>
			                    <tr>
			                        <th scope="col">내용</th>
			                        <td colspan="3">
			                            <textarea id="rplyCntn" name="rplyCntn" class="h120" ><c:out value="${replyDtl.rplyCntn }" /></textarea>
			                        </td>
			                    </tr>
			                </tbody>
			            </table>
					</form>
		           	<div style="text-align: right;">
						<button type="button" class="btn-basic" id="replySaveBtn" onClick="javascript:fn_reg('R');" style="background-color: green;color:white;">저장</button>
						<button type="button" class="btn-basic" id="replyUpdateBtn" onClick="javascript:fn_reg('RU');" style="background-color: green;color:white;">수정</button>										
						<button type="button" class="btn-basic" id="replyDeleteBtn" onClick="javascript:fn_delete('RD');" style="background-color: green;color:white;">삭제</button>										
					</div>		
				</div>
			</div>
			 <!-- 답변정보 영역  끝 -->
        </div>
		<!-- end -->

	</section>

</html>

