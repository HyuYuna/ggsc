<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
<head>
	<script>
		$(document).ready(function() {
	  		$("#operating2").css("display","none");
	  		$("#operating3").css("display","none");
	  		$("#operating4").css("display","none");
		});
	
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
		
		<!-- content 영역 -->
		<div id="operating">
			<div style="width: 100%; margin: auto; text-align: center; margin-top: 30px; margin-bottom: 30px;">
				<button type="button" class="btn btn-primary sub-menu" onclick="javascript: operatingBtn('1')"><font size = "4px">소개</font></button>
				<button type="button" class="btn btn-primary sub-menu" onclick="javascript: operatingBtn('2')"><font size = "4px">설립목적</font></button>
				<button type="button" class="btn btn-primary sub-menu" onclick="javascript: operatingBtn('3')"><font size = "4px">주요사업</font></button>
				<button type="button" class="btn btn-primary sub-menu" onclick="javascript: operatingBtn('4')"><font size = "4px">조직도</font></button>
			</div>
			
			<div id="operating1" class="menu">
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
	</div>
</section> <!-- End section -->