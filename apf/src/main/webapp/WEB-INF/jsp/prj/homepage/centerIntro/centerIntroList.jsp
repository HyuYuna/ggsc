<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
	<head>
		<link rel="stylesheet" href="/gnoincoun/css/style2.css" />
	</head>
	<style>
		table {
		    text-align : center;
		}
		th {
			text-align : center;
			padding : 10px 18px 12px;
		}
		th, td {
		    border: 1px solid #444444;
		 }
		ul[style] li a{
			font-size:16px;
	}
	</style>
    <script>
	  	$(document).ready(function() {
	  		$("#operating").css("display","none");
	  		$("#vision").css("display","none");
	  		$("#pathway").css("display","none");
	  		$("#together").css("display","none");
	  		$("#centerInfo").css("display","none");
	  		$("#directions").css("display","none");
	  		
	  		$("#operating2").css("display","none");
	  		$("#operating3").css("display","none");
	  		$("#operating4").css("display","none");
	  		
	  		var gubun = "${gubun}"
	  		
  			if(gubun == "directions") {
		  		$("#greeting").css("display","none");
		  		$("#directions").css("display","");
	  		}
		});
	  	
	  	function greeting() {
	  		$("#greeting").css("display","");
	  		$("#operating").css("display","none");
	  		$("#vision").css("display","none");
	  		$("#pathway").css("display","none");
	  		$("#together").css("display","none");
	  		$("#centerInfo").css("display","none");
	  		$("#directions").css("display","none");
		}
	  	
	  	function operating() {
	  		$("#greeting").css("display","none");
	  		$("#operating").css("display","");
	  		$("#vision").css("display","none");
	  		$("#pathway").css("display","none");
	  		$("#together").css("display","none");
	  		$("#centerInfo").css("display","none");
	  		$("#directions").css("display","none");
		}
	  	
	  	function vision() {
	  		$("#greeting").css("display","none");
	  		$("#operating").css("display","none");
	  		$("#vision").css("display","");
	  		$("#pathway").css("display","none");
	  		$("#together").css("display","none");
	  		$("#centerInfo").css("display","none");
	  		$("#directions").css("display","none"); 
		}
	  	
	  	function pathway() {
	  		$("#greeting").css("display","none");
	  		$("#operating").css("display","none");
	  		$("#vision").css("display","none");
	  		$("#pathway").css("display","");
	  		$("#pathwayBtn1").css("display","");
			$("#pathwayBtn2").css("display","none");
			$("#pathwayBtn3").css("display","none");
			$("#pathwayBtn4").css("display","none");
	  		$("#together").css("display","none");
	  		$("#centerInfo").css("display","none");
	  		$("#directions").css("display","none"); 
		}
	  	
	  	function together() {
	  		$("#greeting").css("display","none");
	  		$("#operating").css("display","none");
	  		$("#vision").css("display","none");
	  		$("#pathway").css("display","none");
	  		$("#together").css("display","");
	  		$("#centerInfo").css("display","none");
	  		$("#directions").css("display","none");
		}
	  	
	  	function centerInfo() {
	  		$("#greeting").css("display","none");
	  		$("#operating").css("display","none");
	  		$("#vision").css("display","none");
	  		$("#pathway").css("display","none");
	  		$("#together").css("display","none");
	  		$("#centerInfo").css("display","");
	  		$("#directions").css("display","none");
		}
		
		function directions() {
			$("#greeting").css("display","none");
	  		$("#operating").css("display","none");
	  		$("#vision").css("display","none");
	  		$("#pathway").css("display","none");
	  		$("#together").css("display","none");
	  		$("#centerInfo").css("display","none");
	  		$("#directions").css("display","");
		}
		
		function operatingBtn(no) {
			if(no == "1") {
				$("#operating1").css("display","");
				$("#operating2").css("display","none");
				$("#operating3").css("display","none");
				$("#operating4").css("display","none");
			} else if(no == "2") {
				$("#operating1").css("display","none");
				$("#operating2").css("display","");
				$("#operating3").css("display","none");
				$("#operating4").css("display","none");
			} else if(no == "3") {
				$("#operating1").css("display","none");
				$("#operating2").css("display","none");
				$("#operating3").css("display","");
				$("#operating4").css("display","none");
			} else if(no == "4") {
				$("#operating1").css("display","none");
				$("#operating2").css("display","none");
				$("#operating3").css("display","none");
				$("#operating4").css("display","");
			}
		}
		
		function pathwayBtn(no) {
			if(no == "1") {
				$("#pathwayBtn1").css("display","");
				$("#pathwayBtn2").css("display","none");
				$("#pathwayBtn3").css("display","none");
				$("#pathwayBtn4").css("display","none");
			} else if(no == "2") {
				$("#pathwayBtn1").css("display","none");
				$("#pathwayBtn2").css("display","");
				$("#pathwayBtn3").css("display","none");
				$("#pathwayBtn4").css("display","none");
			}else if(no == "3") {
				$("#pathwayBtn1").css("display","none");
				$("#pathwayBtn2").css("display","none");
				$("#pathwayBtn3").css("display","");
				$("#pathwayBtn4").css("display","none");
			} else if(no == "4") {
				$("#pathwayBtn1").css("display","none");
				$("#pathwayBtn2").css("display","none");
				$("#pathwayBtn3").css("display","none");
				$("#pathwayBtn4").css("display","");
			}
		}
		
		function listCenter(idx){
		  console.log("idx : "+idx);
		  var html = undefined;
		  switch(idx){
			  // 내용 회원관 랜덤으로 나와야함 ajax로

			case 1 : //가평
					 
				html = 	'<table style="border:1px;">' +
						'<colgroup>' +
						'<col width="10%"><col width="10%"><col width="10%">' +
						'</colgroup>' +
					    '<tr>' +
					    '<th>센터명</th>' +
					    '<th>주소</th>' +
					    '<th>연락처</th>' +
					    '</tr>' +
						'<tr>' +
					    '<a href="gpsilver.org/home/">' +
						'<td class="title">가평군 노인복지관</p>' +
						'<td class="address">경기도 가평군 가평읍 읍내리 625-8</div>' +
						'<td class="tel">031-581-6063</div>' +
						'</a>' +
						'</tr>' +
						'</table>'
				break;
			case 2 : // 경북
				html = '<table style="border:1px;">' +
						'<colgroup>' +
						'<col width="10%"><col width="10%"><col width="10%">' +
						'</colgroup>' +
					    '<tr>' +
					    '<th>센터명</th>' +
					    '<th>주소</th>' +
					    '<th>연락처</th>' +
					    '</tr>' +
						'<tr>' +
					    '<a href="gpsilver.org/home/">' +
						'<td class="title">가평군 노인복지관</p>' +
						'<td class="address">경기도 가평군 가평읍 읍내리 625-8</div>' +
						'<td class="tel">031-581-6063</div>' +
						'</a>' +
						'</tr>' +
						'<tr>' +
					    '<a href="gpsilver.org/home/">' +
						'<td class="title">가평군 노인복지관</p>' +
						'<td class="address">경기도 가평군 가평읍 읍내리 625-8</div>' +
						'<td class="tel">031-581-6063</div>' +
						'</a>' +
						'</tr>' +
						'</table>'
				break;
			
		  }
		if(html){
			$('.mapList').html(html);
		} 
		
	}
		
  </script>
