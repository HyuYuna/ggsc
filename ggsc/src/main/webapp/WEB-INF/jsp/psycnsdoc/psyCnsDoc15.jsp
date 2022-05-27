<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <title>한국판 자기자비 척도(Self-Compassion Scale)</title>
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

    .bRight-none {
        border-right: none !important;
    }

    .bBottom {
        border-bottom: 2px solid #333;
    }

    .bBottom2 {
        border-bottom: 1px solid #333;
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
                Case No. (20<input type="text" class="inp month" maxlength="2" name='no20'>)-(<input type="text" class="inp month" maxlength="2" name='no21'>)-(<input type="text" class="inp month" maxlength="2" name='no22'>)-(<input type="text" class="inp name" maxlength="5" name='no23'>)
            </div> -->
            <div class="box-title noto700 txt-center mt15 mb15">
            	 한국판 자기자비 척도(Self-Compassion Scale)
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
                <caption>한국판 자기자비 척도</caption>
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
                            <input type="text" id="datepicker1" class="inp" id="writeDt" name="writeDt" style="width: 80%;" readonly>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="txt mt15">
               	일반적으로 어려운 시기에 처해 있을 때, 자신에게 어떻게 행동하는지 각 문항들을 주의깊게 읽고 응답해 주시기 바랍니다. 문항에 기술되어 있는 방식대로 얼마나 자주 행동하는지 아래 다섯가지 대답 가운데 자신을 잘 나타낸다고 생각하는 정도에 따라서 우측 숫자에 ○하시기 바랍니다.
            </div>
            <table class="tbl2 mt15">
                <caption>한국판 자기자비 척도(Self-Compassion Scale)</caption>
                <colgroup>
                    <col style="width: 5%;" />
                    <col style="width: 50%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="2">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</th>
                        <th scope="col">거의<br>아니다<br>(1)</th>
                        <th scope="col">조금<br>그렇다<br>(2)</th>
                        <th scope="col">왠만큼<br>그렇다<br>(3)</th>
                        <th scope="col">자주<br>그렇다<br>(4)</th>
                        <th scope="col" class="bRight-none">거의<br>항상<br>그렇다<br>(5)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="bBottom2">
                        <td class="bRight-none">*1.</td>
                        <td class="txt-left">나는 내 자신의 잘못된 점과 모자라는 부분을 못마땅하게 여기고 내 탓하는 편이다</td>
                        <td><input type="radio" class="ascBtn" id="no11" name="no1" value="1" /></td>
                        <td><input type="radio" class="ascBtn2" id="no12" name="no1" value="2" /></td>
                        <td><input type="radio" class="ascBtn3" id="no13" name="no1" value="3" /></td>
                        <td><input type="radio" class="ascBtn4" id="no14" name="no1" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="ascBtn5" id="no15" name="no1" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">*2.</td>
                        <td class="txt-left">나는 기분이 처질 때, 잘못된 모든 일을 강박적으로 떠올리며 집착하는 경향이 있다. </td>
                        <td><input type="radio" class="ascBtn" id="no21" name="no2" value="1" /></td>
                        <td><input type="radio" class="ascBtn2" id="no22" name="no2" value="2" /></td>
                        <td><input type="radio" class="ascBtn3" id="no23" name="no2" value="3" /></td>
                        <td><input type="radio" class="ascBtn4" id="no24" name="no2" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="ascBtn5" id="no25" name="no2" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">3.</td>
                        <td class="txt-left">나는 상황이 나에게 좋지 않게 돌아갈 때, 그러한 어려움은 모든 사람이 겪는 인생의 한부분이라고 여긴다. </td>
                        <td><input type="radio" class="radBtn" id="no31" name="no3" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no32" name="no3" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no33" name="no3" value="3" /></td>
                        <td><input type="radio" class="radBtn4"id="no34" name="no3" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn5" id="no35" name="no3" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">*4.</td>
                        <td class="txt-left">나는 내 부족함을 생각하면, 세상과 단절되고 동떨어진 기분이 든다.</td>
                        <td><input type="radio" class="ascBtn" id="no41" name="no4" value="1" /></td>
                        <td><input type="radio" class="ascBtn2" id="no42" name="no4" value="2" /></td>
                        <td><input type="radio" class="ascBtn3" id="no43" name="no4" value="3" /></td>
                        <td><input type="radio" class="ascBtn4" id="no44" name="no4" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="ascBtn5" id="no45" name="no4" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">5.</td>
                        <td class="txt-left">나는 마음이 아플 때, 내 자신을 사랑하려고 애를 쓴다.</td>
                        <td><input type="radio" class="radBtn" id="no51" name="no5" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no52" name="no5" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no53" name="no5" value="3" /></td>
                        <td><input type="radio" class="radBtn4" id="no54" name="no5" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn5" id="no55" name="no5" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">*6.</td>
                        <td class="txt-left">나는 나에게 중요한 어떤 일에서 실패를 하면, 세상에는 나처럼 느끼는 사람들이 많다고 생각한다.</td>
                        <td><input type="radio" class="ascBtn" id="no61" name="no6" value="1" /></td>
                        <td><input type="radio" class="ascBtn2" id="no62" name="no6" value="2" /></td>
                        <td><input type="radio" class="ascBtn3" id="no63" name="no6" value="3" /></td>
                        <td><input type="radio" class="ascBtn4" id="no64" name="no6" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="ascBtn5" id="no65" name="no6" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">7.</td>
                        <td class="txt-left">나는 기분이 축 처지고 마음이 갈팡질팡할 때, 세상에는 나처럼 느끼는 사람들이 많다고 생각한다.</td>
                        <td><input type="radio" class="radBtn" id="no71" name="no7" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no72" name="no7" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no73" name="no7" value="3" /></td>
                        <td><input type="radio" class="radBtn4" id="no74" name="no7" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn5" id="no75" name="no7" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">*8.</td>
                        <td class="txt-left">나는 정말로 힘들 때는, 내 자신을 더욱 모질게 대하는 경향이 있다.</td>
                        <td><input type="radio" class="ascBtn" id="no81" name="no8" value="1" /></td>
                        <td><input type="radio" class="ascBtn2" id="no82" name="no8" value="2" /></td>
                        <td><input type="radio" class="ascBtn3" id="no83" name="no8" value="3" /></td>
                        <td><input type="radio" class="ascBtn4" id="no84" name="no8" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="ascBtn5" id="no85" name="no8" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">9.</td>
                        <td class="txt-left">나는 어떤 이 때문에 마음이 상하거나 화가 날 때, 감정의 평정을 유지하려고 노력한다.</td>
                        <td><input type="radio" class="radBtn" id="no91" name="no9" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no92" name="no9" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no93" name="no9" value="3" /></td>
                        <td><input type="radio" class="radBtn4" id="no94" name="no9" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no95" class="radBtn5" name="no9" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">10.</td>
                        <td class="txt-left">나는 뭔가 부족한 느낌이 들면, 대부분의 다른 사람들도 그러한 부족함을 느낄 거라는 생각을 떠올리려고 애를 쓴다.</td>
                        <td><input type="radio" class="radBtn" id="no101" name="no10" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no102" name="no10" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no103" name="no10" value="3" /></td>
                        <td><input type="radio" class="radBtn4" id="no104" name="no10" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn5" id="no105" name="no10" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">*11.</td>
                        <td class="txt-left">나는 내 성격 중에서 마음에 들지 않는 점을 견디거나 참기 어렵다.</td>
                        <td><input type="radio" class="ascBtn" id="no111" name="no11" value="1" /></td>
                        <td><input type="radio" class="ascBtn2" id="no112" name="no11" value="2" /></td>
                        <td><input type="radio" class="ascBtn3" id="no113" name="no11" value="3" /></td>
                        <td><input type="radio" class="ascBtn4" id="no114" name="no11" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="ascBtn5" id="no115" name="no11" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">12.</td>
                        <td class="txt-left">나는 정말로 힘든 시기를 겪을 때, 내게 필요한 돌봄과 부드러움으로 나를 대한다. </td>
                        <td><input type="radio" class="radBtn" id="no121" name="no12" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no122" name="no12" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no123" name="no12" value="3" /></td>
                        <td><input type="radio" class="radBtn4" id="no124" name="no12" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn5" id="no125" name="no12" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">*13.</td>
                        <td class="txt-left">나는 기분이 쳐져 있을 때, 대부분의 다른 사람들은 나보다 더 행복할 거라고 느끼는 경향이 있다.</td>
                        <td><input type="radio" class="ascBtn" id="no131" name="no13" value="1" /></td>
                        <td><input type="radio" class="ascBtn2" id="no132" name="no13" value="2" /></td>
                        <td><input type="radio" class="ascBtn3" id="no133" name="no13" value="3" /></td>
                        <td><input type="radio" class="ascBtn4" id="no134" name="no13" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="ascBtn5" id="no135" name="no13" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">14.</td>
                        <td class="txt-left">나는 뭔가 고통스러운 일이 생기면, 그 상황에 대한 균형잡힌 시각을 가지려고 노력한다..</td>
                        <td><input type="radio" class="radBtn" id="no141" name="no14" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no142" name="no14" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no143" name="no14" value="3" /></td>
                        <td><input type="radio" class="radBtn4" id="no144" name="no14" value="4" /></td>
                        <td class="bRight-none"><input class="radBtn5" type="radio" id="no145" name="no14" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">15.</td>
                        <td class="txt-left">나는 내가 겪은 실패들에 대해서 사람이라면 누구나 겪을 수 있는 일로 보려고 노력한다.</td>
                        <td><input type="radio" class="radBtn" id="no151" name="no15" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no152" name="no15" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no153" name="no15" value="3" /></td>
                        <td><input type="radio" class="radBtn4" id="no154" name="no15" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn5" id="no155" name="no15" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">*16.</td>
                        <td class="txt-left">나는 마음에 들지 않는 나 자신의 어떤 면들을 보면, 스스로 비난한다.</td>
                        <td><input type="radio" class="ascBtn" id="no161" name="no16" value="1" /></td>
                        <td><input type="radio" class="ascBtn2" id="no162" name="no16" value="2" /></td>
                        <td><input type="radio" class="ascBtn3" id="no163" name="no16" value="3" /></td>
                        <td><input type="radio" class="ascBtn4" id="no164" name="no16" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="ascBtn5" id="no165" name="no16" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">17.</td>
                        <td class="txt-left">나는 나에게 중요한 어떤 일에서 실패하면, 그 상황을 가급적 균형 잡힌 시간으로 보려고 한다.</td>
                        <td><input type="radio" class="radBtn" id="no171" name="no17" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no172" name="no17" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no173" name="no17" value="3" /></td>
                        <td><input type="radio" class="radBtn4" id="no174" name="no17" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn5" id="no175" name="no17" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">*18.</td>
                        <td class="txt-left">내가 정말 힘들게 애를쓰고 있을 때, 다른 사람들은 틀림없이 나보다 더 마음 편하게 지내고 있을 거라고 느끼는 경향이 있다.</td>
                        <td><input type="radio" class="ascBtn" id="no181" name="no18" value="1" /></td>
                        <td><input type="radio" class="ascBtn2" id="no182" name="no18" value="2" /></td>
                        <td><input type="radio" class="ascBtn3" id="no183" name="no18" value="3" /></td>
                        <td><input type="radio" class="ascBtn4" id="no184" name="no18" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="ascBtn5" id="no185" name="no18" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">19.</td>
                        <td class="txt-left">나는 고통을 겪을 때, 나 자신에게 친절하게 대한다.</td>
                        <td><input type="radio" class="radBtn" id="no191" name="no19" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no192" name="no19" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no193" name="no19" value="3" /></td>
                        <td><input type="radio" class="radBtn4" id="no194" name="no19" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn5" id="no195" name="no19" value="5" /></td>
                    <tr class="bBottom2">
                        <td class="bRight-none">*20.</td>
                        <td class="txt-left">나는 어떤 일로 기분이 상하거나 화가 날 때, 내 감정에 휩싸이는 경향이 있다.</td>
                        <td><input type="radio" class="ascBtn" id="no201" name="no20" value="1" /></td>
                        <td><input type="radio" class="ascBtn2" id="no202" name="no20" value="2" /></td>
                        <td><input type="radio" class="ascBtn3" id="no203" name="no20" value="3" /></td>
                        <td><input type="radio" class="ascBtn4" id="no204" name="no20" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="ascBtn5" id="no205" name="no20" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">*21.</td>
                        <td class="txt-left">나는 고통을 겪을 때는 나 자신에게 약간 냉담하게 대하는 경향이 있다.</td>
                        <td><input type="radio" class="ascBtn" id="no211" name="no21" value="1" /></td>
                        <td><input type="radio" class="ascBtn2" id="no212" name="no21" value="2" /></td>
                        <td><input type="radio" class="ascBtn3" id="no213" name="no21" value="3" /></td>
                        <td><input type="radio" class="ascBtn4" id="no214" name="no21" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="ascBtn5" id="no215" name="no21" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">22.</td>
                        <td class="txt-left">나는 기분이 처질 때면 호기심과 열린 마음을 갖고 내 감정에 다가가려고 노력한다.</td>
                        <td><input type="radio" class="radBtn" id="no221" name="no22" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no222" name="no22" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no223" name="no22" value="3" /></td>
                        <td><input type="radio" class="radBtn4" id="no224" name="no22" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn5" id="no225" name="no22" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">23.</td>
                        <td class="txt-left">나는 내 자신의 결점과 부족함에 대해 관대하다.</td>
                        <td><input type="radio" class="radBtn" id="no231" name="no23" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no232" name="no23" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no233" name="no23" value="3" /></td>
                        <td><input type="radio" class="radBtn4" id="no234" name="no23" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn5" id="no235" name="no23" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">*24.</td>
                        <td class="txt-left">나는 고통스러운 일이 생기면, 그 일을 크게 부풀려서(확대해서) 생각하는 경향이 있다.</td>
                        <td><input type="radio" class="ascBtn" id="no241" name="no24" value="1" /></td>
                        <td><input type="radio" class="ascBtn2" id="no242" name="no24" value="2" /></td>
                        <td><input type="radio" class="ascBtn3" id="no243" name="no24" value="3" /></td>
                        <td><input type="radio" class="ascBtn4" id="no244" name="no24" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="ascBtn5" id="no245" name="no24" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">*25.</td>
                        <td class="txt-left">나는 중요한 어떤 일에서 실패하면, 나 혼자만 실패한 기분이 든다.</td>
                        <td><input type="radio" class="ascBtn" id="no251" name="no25" value="1" /></td>
                        <td><input type="radio" class="ascBtn2" id="no252" name="no25" value="2" /></td>
                        <td><input type="radio" class="ascBtn3" id="no253" name="no25" value="3" /></td>
                        <td><input type="radio" class="ascBtn4" id="no254" name="no25" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="ascBtn5" id="no255" name="no25" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">26.</td>
                        <td class="txt-left">내 성격 중에서 마음에 들지 않는 부분에 대해 이해하고 견디어내려고 한다.</td>
                        <td><input type="radio" class="radBtn" id="no261" name="no26" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no262" name="no26" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no263" name="no26" value="3" /></td>
                        <td><input type="radio" class="radBtn4" id="no264" name="no26" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn5" id="no265" name="no26" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td colspan="5">합계</td>
                        <td colspan="2" class="bRight-none"><input class="inp num2" name="no27" id="sumCnt" readonly></td>
                    </tr>
                </tbody>
            </table>
            </form>
            <font size=4>역문항 13개(1,2,4,6,8,11,13,16,18,20,21,24,25)</font>
            <div class="box-title noto700 txt-center mt15 mb15">
		     	<span class="fs24">출처 : 김경희, 이금단, 조용래, 채숙희, 이우경(2008), 한국판 자기-자비 척도의 타당화 연구. 한국심리학회지: 건강,13(4), 1023-1044.</span>
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
$(".radBtn, .radBtn2, .radBtn3, .radBtn4, .radBtn5, .ascBtn, .ascBtn2, .ascBtn3, .ascBtn4, .ascBtn5").change(function(e) {
	var a= $(".radBtn:checked").length, b= $(".radBtn2:checked").length*2, c= $(".radBtn3:checked").length*3, d= $(".radBtn4:checked").length*4, e= $(".radBtn5:checked").length*5;
	var f= $(".ascBtn:checked").length*5, g=$(".ascBtn2:checked").length*4, h= $(".ascBtn3:checked").length*3, i = $(".ascBtn4:checked").length*2, j= $(".ascBtn5:checked").length; 
	$("#sumCnt").val(a+b+c+d+e+f+g+h+i+j);
});
</script>
</html>