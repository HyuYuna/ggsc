<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <title>죽음·학대 질문지</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
	<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<meta http-equiv="content-language" content="ko">
	<meta name="_csrf" th:content="${_csrf.token}"/>
	<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
    <link href="/gnoincoundb/css/psyDocument/common.css" rel="stylesheet">
     <link href="/gnoincoundb/css/style.css" rel="stylesheet">
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
	
	function fn_reg(param){
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
		
		if($("#strtTimeHour").val()==""){
			alert("시작시간(시)을 입력해주세요.");
			$("#strtTimeHour").focus();
			return;
		}
		if($("#strtTimeHour").val().length != 2){
			alert("시작시간(시)앞에 0을 입력해주세요.");
			$("#strtTimeHour").focus();
			return;
		}
		if($("#strtMin").val()==""){
			alert("시작시간(분)을 입력해주세요.");
			$("#strtMin").focus();
			return;
		}
		if($("#strtMin").val().length != 2){
			alert("시작시간(분)앞에 0을 입력해주세요.");
			$("#strtMin").focus();
			return;
		}
		
		if($("#endTimeHour").val()==""){
			alert("종료시간(시)을 입력해주세요.");
			$("#endTimeHour").focus();
			return;
		}
		if($("#endTimeHour").val().length != 2){
			alert("종료시간(시)앞에 0을 입력해주세요.");
			$("#endTimeHour").focus();
			return;
		}
		if($("#endTimeMin").val()==""){
			alert("종료시간(분)을 입력해주세요.");
			$("#endTimeMin").focus();
			return;
		}
		if($("#endTimeMin").val().length != 2){
			alert("종료시간(분)앞에 0을 입력해주세요.");
			$("#endTimeMin").focus();
			return;
		}
		
		if($("#cnsrOptnTot").val()== ""){
			alert("설문지를 전부 입력해주세요");
			$("#cnsrOptnTot").focus();
			return;
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
	.bgcolor {
		background-color: #B2CCFF;
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

    .month2 {
        width: 20px;
        top: -2px;
    }

    .name2 {
        width: 45px;
        top: -2px;
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
        font-weight: 500;
        font-size: 16px;
    }
    
    .fs20 {
        font-size: 20px;
        font-weight: 400;
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

    .bRight-none {
        border-right: none !important;
    }

    .bBottom {
        border-bottom: 2px solid #333;
    }

    .txt-Under {
        text-decoration: underline;
    }

    .txt-left {
        text-align: left !important;
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

    .num2 {
        width: 95%;
        top: -2px;
    }

    .mt80 {
        margin-top: 80px;
    }
    
    .btn-basic {
    	padding: 5px;
    }

</style>

<body>
    <div class="doc-wrap">
   		<div class="doc-box" style="margin-top:20px;">
			<form id="frm" name="frm" method="post">
	        	<input type='hidden' name='g_idx' value='${param.gIdx}' />
	        	<input type='hidden' name='dtl_idx' value='${param.dtlIdx}' />
	        	<input type='hidden' name='psy_idx' value='${param.psyNum}' />
	        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	        	<input type="hidden" id="examDocCd" name="examDocCd" value="${vo.examDocCd }" />
				<input type="hidden" id="examDocNm" name="examDocNm" value="${vo.examDocNm }" />
				<input type="hidden" id="cnsDtlGbCd" name="cnsDtlGbCd" value="1" />
				<input type="hidden" id="cnsCnt" name="cnsCnt" value="3"/>
				<input type="hidden" id="cnsleId" name="cnsleId" />
				<input type="hidden" id="caseNo" name="caseNo" />
				<input type="hidden" id="cnsGb"  />
				<input type="hidden" id="cnsGbCd" name="cnsGb" />
				
			 	<div class="box-title noto700 txt-center mt15 mb15">
               		중장년상담 선별척도지
            	</div>
            	
            <table class="tbl">
                <colgroup>
                    <col width="10%"></col>
					<col width="15%"></col>
					<col width="10%"></col>
					<col width="15%"></col>
					<col width="10%"></col>
					<col width="15%"></col>
					<col width="10%"></col>
					<col width="15%"></col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col">이&nbsp;&nbsp;름</th>
                        <td colspan="3">
                            <input type="text" class="inp" id="cnsleNm" name="cnsleNm" style="width: 70%;" readonly><button type="button" class="btn-basic" style="padding: 2px 6px;background: skyblue;" onclick="javascript:findUserPopup();">찾기</button>
                        </td>
                        <th scope="col">성별</th>
                        <td>
                            <label for="genderM" style="margin-right: 5px;">남</label><input type="radio" id="genderM" name="no25" value="M" /> /
                            <label for="genderF" style="margin-right: 5px;">여</label><input type="radio" id="genderF" name="no25" value="F" />
                        </td>
                        <th scope="col">검사일</th>
                        <td>
                            <input type="text" class="inp" id="datepicker1" name="writeDt" style="width: 80%;" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">생년월일</th> 
                        <td>
                        	<input type="text" id="birthDt" name="no26" onlyNumber maxlength=6 readonly/>
                        </td>	
                    	<th scope="col">시작시간</th>
						<td>
							<input type="text" style="width: 30px;" id="strtTimeHour" name="no27"  onlyNumber maxlength=2 />시 <input type="text" style="width: 30px;" id="strtMin" name="no28" onlyNumber maxlength=2/>분
						</td>
						<th scope="col">종료시간</th>
						<td>
							<input type="text" style="width: 30px;" id="endTimeHour" name="no29" onlyNumber maxlength=2 />시 <input type="text" style="width: 30px;" id="endTimeMin" name="no30" onlyNumber maxlength=2 />분
						</td>
						<th scope="col">총 소요시간</th>
						<td>
							<input type="text" style="width: 50px;" id="totTime" name="no31" onlyNumber maxlength=3 />분
						</td>
                    </tr>
                </tbody>
            </table>
            <div class="txt mt15 mb15">
		                ※ 상담사는 아래의 척도를 시행하기에 앞서 신체적 질병 및 인지·지각장애 사항을 점검하고 
				  그로 인하여 파생되는 어려움은 아닌지에 대하여 변별‧사용하시길 바랍니다.
            </div>
				<div style="border-style: solid; border-width: thin; width:700px; height: auto; padding: 30px 20px 20px 20px; margin: 0 auto;">
					<h1 style="text-align: center; font-size:x-large; padding-bottom: 20px;">중장년상담 선별척도지</h1><br>
					<font style="font-size: medium;">"다음 문항은 정답이 있는 문항이 아니므로 읽고, 최근 한 달 사이에 겪은 일들로 
						가장 솔직한 생각을 예, 아니오의 수준에 맞도록 답변해 주시면 됩니다.”</font><br><br>
					<table border="1">
						<colgroup>
							<col width="20%"></col>
							<col width="*"></col>
							<col width="10%"></col>
							<col width="10%"></col>
						</colgroup>
						<thead>
							<th colspan="2">문항</th>
							<th>예</th>
							<th>아니오</th>
						</thead>
						<tbody>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">1. 나의 삶에 대해 대체로 만족하십니까?</td>
								<td><input type="radio" class="radBtn3" id="no11" name="no1" value="Y" /></td>
								<td class="bgcolor"><input class="radBtn4" type="radio" id="no12" name="no1" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">2. 다른 사람에게 도움이 되는 필요한 사람이라고 생각하십니까?</td>
								<td><input type="radio" class="radBtn3" id="no21" name="no2" value="Y" /></td>
								<td class="bgcolor"><input class="radBtn4" type="radio" id="no22" name="no2" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">3. 최근 활동이나 관심거리가 많이 줄었습니까?</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="no31" name="no3" value="Y" /></td>
								<td><input type="radio" class="radBtn2" id="no32" name="no3" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">4. 손발이 떨리고 안절부절 못할 때가 있습니까?</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="no41" name="no4" value="Y" /></td>
								<td><input type="radio" class="radBtn2" id="no42" name="no4" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">5. 가까운 사람(가족, 동거인)들과 해결되지 못한 문제로 갈등이 있습니까?</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="no51" name="no5" value="Y" /></td>
								<td><input type="radio" class="radBtn2" id="no52" name="no5" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">6. 고민이나 문제가 생길 때 하소연할 사람(곳)이 있습니까?</td>
								<td><input class="radBtn3" type="radio" id="no61" name="no6" value="Y" /></td>
								<td class="bgcolor"><input class="radBtn4" type="radio" id="no62" name="no6" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">7. 최근 나에게 중요한 사람, 반려동물이나 물건을 상실한 경험이 있습니까?</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="no71" name="no7" value="Y" /></td>
								<td><input class="radBtn2" type="radio" id="no72" name="no7" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">8. 쉽게 화를 내거나 참지 못할 때가 자주 있습니까?</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="no81" name="no8" value="Y" /></td>
								<td><input type="radio" class="radBtn2" id="no82" name="no8" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">9. 기분이 가라앉거나 우울할 때가 있습니까?</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="no91" name="no9" value="Y" /></td>
								<td><input type="radio" class="radBtn2" id="no92" name="no9" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">10. 최근 가까운 사람(가족, 동거인)에게 소외나 무시를 당한다고 느낀 적이 있습니까?</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="no101" name="no10" value="Y" /></td>
								<td><input type="radio" class="radBtn2" id="no102" name="no10" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">11. 최근 스스로 죽고 싶다는 생각을 한 적이 있습니까?</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="no111" name="no11" value="Y" /></td>
								<td><input type="radio" class="radBtn2" id="no112" name="no11" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">12. 자신이 헛되이 살았다고 느껴질 때가 있습니까?</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="no121" name="no12" value="Y" /></td>
								<td><input type="radio" class="radBtn2" id="no122" name="no12" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">13. 나에게 아무도 관심을 갖지 않아 혼자 된 것 같습니까?</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="no131" name="no13" value="Y" /></td>
								<td><input type="radio" class="radBtn2" id="no132" name="no13" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">14. 신체·정서·경제적 부당한 대우(학대)를 받은 적이 있습니까?</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="no141" name="no14" value="Y" /></td>
								<td><input type="radio" class="radBtn2" id="no142" name="no14" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">15. 최근 일상생활(씻기, 식사, 수면 등)의 어려움이 있습니까?</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="no151" name="no15" value="Y" /></td>
								<td><input type="radio" class="radBtn2" id="no152" name="no15" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">16. 사람들과 어울리고, 관계를 맺는 것에 어려움이 있습니까?</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="no161" name="no16" value="Y" /></td>
								<td><input type="radio" class="radBtn2" id="no162" name="no16" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">17. 요즘 지속적으로 지나치게 하고 있는 게 있습니까?(예: 알코올, 도박, 니코틴, 성, 인터넷 등)</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="no171" name="no17" value="Y" /></td>
								<td><input type="radio" class="radBtn2" id="no172" name="no17" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">18. 최근 예전의 기억이 자주 떠올라 힘든 적이 있습니까?</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="no181" name="no18" value="Y" /></td>
								<td><input type="radio" class="radBtn2" id="no182" name="no18" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">19. 심신에 이상이 생길까봐 극도로 걱정을 한 적이 있습니까?</td>
								<td class="bgcolor"><input class="radBtn" type="radio" id="no191" name="no19" value="Y" /></td>
								<td><input type="radio" class="radBtn2" id="no192" name="no19" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: left; padding-left: 5px;">20. 아플 때 돌봐줄 사람이 있습니까?</td>
								<td><input class="radBtn3" type="radio" id="no201" name="no20" value="Y" /></td>
								<td class="bgcolor"><input class="radBtn4"type="radio" id="no202" name="no20" value="N" /></td>
							</tr>
							<tr>
								<td>채점</td>
								<td style="text-align: left; padding-left: 5px;">※ 진한 색에 1점부여, 그 외 0점을 부여함</td>
								<td><input type="text" class="wd30" id="yesTotScore" name="no21" readonly onlyNumber maxlength=2>점</td>
								<td><input type="text" class="wd30" id="noTotScore" name="no22" readonly onlyNumber maxlength=2>점</td>
							</tr>
							<tr>
								<td>합계</td>
								<td style="text-align: left; padding-left: 5px;">※총20점중 10점이상인 경우 상담대상자로 선정함<br>※긴급상황으로 여겨질 수 있는 11번과 14번의 답이 "예:일 경우 상담대상자로 선정</td>
								<td colspan="2"><input type="text" class="wd30" id="cnsrOptnTot" name="no23" readonly onlyNumber maxlength=2>점</td>
							</tr>
							<tr>
								<td rowspan="2">기관 담당자 추천(추천 사유 작성)</td>
								<td colspan="3" style="text-align: left; padding-left: 5px;">※ 총점이 10점 미만이지만, 기관담당자 추천 사유 발생시 작성</td>
							</tr>
							<tr>
								<td colspan="3" style="padding:10px;"> 
									<textarea id="recommend" name="no24" ></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
			 <div class="box-title noto700 txt-center mt15 mb15">
		     	<span class="fs20">출처: Radloff(1977)가 일반인의 우울을 측정하기 위해 개발한 CES-D척도, 전겸구, 최상진 & 양병창(2001)이 한국의 문화에 맞게 개정.</span>
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

	<script>
		$(".radBtn, .radBtn2, .radBtn3, .radBtn4").change(function(e) {
			var a = $(".radBtn:checked").length, b = $(".radBtn2:checked").length;
			var c = $(".radBtn3:checked").length, d = $(".radBtn4:checked").length;
			$("#yesTotScore").val(a);
			$("#noTotScore").val(d);
			var yesTotal = $("#yesTotScore").val();
			var noTotal = $("#noTotScore").val();
			var total = parseInt(yesTotal)+parseInt(noTotal);
			
			var totLength = parseInt(a+b+c+d);
			
			if(totLength == 20) {
				$("#cnsrOptnTot").val(total);
				var q11 = $("input[name=no11]:checked").val();
				var q14 = $("input[name=no14]:checked").val();

				if(total < 10 && (q11 == "Y" || q14 == "Y")){
					alert("11번 또는 14번 항목을 체크하셨으므로  상담대상자로 선정됐습니다.");
					$("#cnsrOptnTot").val(10);
				} else if (total >= 10 ) {
					alert("검사 결과 10점 이상이므로  상담대상자로 선정됐습니다.");
					$("#cnsrOptnTot").val(total);
				}
			}
		});
		
	</script>
	
</body>
</html>