<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<link href="/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="<c:out value="${pageContext.request.contextPath}" />/js/jquery-1.11.2.min.js" ></script>
<script src="<c:out value="${pageContext.request.contextPath}" />/js/html2canvas.min.js" ></script>
<script src="<c:out value="${pageContext.request.contextPath}" />/js/jspdf.min.js" ></script>
<script src="<c:out value="${pageContext.request.contextPath}" />/js/jquery-accordion-menu.js" ></script>
<style>
	ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
	}
	ul.tabs li{
		background: none;
		color: #222;
		display: inline-block;
		padding: 10px 15px;
		cursor: pointer;
	}
	.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
	}
	.filebox label {
	    display: inline-block;
	    padding: 2px 20px;
	    color: #999;
	    vertical-align: middle;
	    background-color: #fdfdfd;
	    cursor: pointer;
	    border: 1px solid #ebebeb;
	    border-radius: 5px;
	}
	
	/* named upload */
	.filebox .upload-name {
	    display: inline-block;
	  height: 25px;
	  font-size:18px; 
	  padding: 0 10px;
	  vertical-align: middle;
	  background-color: #f5f5f5;
	  border: 1px solid #ebebeb;
	  border-radius: 5px;
	  width: 600px;
	}
	
</style>

<script type="text/javascript">
	$(document).ready(function() {
		
	});
	
	function fn_goLink(no){
		var url = "";
		
		if(no == 1){
			url = "<c:out value="${pageContext.request.contextPath}" />/oasis.do?mnuCd=${mnuCd}";	
		}else if(no == 2){
			url = "<c:out value="${pageContext.request.contextPath}" />/radiohead.do?mnuCd=${mnuCd}";
		}else {
			url = "<c:out value="${pageContext.request.contextPath}" />/boowhal.do?mnuCd=${mnuCd}";
		} 
		document.location.href = url;
	}
	
	function findYsmUser() {
		var ysmNm = $("#ysmNm").val();
		ysmNm = encodeURI(encodeURIComponent(ysmNm));	
		var url ="<c:out value= "${pageContext.request.contextPath}" />/findYsmUser.do?ysmNm=" + ysmNm;
		var name = "ysm 찾기"
		var option = "width= 530 , height = 750, top = 50, left = 100, location = yes";
		window.open(url,name,option);
		encodeURI(encodeURIComponent(jindan_name));
	}
	
	function fn_reg() {
		/*
		var writer = $("#brdWriter").val().replace(/ /gi, "");
		var title = $("#brdTitle").val().replace(/ /gi, "");
		var contents = $("#brdContent").val().replace(/ /gi, "");
		*/
		
		var ysmId = $("#ysmId").val();
		if(ysmId == "") {
			alert("사용자를 선택해주세요");
			return false;
		}
		
		
		if($("#oasisYear").val()==""){
			alert("날짜를 입력하세요");
			$("#year").focus();
			return;
		}
		if($("#oasisMonth").val()==""){
			alert("날짜를 입력하세요");
			$("#month").focus();
			return;
		}
		if($("#oasisDay").val()==""){
			alert("날짜를 입력하세요");
			$("#day").focus();
			return;
		}
		
		if(confirm("등록 하시겠습니까?")){
			document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/dustReg.do?mnuCd=${mnuCd}";
	       	document.frm.submit();
		}
	}
	
</script>

