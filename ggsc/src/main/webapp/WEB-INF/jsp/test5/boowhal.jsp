<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

    <link href="<c:out value="${pageContext.request.contextPath}" />/css/style.css" rel="stylesheet">
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

	function fn_reg(){
		
		var frm = document.frm;
		
		if(frm.ysmNm.value.length == 0) {
			alert("아이디를 선택해주세요");
			return false;
		}
		if(frm.strtTime.value.length == 0) {
			alert("시작시간을 적어주세요");
			return false;
		}
		if(frm.fate.value.length == 0) {
			alert("fate을 적어주세요");
			return false;
		}
		if(frm.gender.value.length == 0) {
			alert("gender 적어주세요");
			return false;
		}
		if(frm.endTimeHour.value.length == 0) {
			alert("endTimeHour 적어주세요");
			return false;
		}
		if(frm.endTimeMin.value.length == 0) {
			alert("endTimeMin 적어주세요");
			return false;
		}
		if(frm.g1Gb.value.length == 0) {
			alert("g1Gb 적어주세요");
			return false;
		}
		if(frm.g2Gb.value.length == 0) {
			alert("g2Gb 적어주세요");
			return false;
		}
		if(frm.g3Gb.value.length == 0) {
			alert("g3Gb 적어주세요");
			return false;
		}
		if(frm.totTime.value.length == 0) {
			alert("totTime 적어주세요");
			return false;
		}
		if(frm.song1Like.value.length == 0) {
			alert("song1Like 적어주세요");
			return false;
		}
		if(frm.song2Like.value.length == 0) {
			alert("song2Like 적어주세요");
			return false;
		}
		if(frm.song3Like.value.length == 0) {
			alert("song3Like 적어주세요");
			return false;
		}
		if(frm.likeTot.value.length == 0) {
			alert("likeTot 적어주세요");
			return false;
		}
		if(frm.boringTot.value.length == 0) {
			alert("boringTot 적어주세요");
			return false;
		}
		if(frm.moreLike.value.length == 0) {
			alert("moreLike 적어주세요");
			return false;
		}
		if(frm.songTot.value.length == 0) {
			alert("songTot 적어주세요");
			return false;
		}
		
		if(confirm("등록 하시겠습니까?")){
			document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/dustReg.do?mnuCd=${mnuCd}";
	       	document.frm.submit();
		}
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
	
</script>

<section id="content">

	<h2 class="h2-title"><i class="fa fa-check-square"></i>Boowhal</h2>
		<div class="box-style1 x-scroll-auto" >
			<div>
				<ul class="tabs">
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(1);">oasis</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(2);">radiohead</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin; background-color: gray;">boowhal</li>
					<div class="txtR" style="width: 73.2%; display: inline-block;">
						<button type="button" id="Ibtn" class="btn-basic" onClick="javascript:fn_reg();" style="background-color: green;color:white;">등록</button>
					</div>
				</ul>
			</div>
			<div style="border-style: solid; border-width: thin; width:100%; height: auto; padding: 10px 10px 10px 10px;">
				<form id="frm" name="frm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
					<input type="hidden" id="ysmNo" name="ysmNo" value="" />
					<input type="hidden" id="bandCd" name="bandCd" value="4" />
					<input type="hidden" id="docGb" name="docGb" value="1" />
					<input type="hidden" id="ysmGb" name="ysmGb" />
					<input type="hidden" id="boowhalYn" name="boowhalYn" value="Y" />
					<table border="1" class="table-write" style="width: 101.2%; position: relative; left: -10px; top: -10px; border-left-style:hidden; border-right-style: hidden; border-top-style: hidden;">
						<colgroup>
							<col width="15%" >
							<col width="35%" >
							<col width="15%" >
							<col width="35%" >
						</colgroup>
						<tbody>
							<tr>
								<th>문서구분</th>
								<td>boowhal</td>
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
				<div style="border-style: solid; border-width: thin; width:700px; height: auto; padding: 30px 20px 20px 20px; margin: 10px 10px 10px 450px;">

					<h1 style="text-align: center; font-size:x-large; padding-bottom: 20px;">Boowhal</h1><br>	
					<table border="1">
						<colgroup>
							<col width="8%"></col>
							<col width="17%"></col>
							<col width="10%"></col>
							<col width="15%"></col>
							<col width="10%"></col>
							<col width="15%"></col>
							<col width="10%"></col>
							<col width="15%"></col>
						</colgroup>
						<tr>
							<td>체크박스</td>
							<td colspan="3">
								<c:forEach items="${g4List}" var="list">
									<input type="checkbox" id="g4Gb${list.odr }" name="g4Gb" value="${list.odr }" /><label for="g4Gb${list.odr }">${list.ysmMclassNm }</label>
								</c:forEach>
							</td>
							<td>시작시간</td>
							<td><input type="text" style="width: 30px;" id="strtTime" name="strtTime" onlyNumber maxlength=2 />시 <input type="text" style="width: 30px;" id="strtMin" name="strtMin" onlyNumber maxlength=2/>분</td>
							<td>fate</td>
							<td>
								<select id="fate" name="fate">
									<c:forEach items="${test1List}" var="list">
										<option value="${list.num }" > ${list.title }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>작성일</td>
							<td><input type="text" style="width: 45px;" id="year" name="year" oninput="this.value = this.value.replace(/[^0-9]/g, '')" maxlength="4"/>년
							<input type="text" style="width: 25px;" id="month" name="month" oninput="this.value = this.value.replace(/[^0-9]/g, '')" maxlength="2"/>월
							<input type="text" style="width: 25px;" id="day" name="day" oninput="this.value = this.value.replace(/[^0-9]/g, '')" maxlength="2"/>일</td>
							<td>성별</td>
							<td><input type="radio" name="gender" value="M" />남&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="F" />여</td>
							<td>종료시간</td>
							<td><input type="text" style="width: 30px;" id="endTimeHour" name="endTimeHour" onlyNumber maxlength=2 />시 <input type="text" style="width: 30px;" id="endTimeMin" name="endTimeMin" onlyNumber maxlength=2 />분</td>
							<td>총 소요시간</td>
							<td><input type="text" style="width: 50px;" id="totTime" name="totTime" onlyNumber maxlength=3 />분</td>
						</tr>
					</table>
					<br>
					<font style="font-size: medium;"> ※ 상담사는 아래의 척도를 시행하기에 앞서 신체적 질병 및 인지·지각장애 사항을 점검하고, 
					그로 인하여 파생되는 어려움은 아닌지에 대하여 변별 사용하시길 바랍니다.</font><br><br>
					<table border="1">
						<colgroup>
							<col width="*"></col>
							<col width="10%"></col>
							<col width="10%"></col>
							<col width="20%"></col>
						</colgroup>
						<tr>
							<td rowspan="2">라디오</td>
							<td colspan="2">응답</td>
							<td>관찰평가</td>
						</tr>
						<tr>
							<td>예</td>
							<td>아니오</td>
							<td>내용 및 특징</td>
						</tr>
						<tr>
							<td>
								<c:forEach items="${g1List }" var="list">
									<input type="radio" id="g1Gb${list.odr}" name="g1Gb" value="${list.odr}" /><label for="g1Gb${list.odr}">${list.ysmMclassNm}</label>
								</c:forEach>
							</td>
							<td><input type="radio" id="ansr1Y" name="ansr1" value="Y" /></td>
							<td><input type="radio" id="ansr1N" name="ansr1" value="N" /></td>
							<td><input type="text" id="ansr1Cntn" name="ansr1Cntn" maxlength="20" /></td>
						</tr>
						<tr>
							<td>
								<c:forEach items="${g2List}" var="list">
									<input type="radio" id="g2Gb${list.odr}" name="g2Gb" value="${list.odr}" /><label for="g2Gb${list.odr}">${list.ysmMclassNm}</label>
								</c:forEach>
							</td>
							<td><input type="radio" id="ansr2Y" name="ansr2" value="Y" /></td>
							<td><input type="radio" id="ansr2N" name="ansr2" value="N" /></td>
							<td><input type="text" id="ansr2Cntn" name="ansr2Cntn" maxlength="20" /></td>
						</tr>
						<tr>
							<td>
								<c:forEach items="${g3List}" var="list">
									<input type="radio" id="g3Gb${list.odr}" name="g3Gb" value="${list.odr}" /><label for="g3Gb${list.odr}">${list.ysmMclassNm}</label>
								</c:forEach>
							</td>
							<td><input type="radio" id="ansr3Y" name="ansr3" value="Y" /></td>
							<td><input type="radio" id="ansr3N" name="ansr3" value="N" /></td>
							<td><input type="text" id="ansr3Cntn" name="ansr3Cntn" maxlength="20" /></td>
						</tr>
					</table>
					<br>
					<font style="font-size: medium;"> ※ 지시문</font><br><br>
					<table border="1" style="width: 100%;">
						<tr>
							<td style="text-align: left; padding: 5px;">"OOO 어르신에게 몇 개의 문장을 읽어드리겠습니다.<br>이에 대하여 가장 솔직한 생각을 예, 아니오의 수준에 맞도록 답변해주시면 됩니다."</td>
						</tr>
					</table>
					<br>
					<table border="1">
						<colgroup>
							<col width="20%"></col>
							<col width="*"></col>
							<col width="10%"></col>
							<col width="10%"></col>
						</colgroup>
						<thead>
							<th colspan="2">좋아하는 곡</th>
							<th>예</th>
							<th>아니오</th>
						</thead>
						<tbody>
							<tr>
								<td colspan="2">Live forever</td>
								<td><input class="likeSong" type="radio" id="song1LikeY" name="song1Like" value="Y" /></td>
								<td><input class="boringSong" type="radio" id="song1LikeN" name="song1Like" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2">Everything in its right place</td>
								<td><input class="likeSong" type="radio" id="song2LikeY" name="song2Like" value="Y" /></td>
								<td><input class="boringSong" type="radio"  id="song2LikeN" name="song2Like" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2">paracture</td>
								<td><input class="likeSong" type="radio" id="song3LikeY" name="song3Like" value="Y" /></td>
								<td><input class="boringSong" type="radio" id="song3LikeN" name="song3Like" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2">wonderwall</td>
								<td><input class="likeSong" type="radio" id="song4LikeY" name="song4Like" value="Y" /></td>
								<td><input class="boringSong" type="radio" id="song4LikeN" name="song4Like" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2">the masterplan</td>
								<td><input class="likeSong" type="radio" id="song5LikeY" name="song5Like" value="Y" /></td>
								<td><input class="boringSong" type="radio" id="song5LikeN" name="song5Like" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2">kid a</td>
								<td><input class="likeSong" type="radio" id="song6LikeY" name="song6Like" value="Y" /></td>
								<td><input class="boringSong" type="radio" id="song6LikeN" name="song6Like" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2">yellow</td>
								<td><input class="likeSong" type="radio" id="song7LikeY" name="song7Like" value="Y" /></td>
								<td><input class="boringSong" type="radio" id="song7LikeN" name="song7Like" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2">소나기</td>
								<td><input class="likeSong" type="radio" id="song8LikeY" name="song8Like" value="Y" /></td>
								<td><input class="boringSong" type="radio" id="song8LikeN" name="song8Like" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2">possibility</td>
								<td><input class="likeSong" type="radio" id="song9LikeY" name="song9Like" value="Y" /></td>
								<td><input class="boringSong" type="radio" id="song9LikeN" name="song9Like" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2">talk tonight</td>
								<td><input class="likeSong" type="radio" id="song10LikeY" name="song10Like" value="Y" /></td>
								<td><input class="boringSong" type="radio" id="song10LikeN" name="song10Like" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2">slide away</td>
								<td><input class="likeSong" type="radio" id="song11LikeY" name="song11Like" value="Y" /></td>
								<td><input class="boringSong" type="radio" id="song11LikeN" name="song11Like" value="N" /></td>
							</tr>
							<tr>
								<td colspan="2">paranoid android</td>
								<td><input class="likeSong" type="radio" id="song12LikeY" name="song12Like" value="Y" /></td>
								<td><input class="boringSong" type="radio" id="song12LikeN" name="song12Like" value="N" /></td>
							</tr>
							<tr>
								<td>개수</td>
								<td style="text-align: left; padding-left: 5px;">※ 체크 시 1점부여, 그 외 0점을 부여함</td>
								<td><input type="text" class="wd30" id="likeTot" name="likeTot" readonly onlyNumber maxlength=2>점</td>
								<td><input type="text" class="wd30" id="boringTot" name="boringTot" readonly onlyNumber maxlength=2>점</td>
							</tr>
							<tr>
								<td>더있나요</td>
								<td style="text-align: left; padding-left: 5px;">※총17점(설문 12점, 상담자소견 5점) 중 10점이상인 경우 상담대상자로 선정함<br>※긴급상황으로 여겨질 수 있는 2번과 12번의 답이 "예:일 경우 상담대상자로 선정</td>
								<td><input type="text" class="wd30" id="moreLike" name="moreLike" onlyNumber maxlength=2>점</td>
								<td><input type="text" class="wd30" id="songTot" name="songTot" readonly onlyNumber maxlength=2>점</td>
							</tr>
						</tbody>
					</table>
				</div>
				</form>
			</div>
		</div>
	<script>
		$(".likeSong, .boringSong").change(function(e) {
			var y = $(".likeSong:checked").length,  n= $(".boringSong:checked").length;
			$("#likeTot").val(y);
			$("#boringTot").val(n);
			var likeTot = $("#likeTot").val();
			var boringTot = $("#boringTot").val();
			var totalTot = parseInt(likeTot)+parseInt(boringTot);
			
			
			var moreLike = $("#moreLike").val();
			var totalTot2 = parseInt(moreLike) + parseInt(likeTot);
		});
		
		$("#moreLike").change(function(e) {
			var a = $("#moreLike").val();
			var b = $("#likeTot").val();
			var tot = parseInt(a)+parseInt(b);
			$("#songTot").val(tot);
			
			var q2  = $("input[name=song2Like]:checked").val();
			var q12 = $("input[name=song11Like]:checked").val();
			
			if(tot >= 10) {
				alert("검사결과 10점이상이므로 상담대상자로 선정됐습니다");
				$("#ysmGb").val("Y")
			} else if(q2 == "Y" || q12 == "Y"){
				alert("2번 또는 12번 항목을 체크하셨으므로  상담대상자로 선정됐습니다.");
				$("#ysmGb").val("Y");
				$("#songTot").val(10);
			}
			
		})
		
		
	</script>

		<!-- end -->
	</section>
</html>

