<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
<head>
	<link rel="stylesheet" href="/gnoincoun/css/style2.css" />
	<style>
		#wrap {width: 100%; margin: auto; height: auto;}
		table {
			border: 1px solid #444444;
			border-collapse: collapse;
		}
		th {
			text-align : center;
		}
		th, td {
		    border: 1px solid #444444;
		 }
		ul[style] li a{
			font-size:17px;
		}
		table.basic td {
			text-align : center;
		}
	</style>
    <script>
		function goLink(idx) {
			switch (idx) {
			case 1:
				window.open("http://gpsilver.org/home/");
				break;
			case 2:
				window.open("https://test.narangdesign.com/mail/withnoin/201801/index.html");
				break;
			case 3:
				window.open("https://ilsansenior.org/");
				break;
			case 4:
				window.open("https://www.dh-seniorwelfarecenter.co.kr/index.php");
				break;
			case 5:
				window.open("https://www.gcsilver.or.kr/");
				break;
			case 6:
				window.open("http://www.gmsenior.or.kr/");
				break;
			case 7:
				window.open("http://www.gjswc.kr/gjnoin/index.do");
				break;
			case 8:
				window.open("http://www.guriwelfare.or.kr/bbs/view.php?id=TemP_kurinews&page=1");
				break;
			case 9:
				window.open("https://www.gpbokji.org/");
				break;
			case 10:
				window.open("http://www.nprsenior.or.kr/");
				break;
			case 11:
				window.open("https://gimposenior.org/");
				break;
			case 12:
				window.open("http://www.gpnsenior.org/main/");
				break;
			case 13:
				window.open("http://nyjsw.or.kr/");
				break;
			case 14:
				window.open("https://www.dongbusenior.or.kr/");
				break;
			case 15:
				window.open("http://www.js1004.kr/");
				break;
			case 16:
				window.open("http://www.ddcnoin.org/");
				break;
			case 17:
				window.open("http://senior.bucheon4u.kr/senior/seniorWelfareAgency/seniorWelfareAgency02/seniorWelfareAgency02_1.jsp");
				break;
			case 18:
				window.open("http://senior.bucheon4u.kr/senior/seniorWelfareAgency/seniorWelfareAgency03/seniorWelfareAgency03_1.jsp");
				break;
			case 19:
				window.open("http://senior.bucheon4u.kr/senior/seniorWelfareAgency/seniorWelfareAgency01/seniorWelfareAgency01_1.jsp");
				break;
			case 20:
				window.open("https://bdsenior.or.kr/main/main.php");
				break;
			case 21:
				window.open("http://sunobok.or.kr/");
				break;
			case 22:
				window.open("http://www.sswc.kr/online/");
				break;
			case 23:
				window.open("http://www.jwnoin.org/");
				break;
			case 24:
				window.open("http://www.ypinetree.or.kr/");
				break;
			case 25:
				window.open("http://www.gnoin.kr/");
				break;
			case 26:
				window.open("http://www.bambat.org/ ");
				break;
			case 27:
				window.open("http://www.seoho.or.kr/user/index.jsp");
				break;
			case 28:
				window.open("http://www.ggsenior.or.kr/");
				break;
			case 29:
				window.open("http://www.budnae.or.kr/");
				break;
			case 30:
				window.open("http://www.pangyonoin.or.kr/main/main.html");
				break;
			case 31:
				window.open("https://scsnoin.or.kr/");
				break;
			case 32:
				window.open("http://shsenior.or.kr/main/");
				break;
			case 33:
				window.open("https://cafe.daum.net/dwsws");
				break;
			case 34:
				window.open("http://www.ansansenior.or.kr/main/main.php");
				break;
			case 35:
				window.open("http://www.anseongnoin.or.kr/");
				break;
			case 36:
				window.open("http://www.happytown.or.kr/");
				break;
			case 37:
				window.open("http://www.yjhcsenior.or.kr/html/index/");
				break; // 양주시 접속문제 있음 400 error
			case 38:
				window.open("http://www.ypsilver21.or.kr/");
				break;
			case 39:
				window.open("http://www.yjsilver.or.kr/main.php");
				break;
			case 40:
				window.open("http://www.lycsenior.org/");
				break;
			case 41:
				window.open("http://www.osannoin.or.kr/main/ ");
				break;
			case 42:
				window.open("http://www.ygsenior.or.kr/");
				break;
			case 43:
				window.open("http://sujibokji.or.kr/main.php#1");
				break;
			case 44:
				window.open("http://www.yiswc.or.kr/website/");
				break;
			case 45:
				window.open("http://www.noinlove.or.kr/");
				break;
			case 46:
				window.open("http://uwsenior.or.kr/");
				break;
			case 47:
				window.open("https://www.songsan.ne.kr/");
				break;
			case 48:
				window.open("http://sgwelfare.org/");
				break;
			case 49:
				window.open("https://uswc4u.or.kr/ ");
				break;
			case 50:
				window.open("http://www.ichonold.or.kr/");
				break;
			case 51:
				window.open("https://www.pajusenior.or.kr/");
				break;
			case 52:
				window.open("http://www.ptsenior.or.kr/");
				break;
			case 53:
				window.open("https://bbnoin.or.kr:41004/");
				break;
			case 54:
				window.open("http://www.sbnoin.net/ ");
				break;
			case 55:
				window.open("http://pssenior.or.kr/");
				break;
			case 56:
				window.open("http://www.pcsc.kr/");
				break;
			case 57:
				window.open("http://www.youngnak-noin.or.kr/");
				break;
			case 58:
				window.open("https://www.dtsenior.or.kr/dongtan/index.do");
				break;
			case 59:
				window.open("https://www.hssenior.or.kr/index/");
				break;
			case 60:
				window.open("http://www.hs-seobu.or.kr/main");
				break;
			case 61:
				window.open("http://www.haansenior.or.kr/");
				break;
			case 62:
				window.open("http://www.8879.or.kr/");
				break;
			case 63:
				window.open("http://www.pdsenior.or.kr/");
				break;
			}
		}

		function listCenter(idx) {
			idx = Number(idx);
			console.log("idx : " + idx);
			var html = undefined;
			switch (idx) {
			case 1: //가평
				$("#nowMap").text('가평');
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >가평군 노인복지관</td>'
						+ '<td class="address">경기도 가평군 가평읍 읍내리 625-8</td>'
						+ '<td class="tel">031-581-6063</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(1)"></td>'
						+ '</tr>' 
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >청평노인복지관</td>'
						+ '<td class="address">경기도 가평군 청평면 은고개로 39</td>'
						+ '<td class="tel">031-582-8879</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(62)"></td>'
						+ '</tr>' + '</table>'
				break;
			case 2: // 고양
				$("#nowMap").text('고양')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" style="cursor:pointer;">고양시덕양노인종합복지관</td>'
						+ '<td class="address">경기도 고양시 덕양구 화정동 846</td>'
						+ '<td class="tel">031-969-7781</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(2)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">고양시일산노인종합복지관</td>'
						+ '<td class="address">경기도 고양시 일산동구 장항동 호수로 731</td>'
						+ '<td class="tel">031-919-8677</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(3)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">고양시대화노인종합복지관</td>'
						+ '<td class="address">경기도 고양시 일산동구 장항동 호수로 731</td>'
						+ '<td class="tel">031-919-8677</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(4)"></td>'
						+ '</tr>' + '</table>'
				break;
			case 3: // 과천 
				$("#nowMap").text('과천')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >과천시노인복지관</td>'
						+ '<td class="address">경기도 과천시 문원로57</td>'
						+ '<td class="tel">02-502-8500</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(5)"></td>'
						+ '</tr>' + '</table>'
				break;

			case 4:
				$("#nowMap").text('광명');
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >광명소하노인종합복지관</td>'
						+ '<td class="address">경기도 광명시 소하로25</td>'
						+ '<td class="tel">02-2625-9300</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(6)"></td>'
						+ '</tr>' 
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >하안노인종합복지관</td>'
						+ '<td class="address">경기도 광명시 철망산로 48</td>'
						+ '<td class="tel">02-898-8830</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(61)"></td>'
						+ '</tr>' + '</table>'
				break;

			case 5:
				$("#nowMap").text('광주')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >광주시노인복지관</td>'
						+ '<td class="address">경기도 광주시 파발로 202</td>'
						+ '<td class="tel">031-766-9129</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(7)"></td>'
						+ '</tr>' + '</table>'
				break;

			case 6:
				$("#nowMap").text('구리')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >구리시종합사회복지관</td>'
						+ '<td class="address">경기도 구리시 벌말로129번길 50</td>'
						+ '<td class="tel">031-556-8100</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(8)"></td>'
						+ '</tr>' + '</table>'
				break;

			case 7:
				$("#nowMap").text('군포')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >군포시노인복지관</td>'
						+ '<td class="address">경기 군포시 고산로 223</td>'
						+ '<td class="tel">031-556-8100</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(9)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >군포시늘푸른노인복지관</td>'
						+ '<td class="address">경기도 군포시 산본천로 101</td>'
						+ '<td class="tel">031-392-5755</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(10)"></td>'
						+ '</tr>' + '</table>'
				break;

			case 8:
				$("#nowMap").text('김포')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >김포시노인종합복지관</td>'
						+ '<td class="address">경기도 김포시 사우중로 74번길 48</td>'
						+ '<td class="tel">031-997-9300</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(11)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >김포시북부노인복지관</td>'
						+ '<td class="address">경기도 김포시 통진읍 마송1로 16번길 40-2</td>'
						+ '<td class="tel">031-984-0108</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(12)"></td>'
						+ '</tr>' + '</table>'
				break;

			case 9:
				$("#nowMap").text('남양주')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >남양주시노인복지관</td>'
						+ '<td class="address">경기도 남양주시 진건읍 진건오남로 359</td>'
						+ '<td class="tel">031-573-6598</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(13)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >남양주시동부노인복지관</td>'
						+ '<td class="address">경기도 남양주시 수동면 비룡로 801-47</td>'
						+ '<td class="tel">031-559-5880</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(14)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >해피누리노인복지관</td>'
						+ '<td class="address">경기도 남양주시 늘을2로 67</td>'
						+ '<td class="tel">031-590-3000</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(15)"></td>'
						+ '</tr>' + '</table>'
				break;

			case 10:
				$("#nowMap").text('동두천')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >동두천노인복지관</td>'
						+ '<td class="address">경기도 동두천시 동두천로 264</td>'
						+ '<td class="tel">031-857-9918</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(16)"></td>'
						+ '</tr>' + '</tr>' + '</table>'
				break;

			case 11:
				$("#nowMap").text('부천')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >부천소사노인복지기관</td>'
						+ '<td class="address">경기도 부천시 길주로 210</td>'
						+ '<td class="tel">032-347-9534</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(17)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >부천오정노인복지관</td>'
						+ '<td class="address">경기도 부천시 길주로 210</td>'
						+ '<td class="tel">032-683-9290</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(18)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >부천시원미노인복지관</td>'
						+ '<td class="address">경기도 부천시 길주로 210</td>'
						+ '<td class="tel">032-667-0261</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(19)"></td>'
						+ '</tr>' + '</table>'
				break;

			case 12:
				$("#nowMap").text('성남')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">분당노인종합복지관</td>'
						+ '<td class="address">경기도 성남시 분당구 불정로 50</td>'
						+ '<td class="tel">031-785-9200</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(20)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >수정노인종합복지관</td>'
						+ '<td class="address">경기도 성남시 수정구 수정남로 268번길 28</td>'
						+ '<td class="tel"> 031-731-3393</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(21)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >수정중앙노인종합복지관</td>'
						+ '<td class="address">경기도 성남시 수정구 성남대로 1480번길 38</td>'
						+ '<td class="tel">031-752-3366</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(22)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >중원노인종합복지관</td>'
						+ '<td class="address">경기도 성남시 중원구 제일로 35번길 51</td>'
						+ '<td class="tel"> 031-751-7450</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(23)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >황송노인종합복지관</td>'
						+ '<td class="address">경기도 성남시 중원구 금상로 132</td>'
						+ '<td class="tel">031-731-5520</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(24)"></td>'
						+ '</tr>' + '</table>'
				break;

			case 13:
				$("#nowMap").text('수원')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >경기도노인종합상담센터</td>'
						+ '<td class="address">경기도 수원시 장안구 경수대로 1150</td>'
						+ '<td class="tel">031-222-1360</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(25)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >밤밭노인복지관</td>'
						+ '<td class="address">수원시 장안구 상률로 53</td>'
						+ '<td class="tel">031-271-8859</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(26)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >서호노인복지관</td>'
						+ '<td class="address">경기도 수원시 권선구 구운로4번길 34</td>'
						+ '<td class="tel">031-291-0911</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(27)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;" >'
						+ '<td class="title" >광교노인복지관</td>'
						+ '<td class="address">경기도 수원시 영통구 센트럴타운로 22</td>'
						+ '<td class="tel">031-8006-7400</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(28)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >버드내노인복지관</td>'
						+ '<td class="address">경기도 수원시 권선구 권선로 564번길 36</td>'
						+ '<td class="tel">031-898-6544</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(29)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >판교노인종합복지관</td>'
						+ '<td class="address">경기도 성남시 분당구 판교역로 99</td>'
						+ '<td class="tel">031-620-2810</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(30)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >SK청솔노인복지관</td>'
						+ '<td class="address">경기도 수원시 장안구 장안로 174</td>'
						+ '<td class="tel">031-257-6811</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(31)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title" >팔달노인복지관</td>'
						+ '<td class="address">경기도 수원시 팔달구 수원천로 343</td>'
						+ '<td class="tel">031-248-3800</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(63)"></td>'
						+ '</tr>' + '</table>'
				break;

			case 14:
				$("#nowMap").text('시흥')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">시흥노인종합복지관</td>'
						+ '<td class="address">경기도 시흥시 장현능곡로 214</td>'
						+ '<td class="tel">031-404-3122</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(32)"></td>'
						+ '</tr>' + '</table>'
				break;

			case 15:
				$("#nowMap").text('안산')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">단원구노인복지관</td>'
						+ '<td class="address">경기도 안산시 단원구 선부광장 1로 134</td>'
						+ '<td class="tel">031-405-1188</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(33)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">상록구노인복지관</td>'
						+ '<td class="address">경기도 안산시 상록구 고잔로 162</td>'
						+ '<td class="tel">031-414-2271</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(34)"></td>'
						+ '</tr>' + '</table>'
				break;

			case 16:
				$("#nowMap").text('안성')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">안성시노인복지관</td>'
						+ '<td class="address">경기도 안성시 장기로 109</td>'
						+ '<td class="tel">031-674-0794</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(35)"></td>'
						+ '</tr>' + '</table>'
				break;

			case 17:
				$("#nowMap").text('안양')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">안양시노인종합복지관</td>'
						+ '<td class="address">경기도 안양시 동안구 경수대로 665번길 74</td>'
						+ '<td class="tel">031-455-0551</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(36)"></td>'
						+ '</tr>' + '</tr>' + '</table>'
				break;

			case 18:
				$("#nowMap").text('양주')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">양주시회천노인복지관</td>'
						+ '<td class="address">경기도 양주시 화합로 1426번길 90</td>'
						+ '<td class="tel">031-859-9081</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(37)"></td>'
						+ '</tr>' + '</table>'
				break;

			case 19:
				$("#nowMap").text('양평')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">양평군노인복지관</td>'
						+ '<td class="address">경기도 양평군 양평대교길 4번길 5</td>'
						+ '<td class="tel">031-774-9751</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(38)"></td>'
						+ '</tr>' + '</table>'
				break;

			case 20:
				$("#nowMap").text('여주')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">여주시노인복지관</td>'
						+ '<td class="address">경기도 여주시 여흥로 160번길 27</td>'
						+ '<td class="tel"> 031-881-0050</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(39)"></td>'
						+ '</tr>' + '</table>'
				break;

			case 21:
				$("#nowMap").text('연천')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">연천군노인복지관</td>'
						+ '<td class="address">경기도 연천군 연천읍 문화로108번길 11</td>'
						+ '<td class="tel">031-834-6080</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(40)"></td>'
						+ '</tr>' + '</table>'
				break;

			case 22:
				$("#nowMap").text('오산')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">오산노인종합복지관</td>'
						+ '<td class="address">경기도 오산시 수청로 192</td>'
						+ '<td class="tel">031-290-8530</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(41)"></td>'
						+ '</tr>' + '</table>'
				break;

			case 23:
				$("#nowMap").text('용인')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">용인기흥노인복지관</td>'
						+ '<td class="address">경기도 용인시 기흥구 산양로 71</td>'
						+ '<td class="tel">031-284-8852</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(42)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">용인시수지노인복지관</td>'
						+ '<td class="address">경기도 용인시 수지구 포은대로 435</td>'
						+ '<td class="tel">031-270-0000</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(43)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">용인시처인노인복지관</td>'
						+ '<td class="address">경기도 용인시 처인구 중부대로 1199</td>'
						+ '<td class="tel">031-324-9303</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(44)"></td>'
						+ '</tr>' + '</table>'
				break;

			case 24:
				$("#nowMap").text('의왕')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">의왕시사랑채노인복지관</td>'
						+ '<td class="address">경기도 의왕시 복지로 109 내손동 공용청사내</td>'
						+ '<td class="tel">031-425-3676</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(45)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">의왕시아름채노인복지관</td>'
						+ '<td class="address">경기도 의왕시 문화공원로 47</td>'
						+ '<td class="tel">031-427-0580</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(46)"></td>'
						+ '</tr>' + '</table>'
				break;

			case 25:
				$("#nowMap").text('의정부')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;" >'
						+ '<td class="title">송산노인종합복지관</td>'
						+ '<td class="address">경기 의정부시 용민로 99</td>'
						+ '<td class="tel">031-852-2595</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(47)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">신곡노인종합복지관</td>'
						+ '<td class="address">경기도 의정부시 금신로297번길 38</td>'
						+ '<td class="tel">031-840-5300</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(48)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">의정부노인종합복지관</td>'
						+ '<td class="address">경기도 의정부시 경의로85번길 16-12</td>'
						+ '<td class="tel">031-826-0742</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(49)"></td>'
						+ '</tr>' + '</table>'
				break;

			case 26:
				$("#nowMap").text('이천')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">이천시노인종합복지관</td>'
						+ '<td class="address">경기도 이천시 남천로 31</td>'
						+ '<td class="tel">031-636-0190</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(50)"></td>'
						+ '</tr>' + '</table>'
				break;

			case 27:
				$("#nowMap").text('파주')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">파주시노인복지관</td>'
						+ '<td class="address">경기도 파주시 가나무로 130</td>'
						+ '<td class="tel">031-943-0730</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(51)"></td>'
						+ '</tr>' + '</table>'
				break;

			case 28:
				$("#nowMap").text('평택')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;" >'
						+ '<td class="title">평택남부노인복지관</td>'
						+ '<td class="address">경기 평택시 평택5로 220</td>'
						+ '<td class="tel">031-8036-4900</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(52)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">평택북부노인복지관</td>'
						+ '<td class="address">경기 평택시 서정로 295</td>'
						+ '<td class="tel">031-615-3915</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(53)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">평택서부노인복지관</td>'
						+ '<td class="address">경기도 평택시 안중읍 안현로 400</td>'
						+ '<td class="tel">031-683-0030</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(54)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">팽성노인복지관</td>'
						+ '<td class="address">경기도 평택시 팽성읍 팽성남산4길 6</td>'
						+ '<td class="tel">031-650-2640</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(55)"></td>'
						+ '</tr>' + '</table>'
				break;

			case 29:
				$("#nowMap").text('포천')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">포천시노인복지관</td>'
						+ '<td class="address">경기도 포천시 군내면 청성로 5</td>'
						+ '<td class="tel">031-8083-7777</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(56)"></td>'
						+ '</tr>' + '</table>'
				break;

			case 30:
				$("#nowMap").text('하남')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;" >'
						+ '<td class="title">영락재가노인지원서비스센터</td>'
						+ '<td class="address">경기도 하남시 안터로 55-1</td>'
						+ '<td class="tel">031-794-9368</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(57)"></td>'
						+ '</tr>' + '</table>'
				break;

			case 31:
				$("#nowMap").text('화성')
				html = '<table style="border:1px;">'
						+ '<colgroup>'
						+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
						+ '</colgroup>'
						+ '<tr>'
						+ '<th>센터명</th>'
						+ '<th>주소</th>'
						+ '<th>연락처</th>'
						+ '<th>홈페이지</th>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;" >'
						+ '<td class="title">화성시동탄노인복지관</td>'
						+ '<td class="address">경기도 화성시 동탄대로8길 36</td>'
						+ '<td class="tel">031-8077-1800</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(58)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">화성시남부노인복지관</td>'
						+ '<td class="address">경기도 화성시 향남읍 토성로 37-22</td>'
						+ '<td class="tel">031-366-5678</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(59)"></td>'
						+ '</tr>'
						+ '<tr style="cursor:pointer;">'
						+ '<td class="title">화성시서부노인복지관</td>'
						+ '<td class="address">경기도 화성시 남양읍 시청로 155</td>'
						+ '<td class="tel">031-8077-2605</td>'
						+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(60)"></td>'
						+ '</tr>' + '</table>'
				break;
			}

			if (html) {
				$('.mapList').html(html);
				$(".mapList").children().children().children().children('th').css('background-color','gray');
				$(".mapList").children().children().children().children('th').css('color','white');
				$(".mapList").children().children().children().children('th').css('font-size','17px');
				$(".mapList").children().children().children().children('td').css('color','initial');
				var trTag = $(".mapList").children().children().children('tr');
				trTag.hover(function(){$(this).css('background-color','#E8E8E8');},function(){$(this).css('background-color','initial')});
				$("#localGb").val(idx).attr("selected","selected");
				console.log(html);
			}
		
	}
  </script>
