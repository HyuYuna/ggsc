<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="/gnoincoundb/js/html2canvas.min.js" ></script>
<script src="/gnoincoundb/js/jspdf.min.js" ></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		var caseNo = "${detail.caseNo}";
		var prevPostGb = "${detail.prevPostGb}";
		
		var str;
		var name;
		
		str = "${detail.prevState}";
		name = "prevState";
		fn_checked(str, name);
		
		str = "${detail.postState}";
		name = "postState";
		fn_checked(str, name);
		
		$("#cnsPrev").css("display", "inline-block");
		$("#cnsPost").css("display", "none");
	  	if(caseNo.length > 0) {
	  		if(prevPostGb == '1') {
	  			$("#cnsPrev").css("display", "inline-block");
	  			$("#cnsPost").css("display", "none");
	  		} else if(prevPostGb == '2') {
	  			$("#cnsPrev").css("display", "none");
	  			$("#cnsPost").css("display", "inline-block");
	  		}
	  		$("#findBtn").css("display", "none");
	  		$("#sBtn").css("display", "none");	  			
		  	$("#prevPostGb").val('${detail.prevPostGb}').attr('selected','selected');
		  	$("#prevPostGb option").not(":selected").attr("disabled", "disabled");
		  	
	  	} else {
	  		$("#uBtn").css("display", "none");
	  		$("#dBtn").css("display", "none");
	  	}
	  	
	  	
	  	$("#prevPostGb").change(function(){
	  		var prevPostGb = $("#prevPostGb").val();
	  		if(prevPostGb == "1") {
	  			$("#cnsPrev").css("display", "inline-block");
	  			$("#cnsPost").css("display", "none");
	  		} else if(prevPostGb == "2"){
	  			$("#cnsPrev").css("display", "none");
	  			$("#cnsPost").css("display", "inline-block");
	  		};
		});
	});
	
	function fn_reg(param){
		
		var cnsleNm = $("#cnsleNm").val();
		var datapicker = $("#datepicker1").val();
		var prevPostGb = $("#prevPostGb").val();
		var prevCnt = $("#prevCnt").val();
		var prevMajorApplCd = $("#prevMajorApplCd").val();
		var prevScore = $("#prevScore").val();
	
		var postCnt = $("#postCnt").val();
		var postMajorApplCd = $("#postMajorApplCd").val();
		var postScore = $("#postScore").val();
		var cnsBefore = $("#cnsBefore").val();
		var cnsAfter = $("#cnsAfter").val();
		
		if(cnsleNm.length == 0) {
			alert("내담자명을 입력해주세요.");
			return;
		}
		if(datapicker.length == 0) {
			alert("검사일시를 입력해 주세요");
			$("#datepicker1").focus();
			return false;
		}
		
		if(prevPostGb == "1") {
			if(prevCnt.length == 0) {
				alert("회기를 입력해주세요.");
				return;
			}
			if($('input:radio[name="prevState"]').is(':checked')==false){
				alert("현재의 어려움 및 불편함상태를 선택해주세요.");
				return;
			}
			if(prevMajorApplCd.length == 0) {
				alert("주호소를 입력해주세요.");
				return;
			}
			if(prevScore.length == 0) {
				alert("점수를 입력해주세요.");
				return;
			}
		}
		
		if(prevPostGb == "2") {
			if(postCnt.length == 0) {
				alert("회기를 입력해주세요.");
				return;
			}
			if($('input:radio[name="postState"]').is(':checked')==false){
				alert("상담 후 문제의 대응정도 및 불편감을 선택해주세요.");
				return;
			}
			if(postMajorApplCd.length == 0) {
				alert("주호소를 입력해주세요.");
				return;
			}
			if(postScore.length == 0) {
				alert("점수를 입력해주세요.");
				return;
			}
			if(cnsBefore.length == 0) {
				alert("상담 전 변화된 점을 입력해주세요.");
				return;
			}
			if(cnsAfter.length == 0) {
				alert("상담 후 변화된 점을 입력해주세요.");
				return;
			}
		}
		
		if(param == "S") {
			if(confirm("등록 하시겠습니까?")){
				$("#num").val(0);
				document.frm.action = "/gnoincoundb/cnsPrevPostReg.do?save="+ param;
		        document.frm.submit();
			}
		} else {
			if(confirm("수정 하시겠습니까?")){
				document.frm.action = "/gnoincoundb/cnsPrevPostReg.do?save="+ param;
		       	document.frm.submit();
			}
		}
		
	}  	
	
	function fn_delete() {
		if(confirm("삭제 하시겠습니까?")){
			document.frm.action = "/gnoincoundb/cnsPrevPostDel.do?mnuCd=${mnuCd}";
	       	document.frm.submit();
		}
	}
	
	function fn_list(mnuCd){
		document.location.href = "/gnoincoundb/cnsPrevPostList.do?mnuCd=" + mnuCd;
		/* document.location.href = "/counsellor_mngList.do?mnuCd=" + mnuCd; */
	}  	
	
	function findUserPopup(){
		var userNm = $("#cnsleNm").val();
		userNm = encodeURI(encodeURIComponent(userNm));		
		var url = "/gnoincoundb/findUserPopup.do?userNm=" + userNm+"&cnsTargetGb=Y&cnsPerTargetGb=Y";
		var name = "회원 찾기";
		var option = "width = 530, height = 750, top = 50, left = 250, location = yes";
		window.open(url, name, option);
		encodeURI(encodeURIComponent(jindan_name));
	}
	
	function fn_pdfDown() {
		// document.downForm.action = "/fileDown.do";
		// var fileNm = "${detail.fileNm}";
		// var filePath = "${detail.filePath}";
		document.frm.action = "/gnoincoundb/fileDown.do";
        document.frm.submit();
       	// document.location.href = "/fileDown.do";
        // document.location.href = "/fileDown.do?fileNm=" + fileNm +"&filePath=" + filePath;
		// document.location.href = "/pdfWrite.do";
	}
	
	function fn_checked(str, name){
		if(str != ""){
			var arr = str.split(",");
			for(var i in arr){
				$("input[name=" + name + "][value=" + arr[i] + "]").prop("checked", true);
			}	
		}
	}
	
	function getGb(){
		if(document.getElementById('caseNo').value.length > 0){
			var token = $("meta[name='_csrf']").attr("th:content");
			var header = $("meta[name='_csrf_header']").attr("th:content");
			
			$.ajax({
				url : "/gnoincoundb/cnsAcceptDtl_ajax.do",
				type : "post",
				dataType : "json",
				beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
				},
				data : { caseNo : document.getElementById('caseNo').value }
			}).done(function(e){
				var data = e.Detail;
				var arr = [ 'cnsNm', 'zoneNm', 'centerNm', 'localNm', 'birthDt' ];
				for(var i=0;i<arr.length;i++){
					$("[data-type='" + arr[i] + "']").text(eval("data." + arr[i] ));
				}
				
			}).fail(function(e){
				alert('서버 오류가 발생하였습니다.');
			})
			
		}
	}
	
