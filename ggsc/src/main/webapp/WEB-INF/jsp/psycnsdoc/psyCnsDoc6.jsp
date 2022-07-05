<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <title>한국형 알코올 중독 선별 검사(AUDIT-K)</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
	<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<meta http-equiv="content-language" content="ko">
	<meta name="_csrf" th:content="${_csrf.token}"/>
	<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
    <link href="/gnoincoundb/css/psyDocument/common.css" rel="stylesheet">
	<link rel="stylesheet" href="/gnoincoundb/css/jquery-accordion-menu.css">
	<link rel="stylesheet" href="/gnoincoundb/css/jquery-ui.css">
	
	<script src="/gnoincoundb/js/jquery/jquery-1.11.2.min.js"></script>
	<script src="/gnoincoundb/js/jquery/jquery.form.js"></script>
	<script src="/gnoincoundb/js/jquery/jquery-migrate-1.4.1.js"></script>
	<script src="/gnoincoundb/js/jquery/jquery-accordion-menu.js" type="text/javascript"></script>
	<script src="/gnoincoundb/js/jquery/jquery-ui.min.js" type="text/javascript"></script>
	<script src="/gnoincoundb/js/common.js"></script>
</head>
<script>
	if('${param.gIdx}' == ''){
		opener.location.reload();
		var msg = "${msg}";
	 	if(msg.length > 0) {
	  		alert(msg);
	 	}
		window.close();
	}
	$(document).ready(function() {
	  	getValues();
	});
	
	
	function getValues(){
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		$.ajax({
			url : "/gnoincoundb/getPsyCnsDocValue.do",
			type : "post",
			data : { gIdx : '${param.gIdx}', psyIdx : '${param.psyNum}', dtlIdx : '${param.dtlIdx}' },
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			}
		}).done(function(e){
			if(e.list!=null){
				var obj = Object.entries(e.list);
				for(var i=0;i<obj.length;i++){
					var c = obj[i];
					if($("[name='" + c[0] + "']").length > 0){
					 var t = $("[name='" + c[0] + "']")[0].type;
					 
					 if(t == 'radio'){
						 $("[name='" + c[0] + "'][value='" + c[1] + "']").prop('checked',true);
					 }else if(t == 'checkbox'){
					 	if(c[1]=='Y'){
					 		$("[name='" + c[0] + "']").prop('checked',true);
					 	}
					 	
					 }else{
						$("[name='" + c[0] + "']").val(c[1]);
					 }
					}
					
				}
				
				console.log(e);
			}
		}).fail(function(e){
			alert('서버 오류가 발생하였습니다.');
		});
		
	}
	
	function fn_reg(){
		var cnsGb = $("#cnsGb").val();
		if(cnsGb == "노인상담") {
			$("#cnsGbCd").val("1");
		} else if(cnsGb == "중장년층상담") {
			$("#cnsGbCd").val("2");
		}
		
		var cnsleNm = $("#cnsleNm").val();
		var writeDt = $('input[name=writeDt]').val();
		if(cnsleNm.length == 0) {
			alert("내담자를 선택해주세요.");
			$("#cnsleNm").focus();
			return false;
		}
		
		if(writeDt.length == 0) {
			alert("검사일을 입력해주세요.");
			$("input[name=writeDt]").focus();
			return false;
		}
		
		if(confirm("등록(수정) 하시겠습니까?")){
			document.frm.action = "/gnoincoundb/psyCnsDocReg.do";
	       	document.frm.submit();
		}
	}  	
	
	function findUserPopup(){
		var userNm = $("#cnsleNm").val();
		userNm = encodeURI(encodeURIComponent(userNm));		
		var url = "/gnoincoundb/findUserPopup.do?userNm=" + userNm+"&cnsTargetGb=Y&cnsPerTargetGb=Y";
		var name = "회원 찾기";
		var option = "width = 530, height = 750, top = 50, left = 250, location = yes";
		window.open(url, name, option);encodeURI(encodeURIComponent(jindan_name));
	}
