<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="/js/html2canvas.min.js" ></script>
<script src="/js/jspdf.min.js" ></script>

<script type="text/javascript">
	$(document).ready(function() {
		var yunaNo = "${detail.yunaNo}";
		var addReqGb = "${detail.addReqGb}";
		$("#internalText").html("diverse");
		$("#g1Gb").css("display" , "inline-block");
		$("#g2Gb").css("display" , "none");
		if(yunaNo.length > 0) {
			if(addReqGb == '1') {
				$("#inReq").css("display" , "inline-block");
				$("#outReq").css("display" , "none");
				$("#internalText").html("diverse");
				$("#g1Gb").css("display" , "inline-block");
				$("#g2Gb").css("display" , "none");
			} else if(addReqGb == '2') {
				$("#inReq").css("display" , "none");
				$("#outReq").css("display" , "inline-block");
				$("#g1Gb").css("display" , "none");
				$("#g2Gb").css("display" , "inline-block");
				$("#internalText").html("enormous");
			}
			$("#sBtn").css("display" , "none");
			$('#addReqGb').val('${detail.addReqGb}').attr('selected','selected');
		} else {
			$('#reqDept').val('${map.centerNm}');
			$('#reqDeptPer').val('${map.userNm}');
			$("#uBtn").css("display", "none");
		}
		
		$("#addReqGb").change(function(){
			var addReqGb = $("#addReqGb").val();
			if(addReqGb == '1') {
				$("#inReq").css("display" , "inline-block");
				$("#outReq").css("display" , "none");
				$("#internalText").html("diverse");
				$("#g1Gb").css("display" , "inline-block");
				$("#g2Gb").css("display" , "none");
			} else if(addReqGb == '2') {
				$("#inReq").css("display" , "none");
				$("#outReq").css("display" , "inline-block");
				$("#g1Gb").css("display" , "none");
				$("#g2Gb").css("display" , "inline-block");
				$("#internalText").html("enormous");
			};
		});
	});
	
	function fn_reg(param){
		
		if(param == "S") {
			if(confirm("등록 하시겠습니까?")) {
				var psycRstMmseds = $("#psycRstMmseds").val();
				if(psycRstMmseds == "") {
					$("#psycRstMmseds").val(0);
				}
				$("#num").val(0);
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/addRequestReg.do?save="+ param;
				document.frm.submit();
			}
		} else {
			if(confirm("수정 하시겠습니까?")) {
				var psycRstMmseds = $("#psycRstMmseds").val();
				if(psycRstMmseds == "") {
					$("#psycRstMmseds").val(0);
				}
				document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/addRequestReg.do?save="+ param;
				document.frm.submit();
			}
		}
		
	}  	
	
	
	function fn_list(mnuCd){
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/linkageReqList.do?mnuCd=" + mnuCd;
	}  	
	
	
	
	function findYunaPopup() {
		var ysmId = $("ysmId").val();
		ysmId = encodeURI(encodeURIComponent(ysmId));		
		var url = "<c:out value="${pageContext.request.contextPath}" />/findYunaPopup.do?ysmId=" + ysmId;
		var name = "유나 찾기"
		var option = "width = 530, height = 750, top = 50, left = 250, location = yes";
		window.open(url,name,option);
		encodeURI(encodeURIComponent(jindan_name));
	}
	
	
	function fn_popup() {
		var openwin;
		var url = "<c:out value="${pageContext.request.contextPath}" />/apple_list.do";
		var name = "사과 목록";
		var option = "width=530, height=750, left=150, location=yes";
		openwin = window.open(url, name, option);
	}
	
	
	
	function getGb(){
		if(document.getElementById('ysmId').value.length > 0){
			var token = $("meta[name='_csrf']").attr("th:content");
			var header = $("meta[name='_csrf_header']").attr("th:content");
			
			$.ajax({
				url : "<c:out value="${pageContext.request.contextPath}" />/yunaDtl_ajax.do",
				type : "post",
				dataType : "json",
				beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
				},
				data : { ysmId : document.getElementById('ysmId').value }
			}).done(function(e){
				var data = e.Detail;
				if(data.gender == "M") {
					$("#gender").val(data.gender);
					$("#genderNm").html("남자");
				} else if(data.gender == "F") {
					$("#gender").val(data.gender);
					$("#genderNm").html("여자");
				}
				var arr = [ 'birthDt',  'mobile' ];
				for(var i=0;i<arr.length;i++){
					$("[data-type='" + arr[i] + "']").text(eval("data." + arr[i] ));
				}
				
			}).fail(function(e){
				alert('서버 오류가 발생하였습니다.');
			})
			
		}
	}
	
	
	
	function fn_reqUploadBox() {
		$("#reqUploadTr").css("display", "");
	}
	function fn_gongUpload() {
		$("#gongUploadTr").css("display" , "");
	}
	
	
	
	
