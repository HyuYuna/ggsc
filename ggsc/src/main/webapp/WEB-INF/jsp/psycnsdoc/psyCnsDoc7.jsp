<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <title>심리적 안녕감척도</title>
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
              심리적 안녕감척도
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
                <caption>심리적 안녕감척도</caption>
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
                ※ 다음 문항을 읽고, 자신이 일상생활에서 느끼고 있는 칸에 ‘√’표해 주십시오.
            </div>
            <table class="tbl2 mt15">
                <caption>심리적 안녕감 척도</caption>
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
                        <th scope="col">전혀<br>그렇지<br>않다</th>
                        <th scope="col">그렇지<br>않다</th>
                        <th scope="col">보통<br>이다</th>
                        <th scope="col">그렇다</th>
                        <th scope="col" class="bRight-none">매우<br>그렇다</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="bBottom2">
                        <td class="bRight-none">*1.</td>
                        <td class="txt-left">나는 다른 사람의 의견에 영향을 많이 받는 경향이 있다.</td>
                        <td><input type="radio" class="ascBtn" id="no11" name="no1" value="1" /></td>
                        <td><input type="radio" class="ascBtn2" id="no12" name="no1" value="2" /></td>
                        <td><input type="radio" class="ascBtn3" id="no13" name="no1" value="3" /></td>
                        <td><input type="radio" class="ascBtn4" id="no14" name="no1" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="ascBtn5" id="no15" name="no1" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">2.</td>
                        <td class="txt-left">나는 다른 사람에 의한 것이 아닌 내가 중요하다고 생각하는 가치로 나 자신을 평가한다.</td>
                        <td><input type="radio" class="radBtn" id="no21" name="no2" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no22" name="no2" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no23" name="no2" value="3" /></td>
                        <td><input type="radio" class="radBtn4" id="no24" name="no2" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn5" id="no25" name="no2" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">3.</td>
                        <td class="txt-left">나는 다른 사람들이 생각하는 방식과 다르더라도 내 의견에 자신 있다.</td>
                        <td><input type="radio" class="radBtn" id="no31" name="no3" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no32" name="no3" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no33" name="no3" value="3" /></td>
                        <td><input type="radio" class="radBtn4"id="no34" name="no3" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn5" id="no35" name="no3" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">*4.</td>
                        <td class="txt-left">나는 다른 사람들과 따뜻하고 신뢰할 만한 관계를 경험해 오지 못했다.</td>
                        <td><input type="radio" class="ascBtn" id="no41" name="no4" value="1" /></td>
                        <td><input type="radio" class="ascBtn2" id="no42" name="no4" value="2" /></td>
                        <td><input type="radio" class="ascBtn3" id="no43" name="no4" value="3" /></td>
                        <td><input type="radio" class="ascBtn4" id="no44" name="no4" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="ascBtn5" id="no45" name="no4" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">*5.</td>
                        <td class="txt-left">친밀한 관계를 유지하는 것이 나에게는 어렵다.</td>
                        <td><input type="radio" class="ascBtn" id="no51" name="no5" value="1" /></td>
                        <td><input type="radio" class="ascBtn2" id="no52" name="no5" value="2" /></td>
                        <td><input type="radio" class="ascBtn3" id="no53" name="no5" value="3" /></td>
                        <td><input type="radio" class="ascBtn4" id="no54" name="no5" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="ascBtn5" id="no55" name="no5" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">6.</td>
                        <td class="txt-left">사람들은 나를 너그럽고 필요하면 남에게 기꺼이  시간도 내어 주는 사람으로 생각한다.</td>
                        <td><input type="radio" class="radBtn" id="no61" name="no6" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no62" name="no6" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no63" name="no6" value="3" /></td>
                        <td><input type="radio" class="radBtn4" id="no64" name="no6" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn5" id="no65" name="no6" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">*7.</td>
                        <td class="txt-left">나는 가끔 인생에서 내가 할 일은 다 한 것 같은  생각이 든다.</td>
                        <td><input type="radio" class="ascBtn" id="no71" name="no7" value="1" /></td>
                        <td><input type="radio" class="ascBtn2" id="no72" name="no7" value="2" /></td>
                        <td><input type="radio" class="ascBtn3" id="no73" name="no7" value="3" /></td>
                        <td><input type="radio" class="ascBtn4" id="no74" name="no7" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="ascBtn5" id="no75" name="no7" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">*8.</td>
                        <td class="txt-left">나는 오늘 하루만 중요할 뿐 미래에 대해서는 생각하지 않는다. </td>
                        <td><input type="radio" class="ascBtn" id="no81" name="no8" value="1" /></td>
                        <td><input type="radio" class="ascBtn2" id="no82" name="no8" value="2" /></td>
                        <td><input type="radio" class="ascBtn3" id="no83" name="no8" value="3" /></td>
                        <td><input type="radio" class="ascBtn4" id="no84" name="no8" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="ascBtn5" id="no85" name="no8" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">9.</td>
                        <td class="txt-left">어떤 사람들은 인생의 목표 없이 방황하지만 나는 그런 사람이 아니다.</td>
                        <td><input type="radio" class="radBtn" id="no91" name="no9" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no92" name="no9" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no93" name="no9" value="3" /></td>
                        <td><input type="radio" class="radBtn4" id="no94" name="no9" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no95" class="radBtn5" name="no9" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">*10.</td>
                        <td class="txt-left">나는 오래전에 내 인생을 크게 발전시키거나 변화하려는 노력을 포기했다.</td>
                        <td><input type="radio" class="ascBtn" id="no101" name="no10" value="1" /></td>
                        <td><input type="radio" class="ascBtn2" id="no102" name="no10" value="2" /></td>
                        <td><input type="radio" class="ascBtn3" id="no103" name="no10" value="3" /></td>
                        <td><input type="radio" class="ascBtn4" id="no104" name="no10" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="ascBtn5" id="no105" name="no10" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">11.</td>
                        <td class="txt-left">나는 나 자신과 주변을 변화시킬 수 있는 새로운  경험을 하는 것이 중요하다고 생각한다.</td>
                        <td><input type="radio" class="radBtn" id="no111" name="no11" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no112" name="no11" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no113" name="no11" value="3" /></td>
                        <td><input type="radio" class="radBtn4" id="no114" name="no11" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn5" id="no115" name="no11" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">*12.</td>
                        <td class="txt-left">여러 측면에서 볼 때 나는 내가 살면서 이루어 온 것이 실망스럽다.</td>
                        <td><input type="radio" class="ascBtn" id="no121" name="no12" value="1" /></td>
                        <td><input type="radio" class="ascBtn2" id="no122" name="no12" value="2" /></td>
                        <td><input type="radio" class="ascBtn3" id="no123" name="no12" value="3" /></td>
                        <td><input type="radio" class="ascBtn4" id="no124" name="no12" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="ascBtn5" id="no125" name="no12" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">13.</td>
                        <td class="txt-left">내 인생을 돌아봤을 때 지금까지는 원하던 대로  되어 기쁘다.</td>
                        <td><input type="radio" class="radBtn" id="no131" name="no13" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no132" name="no13" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no133" name="no13" value="3" /></td>
                        <td><input type="radio" class="radBtn4" id="no134" name="no13" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn5" id="no135" name="no13" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">14.</td>
                        <td class="txt-left">나는 내 성격의 대부분이 마음에 든다.</td>
                        <td><input type="radio" class="radBtn" id="no141" name="no14" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no142" name="no14" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no143" name="no14" value="3" /></td>
                        <td><input type="radio" class="radBtn4" id="no144" name="no14" value="4" /></td>
                        <td class="bRight-none"><input class="radBtn5" type="radio" id="no145" name="no14" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">15.</td>
                        <td class="txt-left">나에게 인생은 끊임없이 배우고, 변화하고, 성장하는 과정이다.</td>
                        <td><input type="radio" class="radBtn" id="no151" name="no15" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no152" name="no15" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no153" name="no15" value="3" /></td>
                        <td><input type="radio" class="radBtn4" id="no154" name="no15" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn5" id="no155" name="no15" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">16.</td>
                        <td class="txt-left">일반적으로 나는 나의 주변 상황을 책임지고 있다고 느낀다.</td>
                        <td><input type="radio" class="radBtn" id="no161" name="no16" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no162" name="no16" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no163" name="no16" value="3" /></td>
                        <td><input type="radio" class="radBtn4" id="no164" name="no16" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn5" id="no165" name="no16" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">17.</td>
                        <td class="txt-left">나는 일상생활을 잘 관리해 나가고 있다.</td>
                        <td><input type="radio" class="radBtn" id="no171" name="no17" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no172" name="no17" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no173" name="no17" value="3" /></td>
                        <td><input type="radio" class="radBtn4" id="no174" name="no17" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn5" id="no175" name="no17" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">*18.</td>
                        <td class="txt-left">일상생활에서 요구하는 것들이 나를 기운 빠지게 한다. </td>
                        <td><input type="radio" class="ascBtn" id="no181" name="no18" value="1" /></td>
                        <td><input type="radio" class="ascBtn2" id="no182" name="no18" value="2" /></td>
                        <td><input type="radio" class="ascBtn3" id="no183" name="no18" value="3" /></td>
                        <td><input type="radio" class="ascBtn4" id="no184" name="no18" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="ascBtn5" id="no185" name="no18" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">채점</td>
                        <td>1, 4, 5, 7, 8, 10, 12, 18 역채점 문항</td>
                        <td><input type="text" class="inp num1" id="cnt1" name="no19" readonly></td>
                        <td><input type="text" class="inp num2" id="cnt2" name="no20" readonly></td>
                        <td><input type="text" class="inp num3" id="cnt3" name="no21" readonly></td>
                        <td><input type="text" class="inp num4" id="cnt4" name="no22" readonly></td>
                        <td class="bRight-none"><input type="text" class="inp num5" id="cnt5" name="no23" readonly></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">합계</td>
                        <td>총점 18-90점으로 점수가 높을수록<br/> 심리적 안녕감 수준이 높음을 의미</td>
                        <td colspan="5" class="bRight-none"><input class="inp num2" name="no24" id="sumCnt" readonly></td>
                    </tr>
                </tbody>
            </table>
            </form>
            <div class="box-title noto700 txt-center mt15 mb15">
		     	<span class="fs24">출처: Ryff가 개발한 심리적 안녕감 척도(Psychological Well-being Scale)(1989)를 조윤주가 18문항으로 재구성한 척도(2006)</span>
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
	$("#cnt1").val(a+f);
	$("#cnt2").val(b+g);
	$("#cnt3").val(c+h);
	$("#cnt4").val(d+i);
	$("#cnt5").val(e+j);
	$("#sumCnt").val(a+b+c+d+e+f+g+h+i+j);
});
</script>
</html>