<section id="content">

	<h2 class="h2-title"><i class="fa fa-check-square"></i>oasis 등록</h2>
		<div class="box-style1 x-scroll-auto" >
			<div>
				<ul class="tabs">
					<li style="border-style: solid; border-bottom-style:none; border-width: thin; background-color: gray;">oasis</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(2);">radiohead</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(3);">boowhal</li>
					<div class="txtR" style="width: 73.2%; display: inline-block;">
						<button type="button" id="Ibtn" class="btn-basic" onClick="javascript:fn_reg();" style="background-color: green;color:white;">등록</button>
					</div>
				</ul>
			</div>
			<div style="border-style: solid; border-width: thin; width:100%; height: auto; padding: 10px 10px 10px 10px;">
				<form id="frm" name="frm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
					<input type="hidden" id="ysmNo" name="ysmNo" value="${detail.ysmNo}" />
					<input type="hidden" id="bandCd" name="bandCd" value="2" />
					<input type="hidden" id="docGb" name="docGb" value="1" />
					<input type="hidden" id="oasisYn" name="oasisYn" value="Y" />
					<table border="1" class="table-write" style="width: 101.2%; position: relative; left: -10px; top: -10px; border-left-style:hidden; border-right-style: hidden; border-top-style: hidden;">
						<colgroup>
							<col width="15%" >
							<col width="35%" >
							<col width="15%" >
							<col width="35%" >
						</colgroup>
						<tbody>
							<tr>
								<th>구분</th>
								<td>oasis</td>
								<th>narcissus</th>
								<td><input type="text" id="narcissus" name="narcissus" style="width: 200px;" readonly="readonly" /></td>
							</tr>
							<tr>
								<th>사용자ID</th>
								<td><input type="text" id="ysmId" name="ysmId" style="width: 200px;" readonly="readonly" /></td>
								<th>사용자명</th>
								<td><input type="text" id="ysmNm" name="ysmNm" style="width: 200px;" readonly="readonly" /><button type="button" class="btn-basic" style="padding: 2px 6px;" onclick="javascript:findYsmUser();">찾기</button></td>
							</tr>
						</tbody>
					</table>
				<div style="border-style: solid; border-width: thin; width:700px;; height: auto; padding: 30px 20px 20px 20px; margin: 10px 10px 10px 450px;">
					<div>
						<h1 style="text-align: center; font-size:x-large; padding-bottom: 20px;">oasis</h1>
					</div>
					<font style="font-size: medium;">본 동의서의 목적은 노인상담센터가 제공하는 상담서비스에 관한 기본적인 정보를 드리고 이해를 높이고자하는 것입니다. 복사본을 원하시면 상담자에게 요청하시기 바랍니다.</font>
					<br><br>
					<h2><span style="font-size: 20px;">▣</span> 비밀보장</h2><br>
					<font style="font-size: medium">노인상담센터의 상담은 상담자 윤리 규정에 의거하여 비밀보장이 유지됩니다. 각 상담 회기 후 작성되는 상담일지 또한 안전하게 저장됩니다. 
					상담내용의 비밀보장에는 몇 가지 예외상황이 있습니다.</font><br>
					<font style="font-size: medium;">1. 상담사의 전문가로서 계속적인 성장을 위하여 사례에 대한 자문을 받는 경우 상담 내용을 나눌 수 있습니다.</font><br>
					<font style="font-size: medium;">2. 내담자가 자살 시도를 하려고 할 때, 혹은 다른 사람을 해칠 의도가 있을 때, 가정 폭력 등으로 가족구성원이 학대 받고 있을 때, 
					내담자가 감염 병이 있다는 것을 되었을 때에는 비밀보장이 지켜지지 않을 수 있습니다.</font><br>
					<font style="font-size: medium;">3. 법원의 요청으로 인해 상담을 받을 경우 모든 상담 내용은 관련기관에 통보될 수 있습니다.</font><br>
					<font style="font-size: medium;">4. 내담자가 상담자에게 지문이나 대화를 허가한 경우 해당되는 친지나 전문가와 상담 내용의 일부분을 나눌 수 있습니다.</font><br><br>
					<h2><span style="font-size: 20px;">▣</span> 내담자의 권리</h2><br>
					<font style="font-size: medium;">상담의 시작과 끝에 대한 결정은 내담자의 권리입니다. 내담자는 상담시작 전 혹은 상담도중에 언제든지 상담을
					거부하거나 중단할 수 있는 권리가 있습니다. 상담종결을 원할 경우 언제든지 저와 의논해 주시기 바랍니다. 또한 내담자는 자신이 받은 상담 및 심리검사의 기록을 볼 수 있는 권리가 있습니다.</font>
					<br><br>
					<h2><span style="font-size: 20px;">▣</span> 녹음동의</h2><br>
					<font style="font-size: medium;">녹음 동의는 상담자가 전문가로서의 수련과 성장을 위하여 사례에 대하여 자문을 받거나, 더 나은 상담을 제공하기 위하여 상담
					내용을 녹음을 하는 것에 대한 동의를 구하고자 하는 것입니다.</font><br>
					<font style="font-size: medium;">녹음 파일은 안전하게 저장되며 녹음 파일에도 비밀보장의 원칙이 적용됩니다. 녹음된 회기 내용은 상담자와 상담자의 수련에 관련된 
					전문가들만 들을 수 있습니다. 상담의 녹음에 관한 결정은 내담자의 권리입니다. 내담자는 언제든지 녹음을 거부하거나 중단 할 수 있습니다. 녹음이 불편한 경우 언제든지 상담자에게 
					말씀해 주시기 바랍니다.</font><br>
					<font style="font-size: medium;">위의 상담동의서 내용을 상담자로부터 충분히 설명을 들었으며 모든 사항에 동의합니다. 나는 질문이 있을 경우 상담자에게 
					언제든지 질문할 권리를 가지고 있다는 것을 알고 있습니다.</font>
					<br><br><br>
					<div style="text-align: center;">
						<font style="font-size: medium;">날&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;짜 :</font>
						<input type="text" id="oasisYear" name="oasisYear" style="width: 60px;" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '');"><font style="font-size: medium;">년</font>
						<input type="text" id="oasisMonth" name="oasisMonth" style="width: 30px;" maxlength="2" oninput="this.value = this.value.replace(/[^0-9]/g, '');"><font style="font-size: medium;">월</font>
						<input type="text" id="oasisDay" name="oasisDay" style="width: 30px;" maxlength="2" oninput="this.value = this.value.replace(/[^0-9]/g, '');"><font style="font-size: medium;">일</font><br>
						<font style="font-size: medium;">이름 : </font>
						<input type="text" value="${map.userId}" style="width: 130px;" readonly="readonly" />
					</div>
				</div>
				</form>
			</div>
		</div>
		
		<!-- end -->

	</section>

</html>

