<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <title>스트레스 자각 척도(PSS)</title>
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
            	 스트레스 자각 척도(PSS)
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
                <caption>스트레스 자각 척도(PSS)</caption>
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
               	※ 지난 한 달(1개월) 동안의 당신의 감정과 생각에 관하여 물어보는 것입니다. 
				<br/>각 문항들을 주의 깊게 읽고, 얼마나 자주 그렇게 생각했는지  ‘√’표해 주십시오.
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
                        <th scope="col">전혀<br>없었다</th>
                        <th scope="col">거의<br>없었다</th>
                        <th scope="col">가끔<br>있었다</th>
                        <th scope="col">자주<br/>있었다</th>
                        <th scope="col" class="bRight-none">매우<br>자주<br>있었다</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="bBottom2">
                        <td class="bRight-none">1.</td>
                        <td class="txt-left">최근 1개월 동안, 예상치 못했던 일 때문에 당황했던 적이 얼마나 있었습니까?</td>
                        <td><input type="radio" class="radBtn" id="no11" name="no1" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no12" name="no1" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no13" name="no1" value="3" /></td>
                        <td><input type="radio" class="radBtn4" id="no14" name="no1" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn5" id="no15" name="no1" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">2.</td>
                        <td class="txt-left">최근 1개월 동안, 인생에서 중요한 일들을 조절할 수 없다는 느낌을 얼마나 경험하였습니까?</td>
                        <td><input type="radio" class="radBtn" id="no21" name="no2" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no22" name="no2" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no23" name="no2" value="3" /></td>
                        <td><input type="radio" class="radBtn4" id="no24" name="no2" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn5" id="no25" name="no2" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">3.</td>
                        <td class="txt-left">최근 1개월 동안, 신경이 예민해지고 스트레스를 받고 있다는 느낌을 얼마나 경험하였습니까?</td>
                        <td><input type="radio" class="radBtn" id="no31" name="no3" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no32" name="no3" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no33" name="no3" value="3" /></td>
                        <td><input type="radio" class="radBtn4"id="no34" name="no3" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn5" id="no35" name="no3" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">*4.</td>
                        <td class="txt-left">최근 1개월 동안, 당신의 개인적 문제들을 다루는 데 있어서 얼마나 자주 자신감을  느꼈습니까?</td>
                        <td><input type="radio" class="ascBtn" id="no41" name="no4" value="1" /></td>
                        <td><input type="radio" class="ascBtn2" id="no42" name="no4" value="2" /></td>
                        <td><input type="radio" class="ascBtn3" id="no43" name="no4" value="3" /></td>
                        <td><input type="radio" class="ascBtn4" id="no44" name="no4" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="ascBtn5" id="no45" name="no4" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">*5.</td>
                        <td class="txt-left">최근 1개월 동안, 일상의 일들이 당신의  생각대로 진행되고 있다는 느낌을 얼마나 경험하였습니까?</td>
                        <td><input type="radio" class="ascBtn" id="no51" name="no5" value="1" /></td>
                        <td><input type="radio" class="ascBtn2" id="no52" name="no5" value="2" /></td>
                        <td><input type="radio" class="ascBtn3" id="no53" name="no5" value="3" /></td>
                        <td><input type="radio" class="ascBtn4" id="no54" name="no5" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="ascBtn5" id="no55" name="no5" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">6.</td>
                        <td class="txt-left">최근 1개월 동안, 당신이 꼭 해야 하는 일을 처리할 수 없다고 생각한 적이 얼마나 있었습니까?</td>
                        <td><input type="radio" class="radBtn" id="no61" name="no6" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no62" name="no6" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no63" name="no6" value="3" /></td>
                        <td><input type="radio" class="radBtn4" id="no64" name="no6" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn5" id="no65" name="no6" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">*7.</td>
                        <td class="txt-left">최근 1개월 동안, 일상생활의 짜증을 얼마나 자주 잘 다스릴 수 있었습니까?</td>
                        <td><input type="radio" class="ascBtn" id="no71" name="no7" value="1" /></td>
                        <td><input type="radio" class="ascBtn2" id="no72" name="no7" value="2" /></td>
                        <td><input type="radio" class="ascBtn3" id="no73" name="no7" value="3" /></td>
                        <td><input type="radio" class="ascBtn4" id="no74" name="no7" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="ascBtn5" id="no75" name="no7" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">*8.</td>
                        <td class="txt-left">최근 1개월 동안, 최상의 컨디션이라고   얼마나 자주 느끼셨습니까?</td>
                        <td><input type="radio" class="ascBtn" id="no81" name="no8" value="1" /></td>
                        <td><input type="radio" class="ascBtn2" id="no82" name="no8" value="2" /></td>
                        <td><input type="radio" class="ascBtn3" id="no83" name="no8" value="3" /></td>
                        <td><input type="radio" class="ascBtn4" id="no84" name="no8" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="ascBtn5" id="no85" name="no8" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">9.</td>
                        <td class="txt-left">최근 1개월 동안, 당신이 통제할 수 없는 일 때문에 화가 난 경험이 얼마나 있었습니까?</td>
                        <td><input type="radio" class="radBtn" id="no91" name="no9" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no92" name="no9" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no93" name="no9" value="3" /></td>
                        <td><input type="radio" class="radBtn4" id="no94" name="no9" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no95" class="radBtn5" name="no9" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">10.</td>
                        <td class="txt-left">최근 1개월 동안, 어려운 일들이 너무 많이 쌓여서 극복하지 못할 것 같은 느낌을 얼마나 자주 경험하셨습니까?</td>
                        <td><input type="radio" class="radBtn" id="no101" name="no10" value="1" /></td>
                        <td><input type="radio" class="radBtn2" id="no102" name="no10" value="2" /></td>
                        <td><input type="radio" class="radBtn3" id="no103" name="no10" value="3" /></td>
                        <td><input type="radio" class="radBtn4" id="no104" name="no10" value="4" /></td>
                        <td class="bRight-none"><input type="radio" class="radBtn5" id="no105" name="no10" value="5" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">채점</td>
                        <td>※ 4, 5, 7, 8 역채점 문항</td>
                        <td><input type="text" class="inp num1" id="cnt1" name="no11" readonly></td>
                        <td><input type="text" class="inp num2" id="cnt2" name="no12" readonly></td>
                        <td><input type="text" class="inp num3" id="cnt3" name="no13" readonly></td>
                        <td><input type="text" class="inp num4" id="cnt4" name="no14" readonly></td>
                        <td class="bRight-none"><input type="text" class="inp num5" id="cnt5" name="no15" readonly></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">총점</td>
                        <td>점수가 높을수록 <br/> 자각된 스트레스 정도가 심함을 의미함.</td>
                        <td colspan="5" class="bRight-none"><input class="inp num2" name="no16" id="sumCnt" readonly></td>
                    </tr>
                </tbody>
            </table>
            </form>
            <div class="box-title noto700 txt-center mt15 mb15">
		     	<span class="fs24">출처: Cohen과 Mermelstein이 개발하고(1983), Cohen과 Williamson(1988)이 요인분석을 통해 단축형으로 수정. 이정은이 번안(2005)함</span>
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