</script>
<style>
    .box-title {
        font-size: 35px;
    }

    .inp {
        width: 95%;
        font-family: 'Noto Sans KR', sans-serif;
        color: #333333;
        font-size: 16px;
        position: relative;
        top: 0px;
        font-weight: 500;
    }

    .month {
        width: 20px;
        top: -3px;
    }

    .name {
        width: 45px;
        top: -3px;
    }

    .headName {
        font-size: 16px;
        border: 2px solid #333;
        border-radius: 5px;
        width: 282px;
        padding: 0px 10px 0px 10px;
    }

    .tbl {
        border: 2px solid #333;
    }

    .tbl tbody>tr {
        padding: 5px;
        font-weight: 500;
        font-size: 16px;
    }

    .tbl2 thead>tr>th {
        padding: 5px;
        font-weight: 500;
        font-size: 16px;
    }

    .tbl2 tbody>tr {
        padding: 5px;
        font-weight: 400;
        font-size: 16px;
    }
    
    .fs24 {
        font-size: 20px;
        font-weight: 400;
    }

    .txt {
        font-family: 'Noto Sans KR', sans-serif;
        color: #333333;
        font-size: 16px;
        border: 2px solid #333;
        padding: 10px;
        word-break: break-all;
    }

    .bRight-none {
        border-right: none !important;
    }

    .bBottom {
        border-bottom: 2px solid #333;
    }

    .txt-left {
        text-align: left !important;
    }

    .txtIn40 {
        text-indent: 40px;
    }

    .txtIn20 {
        text-indent: 20px;
    }

    .bgG {
        background-color: #D6D6D6;
    }

    .w30 {
        width: 30%;
        top: -2px;
    }

	.btn-basic {
    	padding: 5px;
    }
    
    .total {
        border: 2px solid #333;
        width: 205px;
        height: 32px;
        font-family: 'Noto Sans KR', sans-serif;
        color: #333333;
        font-size: 16px;
    }
    
    .tot {
        width: 95px;
        height: 28px;
        border-right: 1px solid #333;
        text-align: center;
        float: left;
    }
    
    .num {
        width: 106px;
        height: 28px;
        float: left;
        padding-left: 5px;
    }
    
</style>

