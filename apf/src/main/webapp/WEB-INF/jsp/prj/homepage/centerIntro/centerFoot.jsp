<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
<head>
	<script>
		$(document).ready(function() {
			$("#pathwayBtn2").css("display","none");
			$("#pathwayBtn3").css("display","none");
			$("#pathwayBtn4").css("display","none");
		});
	
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
		<div style="width: 100%; margin: auto; text-align: center; margin-top: 30px; margin-bottom: 30px;">
			<button type="button" class="btn btn-primary sub-menu" onclick="javascript: pathwayBtn('1')"><font size = "4px">2020 ~ 2021</font></button>
			<button type="button" class="btn btn-primary sub-menu" onclick="javascript: pathwayBtn('2')"><font size = "4px">2018 ~ 2019</font></button>
			<button type="button" class="btn btn-primary sub-menu" onclick="javascript: pathwayBtn('3')"><font size = "4px">2016 ~ 2017</font></button>
			<button type="button" class="btn btn-primary sub-menu" onclick="javascript: pathwayBtn('4')"><font size = "4px">1999 ~ 2012</font></button>
		</div>
		
		<div id="pathwayBtn1" class="menu">
			<img src='/gnoincoun/images/cenIntro9.png' alt="센터안내" style="width: 920px;"/>
		</div>
		<div id="pathwayBtn2" class="menu">
			<img src='/gnoincoun/images/cenIntro10.png' alt="센터안내" style="width: 920px;"/>
		</div>
		<div id="pathwayBtn3" class="menu">
			<img src='/gnoincoun/images/cenIntro11.png' alt="센터안내" style="width: 920px;"/>
		</div>
		<div id="pathwayBtn4" class="menu">
			<img src='/gnoincoun/images/cenIntro12.png' alt="센터안내" style="width: 920px;"/>
		</div>
	</div>
</section> <!-- End section -->