<style>
	#wrap {width: 100%; margin: auto; height: auto;}
</style>
<section class="service-2 section">
	<div id="wrap">
        <div style="border-top: 1px solid #f09d4c; overflow: hidden;">
			<img src='/gnoincoun/images/cenIntro1.jpg' alt="맘편한 상담" />
		</div>
		<div style="width: 910px; margin: auto;">
			<span style="float: left; margin-top: 20px; margin-bottom: 15px; font: bold; font-weight: 900;">센터안내</span>
			<ul class="main-menu" style="width: 730px; font-size: 14px; float: right; margin-top: 20px; margin-bottom: 15px;"> <!-- margin-right: 26%; -->
				<li><a href="javascript: greeting();">인사말</a></li>
				<li><a href="javascript: operating();">운영법인</a></li>
				<li><a href="javascript: vision();">미션과 비전</a></li>
				<li><a href="javascript: pathway();">걸어온길</a></li>
				<li><a href="javascript: together();">함께하는<br/>사람들</a></li>
				<li><a href="javascript: centerInfo();">시군센터</a></li>
				<li><a href="javascript: directions();">오시는길</a></li>
			</ul>
		</div>
		
		<!-- content 영역 -->
		<div id="greeting">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 920px; margin: auto; margin-top: 30px;">
				<img src='/gnoincoun/images/cenIntro2.jpg' alt="전화상담" style="width: 920px;"/>
			</div>
			<div style="width: 100%; text-align: center; margin-top: 20px;">
				<!-- <button type="button" class="btn btn-warning" style="border-radius: 11px;" >전화상담 신청하기</button> -->
			</div>
		</div>
		<div id="operating">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 100%; margin: auto; text-align: center; margin-top: 30px; margin-bottom: 30px;">
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: operatingBtn('1')"><font size = "3px">소개</font></button>
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: operatingBtn('2')"><font size = "3px">설립목적</font></button>
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: operatingBtn('3')"><font size = "3px">주요사업</font></button>
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: operatingBtn('4')"><font size = "3px">조직도</font></button>
			</div>
			
			<div id="operating1" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro6.jpg' alt="내방상담" style="width: 920px;"/>
			</div>
			<div id="operating2" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro15.png' alt="내방상담" style="width: 920px;"/> 
			</div>
			<div id="operating3" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro7.jpg' alt="내방상담" style="width: 920px;"/>
			</div>
			<div id="operating4" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro13.png' alt="내방상담" style="width: 920px;"/>
			</div>
			
		</div>
		<div id="vision">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 920px; margin: auto; margin-top: 30px;">
				<img src='/gnoincoun/images/cenIntro16.png' alt="미션과 비전" style="width: 920px;"/>
			</div>
		</div>
		<div id="pathway">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 100%; margin: auto; text-align: center; margin-top: 30px; margin-bottom: 30px;">
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: pathwayBtn('1')"><font size = "3px">2020 ~ 2021</font></button>
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: pathwayBtn('2')"><font size = "3px">2018 ~ 2019</font></button>
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: pathwayBtn('3')"><font size = "3px">2016 ~ 2017</font></button>
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: pathwayBtn('4')"><font size = "3px">1999 ~ 2012</font></button>
			</div>
			
			<div id="pathwayBtn1" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro9.png' alt="센터안내" style="width: 920px;"/>
			</div>
			<div id="pathwayBtn2" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro10.png' alt="센터안내" style="width: 920px;"/>
			</div>
			<div id="pathwayBtn3" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro11.png' alt="센터안내" style="width: 920px;"/>
			</div>
			<div id="pathwayBtn4" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro12.png' alt="센터안내" style="width: 920px;"/>
			</div>
		</div>
		<div id="together">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 920px; margin: auto; margin-top: 30px;">
				<img src='/gnoincoun/images/cenIntro14.png' alt="함께하는 사람들"
					style="width: 920px;" />
				<!--  <div style="margin-top: 35px;">
					<table class="table table-bordered" style="vertical-align:middle;">
						<colgroup>
							<col width="30%" />
							<col width="10%" />
							<col width="8%" />
							<col width="15%" />
							<col width="35%" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col" colspan="2">직급</th>
								<th scope="col">이름</th>
								<th scope="col">전화번호</th>
								<th scope="col">당담업무</th>
							</tr>
						</thead>
						<tbody style="vertical-align:middle;">
							<tr>
								<td colspan="2" rowspan="2">센터장</th>
								<td rowspan="2">김미나</td>
								<td rowspan="2">070-4832-6360</td>
								<td>• 센터 운영 총괄</td>
							</tr>
							<tr>
								<td>• 대외 협력업무</td>
							</tr>
							<tr>
								<td rowspan="5">노인상담지원팀</th>
								<td rowspan="2">팀장</td>
								<td rowspan="2">오명심</td>
								<td rowspan="2">070-4832-6361</td>
								<td>• 센터 사업 총괄</td>
							</tr>
							<tr>	
								<td>• 복무 및 인사관리</td>
							</tr>
							<tr>
								<td rowspan="3">과장</th>
								<td rowspan="3">박경숙</td>
								<td rowspan="3">070-4832-6363</td>
								<td>• 상담지원사업</td>
							</tr>
							<tr>	
								<td>• 교육지원사업</td>
							</tr>
							<tr>	
								<td>• 외부지원사업</td>
							</tr>
						</tbody>
					</table>
				</div> -->
			</div>
			<div style="width: 100%; text-align: center; margin-top: 20px;">
				<!-- <button type="button" class="btn btn-success" style="border-radius: 11px;" onclick="location.href='/gnoincoun/comfCnsWrite.do'">온라인상담 예약하기</button> -->
			</div>
		</div>
		<div id="centerInfo">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div class='full bg-gray'>
				<div class='wrap'>
				<div style="width: 100%; text-align: center; margin-top: 50px;">
				<div class='map-box'>
						<div class='main-title'>
							<div class='left'><img src="/gnoincoun/images/map/icon_map.png" alt="icon" class='map_icon'/>&nbsp;지도에 표시된 마커를 선택해주세요.</div>
							<div>선택지역 : <span id='nowMap'>전체</span></div>
						</div>
						<div class='main-content'>
							<div class='left'>
								<div class='map_img'>
									<img src="/gnoincoun/images/map/map.png" alt="경기도청" usemap="#marker"/>
									<map name="marker">
										<area shape="poly" coords="215,109,233,78,254,91,253,98,269,101,273,121,261,126,252,133,249,147,246,153,253,157,253,165,246,166,254,175,256,191,250,202,257,207,257,217,249,216,241,219,238,217,237,205,233,196,230,192,222,189,212,197,212,182,197,158,188,154,193,129,198,135,200,115,211,109" href="javascript:listCenter(1);" alt="가평"/>
										<area shape="poly" coords="88,215,92,199,102,195,111,200,114,193,109,185,99,189,93,189,96,170,68,171,64,180,33,183,36,189,66,207,65,206" href="javascript:listCenter(2);" alt="고양"/>
										<area shape="circle" coords="122,237,18" href="javascript:listCenter(3);"alt="과천"/>
										<area shape="rectangle" coords="75,216,101,249" href="javascript:listMuseum(4);"alt="광명"/>
										<area shape="poly" coords="152,291,171,274,171,250,191,248,195,237,201,233,212,248,209,262,226,289,213,298,204,303,201,314,187,313,188,293,173,286,169,286" href="javascript:listCenter(5);" alt="광주"/>
										<area shape="circle" coords="142,206,17" href="javascript:listCenter(6);"alt="구리"/>
										<area shape="circle" coords="96,303,17" href="javascript:listCenter(7);" alt="군포" />
										<area shape="poly" coords="0,160,7,157,27,152,39,198,29,195,25,211,7,211,-0,192,157" href="javascript:listCenter(8);" alt="김포"/>
										<area shape="poly" coords="157,169,181,161,201,165,212,191,206,204,192,238,188,212,168,210,163,214,162,196,158,187,147,186,155,169" href="javascript:listCenter(9);" alt="남양주"/>
										<area shape="circle" coords="139,114,18" href="javascript:listCenter(10);" alt="동두천" />
										<area shape="circle" coords="55,234,20" href="javascript:listCenter(11);"alt="부천"/>
										<area shape="circle" coords="150,262,17" href="javascript:listCenter(12);" alt="성남" />
										<area shape="poly" coords="137,314,132,327,113,332,114,323,107,320,116,309,115,302,127,309,138,309,141,308" href="javascript:listCenter(13);" alt="수원"/>
										<area shape="circle" coords="54,274,17" href="javascript:listCenter(14);" alt="시흥" />
										<area shape="poly" coords="53,304,63,291,77,278,84,281,76,297,75,308,70,314" href="javascript:listCenter(15);" alt="안산"/>
										<area shape="poly" coords="146,376,148,389,156,393,156,401,148,409,161,409,169,417,169,425,179,421,194,419,216,413,217,402,233,391,233,389,245,375,245,370,237,360,225,355,223,362,225,369,221,373,217,366,197,369,189,361,181,359,173,372,156,376,154,375" href="javascript:listCenter(16);" alt="안성"/>
										<area shape="circle" coords="101,268,16" href="javascript:listCenter(17);" alt="안양"  />
										<area shape="poly" coords="98,186,108,182,120,186,118,180,114,173,116,159,121,150,137,149,145,147,146,134,130,134,121,128,119,118,118,109,112,109,103,133,105,134,98,137,97,153,105,155,101,165,100,176,101,178" href="javascript:listCenter(18);" alt="양주"/>
										<area shape="poly" coords="309,287,301,237,319,230,321,227,316,222,296,195,282,204,266,199,257,205,263,212,258,217,252,217,235,218,234,199,231,196,206,205,197,235,208,234,215,249,212,258,217,266,221,261,228,263,241,263,249,263,257,271,264,265,277,269,280,266,292,269,292,269,296,272,296,281" href="javascript:listCenter(19);" alt="양평"/>
										<area shape="poly" coords="221,269,226,285,237,287,254,297,256,305,253,311,253,318,252,330,249,345,259,344,267,343,283,355,288,357,303,332,305,318,307,303,305,286,291,279,279,270,269,274,264,269,255,272,248,270,247,265,231,267,231,271" href="javascript:listCenter(20);" alt="여주"/>
										<area shape="poly" coords="94,48,81,52,86,60,83,72,82,78,73,89,77,94,86,90,93,97,90,86,104,93,115,85,122,90,114,105,119,109,128,94,141,94,154,89,153,77,147,75,143,65,156,66,161,69,165,68,160,47,162,26,145,13,145,3,138,2,123,17,114,20,106,33,101,37,113,45,111,48,96,48" href="javascript:listCenter(21);" alt="연천"/>
										<area shape="circle" coords="127,350,17" href="javascript:listCenter(22);"alt="오산" />
										<area shape="poly" coords="157,331,159,341,148,355,143,357,149,365,155,371,172,375,171,362,181,356,193,360,193,368,214,368,225,371,220,361,222,356,216,352,213,349,216,346,197,334,198,312,181,313,185,292,172,289,147,302,140,322,135,328,152,328" href="javascript:listCenter(23);" alt="용인"/>
										<area shape="circle" coords="128,289,16" href="javascript:listCenter(24);"alt="의왕" />
										<area shape="circle" coords="135,169,18" href="javascript:listCenter(25);"alt="의정부"/>
										<area shape="poly" coords="208,305,198,333,220,345,222,353,231,355,247,366,248,379,241,382,269,377,273,368,275,352,261,338,255,346,247,346,241,337,247,336,251,301,229,290,229,289" href="javascript:listCenter(26);" alt="이천"/>
										<area shape="poly" coords="39,105,34,135,27,151,39,184,45,181,61,179,67,169,89,168,97,165,100,156,93,153,91,136,97,129,101,116,107,107,115,95,78,96,75,101,69,97,65,93,38,97,38,97" href="javascript:listCenter(27);" alt="파주"/>
										<area shape="poly" coords="90,430,82,417,74,401,89,374,109,373,115,367,141,370,145,377,144,392,153,397,140,409,120,421,109,417" href="javascript:listCenter(28);" alt="평택"/>
										<area shape="poly" coords="162,32,173,41,187,33,182,45,186,49,193,59,204,53,215,53,226,53,226,66,221,91,205,106,201,112,198,128,193,128,184,158,180,158,156,164,150,148,148,148,150,130,157,129,161,114,160,101,152,93,161,88,153,73,149,68,164,69,167,69,161,50,162,38" href="javascript:listCenter(29);" alt="포천"/>
										<area shape="circle" coords="171,230,17" href="javascript:listCenter(30);" alt="하남" />
										<area shape="poly" coords="42,322,37,336,32,346,42,346,37,359,47,365,48,349,57,341,58,343,70,353,57,359,60,377,53,386,73,401,84,380,89,373,105,374,113,369,106,357,105,342,109,334,113,329,103,322,77,323,67,313,56,321,58,321,53,321" href="javascript:listCenter(31);" alt="화성"/>
									</map>
								<!-- <div class='map_namyangju map_marker'>
									<img src='/gnoincoun/images/map/namyangju.png'></div>
								</div> -->
								</div>
							</div>
	
							<div class='right'>
								<div class='map-search'>
									<div class='row'>
										<li class='subject'>지역 검색</li>
										<li class='content select2' style="min-height: 0;">
											<select>
												<option value=''>경기도
											</select>
											<select><option value=''>고양시</select>
										</li>
									</div>
									<!--  <div class='row'>
										<li class='subject'>명칭 검색</li>
										<li class='content' style='position:relative; min-height: 0;"'>
											<input type='text' class='form-control' />
											<img src="/gnoincoun/images/map/icon_search.png" style='position:absolute; top:0; right:0; cursor:pointer;  '/>
										</li>
									</div> -->
	
									<div class='bar mg20'></div>
	
									<div class='map-search-text'>
										<!-- <span>지역 검색에서 시/군/구가 안 나오면 해당 지역에 센터가 없음으로 명칭 검색에서 명칭을 입력해 주세요.</span> -->
	
										<div class='mapList'>지도에 있는 마커를 선택하시면<br>상세 지부가 나타납니다.</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				<!-- <button type="button" class="btn btn-success" style="border-radius: 11px;" onclick="location.href='/gnoincoun/comfCnsWrite.do'">온라인상담 예약하기</button> -->
				</div>
				</div>
			</div>
		</div>
		<div id="directions">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro5.jpg' alt="온라인상담" style="width: 920px;"/>
			</div>
			<div style="width: 100%; text-align: center; margin-top: 20px;">
				<!-- <button type="button" class="btn btn-success" style="border-radius: 11px;" onclick="location.href='/gnoincoun/comfCnsWrite.do'">온라인상담 예약하기</button> -->
			</div>
		</div>
		
		
	</div>
</section> <!-- End section -->