</script>
<style>
	
	.table-style1 input {width:150px;}
	/* td:nth-child(even){text-align:left;} */
	/* td:nth-child(odd){text-align:left;} 홀수 이벤트*/
	input[type="text"] {
		width: initial;
		appearance: none;
	} 
	.box-title {
        font-size: 35px;
    }
    .tbl>tbody>tr {
        font-size: 16px;
        height: 50px;
    }
    .tbl>tbody>tr>th {
        border: 1px solid #333;
        background-color: #CCCCCC;
    }
    .h70 {
        height: 70px;
    }
    .bgG {
        background-color: #CCCCCC;
    }
    .doc-wrap {
    	font-weight: 700;
    	font-family: 'Noto Sans KR', sans-serif;
    	font-size: 16px;
        color: #333333;
    }
    .inp {
        font-family: 'Noto Sans KR', sans-serif;
        color: #333333;
        font-size: 16px;
        position: relative;
        line-height: 1.5em;
        font-weight: 500;
        width: 95%;
    }
    textarea {
        width: 95%;
        height: 100px;
        font-family: 'Noto Sans KR', sans-serif;
        color: #333333;
        font-size: 16px;
        font-weight: 500;
        border: none;
    }
    hr {
    	display:block;
    	border-width:2px;
    	border-style:dotted;
    }
    .h120 {
        height: 120px;
    }
    .h150 {
        height: 150px;
    }
    .h200 {
        height: 200px;
    }
    .sign-box {
        width: 300px;
    }
    .tbl-title {
        width: 100%;
        height: 35px;
        line-height: 35px; 
        display: inline-block;
        background-color: #CCCCCC;
        text-align: center;
        border: 1px solid #333;
        font-family: 'Noto Sans KR', sans-serif;
        color: #333333;
        font-size: 18px;
        font-weight: 500;
    }
    .doc-box {
        border: 2px solid #333;
    }
    .con-info {
        border-bottom: 1px solid #333;
        border-right: 1px solid #333;
        border-left: 1px solid #333;
        font-family: 'Noto Sans KR', sans-serif;
        color: #333333;
        font-size: 18px;
        padding: 15px;
    }
    .inp14 {
        border: none;
        font-family: 'Noto Sans KR', sans-serif;
        color: #333333;
        font-size: 18px;
        width: 100%;
        font-weight: 500;
        position: relative;
        top: -3px;
    }
    .month {
        width: 20px;
    }
    .tbl tbody>tr>td {
        padding: 5px;
        font-weight: 500;
    }
    .tbl thead th.bg-w {
        background-color: #fff;
        font-size: 18px;
    }
    .w9 {
        width: 9%;
    }
    .w21 {
        width: 21%;
    }
    .under {
        border-bottom: 1px solid #333;
    }
    .nl {
        width: 100%;
        display: inline-block;
        text-align: center;
    }
    .nl li {
        width: 9%;
        float: left;
    }
    .w100 {
        width: 100px;
    }
    .w90 {
        width: 90px;
    }
    .small {
        height: 60px;
    }
    .border {
        border: 1px solid #333;
        padding: 5px;
        word-break: break-all;
    }
    .fs16 {
        font-size: 16px;
    }
    .btn-basic {
    	padding: 5px;
    }
     .hr-sect {
        display: flex;
        flex-basis: 100%;
        align-items: center;
        color: rgba(0, 0, 0, 0.35);
        font-size: 12px;
        margin: 8px 0px;
      }
      .hr-sect::before,
      .hr-sect::after {
        content: "";
        flex-grow: 1;
        background: rgba(0, 0, 0, 0.35);
        height: 1px;
        font-size: 0px;
        line-height: 0px;
        margin: 0px 16px;
      }
    