</head>
<section class="title_explain hidden-xs">
	<div class="container">
		<dl>
			<dt>센터소개</dt>
			<dd class="explanation">마음으로 만나는 어르신과 중장년의 행복한 노후</dd>
			<dd class="explanEng">GNOIN Hall Introdution</dd>
		</dl>
	</div>
</section>
<section class="service-2 section" style="margin-top:-14px;">
	<div id="wrap">
			<div class='full bg-gray'>
				<div class='wrap'>
				<div style="width: 100%; text-align: center; margin-top: 50px;">
				<div class='map-box'>
					<div class='main-title'>
						<div class='left'><img src="/gnoincoun/images/map/icon_map.png" alt="icon" class='map_icon'/>&nbsp;지도에 표시된 마커를 선택해주세요.</div>
						<div>선택지역 : <span id='nowMap'></span></div>
					</div>
						<div class='main-content'>
							<div class='left'>
								<div class='map_img'>
									<img src="/gnoincoun/images/map/map.png" alt="경기도청" usemap="#marker"/>
									<map name="marker">
										<area shape="poly"
										coords="215,109,233,78,254,91,253,98,269,101,273,121,261,126,252,133,249,147,246,153,253,157,253,165,246,166,254,175,256,191,250,202,257,207,257,217,249,216,241,219,238,217,237,205,233,196,230,192,222,189,212,197,212,182,197,158,188,154,193,129,198,135,200,115,211,109"
										href="javascript:listCenter(1);" alt="가평" />
									<area shape="poly"
										coords="88,215,92,199,102,195,111,200,114,193,109,185,99,189,93,189,96,170,68,171,64,180,33,183,36,189,66,207,65,206"
										href="javascript:listCenter(2);" alt="고양" />
									<area shape="circle" coords="122,237,18"
										href="javascript:listCenter(3);" alt="과천" />
									<area shape="rectangle" coords="75,216,101,249"
										href="javascript:listCenter(4);" alt="광명" />
									<area shape="poly"
										coords="152,291,171,274,171,250,191,248,195,237,201,233,212,248,209,262,226,289,213,298,204,303,201,314,187,313,188,293,173,286,169,286"
										href="javascript:listCenter(5);" alt="광주" />
									<area shape="circle" coords="142,206,17"
										href="javascript:listCenter(6);" alt="구리" />
									<area shape="circle" coords="96,303,17"
										href="javascript:listCenter(7);" alt="군포" />
									<area shape="poly"
										coords="0,160,7,157,27,152,39,198,29,195,25,211,7,211,-0,192,157"
										href="javascript:listCenter(8);" alt="김포" />
									<area shape="poly"
										coords="157,169,181,161,201,165,212,191,206,204,192,238,188,212,168,210,163,214,162,196,158,187,147,186,155,169"
										href="javascript:listCenter(9);" alt="남양주" />
									<area shape="circle" coords="139,114,18"
										href="javascript:listCenter(10);" alt="동두천" />
									<area shape="circle" coords="55,234,20"
										href="javascript:listCenter(11);" alt="부천" />
									<area shape="circle" coords="150,262,17"
										href="javascript:listCenter(12);" alt="성남" />
									<area shape="poly"
										coords="137,314,132,327,113,332,114,323,107,320,116,309,115,302,127,309,138,309,141,308"
										href="javascript:listCenter(13);" alt="수원" />
									<area shape="circle" coords="54,274,17"
										href="javascript:listCenter(14);" alt="시흥" />
									<area shape="poly"
										coords="53,304,63,291,77,278,84,281,76,297,75,308,70,314"
										href="javascript:listCenter(15);" alt="안산" />
									<area shape="poly"
										coords="146,376,148,389,156,393,156,401,148,409,161,409,169,417,169,425,179,421,194,419,216,413,217,402,233,391,233,389,245,375,245,370,237,360,225,355,223,362,225,369,221,373,217,366,197,369,189,361,181,359,173,372,156,376,154,375"
										href="javascript:listCenter(16);" alt="안성" />
									<area shape="circle" coords="101,268,16"
										href="javascript:listCenter(17);" alt="안양" />
									<area shape="poly"
										coords="98,186,108,182,120,186,118,180,114,173,116,159,121,150,137,149,145,147,146,134,130,134,121,128,119,118,118,109,112,109,103,133,105,134,98,137,97,153,105,155,101,165,100,176,101,178"
										href="javascript:listCenter(18);" alt="양주" />
									<area shape="poly"
										coords="309,287,301,237,319,230,321,227,316,222,296,195,282,204,266,199,257,205,263,212,258,217,252,217,235,218,234,199,231,196,206,205,197,235,208,234,215,249,212,258,217,266,221,261,228,263,241,263,249,263,257,271,264,265,277,269,280,266,292,269,292,269,296,272,296,281"
										href="javascript:listCenter(19);" alt="양평" />
									<area shape="poly"
										coords="221,269,226,285,237,287,254,297,256,305,253,311,253,318,252,330,249,345,259,344,267,343,283,355,288,357,303,332,305,318,307,303,305,286,291,279,279,270,269,274,264,269,255,272,248,270,247,265,231,267,231,271"
										href="javascript:listCenter(20);" alt="여주" />
									<area shape="poly"
										coords="94,48,81,52,86,60,83,72,82,78,73,89,77,94,86,90,93,97,90,86,104,93,115,85,122,90,114,105,119,109,128,94,141,94,154,89,153,77,147,75,143,65,156,66,161,69,165,68,160,47,162,26,145,13,145,3,138,2,123,17,114,20,106,33,101,37,113,45,111,48,96,48"
										href="javascript:listCenter(21);" alt="연천" />
									<area shape="circle" coords="127,350,17"
										href="javascript:listCenter(22);" alt="오산" />
									<area shape="poly"
										coords="157,331,159,341,148,355,143,357,149,365,155,371,172,375,171,362,181,356,193,360,193,368,214,368,225,371,220,361,222,356,216,352,213,349,216,346,197,334,198,312,181,313,185,292,172,289,147,302,140,322,135,328,152,328"
										href="javascript:listCenter(23);" alt="용인" />
									<area shape="circle" coords="128,289,16"
										href="javascript:listCenter(24);" alt="의왕" />
									<area shape="circle" coords="135,169,18"
										href="javascript:listCenter(25);" alt="의정부" />
									<area shape="poly"
										coords="208,305,198,333,220,345,222,353,231,355,247,366,248,379,241,382,269,377,273,368,275,352,261,338,255,346,247,346,241,337,247,336,251,301,229,290,229,289"
										href="javascript:listCenter(26);" alt="이천" />
									<area shape="poly"
										coords="39,105,34,135,27,151,39,184,45,181,61,179,67,169,89,168,97,165,100,156,93,153,91,136,97,129,101,116,107,107,115,95,78,96,75,101,69,97,65,93,38,97,38,97"
										href="javascript:listCenter(27);" alt="파주" />
									<area shape="poly"
										coords="90,430,82,417,74,401,89,374,109,373,115,367,141,370,145,377,144,392,153,397,140,409,120,421,109,417"
										href="javascript:listCenter(28);" alt="평택" />
									<area shape="poly"
										coords="162,32,173,41,187,33,182,45,186,49,193,59,204,53,215,53,226,53,226,66,221,91,205,106,201,112,198,128,193,128,184,158,180,158,156,164,150,148,148,148,150,130,157,129,161,114,160,101,152,93,161,88,153,73,149,68,164,69,167,69,161,50,162,38"
										href="javascript:listCenter(29);" alt="포천" />
									<area shape="circle" coords="171,230,17"
										href="javascript:listCenter(30);" alt="하남" />
									<area shape="poly"
										coords="42,322,37,336,32,346,42,346,37,359,47,365,48,349,57,341,58,343,70,353,57,359,60,377,53,386,73,401,84,380,89,373,105,374,113,369,106,357,105,342,109,334,113,329,103,322,77,323,67,313,56,321,58,321,53,321"
										href="javascript:listCenter(31);" alt="화성" />
									</map>
								<!-- <div class='map_namyangju map_marker'>
									<img src='/gnoincoun/images/map/namyangju.png'></div>
								</div> -->
								</div>
							</div>
	
							<div class='right'>
								<div class='map-search'>
									<div class='row'>
									<li class='subject' style="color:initial; text-align:center;">지역 검색</li>
									<li class='content select2' style="min-height: 0;">
										<select style="appearance:menulist;"><option value=''>경기도</select>
										<select id="localGb" name="localGb" onchange="javascript:listCenter(this.value);"  style="appearance:menulist;">
											<option>--------</option>
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
		</div>
	</div>
</section> <!-- End section -->