</script>

<style>
	
	.table-style1 input {width:150px;}
	/* td:nth-child(even){text-align:left;} */
	/* td:nth-child(odd){text-align:left;} 홀수 이벤트*/
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
    
    
</style>
<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>
		<c:if test="${empty detail.num }">추가의뢰 등록</c:if>
		<c:if test="${!empty detail.num }">추가의뢰 상세보기</c:if>
	</h2>
	<div class="box-style1 x-scroll-auto" >
		<form id="frm" name="frm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<input type="hidden" id="num" name="num" value="${detail.num }" />
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
							<th>연계구분</th>
							<td>
								<select id="addReqGb" name="addReqGb" style="width:200px;">
									<option value="1">내부연계</option>
									<option value="2">외부연계</option>
								</select>
							</td>
							<th>사과</th>
							<td>
								<input type="text" name="addReq" id="addReq" style="width: 200px;" value="${detail.addReq }" readonly/><button type="button" class="btn-basic" style="padding: 2px 6px;" onclick="javascript:fn_popup();">찾기</button>
							</td>
						</tr>
						<tr>
							<th>ID</th>
							<td>
								<input type="text" id="ysmId" name="ysmId" style="width:200px;" value="${detail.ysmId}" readonly="readonly">
								<button type="button" class="btn-basic" style="padding: 2px 6px;" onclick="javascript:findYunaPopup();">찾기</button>
							</td>
							<th>yunaNo</th>
							<td><input type="text" id="yunaNo" name="yunaNo" style="width: 200px;"  value="${detail.yunaNo}" readonly="readonly" /></td>
						</tr>
						<tr>
							<th>운명</th>
							<td><input type="text" id="fate" name="fate" value="${detail.fate}" style="width: 200px;" readonly="readonly" /></td>
							<th><span id="internalText"></span></th>
							<td>
								<select class="wd200" id="g1Gb" name="g1Gb">
									<option value="">선택하세요</option>
									<c:forEach items="${g1List }" var="list">
										<option value="${list.odr }" >${list.ysmMclassNm}</option>										
									</c:forEach>
								</select>
								<select class="wd200" id="g2Gb" name="g2Gb" >
									<option value="">선택하세요</option>
									<c:forEach items="${g2List }" var="list">
										<option value="${list.odr }" >${list.ysmMclassNm}</option>										
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr id="reqUploadTr" style="display: none;">
							<th>연계의뢰서 업로드</th>
							<td colspan="3">
								<div> 
	 								<input type="file" id="file" name="file" style="width: 400px;"> 
									<button class="btn-basic" style="background-color: gray; color: white; line-height: 15px;">업로드</button>
								</div>
							</td>
						</tr>
						<tr id="gongUploadTr" style="display: none;">
							<th>공문 업로드</th>
							<td colspan="3">
								<div> 
	 								<input type="file" id="file2" name="file2" style="width: 400px;"> 
									<button class="btn-basic" style="background-color: gray; color: white; line-height: 15px;">업로드</button>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
		 <!-- 내부연계의뢰서 시작 -->
			<div class="doc-wrap" style="width: 80%;margin: auto;">
				<div style="text-align: right;">
					<button type="button" class="btn-basic" id="reqUpload" onClick="javascript:fn_reqUploadBox();" style="background-color: green;color:white;">연계의뢰서업로드</button>
					<button type="button" class="btn-basic" id="gongUpload" onClick="javascript:fn_gongUpload();" style="background-color: green;color:white;">공문업로드</button>
				</div>			
		        <div class="doc-box mt20" id="inReq">
		            <div class="box-title noto700 txt-center mt15 mb15">연계의뢰서</div>
		            	
		            	
		            	<div class="sign-box fr">
			                <table class="table-write mg-t5">
			                    <caption>연계의뢰서</caption>
			                    <colgroup>
			                        <col style="width: 15%;" />
			                        <col style="width: 25%;" />
			                        <col style="width: 25%;" />
			                        <col style="width: 25%;" />
			                    </colgroup>
			                    <tbody>
			                        <tr>
			                            <td class="bgG" rowspan="2">&nbsp;결&nbsp;제</td>
			                            <th scope="col">담당</th>
			                            <th scope="col">과장</th>
			                            <th scope="col">관장</th>
			                        </tr>
			                        <tr>
			                            <td class="h70"></td>
			                            <td class="h70"></td>
			                            <td class="h70"></td>
			                        </tr>
			                    </tbody>
			                </table>
		                </div>
		        
		            <div class="tbl-title mt20">
		                담당자 정보
		            </div>
		            <table class="table-write" style="margin-top:1px;">
		                <%-- <caption>연계의뢰서</caption> --%>
		                <colgroup>
		                    <col style="width: 13%;" />
		                    <col style="width: 22%;" />
		                    <col style="width: 10%;" />
		                    <col style="width: 18%;" />
		                    <col style="width: 13%;" />
		                    <col style="width: 22%;" />
		                </colgroup>
		                <tbody>
		                    <tr>
		                        <th scope="col">의뢰부서</th>
		                        <td>
		                            <input type="text" id="reqDept" name="reqDept" class="inp txt-center" readonly="readonly" value="${detail.reqDept }">
		                        </td>
		                        <th scope="col">담당</th>
		                        <td>
		                            <input type="text" id="reqDeptPer" name="reqDeptPer" class="inp txt-center" readonly="readonly" value="${detail.reqDeptPer }">
		                        </td>
		                        <th scope="col">의뢰일</th>
		                        <td>
		                            <input type="text" id="datepicker1" name="reqDt" class="inp txt-center" style="width:170px;" readonly="readonly" value="${detail.reqDt }">
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="col">사과</th>
		                        <td>
		                            <input type="text" id="epilogue" name="epilogue" class="inp txt-center" readonly="readonly" value="${detail.epilogue }">
		                        </td>
		                        <th scope="col">담당</th>
		                        <td>
		                            <input type="text" id="helpDeptPer" name="helpDeptPer" class="inp txt-center" value="${detail.helpDeptPer }" onlyKorean oninput="this.value = this.value.replace(/[^ㄱ-힣/, '');" maxlength="8">
		                        </td>
		                        <th scope="col">회신기한</th>
		                        <td>
		                            <input type="text" id="datepicker2" name="relyTerm" class="inp txt-center" style="width:170px;" readonly="readonly" value="${detail.relyTerm }">
		                        </td>
		                    </tr>
		                </tbody>
		            </table>
		            <div class="tbl-title" style="margin-top:1px;">
		                대상자 정보
		            </div>
		            <table class="table-write" style="margin-top:1px;">
		                <%-- <caption>연계의뢰서</caption> --%>
		                <colgroup>
		                    <col style="width: 13%;" />
		                    <col style="width: 22%;" />
		                    <col style="width: 10%;" />
		                    <col style="width: 18%;" />
		                    <col style="width: 13%;" />
		                    <col style="width: 22%;" />
		                </colgroup>
		                <tbody>
		                    <tr>
		                    	<th scope="col">성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명</th>
								<td><input type="text" class="wd200" id="ysmNm" name="ysmNm" value="${detail.ysmNm}" readonly /></td>
		                    	<th scope="col">성별</th>
		                    	<td><span id="genderNm">${detail.gender }</span></td>
		                    	<th scope="col">생년월일</th>
		                    	<td><span data-type='birthDt'>${detail.birthDt }</span></td>
		                    </tr>
		                    <tr height=33>
		                    	<th scope="col">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</th>
		                    	<td colspan="3"><input type="text" id="addr" name="addr" value="${detail.addr }" /></td>
		                    	<th scope="col">연락처</th>
		                    	<td><span data-type='mobile'>${detail.mobile }</span>
		                    </tr>
		                    <tr>
		                        <th scope="col">대상자<br>특이사항</th>
		                        <td colspan="5">
		                            <textarea id="rcptSgct" name="rcptSgct" class="h120" ><c:out value="${detail.rcptSgct }" /></textarea>
		                        </td>
		                    </tr>
		                </tbody>
		            </table>
		            <div class="tbl-title" style="margin-top:1px;">
		                요청사항
		            </div>
		            <table class="table-write" style="margin-top:1px;">
		                <%-- <caption>연계의뢰서</caption> --%>
		                <colgroup>
		                    <col style="width: 13%;" />
		                    <col style="width: 22%;" />
		                    <col style="width: 10%;" />
		                    <col style="width: 18%;" />
		                    <col style="width: 13%;" />
		                    <col style="width: 22%;" />
		                </colgroup>
		                <tbody>
		                    <tr>
		                        <th scope="col">의뢰사유<br>및<br>요청사항</th>
		                        <td colspan="5">
		                            <textarea id="reqResnCntn" name="reqResnCntn" class="h150"><c:out value="${detail.reqResnCntn }" /></textarea>
		                        </td>
		                    </tr>
		                </tbody>
		            </table>
		            <div class="tbl-title" style="margin-top:1px;">
		                연계에 대한 회신내용
		            </div>
		            <table class="table-write" style="margin-top:1px;">
		                <%-- <caption>연계의뢰서</caption> --%>
		                <colgroup>
		                    <col style="width: 13%;" />
		                    <col style="width: 22%;" />
		                    <col style="width: 10%;" />
		                    <col style="width: 18%;" />
		                    <col style="width: 13%;" />
		                    <col style="width: 22%;" />
		                </colgroup>
		                <tbody>
		                    <tr>
		                        <th scope="col">처리결과</th>
		                        <td colspan="5">
		                            <textarea id="pgrsRslt" name="pgrsRslt" class="h200"><c:out value="${detail.pgrsRslt }" /></textarea>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="col">비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고</th>
		                        <td colspan="5">
		                            <textarea id="etc" name="etc" ><c:out value="${detail.etc }" /></textarea>
		                        </td>
		                    </tr>
		                </tbody>
		            </table>
		           
		        </div>
		    </div>
    <!-- 내부연계의뢰서 끝  -->
    <!-- 외부연계의뢰서 시작  -->
	    <div class="doc-wrap" style="width: 80%;margin: auto;">
			    <div class="doc-wrap" id="outReq" style="display: none;">
			        <div class="doc-box mt20">
			            <div class="box-title noto700 txt-center mt15 mb15">연계의뢰서</div>
			            <table class="table-write" style="border-bottom: none; width: 975px;">
			                <caption>연계의뢰서</caption>
			                <colgroup>
			                    <col style="width: 11.3%;" />
			                    <col style="width: 35%;" />
			                    <col style="width: 11.3%;" />
			                    <col style="width: 35%;" />
			                </colgroup>
			                <tbody>
			                    <tr style="border-bottom: none;">
			                        <th style="border-bottom: none;" scope="col">의뢰일시</th>
			                        <td style="border-bottom: none;"><span>20<input type="text" class="inp month" id="year" name="year" maxlength="2" style="width:25px;" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('#year2').val(this.value);" value="${detail.year }" /></span>년&nbsp;&nbsp;&nbsp;<span><input type="text" class="inp month" id="month" name="month" maxlength="2" style="width:25px;" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('#month2').val(this.value);" value="${detail.month }"></span>월&nbsp;&nbsp;&nbsp;<span><input type="text" id="day" name="day" class="inp month" maxlength="2" style="width:25px;" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('#day2').val(this.value);" value="${detail.day }"></span>일</td>
			                        <th style="border-bottom: none;" scope="col">의뢰담당자</th>
			                        <td style="border-bottom: none;"><input type="text" class="inp txt-left w130" id="linkReqName" name="linkReqName" style="width:120px;" oninput="$('#orgName').val(this.value);" value="${detail.linkReqName }">&nbsp;&nbsp;&nbsp;(☎&nbsp;&nbsp;<input type="text" class="inp w130 txt-left" id="linkReqNmTel" name="linkReqNmTel" style="width:120px;" oninput="this.value = this.value.replace(/[^0-9]/g, '');" value="${detail.linkReqNmTel }">)</td>
			                    </tr>
			                </tbody>
			            </table>
			            <table class="table-write">
			                <%-- <caption>연계의뢰서</caption> --%>
			                <colgroup>
			                    <col style="width: 12%;" />
			                    <col style="width: 15%;" />
			                    <col style="width: 28%;" />
			                    <col style="width: 15%;" />
			                    <col style="width: 27.7%;" />
			                </colgroup>
			                <tbody>
			                    <tr>
			                        <th rowspan="4" scope="col">내담자<br>인적사항</th>
			                        <td>YUNA NO</td>
			                        <td colspan="3">
			                            <input type="text" class="inp txt-left" id="yunaNo2" name="yunaNo2" readonly="readonly" value="${detail.yunaNo }" >
			                        </td>
			                    </tr>
			                    <tr>
			                        <td>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명</td>
			                        <td>
			                            <input type="text" class="inp txt-left w130" id="ysmNm2" name="ysmNm2" style="width:150px;" readonly="readonly" value="${detail.ysmNm }">(남, 여)
			                        </td>
			                        <td>연&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;령</td>
			                        <td>
			                            <input type="text" class="inp14 three" maxlength="3" id="age" name="age" style="width:50px;" value="${detail.age }" oninput="this.value = this.value.replace(/[^0-9]/g, '');"><span class="poR65">세</span>
			                        </td>
			                    </tr>
			                    <tr>
			                        <td>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</td>
			                        <td>
			                            <input type="text" class="inp txt-left" id="addr2" name="addr2" value="${detail.addr }">
			                        </td>
			                        <td>연&nbsp;&nbsp;락&nbsp;&nbsp;처</td>
			                        <td style="text-align: left;">
			                            <input type="text" class="inp txt-center" id="tel" name="tel" value="${detail.mobile }" maxlength="20" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
			                        </td>
			                    </tr>
			                    <tr>
			                        <td>건강상태<br>(복용약포함)</td>
			                        <td>
			                            <textarea class="h50" id="cnsleHelth" name="cnsleHelth"><c:out value="${detail.cnsleHelth }"/></textarea>
			                        </td>
			                        <td>공적부조</td>
			                        <td>의료보호 1종 /<br>의료보호 2종<br>(※해당자만 체크)</td>
			                    </tr>
			                    <tr>
			                        <th scope="col">심리<br>검사<br>결과</th>
			                        <td colspan="4" class="txt-left">
			                            <!-- <span class="ml30">· GDS-KR(우울검사) : </span><span class="ml42"><input type="text" class="inp txt-right w130" id="" name="" style="width:200px;">점(30점만점기준)</span><br> -->
			                            <span class="ml30">· MMSE-DS(인지기능검사) : <input type="text" class="inp txt-left w130" id="psycRstMmseds" name="psycRstMmseds" style="width:40px;" oninput="this.value = this.value.replace(/[^0-9]/g, '');" value="${detail.psycRstMmseds }" maxlength="3">점(30점만점기준)</span><br>
			                            <span class="ml30">· 기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;타 : <input type="text" class="inp txt-left w130" id="psycRstEtc" name="psycRstEtc" style="width:200px;" value="${detail.psycRstEtc }" maxlength="20"></span>
			                        </td>
			                    </tr>
			                    <tr>
			                        <th scope="col">내담자<br>특이<br>사항</th>
			                        <td colspan="4">
			                            <textarea class="h100" id="cnslePsycRst" name="cnslePsycRst"><c:out value="${detail.cnslePsycRst }"/></textarea>
			                        </td>
			                    </tr>
			                    <tr>
			                        <th scope="col">상담사<br>의견</th>
			                        <td colspan="4">
			                            <textarea class="h100" id="cnsrOp" name="cnsrOp"><c:out value="${detail.cnsrOp }"/></textarea>
			                        </td>
			                    </tr>
			                    <tr>
			                        <th class="txtGr" scope="col">연계요청<br>사항</th>
			                        <td colspan="4">
			                            <textarea class="h100" id="linkReqDesc" name="linkReqDesc"><c:out value="${detail.linkReqDesc }"/></textarea>
			                        </td>
			                    </tr>
			                    <tr>
			                        <th rowspan="3" scope="col">연계에<br>대한<br>회신내용</th>
			                        <td>사과</td>
			                        <td>
			                            <input type="text" class="inp txt-center" id="epilogueNm" name="epilogueNm" value="${detail.epilogueNm }" readonly>
			                        </td>
			                        <td>기관연락처</td>
			                        <td>
			                            <input type="text" class="inp txt-center" id="linkReqOrgTel" name="linkReqOrgTel" value="${detail.linkReqOrgTel }" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
			                        </td>
			                    </tr>
			                    <tr>
			                        <td>담당자</td>
			                        <td>
			                            <input type="text" class="inp txt-center" id="linkReqRecvName" name="linkReqRecvName" value="${detail.linkReqRecvName }" maxlength="8">
			                        </td>
			                        <td>회신일자</td>
			                        <td>
			                            <span>20<input type="text" class="inp month" maxlength="2" id="linkReqRecvYear" name="linkReqRecvYear" style="width:25px;" oninput="this.value = this.value.replace(/[^0-9]/g, '');" value="${detail.linkReqRecvYear }"></span>년&nbsp;&nbsp;&nbsp;<span><input type="text" class="inp month" maxlength="2" id="linkReqRecvMonth" name="linkReqRecvMonth" style="width:25px;" oninput="this.value = this.value.replace(/[^0-9]/g, '');" value="${detail.linkReqRecvMonth }"></span>월&nbsp;&nbsp;&nbsp;<span><input type="text" class="inp month" maxlength="2" id="linkReqRecvDay" name="linkReqRecvDay" style="width:25px;" oninput="this.value = this.value.replace(/[^0-9]/g, '');" value="${detail.linkReqRecvDay }"></span>일
			                        </td>
			                    </tr>
			                    <tr>
			                        <td>요청사항에<br>대한<br>처리결과</td>
			                        <td colspan="3">
			                            <textarea class="h100" id="linkReqRecvRst" name="linkReqRecvRst"><c:out value="${detail.linkReqRecvRst }"/></textarea>
			                        </td>
			                    </tr>
			                </tbody>
			            </table>
			            <div class="doc-wrap" style="width: 80%;margin: auto;">
			                <br>
			                <p class="txt-center fs20">위 사례에 대해 진행된 결과를 14일 이내 다시 통보해 주시기 바랍니다.</p>
			                <p class="txt-center mt30">
			                    <span>20<input type="text" class="inp month" maxlength="2" id="year2" name="" style="width:25px;" value="${detail.year }" readonly="readonly"></span>년&nbsp;&nbsp;&nbsp;<span><input type="text" class="inp month" maxlength="2" id="month2" name="" style="width:25px;" value="${detail.month }" readonly="readonly"></span>월&nbsp;&nbsp;&nbsp;<span><input type="text" class="inp month" maxlength="2" id="day2" name="" style="width:25px;" value="${detail.day }" readonly="readonly"></span>일
			                </p>
			                <div style="text-align:center;">
			                    <p>의&nbsp;&nbsp;&nbsp;&nbsp;뢰&nbsp;&nbsp;&nbsp;&nbsp;자&nbsp;&nbsp;&nbsp;&#58;&nbsp;&nbsp;&nbsp;
			                        <span><input type="text" class="inp long" maxlength="9" id="orgName" name="orgName" style="width:120px;" readonly="readonly" value="${detail.orgName }"  ></span>(인)
			                    </p>
			                    <p>기&nbsp;&nbsp;&nbsp;&nbsp;관&nbsp;&nbsp;&nbsp;&nbsp;명&nbsp;&nbsp;&nbsp;&#58;&nbsp;&nbsp;&nbsp;
			                        <span><input type="text" class="inp long" id="reqName" name="reqName" style="width:250px;" readonly="readonly" value="${detail.reqName }"></span>
			                    </p>
			                </div>
			            </div>
			        </div>
			    </div>
		 </div>
			<div class="btn" style="text-align: right; display: block;">
				<button type="button" class="btn-basic" id="uBtn" onclick="javascript:fn_reg('${detail.num}');">수정</button>
				<button type="button" class="btn-basic" id="sBtn" onclick="javascript:fn_reg('S');">저장</button>
				<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd }');" style="background-color:#fc692f;color:white;">목록</button>
			</div>	
   		</div>
	</form>
	
	<!-- 외부연계의뢰서 끝  -->	    
	</div>
	
	
	
</section>
</html>