</style>
<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>
		<c:if test="${empty detail.num }">사전·사후 검사 등록</c:if>
		<c:if test="${!empty detail.num }">사전·사후 검사 상세보기</c:if>
	</h2>
	<div class="box-style1 x-scroll-auto" >
		<form name="downForm" id="downForm" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="fileNm" name="fileNm" value="" />
			<input type="hidden" id="sysFileNm" name="sysFileNm" value="" />
			<input type="hidden" id="filePath" name="filePath" value="" />
		</form>
		<form id="frm" name="frm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<input type="hidden" id="num" name="num" value="${detail.num }" />
			<input type="hidden" id="caseNo" name="caseNo"  value="${detail.caseNo}" />
			<input type="hidden" id="sigunCd" name="sigunCd" />
			<div style="border-style: solid; border-width: thin; width:100%; height: auto; padding: 10px 10px 10px 10px;">
				<table border="1" class="table-write" style="width: 101.2%; position: relative; left: -10px; top: -10px; border-left-style:hidden; border-right-style: hidden; border-top-style: hidden;">
					<colgroup>
						<col width="15%" >
						<col width="30%" >
						<col width="15%" >
						<col width="35%" >
					</colgroup>
					<tbody>
						<tr>
							<th>검사 구분</th>
							<td>
								<select id="prevPostGb" name="prevPostGb" style="width:200px;">
									<option value="1">사전 검사</option>
									<option value="2">사후 검사</option>
								</select>
							</td>
							<th>검사일자</th>
	                        <td style="border-bottom: 1px solid #bbb;">
	                            <input type="text" id="datepicker1" name="inspectDt" class="inp txt-center" style="width:170px;" readonly="readonly" value="${detail.inspectDt }">
	                        </td>
						</tr>
						<tr>
							<th>내담자ID</th>
							<td><input type="text" id="cnsleId" name="cnsleId" style="width: 200px;" readonly="readonly" value="${detail.cnsleId }" /></td>
							<th>내담자명</th>
							<td><input type="text" id="cnsleNm" name="cnsleNm" style="width: 200px;" value="${detail.cnsleNm }" readonly /><button type="button" id="findBtn" class="btn-basic" style="padding: 2px 6px;" onclick="javascript:findUserPopup();">찾기</button></td>
						</tr>
						<tr height=33>
							<th>상담구분</th>
							<td><span data-type='cnsNm'></span></td>
							<th>권역구분</th>
							<td><span data-type='zoneNm'></span></td>
						</tr>
						<tr height=33>
							<th>지역구분</th>
							<td><span data-type='localNm'></span></td>
							<th>센터구분</th>
							<td><span data-type='centerNm'></span></td>
						</tr>
					</tbody>
				</table>
		 	<div class="doc-wrap" style="width: 80%;margin: auto;">
		        <div class="title mt20">
		            <span class="docTitle noto700 ml20">상담 사전 · 사후 기록지</span>
		        </div>
		        <div class="btn" style="text-align: right; display: block;">
					<!-- <button type="button" class="btn-basic" onClick="javascript:fn_clear();"><i class="fa fa-repeat"></i>초기화</button> -->
					<button type="button" class="btn-basic" id="uBtn" onclick="javascript:fn_reg('${detail.num}');">수정</button>
					<button type="button" class="btn-basic" id="sBtn" onclick="javascript:fn_reg('S');">저장</button>
					<c:if test="${map.authCd <= 1}">
						<button type="button" class="btn-basic" id="dBtn" onClick="javascript:fn_delete();">삭제</button>
					</c:if>
					<!-- <button type="button" class="btn-default" onClick="javascript:fn_reg();" style="background-color:#fc692f;color:white;">저장</button> -->
					<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd }');" style="background-color:#fc692f;color:white;">목록</button>
				</div>	
		        <div class="doc-box mt20" id="cnsPrev">
		            <table class="tbl">
		                <caption>상담 사전기록지</caption>
		                <colgroup>
		                    <col style="width: 10%;" />
		                    <col style="width: 20%;" />
		                    <col style="width: 10%;" />
		                    <col style="width: 20%;" />
		                </colgroup>
		                <tr>
		                    <th>사전 회기</th>
		                    <td colspan="3" style="border-bottom: 1px solid #bbb;"	>
		                    	<input type="text" class="txt-center" id="prevCnt" name="prevCnt" value="${detail.inspectCnt}" oninput="this.value = this.value.replace(/[^0-9]/, '');" style="width:100px;" maxlength="3">
		                    </td>
		                </tr>
		            </table>
		            <div class="con-info">
		                <div class="mt40">
		                    <div class="noto500">1. 현재의 어려움 및 불편함은 어느 정도입니까? ○표해 주세요.<br>
		                        &nbsp;&nbsp;&nbsp;&nbsp;(0 가장 만족상태, 10 가장 어려운 상태)</div>
		                    <!-- <div class="mt10">|----------------------------------------------------------------------------------------------------------------------------------------|</div> -->
		                    <hr>
		                    </div>
		                    <ul class="nl mt5">
		                        <li><label for="prevState0" style="margin-right: 5px;">0</label><input type="radio" id="prevState0" name="prevState" value="0" /></li>
		                        <li><label for="prevState1" style="margin-right: 5px;">1</label><input type="radio" id="prevState1" name="prevState" value="1" /></li>
		                        <li><label for="prevState2" style="margin-right: 5px;">2</label><input type="radio" id="prevState2" name="prevState" value="2" /></li>
		                        <li><label for="prevState3" style="margin-right: 5px;">3</label><input type="radio" id="prevState3" name="prevState" value="3" /></li>
		                        <li><label for="prevState4" style="margin-right: 5px;">4</label><input type="radio" id="prevState4" name="prevState" value="4" /></li>
		                        <li><label for="prevState5" style="margin-right: 5px;">5</label><input type="radio" id="prevState5" name="prevState" value="5" /></li>
		                        <li><label for="prevState6" style="margin-right: 5px;">6</label><input type="radio" id="prevState6" name="prevState" value="6" /></li>
		                        <li><label for="prevState7" style="margin-right: 5px;">7</label><input type="radio" id="prevState7" name="prevState" value="7" /></li>
		                        <li><label for="prevState8" style="margin-right: 5px;">8</label><input type="radio" id="prevState8" name="prevState" value="8" /></li>
		                        <li><label for="prevState9" style="margin-right: 5px;">9</label><input type="radio" id="prevState9" name="prevState" value="9" /></li>
		                        <li><label for="prevState10" style="margin-right: 5px;">10</label><input type="radio" id="prevState10" name="prevState" value="10" /></li>
		                    </ul>
		                    <div class="noto500 mt40">3. 주호소 문제 검사 : 
		                    	<input type="text" class="inp14 txt-right" id="prevMajorApplCd" name="prevMajorApplCd" value="${detail.majorApplCd}">&emsp;&emsp;&emsp;&emsp;
		                    	<input type="text" class="inp14 txt-right" id="prevScore" name="prevScore" value="${detail.prevScore}" style="width:9%" oninput="this.value = this.value.replace(/[^0-9]/, '');" maxlength="3">&nbsp;&nbsp;점
		                    </div>
		                    <div class="noto500 mt40" style="margin-bottom:5px;">5. 상담에 대한 기타 건의 사항</div>
		                    <textarea id="prevSuggestion" name="prevSuggestion">${detail.suggestion }</textarea>
		                    <div class="noto500 mt40 border">
		                      	 주 호소내용<br/>
		                        <span class="fs16 txt-justify">① 심리정서&nbsp;&nbsp;② 대인관계&nbsp;&nbsp;③ 치매&nbsp;&nbsp;④ 중독&nbsp;&nbsp;⑤ 정신건강·장애&nbsp;&nbsp;⑥ 자살&nbsp;&nbsp;⑦ 건강&nbsp;&nbsp;⑧ 경제&nbsp;&nbsp;⑨ 생활&nbsp;&nbsp;⑩ 성&nbsp;&nbsp;⑪ 부부&nbsp;&nbsp;⑫ 가족&nbsp;&nbsp; ⑬ 학대&nbsp;&nbsp;⑭ 노년생애준비&nbsp;&nbsp;⑮ 재난&nbsp;&nbsp;⑯ 기타&nbsp;&nbsp;</span>
		                    </div>
		                </div>
		            </div>
		            
		            <div class="doc-box mt20" id="cnsPost">
		            <table class="tbl">
		                <caption>상담 사후기록지</caption>
		                <colgroup>
		                    <col style="width: 10%;" />
		                    <col style="width: 20%;" />
		                    <col style="width: 10%;" />
		                    <col style="width: 20%;" />
		                </colgroup>
		                <tr>
		                    <th>사후 회기</th>
		                    <td colspan="3" style="border-bottom: 1px solid #bbb;"	>
		                    	<input type="text" class="txt-center" id="postCnt" name="postCnt" value="${detail.inspectCnt}" oninput="this.value = this.value.replace(/[^0-9]/, '');" style="width:100px;" maxlength="3">
		                    </td>
		                </tr>
		            </table>
		            <div class="con-info">
		                <div class="mt5 noto500">
		                    ✿ 상담 전과 상담 후의 변화된 점을 적어주세요.
		                </div>
		                <div class="mt40">
		                    <div class="noto500 mt40">2. 상담 후 문제의 대응정도 및 불편감은 어느 정도입니까? ○표해 주세요.<br>
		                        &nbsp;&nbsp;&nbsp;&nbsp;(0 가장 만족상태, 10 가장 어려운 상태)</div>
		                    <!-- <div class="mt10">|----------------------------------------------------------------------------------------------------------------------------------------|</div> -->
		                   	<hr>
		                    <ul class="nl mt5">
		                        <li><label for="postState0" style="margin-right: 5px;">0</label><input type="radio" id="postState0" name="postState" value="0" /></li>
		                        <li><label for="postState1" style="margin-right: 5px;">1</label><input type="radio" id="postState1" name="postState" value="1" /></li>
		                        <li><label for="postState2" style="margin-right: 5px;">2</label><input type="radio" id="postState2" name="postState" value="2" /></li>
		                        <li><label for="postState3" style="margin-right: 5px;">3</label><input type="radio" id="postState3" name="postState" value="3" /></li>
		                        <li><label for="postState4" style="margin-right: 5px;">4</label><input type="radio" id="postState4" name="postState" value="4" /></li>
		                        <li><label for="postState5" style="margin-right: 5px;">5</label><input type="radio" id="postState5" name="postState" value="5" /></li>
		                        <li><label for="postState6" style="margin-right: 5px;">6</label><input type="radio" id="postState6" name="postState" value="6" /></li>
		                        <li><label for="postState7" style="margin-right: 5px;">7</label><input type="radio" id="postState7" name="postState" value="7" /></li>
		                        <li><label for="postState8" style="margin-right: 5px;">8</label><input type="radio" id="postState8" name="postState" value="8" /></li>
		                        <li><label for="postState9" style="margin-right: 5px;">9</label><input type="radio" id="postState9" name="postState" value="9" /></li>
		                        <li><label for="postState10" style="margin-right: 5px;">10</label><input type="radio" id="postState10" name="postState" value="10" /></li>
		                    </ul>
		                    <div class="noto500 mt40">3. 주호소 문제 검사 : 
		                    	<input type="text" class="inp14 w21 txt-right" id="postMajorApplCd" name="postMajorApplCd" value="${detail.majorApplCd}">&emsp;&emsp;&emsp;&emsp;
		                    	<input type="text" class="inp14 txt-right" id="postScore" name="postScore" value="${detail.postScore}" style="width:9%" oninput="this.value = this.value.replace(/[^0-9]/, '');" maxlength="3">&nbsp;&nbsp;점
		                    </div>
		                    <div class="noto500 mt40">4. 상담 후 변화된 점은 무엇입니까?</div>
		                    <table class="tbl mt10">
		                        <caption>상담표</caption>
		                        <colgroup>
		                            <col style="width: 50%;" />
		                            <col style="width: 50%;" />
		                        </colgroup>
		                        <thead>
		                            <th class="bg-w" scope="col">상담 전</th>
		                            <th class="bg-w" scope="col">상담 후</th>
		                        </thead>
		                        <tbody>
		                            <tr>
		                                <td>
		                                    <textarea id="cnsBefore" name="cnsBefore">${detail.cnsBefore}</textarea>
		                                </td>
		                                <td>
		                                    <textarea id="cnsAfter" name="cnsAfter">${detail.cnsAfter}</textarea>
		                                </td>
		                            </tr>
		                        </tbody>
		                    </table>
		                    <div class="noto500 mt40" style="margin-bottom:5px;">5. 상담에 대한 기타 건의 사항</div>
		                    <textarea id="postSuggestion" name="postSuggestion">${detail.suggestion }	</textarea>
		                    <div class="noto500 mt40 border">
		                      	 주 호소내용<br/>
		                        <span class="fs16 txt-justify">① 심리정서&nbsp;&nbsp;② 대인관계&nbsp;&nbsp;③ 치매&nbsp;&nbsp;④ 중독&nbsp;&nbsp;⑤ 정신건강·장애&nbsp;&nbsp;⑥ 건강&nbsp;&nbsp;⑦ 경제&nbsp;&nbsp;⑧ 생활&nbsp;&nbsp;⑨ 성&nbsp;&nbsp;⑩ 부부&nbsp;&nbsp;⑪ 가족&nbsp;&nbsp;⑫ 학대&nbsp;&nbsp; ⑬ 노년생애준비&nbsp;&nbsp;⑭ 자살&nbsp;&nbsp;⑮ 재난&nbsp;&nbsp;⑯ 기타&nbsp;&nbsp;</span>
		                    </div>
		                </div>
		            </div>
		            </div>
		        </div>
	    	</div>
		</form>
  	</div>
	
</section>
</html>