<body>
    <div class="doc-wrap">
        <div class="doc-box mt20">
        	<form id="frm" name="frm" method="post">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <!-- <div class="headName noto500">
                Case No. (20<input type="text" class="inp month" maxlength="2" name='no26'>)-(<input type="text" class="inp month" maxlength="2" name='no27'>)-(<input type="text" class="inp month" maxlength="2" name='no28'>)-(<input type="text" class="inp name" maxlength="5" name='no29'>)
            </div> -->
            <div class="box-title noto700 txt-center mt15 mb15">한국형 알코올 중독 선별 검사(AUDIT-K) </div>
            
            <input type='hidden' name='g_idx' value='${param.gIdx}' />
        	<input type='hidden' name='dtl_idx' value='${param.dtlIdx}' />
        	<input type='hidden' name='psy_idx' value='${param.psyNum}' />
            <input type="hidden" id="examDocCd" name="examDocCd" value="${vo.examDocCd }" />
			<input type="hidden" id="examDocNm" name="examDocNm" value="${vo.examDocNm }" />
			<input type="hidden" id="cnsDtlGbCd" name="cnsDtlGbCd" value="1" />
			<input type="hidden" id="cnsCnt" name="cnsCnt" value="3"/>
			<input type="hidden" id="cnsleId" name="cnsleId" />
			<input type="hidden" id="caseNo" name="caseNo" />
			<input type="hidden" id="cnsGb"  />
			<input type="hidden" id="cnsGbCd" name="cnsGb" />
			
            <table class="tbl">
                <caption>한국형 알코올 중독 선별 검사(AUDIT-K)</caption>
                <colgroup>
                    <col style="width: 8%;" />
                    <col style="width: 10%;" />
                    <col style="width: 8%;" />
                    <col style="width: 10%;" />
                    <col style="width: 8%;" />
                    <col style="width: 10%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col">이&nbsp;&nbsp;&nbsp;&nbsp;름</th>
                        <td>
                            <input type="text" class="inp" id="cnsleNm" name="cnsleNm" style="width: 70%;" readonly><button type="button" class="btn-basic" style="padding: 2px 6px;background: skyblue;" onclick="javascript:findUserPopup();">찾기</button>
                        </td>
                        <th scope="col">연락처</th>
                        <td>
                            <input type="text" class="inp" id="mobile" name="telNo" oninput="this.value = this.value.replace(/[^0-9]/, '');" maxlength="20">
                        </td>
                        <th scope="col">검사일</th>
                        <td>
                            <input type="text" id="datepicker1" class="inp" name="writeDt" style="width: 80%;" readonly>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="txt mt15">
            	※ 다음 문항은 알코올중독선별검사를 위한 내용입니다. 
            	<br/>다음의 각 문항을 읽고 귀하의 생각에 가장 적합하다고 생각되는 곳에 ‘√’표해 주시기 바랍니다.
            </div>
            <table class="tbl2 mt15">
                <caption>한국형 알코올 중독 선별 검사(AUDIT-K)</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">1. 얼마나 술을 자주 마십니까?</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn" id="no11" name="no1" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no11">전혀 안마심</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" class="radBtn2" id="no12" name="no1" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no12">월1회 미만</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn3" id="no13" name="no1" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no13">월2~4회</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" class="radBtn4" id="no14" name="no1" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no14">주2~3회</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn5" id="no15" name="no1" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no15">주4회 이상</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>한국형 알코올 중독 선별 검사(AUDIT-K)</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">2. 술을 마시면 한 번에 몇 잔 정도 마십니까?</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn" id="no21" name="no2" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no21">전혀 안마심</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" class="radBtn2" id="no22" name="no2" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no22">소주 반병 이하</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn3" id="no23" name="no2" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no23">소부 반병 정도</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" class="radBtn4" id="no24" name="no2" value="4" style="margin-right: 5px; margin-bot 	tom: 4px;" /><label for="no124">소주 반병과 1병사이</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn5" id="no25" name="no2" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no25">소주 한병 이상</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>한국형 알코올 중독 선별 검사(AUDIT-K)</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">
                            3. 한번에 소주 한병 또는 맥주 4병이상 마시는 경우는 얼마나 자주 있습니까?
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn" id="no31" name="no3" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no31">없음</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" class="radBtn2" id="no32" name="no3" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no32">월1회 미만</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn3" id="no33" name="no3" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no33">월1회</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" class="radBtn4" id="no34" name="no3" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no34">주1회</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn5" id="no35" name="no3" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no35">거의 매일</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>한국형 알코올 중독 선별 검사(AUDIT-K)</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">
                            4. 지난 1년 간 한번 술을 마시기 시작하면 멈출 수 없었던 때가 얼마나 자주 있었습니까?
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn" id="no41" name="no4" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no41">없음</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" class="radBtn2" id="no42" name="no4" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no42">월1회 미만</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn3" id="no43" name="no4" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no43">월1회</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" class="radBtn4" id="no44" name="no4" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no44">주1회</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn5" id="no45" name="no4" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no45">거의 매일</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>한국형 알코올 중독 선별 검사(AUDIT-K)</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">5. 지난 1년 간 평소 같으면 할 수 있던 일을 음주 때문에 실패한 적이 얼마나 자주 있었습니까?</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn" id="no51" name="no5" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no51">없음</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" class="radBtn2" id="no52" name="no5" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no52">월1회 미만</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn3" id="no53" name="no5" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no53">월1회</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" class="radBtn4" id="no54" name="no5" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no54">주1회</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn5" id="no55" name="no5" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no55">거의 매일</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>한국형 알코올 중독 선별 검사(AUDIT-K)</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">6. 지난 1년 간 술을 마신 다음날 일어나기 위해 해장술이 필요했던 적이 얼마나 자주 있었습니까?</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn" id="no61" name="no6" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no61">없음</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" class="radBtn2" id="no62" name="no6" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no62">월1회 미만</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn3" id="no63" name="no6" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no63">월1회</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" class="radBtn4" id="no64" name="no6" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no64">주1회</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn5" id="no65" name="no6" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no65">거의 매일</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>한국형 알코올 중독 선별 검사(AUDIT-K)</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">7. 지난 1년 간 음주 후에 죄책감 등이 든 적이 얼마나 자주 있었습니까?</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn" id="no71" name="no7" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no71">없음</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" class="radBtn2" id="no72" name="no7" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no72">월1회 미만</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn3" id="no73" name="no7" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no73">월1회</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" class="radBtn4" id="no74" name="no7" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no74">주1회</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn5" id="no75" name="no7" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no75">거의 매일</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>한국형 알코올 중독 선별 검사(AUDIT-K)</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">8. 지난 1년 간 음주 때문에 전날 밤에 있었던 일이 기억나지 않았던 적이 얼마나 자주 있었습니까?</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn" id="no81" name="no8" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no81">없음</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" class="radBtn2" id="no82" name="no8" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no82">월1회 미만</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn3" id="no83" name="no8" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no83">월1회</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" class="radBtn4" id="no84" name="no8" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no84">주1회</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn5" id="no85" name="no8" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no85">거의 매일</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>한국형 알코올 중독 선별 검사(AUDIT-K)</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">9. 음주로 인해 자신이나 다른 사람이 다친 적이 있었습니까?</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn" id="no91" name="no9" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no91">없음</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" class="radBtn2" id="no92" name="no9" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no92">-</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn3" id="no93" name="no9" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no93">있지만 지난 1년간은 없음</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" class="radBtn4" id="no94" name="no9" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no94">-</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn5" id="no95" name="no9" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no95">지난 1년간 있었음</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            <table class="tbl2 mt5">
                <caption>한국형 알코올 중독 선별 검사(AUDIT-K)</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 50%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="txt-left txtIn20 bgG bRight-none">10. 친척이나 친구, 의사가 당신이 술 마시는 것을 걱정하거나 당신에게 술 끊기를 권유하는 적이 있었습니까?</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn" id="no101" name="no10" value="1" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no101">없음</label></td>
                        <td>2.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" class="radBtn2" id="no102" name="no10" value="2" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no102">-</label></td>
                    </tr>
                    <tr>
                        <td>3.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn3" id="no103" name="no10" value="3" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no103">있지만 지난 1년간은 없음</label></td>
                        <td>4.</td>
                        <td class="txt-left txtIn40 bRight-none"><input type="radio" class="radBtn4" id="no104" name="no10" value="4" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no104">-</label></td>
                    </tr>
                    <tr class="bBottom">
                        <td>5.</td>
                        <td class="txt-left txtIn40"><input type="radio" class="radBtn5" id="no105" name="no10" value="5" style="margin-right: 5px; margin-bottom: 4px;" /><label for="no105">지난 1년간 있었음</label></td>
                        <td></td>
                        <td class="txt-left txtIn40 bRight-none"></td>
                    </tr>
                </tbody>
            </table>
            
            <table class="tbl2 mt15">
                <caption>점수 누계</caption>
                <colgroup>
                    <col style="width: 40%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" class="txtIn20 bgG">점수누계</th>
                        <th scope="col" class="bgG">1번</th>
                        <th scope="col" class="bgG">2번</th>
                        <th scope="col" class="bgG">3번</th>
                        <th scope="col" class="bgG">4번</th>
                        <th scope="col" class="bgG">5번</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="bBottom2">
                        <td class="txt-left">점수누계 (1번. 0점 / 2번. 1점 / 3번. 2점 / 4번. 3점 / 5번. 4점)</td>
                        <td><input type="text" class="inp num1" id="cnt1" name="no11" value="0" readonly></td>
                        <td><input type="text" class="inp num2" id="cnt2" name="no12" readonly></td>
                        <td><input type="text" class="inp num3" id="cnt3" name="no13" readonly></td>
                        <td><input type="text" class="inp num4" id="cnt4" name="no14" readonly></td>
                        <td><input type="text" class="inp num5" id="cnt5" name="no15" readonly></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="txt-center">정상 음주군</td>
                        <td colspan="5">남성 : 0~9 / 여성 : 0~5</td>
                    </tr>
                     <tr class="bBottom2">
                        <td class="txt-center">위험 음주군</td>
                        <td colspan="5">남성 : 10~19 / 여성 : 6~9</td>
                    </tr>
                     <tr class="bBottom2">
                        <td class="txt-center">알코올 사용장애 추정군</td>
                        <td colspan="5">남성 : 20~40 / 여성 : 10~40</td>
                    </tr>
                </tbody>
            </table>
            <div style="height: 50px;">
	            <div class="total fr mt15">
	                <div class="tot"> 총 점  </div>
	                <div class="num">
	                    <input type="text" class="inp num2" name="no16" id="sumCnt" readonly>
              	 	</div>
	            </div>
	        </div>
            </form>
		     <div class="box-title noto700 txt-center mt15 mb15">
		     	<span class="fs24">출처: 세계보건기구에서 개발함(1987), 2007년 ‘한 잔’의 양을 NIAAA(미국 국가알코올중독연구소)에서   제시한 지침대로 반영하여 연세대학교 정신병원에서 번역, 사용</span>
		     </div>
            <div class="btn" style="text-align: right; display: block; margin-top: 15px;">
            	<button type="button" class="btn-basic" onclick="window.close();" style="background-color:#fc692f;color:white;">닫기</button>
				<c:choose>
	            	<c:when test="${param.dtlIdx == 0}"> <button type="button" class="btn-basic" id="sBtn" onclick="javascript:fn_reg();" style="background-color:#fc692f;color:white;">저장</button> </c:when>
	            	<c:when test="${param.dtlIdx > 0 }"> <button type="button" class="btn-basic" id="uBtn" onclick="javascript:fn_reg();" style="background-color:#fc692f;color:white;">수정</button> </c:when>
	            </c:choose>
			</div>
        </div>
    </div>
</body>
<script>
	$(".radBtn, .radBtn2, .radBtn3, .radBtn4, .radBtn5").change(function(e) {
		var b= $(".radBtn2:checked").length, c= $(".radBtn3:checked").length*2, d= $(".radBtn4:checked").length*3, e= $(".radBtn5:checked").length*4;
		$("#cnt2").val(b);
		$("#cnt3").val(c);
		$("#cnt4").val(d);
		$("#cnt5").val(e);
		$("#sumCnt").val(b+c+d+e);
	});
</script>
</html>