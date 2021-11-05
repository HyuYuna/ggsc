<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>경기도노인종합상담센터</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<!-- <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet"> -->
	<!-- <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" /> -->
	<link rel="stylesheet" href="/gnoincoun/assets/css/swiper-bundle.min.css" />
	<link rel="stylesheet" href="/gnoincoun/css/style2.css" />
	
	<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->
	<script src="/gnoincoun/assets/js/jquery-3.3.1.min.js"></script>
	<!-- <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script> -->
	<script src="/gnoincoun/assets/js/swiper-bundle.min.js"></script>
	<script src="/gnoincoun/js/script2.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$('.border-btn-box > li').hover(
		    function() { $(this).addClass('active'); } ,
			function() { $(this).removeClass('active'); }
		);
	});
	
	function fn_fileDown(sysFileNm, filePath, fileNm){
		$("#fileNm").val(fileNm);
		$("#sysFileNm").val(sysFileNm);
		$("#filePath").val(filePath);
		document.downForm.action = "/gnoincoun/fileDown2.do";
       	document.downForm.submit();
	}
	
	function goLink(idx) {
		if (idx = 1) {
			 window.open("http://gpsilver.org/home/"); 
		} else if (idx = 2) {
			window.open("https://test.narangdesign.com/mail/withnoin/201801/index.html"); 
		}
	}
	
	function listCenter(idx){
		  idx = Number(idx);
		  console.log("idx : "+idx);
		  var html = undefined;
		  switch(idx){
			  // 내용 회원관 랜덤으로 나와야함 ajax로

		  case 1 : //가평
				$("#nowMap").text('가평');
				html = 	'<table style="border:1px;">' +
				'<colgroup>' +
				'<col width="10%"><col width="10%"><col width="10%">' +
				'</colgroup>' +
			    '<tr>' +
				    '<th>센터명</th>' +
				    '<th>주소</th>' +
				    '<th>연락처</th>' +
			    '</tr>' +
				'<tr style="cursor:pointer;" onclick="goLink(1)">' +
					'<td class="title" >가평군 노인복지관</td>' +
					'<td class="address">경기도 가평군 가평읍 읍내리 625-8</td>' +
					'<td class="tel">031-581-6063</td>' +
				'</tr>' +
				'</table>'
				break;
			case 2 : // 경북
				$("#nowMap").text('고양')
				html =  '<table style="border:1px;">' +
				'<colgroup>' +
				'<col width="10%"><col width="10%"><col width="10%">' +
				'</colgroup>' +
			    '<tr>' +
				    '<th>센터명</th>' +
				    '<th>주소</th>' +
				    '<th>연락처</th>' +
			    '</tr>' +
				'<tr style="cursor:pointer;" onclick="goLink(2)">' +
					'<td class="title" style="cursor:pointer;">고양시덕양노인종합복지관</td>' +
					'<td class="address">경기도 고양시 덕양구 화정동 846</td>' +
					'<td class="tel">031-969-7781</td>' +
				'</tr>' +
				'<tr style="cursor:pointer;" onclick="goLink(3)">' +
					'<td class="title">고양시일산노인종합복지관</td>' +
					'<td class="address">경기도 고양시 일산동구 장항동 호수로 731</td>' +
					'<td class="tel">031-919-8677</td>' +
				'</tr>' +
				'<tr style="cursor:pointer;" onclick="goLink(4)">' +
					'<td class="title">고양시대화노인종합복지관</td>' +
					'<td class="address">경기도 고양시 일산동구 장항동 호수로 731</td>' +
					'<td class="tel">031-919-8677</td>' +
				'</tr>' +
				'</table>'
				break;
			case 3 : // 과천 
				$("#nowMap").text('과천')
				html = 	'<table style="border:1px;">' +
				'<colgroup>' +
				'<col width="10%"><col width="10%"><col width="10%">' +
				'</colgroup>' +
			    '<tr>' +
				    '<th>센터명</th>' +
				    '<th>주소</th>' +
				    '<th>연락처</th>' +
			    '</tr>' +
				'<tr style="cursor:pointer;" onclick="goLink(5)">' +
					'<td class="title" >과천시노인복지관</td>' +
					'<td class="address">경기도 과천시 문원로57</td>' +
					'<td class="tel">02-502-8500</td>' +
				'</tr>' +
				'</table>'
			break;
				
			case 4 :
				$("#nowMap").text('광명')
				html = 	'<table style="border:1px;">' +
				'<colgroup>' +
				'<col width="10%"><col width="10%"><col width="10%">' +
				'</colgroup>' +
			    '<tr>' +
				    '<th>센터명</th>' +
				    '<th>주소</th>' +
				    '<th>연락처</th>' +
			    '</tr>' +
				'<tr style="cursor:pointer;" onclick="goLink(6)">' +
					'<td class="title" >광명소하노인종합복지관</td>' +
					'<td class="address">경기도 광명시 소하로25</td>' +
					'<td class="tel">02-2625-9300</td>' +
				'</tr>' +
				'</table>'
			break;
				
			case 5 :
				$("#nowMap").text('광주')
				html = 	'<table style="border:1px;">' +
				'<colgroup>' +
				'<col width="10%"><col width="10%"><col width="10%">' +
				'</colgroup>' +
			    '<tr>' +
				    '<th>센터명</th>' +
				    '<th>주소</th>' +
				    '<th>연락처</th>' +
			    '</tr>' +
				'<tr style="cursor:pointer;" onclick="goLink(7)">' +
					'<td class="title" >광주시노인복지관</td>' +
					'<td class="address">경기도 광주시 파발로 202</td>' +
					'<td class="tel">031-766-9129</td>' +
				'</tr>' +
				'</table>'
			break;
				
			case 6 :
				$("#nowMap").text('구리')
				html = 	'<table style="border:1px;">' +
				'<colgroup>' +
				'<col width="10%"><col width="10%"><col width="10%">' +
				'</colgroup>' +
			    '<tr>' +
				    '<th>센터명</th>' +
				    '<th>주소</th>' +
				    '<th>연락처</th>' +
			    '</tr>' +
				'<tr style="cursor:pointer;" onclick="goLink(8)">' +
					'<td class="title" >구리시종합사회복지관</td>' +
					'<td class="address">경기도 구리시 벌말로129번길 50</td>' +
					'<td class="tel">031-556-8100</td>' +
				'</tr>' +
				'</table>'
			break;
				
			case 7 :
				$("#nowMap").text('군포')
				html = 	'<table style="border:1px;">' +
				'<colgroup>' +
				'<col width="10%"><col width="10%"><col width="10%">' +
				'</colgroup>' +
			    '<tr>' +
				    '<th>센터명</th>' +
				    '<th>주소</th>' +
				    '<th>연락처</th>' +
			    '</tr>' +
				'<tr style="cursor:pointer;" onclick="goLink(9)">' +
					'<td class="title" >군포시노인복지관</td>' +
					'<td class="address">경기도 구리시 벌말로129번길 50</td>' +
					'<td class="tel">031-556-8100</td>' +
				'</tr>' +
				'<tr style="cursor:pointer;" onclick="goLink(10)">' +
					'<td class="title" >군포시늘푸른노인복지관</td>' +
					'<td class="address">경기도 군포시 산본천로 101</td>' +
					'<td class="tel">031-392-5755</td>' +
				'</tr>' +
				'</table>'
			break;
				
			case 8 :
				$("#nowMap").text('김포')
				html = 	'<table style="border:1px;">' +
				'<colgroup>' +
				'<col width="10%"><col width="10%"><col width="10%">' +
				'</colgroup>' +
			    '<tr>' +
				    '<th>센터명</th>' +
				    '<th>주소</th>' +
				    '<th>연락처</th>' +
			    '</tr>' +
				'<tr style="cursor:pointer;" onclick="goLink(11)">' +
					'<td class="title" >김포시노인종합복지관</td>' +
					'<td class="address">경기도 김포시 사우중로 74번길 48</td>' +
					'<td class="tel">031-997-9300</td>' +
				'</tr>' +
				'<tr style="cursor:pointer;" onclick="goLink(12)">' +
					'<td class="title" >김포시북부노인복지관</td>' +
					'<td class="address">경기도 김포시 통진읍 마송1로 16번길 40-2</td>' +
					'<td class="tel">031-984-0108</td>' +
				'</tr>' +
				'</table>'
			break;
					
			
		}
		  
		if(html){
			$('.mapList').html(html);
			console.log(html);
		} 
		
	}
		
	</script>
