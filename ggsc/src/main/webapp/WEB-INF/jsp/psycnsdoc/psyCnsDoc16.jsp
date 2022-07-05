<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <title>치매 선별용 한국어판 간이정신상태검사</title>
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
	
	$(document).on('click', 'input[type="radio"][name="no3"]', function(){
		var no3 = $(this).val();
		if (no3 == "3") {
			$("#etc").css('display', 'initial');
		} else {
			$("#etc").css('display', 'none');
		}
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
					 	if(c[1]=='V'){
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
		
		var cnt7 = parseInt($("#cnt7").val());
		var isNan = isNaN(cnt7);
		
		if(isNan) {
			alert("검사지를 전부 입력해주세요");
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
	input[type="radio"] + label {
		margin-left  : 5px;
		margin-right : 15px;
	}
	
	textarea {
        width: 100%;
        height: 130px;
        font-family: 'Noto Sans KR', sans-serif;
        color: #333333;
        font-size: 18px;
        font-weight: 500;
    }

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
        font-weight: 700;
        font-size: 18px;
        border: 1px solid #333;
        height: 50px;
    }

    .tbl2 tbody>tr {
        padding: 5px;
        font-weight: 500;
        font-size: 16px;
        height: 50px;
    }

    .fs24 {
        font-size: 24px;
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

    .bgGf {
        background-color: #F2F2F2;
    }

    .bgGt {
        background-color: #E5E5E5;
    }

    .bRight-none {
        border-right: none !important;
    }

    .bLeft-none {
        border-left: none !important;
    }

    .bRight {
        border-right: 2px solid #333 !important;
    }

    .bRight2 {
        border-right: 1px solid #333 !important;
    }

    .bLeft {
        border-left: 2px solid #333;
    }

    .bTop {
        border-top: 2px solid #333;
    }

    .bBot-none {
        border-bottom: none !important;
    }

    .bBottom {
        border-bottom: 2px solid #333 !important;
    }

    .bBottom2 {
        border-bottom: 1px solid #333;
    }

    .bBottom3 {
        border-bottom: 3px double #333;
    }

    .txt-Under {
        text-decoration: underline;
    }

    .txt-left {
        text-align: left !important;
    }
    
    .num {
        width: 106px;
        height: 28px;
        float: left;
        padding-left: 5px;
    }

    .fs24 {
        font-size: 24px;
        font-weight: 400;
    }

	.btn-basic {
    	padding: 5px;
    }

</style>

<body>
    <div class="doc-wrap">
        <div class="doc-box mt20">
        	<form id="frm" name="frm" method="post">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <!-- <div class="headName noto500">
                Case No. (20<input type="text" class="inp month" maxlength="2" name='no31'>)-(<input type="text" class="inp month" maxlength="2" name='no32'>)-(<input type="text" class="inp month" maxlength="2" name='no33'>)-(<input type="text" class="inp name" maxlength="5" name='no34'>)
            </div> -->
            <div class="box-title noto700 txt-center mt15 mb15">
                치매 선별용 한국어판 간이정신상태검사<br>
                <span class="fs24">(Korean version of MMSE for Dementia Screening: MMSE-K)</span>
            </div>
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
                <caption>치매선별용한국어판간이정신상태검사</caption>
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
                        <th scope="col">이&nbsp;&nbsp;름</th>
                        <td>
                            <input type="text" class="inp" id="cnsleNm" name="cnsleNm" style="width: 70%;" readonly><button type="button" class="btn-basic" style="padding: 2px 6px;background: skyblue;" onclick="javascript:findUserPopup();">찾기</button>
                        </td>
                        <th scope="col">성별</th>
                        <td>
                            <label for="genderM" style="margin-right: 5px;">남</label><input type="radio" id="genderM" name="no1" value="M" /> /
                            <label for="genderF" style="margin-right: 5px;">여</label><input type="radio" id="genderF" name="no1" value="F" />
                        </td>
                        <th scope="col">검사일</th>
                        <td>
                            <input type="text" class="inp" id="datepicker1" name="writeDt" style="width: 80%;" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">생년월일</th> 
                        <td colspan="3">
                        	<input type="text" id="birthDt" name="birthDt" onlyNumber maxlength=6 readonly/>
                        </td>	
                    	<th scope="col">학력(교육년수)</th>
						<td>
							<input type="text" style="width: 30px;" name="no2"  onlyNumber maxlength=2 />년
						</td>
                    </tr>
                    <tr>
                    	 <th scope="col">검사장소</th> 
                    	 <td colspan="3">
                    	 	<input type="radio" id="no31" name="no3" value="1" /><label for="no31">치매안심센터</label>
                    	 	<input type="radio" id="no32" name="no3" value="2" /><label for="no32">대상자 집</label>
                    	 	<input type="radio" id="no33" name="no3" value="3" /><label for="no33">기타 :</label>
                    	 	<input type="text" id="etc" name="no4" style="width: 200px; display:none;" />
                    	 </td>
                    	 <th scope="col">검사자</th>
						<td>
							<input type="text" style="width: 80px;" name="no5"  />
						</td>
                    </tr>
                </tbody>
            </table>
            
            <div class="txt mt15">
            	“안녕하세요.  지금부터 <input type="text" id="cnsleNm2" style="width:80px;" readonly />님의 기억력과 사고능력을 살펴보기 위한 질문들을 드리겠습니다.<br/>
					생각나는 대로 최선을 다해 답변해 주시면 됩니다.”
			</div>
			
            <table class="tbl2 mt15">
                <caption>치매선별용한국어판간이정신상태검사</caption>
                <colgroup>
                    <col style="width: 8%;" />
                    <col style="width: 7%;" />
                    <col style="width: 5%;" />
                    <col style="width: 14%;" />
                    <col style="width: 41%;" />
                    <col style="width: 2%;" />
                    <col style="width: 2%;" />
                    <col style="width: 2%;" />
                    <col style="width: 2%;" />
                    <col style="width: 2%;" />
                    <col style="width: 2%;" />
                </colgroup>
                <thead>
                    <tr class="bTop bLeft bRight bBottom">
                        <th scope="col" colspan="5" class="bRight2 bgGt">질문항목</th>
                        <th scope="col" colspan="6" class="bgGf">점수</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="bLeft bRight">
                        <td class="bRight2" rowspan="6">지남력</td>
                        <td class="bRight2" rowspan="5">시간</td>
                        <td class="bRight-none noto400">1.</td>
                        <td colspan="2" class="txt-left bRight2 noto400">오늘 날짜를 말씀해주세요.</td>
                        <td colspan="6" class="bRight2 bgGf"></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400">(1)</td>
                        <td colspan="2" class="txt-left bRight2 noto400">올해는 몇 년도입니까?</td>
                        <td colspan="3" class="bRight2 bgGf">0&nbsp;<input type="radio" class="recoGb" id="no61" name="no6" value="0" /></td>
                        <td colspan="3" class="bgGt">1&nbsp;<input type="radio" class="recoGb1" id="no62" name="no6" value="1" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400">(2)</td>
                        <td colspan="2" class="txt-left bRight2 noto400">지금은 몇 월입니까?</td>
                        <td colspan="3" class="bRight2 bgGf">0&nbsp;<input type="radio" class="recoGb" id="no71" name="no7" value="0" /></td>
                        <td colspan="3" class="bgGt">1&nbsp;<input type="radio" class="recoGb1" id="no72" name="no7" value="1" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400">(3)</td>
                        <td colspan="2" class="txt-left bRight2 noto400">오늘은 며칠입니까?</td>
                        <td colspan="3" class="bRight2 bgGf">0&nbsp;<input type="radio" class="recoGb" id="no81" name="no8" value="0" /></td>
                        <td colspan="3" class="bgGt">1&nbsp;<input type="radio" class="recoGb1" id="no82" name="no8" value="1" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400">(4)</td>
                        <td colspan="2" class="txt-left bRight2 noto400">오늘은 무슨 요일입니까?</td>
                        <td colspan="3" class="bRight2 bgGf">0&nbsp;<input type="radio" class="recoGb" id="no91" name="no9" value="0" /></td>
                        <td colspan="3" class="bgGt">1&nbsp;<input type="radio" class="recoGb1" id="no92" name="no9" value="1" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                    	<td class="bRight2">장소</td>
                        <td class="bRight-none noto400">2.</td>
                        <td colspan="2" class="txt-left bRight2 noto400">지금  <input type="text" id="cnsleNm3" style="width:80px;" readonly /> 님이 계신 여기는 어디인가요? 이 장소가 어디인지 말씀해 주세요.</td>
                        <td colspan="3" class="bRight2 bgGf">0&nbsp;<input type="radio" class="recoGb" id="no101" name="no10" value="0" /></td>
                        <td colspan="3" class="bgGt">1&nbsp;<input type="radio" class="recoGb1" id="no102" name="no10" value="1" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight2" rowspan="5">기억력</td>
                        <td class="bRight2" rowspan="5">기억등록</td>
                        <td class="bRight-none noto400">3.</td>
                        <td colspan="2" class="txt-left bRight2 noto400">
                        	지금부터 외우셔야 하는 문장 하나를 불러드리겠습니다.<br/> 
                        	끝까지 잘 듣고 따라 해 보세요.
                        </td>
						<td colspan="6" rowspan="5" class="bRight2 bgGf">
							점수 없음<br/>(단, 순서 상관없이 대상자가 말한 단어에 ○표)
						</td>
					</tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400">(1차)</td>
                        <td colspan="2" class="txt-left bRight2 noto400">
                        	민수는  <input type="checkbox" name="no11" value="V" /> 
                        	/ 자전거를 타고  <input type="checkbox" name="no12" value="V" /> 
                        	/ 공원에 가서 <input type="checkbox" name="no13" value="V" /> 
                        	/ 11시부터  <input type="checkbox" name="no14" value="V" /> 
                        	/ 야구를 했다 <input type="checkbox" name="no15" value="V" /> 
                        </td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400"></td>
                        <td colspan="2" class="txt-left bRight2 noto400">
                        	잘 하셨습니다. 제가 다시 한번 불러드리겠습니다. <br/>
							이번에도 다시 여쭈어 볼테니 잘 듣고 따라해보세요.
						</td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400">(2차)</td>
                        <td colspan="2" class="txt-left bRight2 noto400">
                        	민수는  <input type="checkbox" name="no16" value="V" /> 
                        	/ 자전거를 타고  <input type="checkbox" name="no17" value="V" /> 
                        	/ 공원에 가서 <input type="checkbox" name="no18" value="V" /> 
                        	/ 11시부터  <input type="checkbox" name="no19" value="V" /> 
                        	/ 야구를 했다 <input type="checkbox" name="no20" value="V" /> 
                        </td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400"></td>
                        <td colspan="2" class="txt-left bRight2 noto400">제가 이 문장을 나중에 여쭤보겠습니다.  잘 기억하세요.</td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight2" rowspan="5">주의력</td>
                        <td class="bRight2" rowspan="3">숫자 바로 따라 말하기</td>
                        <td class="bRight-none noto400">4.</td>
                        <td colspan="2" class="txt-left bRight2 noto400">
                        	제가 불러드리는 숫자를 그대로 따라 해 주세요.  (대상자가 잘 이해하지못하는 경우)  
                        	제가 1-2-3  하고 부르면,  똑같이 1-2-3  이렇게 말씀해 주세요.
                        </td>
                        <td colspan="6" class="bRight2 bgGf"></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400">(1)</td>
                        <td colspan="2" class="txt-left bRight2 noto400">6 – 9 – 7 – 3</td>
                        <td colspan="3" class="bRight2 bgGf">0&nbsp;<input type="radio" class="recoGb" id="no211" name="no21" value="0" /></td>
                        <td colspan="3" class="bgGt">1&nbsp;<input type="radio" class="recoGb2" id="no212" name="no21" value="1" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight-none noto400">(2)</td>
                        <td colspan="2" class="txt-left bRight2 noto400">5 – 7 – 2 – 8 – 4</td>
                        <td colspan="3" class="bRight2 bgGf">0&nbsp;<input type="radio" class="recoGb" id="no221" name="no22" value="0" /></td>
                        <td colspan="3" class="bgGt">1&nbsp;<input type="radio" class="recoGb2" id="no222" name="no22" value="1" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight2" rowspan="2">거꾸로 말하기</td>
                        <td class="bRight-none noto400">5.</td>
                        <td colspan="2" class="txt-left bRight2 noto400">
                        	제가 불러드리는 말을 끝에서부터 거꾸로 따라 해 주세요.  
                        	(대상자가 잘 이해하지 못하는 경우)  OOO님 (대상자 이름)  이름을 거꾸로 하면 OOO 
							이렇게 되지요?  마찬가지로 제가 부르는 말을 거꾸로 말씀해 주세요.
						</td>
						<td colspan="6" class="bRight2 bgGf"></td>
					</tr>
					<tr class="bLeft bRight">
						<td class="bRight-none noto400"></td>
                        <td colspan="2" class="bRight2 noto400">금수강산</td>
                        <td colspan="3" class="bRight2 bgGf">0&nbsp;<input type="radio" class="recoGb" id="no231" name="no23" value="0" /></td>
                        <td colspan="3" class="bgGt">1&nbsp;<input type="radio" class="recoGb2" id="no232" name="no23" value="1" /></td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td class="bRight2">시공간<br/>기능</td>
                        <td class="bRight2">도형모사 (그림1)</td>
                        <td class="bRight-none noto400">6.</td>
                        <td colspan="2" class="txt-left bRight2 noto400">
                        	(그림을 가리키며)  여기 점을 연결하여 그린 그림이 있습니다.<br/>
                        	이 그림과 똑같이 되도록 (아래 반응 공간을 가리키며)  같은 위치에 그려보세요.<br/>
							점을 연결해서 그리시면 됩니다.
                        </td>
						<td colspan="2" class="bRight2 bgGf">0&nbsp;<input type="radio" class="recoGb3" id="no241" name="no24" value="0" /></td>
                        <td colspan="2" class="bgGt">1&nbsp;<input type="radio" class="recoGb3" id="no242" name="no24" value="1" /></td>
                        <td colspan="2" class="bgGf">2&nbsp;<input type="radio" class="recoGb3" id="no243" name="no24" value="2" /></td>
					</tr>
					
					<tr class="bLeft bRight">
                        <td rowspan="3" class="bRight2">집행기능</td>
                        <td class="bRight2">시각추론1<br/>(그림2)</td>
                        <td class="bRight-none noto400">7.</td>
                        <td colspan="2" class="txt-left bRight2 noto400">
                        	여기 모양들이 정해진 순서로 나옵니다. 
                        	모양들을 보면서 어떤 순서로 나오는지 생각해 보세요. 
                        	자(도형을 왼쪽부터 하나씩 가리키며), 네모, 동그라미, 세모, 네모, 빈칸, 세모, 
                        	그렇다면 여기 빈칸에는 무엇이 들어가야 할까요?
                        </td>
						<td colspan="3" class="bRight2 bgGf">0&nbsp;<input type="radio" class="recoGb" id="no251" name="no25" value="0" /></td>
                        <td colspan="3" class="bgGt">1&nbsp;<input type="radio" class="recoGb4" id="no252" name="no25" value="1" /></td>
					</tr>
					<tr class="bLeft bRight">
                        <td class="bRight2">시각추론2<br/>(그림3)</td>
                        <td class="bRight-none noto400">8.</td>
                        <td colspan="2" class="txt-left bRight2 noto400">
                        	(맨 앞 그림을 가리키며)  여기 네 칸 중의 한 칸에 별이 하나 있습니다. 
							두 번째 그림을 가리키며)  별이 이렇게 다른 위치로 이동합니다. 
							어떤 식으로 이동하는지 잘 생각해 보십시오. (마지막 반응 칸을 가리키며) 여기서는
							네 칸 중에 별이 어디에 위치하게 될까요?
                        </td>
						<td colspan="3" class="bRight2 bgGf">0&nbsp;<input type="radio" class="recoGb" id="no261" name="no26" value="0" /></td>
                        <td colspan="3" class="bgGt">1&nbsp;<input type="radio" class="recoGb4" id="no262" name="no26" value="1" /></td>
					</tr>
					<tr class="bLeft bRight">
                        <td class="bRight2">언어추론<br/>(그림4)</td>
                        <td class="bRight-none noto400">9.</td>
                        <td colspan="2" class="txt-left bRight2 noto400">
                        	카드에 숫자와 계절이 하나씩 적혀 있습니다.  ‘1-봄-2-여름~’  
                        	이렇게 연결되어 나갑니다.  
                        	(화살 표시된 빈칸을 가리키며)  여기는 무엇이 들어갈 차례일까요? 
                        </td>
						<td colspan="2" class="bRight2 bgGf">0&nbsp;<input type="radio" class="recoGb42" id="no271" name="no27" value="0" /></td>
                        <td colspan="2" class="bgGt">1&nbsp;<input type="radio" class="recoGb42" id="no272" name="no27" value="1" /></td>
                        <td colspan="2" class="bgGf">2&nbsp;<input type="radio" class="recoGb42" id="no273" name="no27" value="2" /></td>
					</tr>
                    <tr class="bLeft bRight">
                        <td rowspan="12" class="bRight2">기억력</td>
                        <td rowspan="12" class="bRight2">기억회상<br/>/재인1</td>
                        <td class="bRight-none noto400">10.</td>
                        <td colspan="2" class="txt-left bRight2 noto400">
                        	제가 조금 전에 외우라고 불러드렸던 문장을 다시 한번 말씀해 주세요.<br/>
							[조금 전에 외우시라고 불러드렸던 문장(한 문장의 이야기)을 말씀해 보세요.
                        </td>
						<td colspan="6" rowspan="2" class="bRight2 bgGf"></td>
					</tr>
					<tr class="bLeft bRight">
                        <td colspan="2" class="bRight2 noto400 bgGf">기억회상(각  2점)</td>
                        <td class="bRight2 noto400 bgGf">재인(기억회상 과제에서 회상하지 못한 항목만 시행.  각  1점)</td>
					</tr>
					<tr class="bLeft bRight">
                        <td colspan="2" rowspan="2" class="bRight2 noto400">
                        	민수 <input type="checkbox" name="no28" value="V" />
						</td>
                        <td class="bRight2 noto400">제가 아까 어떤 사람의 이름을 말했는데 누구일까요?</td>
                        <td rowspan="2" colspan="2" class="bRight2 bgGf">0&nbsp;<input type="radio" class="recoGb5" id="no291" name="no29" value="0" /></td>
                        <td rowspan="2" colspan="2" class="bgGt">1&nbsp;<input type="radio" class="recoGb5" id="no292" name="no29" value="1" /></td>
                        <td rowspan="2" colspan="2" class="bgGf">2&nbsp;<input type="radio" class="recoGb5" id="no293" name="no29" value="2" /></td>
					</tr>
					<tr class="bLeft bRight">
						<td class="bRight2 noto400">
							영수&nbsp;<input type="radio" id="no301" name="no30" value="1" /> &emsp;
							민수&nbsp;<input type="radio" id="no302" name="no30" value="2" /> &emsp;
							진수&nbsp;<input type="radio" id="no303" name="no30" value="3" />
	                    </td>
					</tr>
	                <tr class="bLeft bRight">
                        <td colspan="2" rowspan="2" class="bRight2 noto400">
                        	자전거 <input type="checkbox" name="no31" value="V" />
						</td>
                        <td class="bRight2 noto400">무엇을 타고 갔습니까?</td>
                        <td rowspan="2" colspan="2" class="bRight2 bgGf">0&nbsp;<input type="radio" class="recoGb5" id="no321" name="no32" value="0" /></td>
                        <td rowspan="2" colspan="2" class="bgGt">1&nbsp;<input type="radio" class="recoGb5" id="no322" name="no32" value="1" /></td>
                        <td rowspan="2" colspan="2" class="bgGf">2&nbsp;<input type="radio" class="recoGb5" id="no323" name="no32" value="2" /></td>
					</tr>
					<tr class="bLeft bRight">
						<td class="bRight2 noto400">
							버스 &nbsp;<input type="radio" id="no331" name="no33" value="1" /> &emsp;
							오토바이&nbsp;<input type="radio" id="no332" name="no33" value="2" /> &emsp;
							자전거&nbsp;<input type="radio" id="no333" name="no33" value="3" />
	                    </td>
					</tr>
					<tr class="bLeft bRight">
                        <td colspan="2" rowspan="2" class="bRight2 noto400">
                        	공원 <input type="checkbox" name="no34" value="V" />
						</td>
                        <td class="bRight2 noto400">어디에 갔습니까?</td>
                        <td rowspan="2" colspan="2" class="bRight2 bgGf">0&nbsp;<input type="radio" class="recoGb5" id="no351" name="no35" value="0" /></td>
                        <td rowspan="2" colspan="2" class="bgGt">1&nbsp;<input type="radio" class="recoGb5" id="no352" name="no35" value="1" /></td>
                        <td rowspan="2" colspan="2" class="bgGf">2&nbsp;<input type="radio" class="recoGb5" id="no353" name="no35" value="2" /></td>
					</tr>
					<tr class="bLeft bRight">
						<td class="bRight2 noto400">
							공원 &nbsp;<input type="radio" id="no361" name="no36" value="1" /> &emsp;
							놀이터 &nbsp;<input type="radio" id="no362" name="no36" value="2" /> &emsp;
							운동장 &nbsp;<input type="radio" id="no363" name="no36" value="3" />
	                    </td>
					</tr>
                    <tr class="bLeft bRight">
                        <td colspan="2" rowspan="2" class="bRight2 noto400">
                        	11시 <input type="checkbox" name="no37" value="V" />
						</td>
                        <td class="bRight2 noto400">몇 시부터 했습니까?</td>
                        <td rowspan="2" colspan="2" class="bRight2 bgGf">0&nbsp;<input type="radio" class="recoGb5" id="no381" name="no38" value="0" /></td>
                        <td rowspan="2" colspan="2" class="bgGt">1&nbsp;<input type="radio" class="recoGb5" id="no382" name="no38" value="1" /></td>
                        <td rowspan="2" colspan="2" class="bgGf">2&nbsp;<input type="radio" class="recoGb5" id="no383" name="no38" value="2" /></td>
					</tr>
					<tr class="bLeft bRight">
						<td class="bRight2 noto400">
							10시 &nbsp;<input type="radio" id="no391" name="no39" value="1" /> &emsp;
							11시 &nbsp;<input type="radio" id="no392" name="no39" value="2" /> &emsp;
							12시 &nbsp;<input type="radio" id="no393" name="no39" value="3" />
	                    </td>
					</tr>
					<tr class="bLeft bRight">
                        <td colspan="2" rowspan="2" class="bRight2 noto400">
                        	야구 <input type="checkbox" name="no40" value="V" />
						</td>
                        <td class="bRight2 noto400">무엇을 했습니까?</td>
                        <td rowspan="2" colspan="2" class="bRight2 bgGf">0&nbsp;<input type="radio" class="recoGb5" id="no411" name="no41" value="0" /></td>
                        <td rowspan="2" colspan="2" class="bgGt">1&nbsp;<input type="radio" class="recoGb5" id="no412" name="no41" value="1" /></td>
                        <td rowspan="2" colspan="2" class="bgGf">2&nbsp;<input type="radio" class="recoGb5" id="no413" name="no41" value="2" /></td>
					</tr>
					<tr class="bLeft bRight">
						<td class="bRight2 noto400">
							농구 &nbsp;<input type="radio" id="no421" name="no42" value="1" /> &emsp;
							축구 &nbsp;<input type="radio" id="no422" name="no42" value="2" /> &emsp;
							야구 &nbsp;<input type="radio" id="no423" name="no42" value="3" />
	                    </td>
					</tr>
					<tr class="bLeft bRight">
                        <td rowspan="5" class="bRight2">언어기능</td>
                        <td rowspan="4" class="bRight2">이름대기<br/>(그림5)</td>
                        <td class="bRight-none noto400">11.</td>
                        <td colspan="2" class="txt-left bRight2 noto400">
                        	여기 있는 이 그림의 이름을 말씀해 주세요.  이것은 무엇입니까?
                        </td>
						<td colspan="6" class="bRight2 bgGf"></td>
					</tr>
					<tr class="bLeft bRight">
                        <td class="bRight-none noto400">(1)</td>
                        <td class="txt-left bRight2 noto400">칫솔</td>
                        <td class="bRight2 noto400">
							대상자 반응 &nbsp;<input type="text" id="no43" name="no43" /> &emsp;
	                    </td>
						<td colspan="3" class="bRight2 bgGf">0&nbsp;<input type="radio" class="recoGb" id="no441" name="no44" value="0" /></td>
                        <td colspan="3" class="bgGt">1&nbsp;<input type="radio" class="recoGb6" id="no442" name="no44" value="1" /></td>
					</tr>
					<tr class="bLeft bRight">
                        <td class="bRight-none noto400">(2)</td>
                        <td class="txt-left bRight2 noto400">그네</td>
                        <td class="bRight2 noto400">
							대상자 반응 &nbsp;<input type="text" id="no45" name="no45" /> &emsp;
	                    </td>
						<td colspan="3" class="bRight2 bgGf">0&nbsp;<input type="radio" class="recoGb" id="no461" name="no46" value="0" /></td>
                        <td colspan="3" class="bgGt">1&nbsp;<input type="radio" class="recoGb6" id="no462" name="no46" value="1" /></td>
					</tr>
					<tr class="bLeft bRight">
                        <td class="bRight-none noto400">(3)</td>
                        <td class="txt-left bRight2 noto400">주사위</td>
                        <td class="bRight2 noto400">
							대상자 반응 &nbsp;<input type="text" id="no47" name="no47" /> &emsp;
	                    </td>
						<td colspan="3" class="bRight2 bgGf">0&nbsp;<input type="radio" class="recoGb" id="no481" name="no48" value="0" /></td>
                        <td colspan="3" class="bgGt">1&nbsp;<input type="radio" class="recoGb6" id="no482" name="no48" value="1" /></td>
					</tr>
					<tr class="bLeft bRight">
                        <td class="bRight2">이해력</td>
                        <td class="bRight-none noto400">12.</td>
                        <td colspan="2" class="txt-left bRight2 noto400">
                        	제가 말씀드리는 대로 행동으로 그대로 보여주십시오.
                        	<br/>
                        	박수를 두 번 치고, 주먹을 쥐세요. 
                        </td>
						<td colspan="3" class="bRight2 bgGf">0&nbsp;<input type="radio" class="recoGb" id="no491" name="no49" value="0" /></td>
                        <td colspan="3" class="bgGt">1&nbsp;<input type="radio" class="recoGb6" id="no492" name="no49" value="1" /></td>
					</tr>
                    <tr class="bLeft bRight">
                        <td class="bRight2 bBottom" rowspan="2">집행기능</td>
                        <td class="bRight2 bBottom" rowspan="2">유창성</td>
                        <td class="bRight-none noto400">13.</td>
                        <td colspan="2" class="txt-left bRight2 noto400">지금부터 제가 그만이라고 말할 때까지 과일이나 채소를 최대한 많이 이야기해 주세요.  준비되셨지요? 자, 과일이나 채소 이름을 말씀해 주세요.  시작!</td>
                        <td colspan="6" class="bgGf">
                        	<input type="text" id="no50" name="no50" style="width:25%;" /> 개
                        </td>
                    </tr>
                    <tr class="bLeft bRight">
                        <td colspan="3" class="bRight2 noto400 bBottom">
                        	[반응기록/제한 시간 1분]  0-8개:  0점 /  9-14개:  1점 /  15개 이상:  2점 <br/>
                        	<textarea id="cnsBefore" name="no51" ></textarea>
                        </td>
                        <td rowspan="2" colspan="2" class="bRight2 bgGf bBottom">0&nbsp;<input type="radio" class="recoGb43" id="no521" name="no52" value="0" /></td>
                        <td rowspan="2" colspan="2" class="bgGt bBottom">1&nbsp;<input type="radio" class="recoGb43" id="no522" name="no52" value="1" /></td>
                        <td rowspan="2" colspan="2" class="bgGf bBottom">2&nbsp;<input type="radio" class="recoGb43" id="no523" name="no52" value="2" /></td>
                        
                    </tr>
                </tbody>
            </table>
		 	<div class="tbl-title mt30">
		 		 ◉ 결과요약표
            </div>            
            
            <table class="tbl2 mt15">
                <caption>점수 누계</caption>
                <colgroup>
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" class="bgG">인지영역</th>
                        <th scope="col" class="bgG">지남력</th>
                        <th scope="col" class="bgG">주의력</th>
                        <th scope="col" class="bgG">시공간지능</th>
                        <th scope="col" class="bgG">집행기능</th>
                        <th scope="col" class="bgG">기억력</th>
                        <th scope="col" class="bgG">언어기능</th>
                        <th scope="col" class="bgG">총점</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="bBottom2">
                    	<td>점수</td>
                        <td><input type="text" class="inp num1" id="cnt1" name="no53" readonly></td>
                        <td><input type="text" class="inp num2" id="cnt2" name="no54" readonly></td>
                        <td><input type="text" class="inp num3" id="cnt3" name="no55" readonly></td>
                        <td><input type="text" class="inp num4" id="cnt4" name="no56" readonly></td>
                        <td><input type="text" class="inp num5" id="cnt5" name="no57" readonly></td>
                        <td><input type="text" class="inp num6" id="cnt6" name="no58" readonly></td>
                        <td><input type="text" class="inp num7" id="cnt7" name="no59" readonly></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="txt-center">판정</td>
                        <td colspan="4">정상 <input type="radio" id="no601" name="no60" value="1" /></td>
                        <td colspan="3">인지저하 의심  <input type="radio" id="no602" name="no60" value="2" /></td>
                    </tr>
                </tbody>
            </table>
            
            </form>
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
	$(".recoGb, .recoGb1, .recoGb2, .recoGb3, .recoGb4, .recoGb42, .recoGb43, .recoGb5, .recoGb6").change(function(e) {
		var a = $('input:radio[class="recoGb1"]:checked').length;
		var b = $('input:radio[class="recoGb2"]:checked').length;
		var c = $('input:radio[class="recoGb3"]:checked').val();
		var d = $('input:radio[class="recoGb4"]:checked').length;
		var e = $('input:radio[class="recoGb42"]:checked').val();
		var f = $('input:radio[class="recoGb43"]:checked').val();
		
		const recoGb5 = ["29","32","35","38","41"];
		var g = 0;
		for(i=0; i<recoGb5.length; i++) {
			var h = $('input[name="no'+recoGb5[i]+'"]:checked').val();
			g = g+parseInt(h);
		}
		
		var j = $('input:radio[class="recoGb6"]:checked').length;
		
		var execute = parseInt(d) + parseInt(e) + parseInt(f);
		var total = parseInt(a) + parseInt(b) + parseInt(c)
				+ parseInt(d) + parseInt(e) + parseInt(f) 
				+ parseInt(g) + parseInt(j);
		
		$("#cnt1").val(a);
		$("#cnt2").val(b);
		$("#cnt3").val(c);
		$("#cnt4").val(execute);
		$("#cnt5").val(g);
		$("#cnt6").val(j);
		$("#cnt7").val(total);
		
	});
</script>


</html>