</head>
<style>
a { text-decoration:none; color:#333;} 
.main-menu > li > a:hover {font-weight: bold;}

body {min-width:320px;}
.logo-box img{
	width: auto; height: auto;
	max-width: 300px;
    max-height: 300px;
}
table {
    border: 1px solid #444444;
    border-collapse :collapse;
 }
th, td {
    border: 1px solid #444444;
 }
 
</style>
<body>
	<div id="wrap">
		<div class='header wrap'>
			<span class='logo-box'><a href="/gnoincoun/homepageMainList.do"><img src="/gnoincoun/images/logoRetouch.png" alt="경기도노인종합상담센터" class='logo'/></a></span>
			<!-- <ul class='navigator'>
				<li>로그인</li>
				<li>회원가입</li>
				<li>마이페이지</li>
				<li class='all-menu'>
					<span class='all-menu-icon'></span>
					전체 메뉴</li>
			</ul> -->
			<ul class='navigator'>
				<c:choose>
					<c:when test="${sessionScope.LoginVO == null }">
						<li><a href="/gnoincoun/login.do">로그인</a></li>
						<li><a href="/gnoincoun/agree.do">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/gnoincoun/logout.do">로그아웃</a></li>
						<li><a href="/gnoincoun/mypageView.do">마이페이지</a></li>
					</c:otherwise>
				</c:choose>
				<li class='all-menu'>
					<span class='all-menu-icon'></span>
					전체 메뉴</li>
			</ul>

			<ul class='main-menu' id="topMenuPart">
				<li><a href="/gnoincoun/comfCnsWrite.do">맘편한상담<c:out value="${loginVo.userNm }"/></a></li>
				<li><a href="/gnoincoun/psyInfo.do">간편한심리검사</a></li>
				<li><a href="/gnoincoun/eduAppWrite.do">교육신청</a></li>
				<li><a href="/gnoincoun/centerIntroList.do">센터안내</a></li>
				<li><a href="/gnoincoun/busiIntroList.do">센터사업소개</a></li>
				<li><a href="/gnoincoun/centerNewsList.do">소통공간</a></li>
			</ul>
		</div>

		<div class='full main-image' style="overflow: hidden;">
			<img src='/gnoincoun/images/main.png' alt="행복한 세상"/>
		</div>

		<div class='wrap main-content'>
			<div class='banner-box-01'>
				<li><a href="/gnoincoun/centerIntroList.do"><img src="/gnoincoun/images/banner_01.png" alt="이렇게 이용하세요"/></a></li>
				<li><a href="/gnoincoun/psyInfo.do"><img src="/gnoincoun/images/banner_02.png" alt="간편한 심리검사"/></a></li>
				<li><a href="/gnoincoun/comfCnsWrite.do"><img src="/gnoincoun/images/banner_03.png" alt="맘편한 상담"/></a></li>
				<li><a href="/gnoincoun/mypageView.do"><img src="/gnoincoun/images/banner_04.png" alt="마이페이지"/></a></li>
			</div>

			<div class='banner-box-02'>
				<li><a href="/gnoincoun/busiIntroList.do"><img src="/gnoincoun/images/banner_06.png" alt="시군지원사업"/></a></li>
				<li><a href="/gnoincoun/busiIntroList.do?gubun=noin"><img src="/gnoincoun/images/banner_07.png" alt="24시노인온상담"/></a></li>
				<li><a href="/gnoincoun/busiIntroList.do?gubun=gender"><img src="/gnoincoun/images/banner_08.png" alt="성인지교육사업"/></a></li>
				<li><a href="/gnoincoun/busiIntroList.do?gubun=mid"><img src="/gnoincoun/images/banner_09.png" alt="중장년상담"/></a></li>
				<li><a href="/gnoincoun/busiIntroList.do?gubun=weak"><img src="/gnoincoun/images/banner_10.png" alt="취약노인지원사업"/></a></li>
			</div>
		</div>

		<div class='full bg-gray'>
			<div class='wrap'>
				<div class='banner-one'>
					<a href="/gnoincoun/comfCnsWrite.do"><img src="/gnoincoun/images/banner_one.png" alt="상담 신청하기" /></a>
				</div>



				<div class='map-box'>
					<div class='main-title'>
						<div class='left'><img src="/gnoincoun/images/map/icon_map.png" alt="icon" class='map_icon'/>&nbsp;지도에 표시된 마커를 선택해주세요.</div>
						<div class='right'>선택지역 : <span id='nowMap'>전체</span></div>
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
							 	<form id="searchForm" name="searchForm" method="post">
								<div class='row'>
									<li class='subject'>지역 검색</li>
									<li class='content select2'>
										<select><option value=''>경기도</select>
										<select class="form-control" id="localGb" name="localGb" onchange="javascript:listCenter(this.value);">
											<option value='1'>가평군</option>
											<option value='2'>고양시</option>
											<option value='3'>과천시</option>
											<option value='4'>광명시</option>
											<option value='5'>광주시</option>
											<option value='6'>구리시</option>
											<option value='7'>군포시</option>
											<option value='8'>김포시</option>
											<option value='9'>남양주시</option>
											<option value='10'>동두천시</option>
											<option value='11'>부천시</option>
											<option value='12'>성남시</option>
											<option value='13'>수원시</option>
											<option value='14'>시흥시</option>
											<option value='15'>안산시</option>
											<option value='16'>안성시</option>
											<option value='17'>안양시</option>
											<option value='18'>양주시</option>
											<option value='19'>양평군</option>
											<option value='20'>여주시</option>
											<option value='21'>연천군</option>
											<option value='22'>오산시</option>
											<option value='23'>용인시</option>
											<option value='24'>의왕시</option>
											<option value='25'>의정부시</option>
											<option value='26'>이천시</option>
											<option value='27'>파주시</option>
											<option value='28'>평택시</option>
											<option value='29'>포천시</option>
											<option value='30'>하남시</option>
											<option value='31'>화성시</option>
										</select>
									</li>
								</div>
								<div class='row'>
									<!-- <li class='subject'>명칭 검색</li> 
									<li class='content' style='position:relative'>
										<input type='text' class='form-control' />
										<img src="/gnoincoun/images/map/icon_search.png" style='position:absolute; top:0; right:0; cursor:pointer;  '/>
									</li> -->
								</div>
								</form>

								<div class='bar mg20'></div>

								<div class='map-search-text'>
									<!-- <span>지역 검색에서 시/군/구가 안 나오면 해당 지역에 센터가 없음으로 명칭 검색에서 명칭을 입력해 주세요.</span> -->

									<div class='mapList'>지도에 있는 마커를 선택하시면<br>상세 지부가 나타납니다.</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



		<div class='wrap board-box'>
			<div class='border-header'>
				<h2>센터소식</h2>
				<ul class='border-btn-box'>
					<!-- <li class='active'>
						<a href="/gnoincoun/centerNewsList.do">센터소식</a>
					</li> -->
					<li><a href="/gnoincoun/centerNewsList.do">센터소식</a></li>
					<li><a href="/gnoincoun/noticeList.do">공지사항</a></li>
					<li><a href="/gnoincoun/docLibraryList.do">문서자료실</a></li>
					<li><a href="/gnoincoun/freeBoardList.do">자유게시판</a></li>
				</ul>
			</div>

			<div class='board-list'>
				<ul>
					<li class='board-image'><img src="/gnoincoun/images/board_01.png" /></li>
					<ul class='board-text'>
						<li class='date'>
							<span class='date_ym'>2021.01</span><br>
							<span class='date_d'>19</span>
						</li>
						<li class='subject'>경기도형 노인맞춤돌봄서비스 종사자 안전관리메뉴얼 안내</li>
						<dd class='icon_arrow'></dd>
					</ul>
				</ul>

				<ul>
					<li class='board-image'><img src="/gnoincoun/images/board_02.png" /></li>
					<ul class='board-text'>
						<li class='date'>
							<span class='date_ym'>2021.01</span><br>
							<span class='date_d'>15</span>
						</li>
						<li class='subject'>2020년 경기도노인종합상담센터 5차 직원 채용 서류전형 합격자 공고</li>
						<dd class='icon_arrow'></dd>
					</ul>
				</ul>

				<ul>
					<li class='board-image'><img src="/gnoincoun/images/board_03.png" /></li>
					<ul class='board-text'>
						<li class='date'>
							<span class='date_ym'>2020.12</span><br>
							<span class='date_d'>17</span>
						</li>
						<li class='subject'>2020년 경기도노인종합상담센터 5차 직원[행정직] 채용 공고</li>
						<dd class='icon_arrow'></dd>
					</ul>
				</ul>

				<ul>
					<li class='board-image'><img src="/gnoincoun/images/board_04.png" /></li>
					<ul class='board-text'>
						<li class='date'>
							<span class='date_ym'>2020.11</span><br>
							<span class='date_d'>16</span>
						</li>
						<li class='subject'>경기도노인종합상담센터 20주년 심포지엄 개최 안내</li>
						<dd class='icon_arrow'></dd>
					</ul>
				</ul>
			</div>



			<div class="swiper-container mySwiper site-list">
			  <div class="swiper-wrapper">
				<div class="swiper-slide"><img src="/gnoincoun/images/site_01.png" alt="보건복지부" /></div>
				<div class="swiper-slide"><img src="/gnoincoun/images/site_02.png" alt="보건복지부" /></div>
				<div class="swiper-slide"><img src="/gnoincoun/images/site_03.png" alt="보건복지부" /></div>
				<div class="swiper-slide"><img src="/gnoincoun/images/site_04.png" alt="보건복지부" /></div>
				<div class="swiper-slide"><img src="/gnoincoun/images/site_05.png" alt="보건복지부" /></div>
				<div class="swiper-slide"><img src="/gnoincoun/images/site_05.png" alt="보건복지부" /></div>
			  </div>
			  <div class='swiper-button-prev'></div>
			  <div class="swiper-button-next"></div>
			</div>

		</div>

		<div id="footer">
			<div class='footer-top'>
				<div class='wrap'>
					<div class='logo-image'>
						<img src="/gnoincoun/images/logo_slogan_white.png" />
					</div>
					<div class='text-content'>
						<p>경기도노인종합상담센터</p>
						<div>16207  경기도 수원시 장안구 경수대로 1150, 도서관 3층     대표 : 김미나     고유번호 : 722-82-00367<br>
							  전화 :  031-222-1360     팩스 : 070-4832-6366     이메일 :  ggnoincoun@gmail.com     개인정보담당자 : 강진주</div>
					</div>
					
					<select class="selectpicker" onchange="if(this.value) window.open(this.value);" style="height:30px; float:right; position:relative;">
						<option value="">유관사이트 바로가기</option>
						<option value="http://www.mohw.go.kr/">보건복지부</option>
						<option value="https://www.gg.go.kr/">경기도청</option>
						<option value="https://gg.pass.or.kr/">경기도사회서비스원</option>
						<option value="https://ggwf.gg.go.kr/">경기복지재단</option>
						<option value="https://www.ggwf.or.kr/">경기복지플랫폼</option>
						<option value="https://www.gg.go.kr/oldman_job/">경기도노인일자리지원센터</option>
						<option value="https://ggss.or.kr/">경기도지역사회서비스지원단</option>
						<option value="https://gepa.co.kr/">경기도노인보호전문기관</option>
						<option value="https://kg1389.or.kr/">경기동부노인보호전문기관</option>
						<option value="https://www.gnnoin.kr/">경기북부노인보호전문기관</option>
						<option value="https://www.ggw1389.or.kr/main/main.php/">경기서부노인보호전문기관</option>
						<option value="http://www.gaswc.or.kr/">경기도노인종합복지관협회</option>
						<option value="https://gyeonggi.nid.or.kr/home/main/main.aspx/">경기도광역치매센터</option>
						<option value="http://www.kgacold.co.kr/">경기도재가노인복지협회</option>
						<option value="https://noininfo.or.kr/">경기도노인복지시설엽합회</option>
						<option value="https://happycam5060.or.kr:45870/">경기도중장년해피캠퍼스 남부센터</option>
						<option value="https://http://www.gaswc.or.kr/">경기도노인복지관협회</option>
						<option value="https://www.mentalhealth.or.kr/">경기도정신건강복지센터</option>
					</select>

				</div> 
			</div>
			<div class='footer-bottom'>
				<div class='wrap'>
					<span><a href="">이용약관</a></span>
					<span><a href="">개인정보취급방침</a></span>
					<span><a href="">이메일추출방지정책</a></span>
					<span><a href="">장애인차별금지법</a></span>
					<span><a href="/gnoincoun/centerIntroList.do?gubun=directions">찾아오시는 길</a></span>
					<span class='copyright'>Copyright (c) 2021 GNOIN. All rights reserved.</span>
				</div>
			</div>

		</div>

	</div>
</body>
</html>