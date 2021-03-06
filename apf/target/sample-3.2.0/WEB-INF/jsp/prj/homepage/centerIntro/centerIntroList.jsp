<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
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
	  		/* $("#greeting").css("display","none");
	  		$("#operating").css("display","none");
	  		$("#vision").css("display","");
	  		$("#pathway").css("display","none");
	  		$("#together").css("display","none");
	  		$("#centerInfo").css("display","none");
	  		$("#directions").css("display","none"); */
		}
	  	
	  	function pathway() {
	  		/* $("#greeting").css("display","none");
	  		$("#operating").css("display","none");
	  		$("#vision").css("display","none");
	  		$("#pathway").css("display","");
	  		$("#together").css("display","none");
	  		$("#centerInfo").css("display","none");
	  		$("#directions").css("display","none"); */
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
				$("#operating3").css("display","none");
				$("#operating4").css("display","none");
			} else if(no == "3") {
				$("#operating1").css("display","none");
				$("#operating3").css("display","");
				$("#operating4").css("display","none");
			} else if(no == "4") {
				$("#operating1").css("display","none");
				$("#operating3").css("display","none");
				$("#operating4").css("display","");
			}
		}
		
  </script>
<style>
	#wrap {width: 100%; margin: auto; height: auto;}
</style>
<section class="service-2 section">
	<div id="wrap">
        <div style="border-top: 1px solid #f09d4c;">
			<img src='/gnoincoun/images/cenIntro1.jpg' alt="????????? ??????" style="width: 1920px;"/>
		</div>
		<div style="width: 910px; margin: auto;">
			<span style="float: left; margin-top: 20px; margin-bottom: 15px; font: bold; font-weight: 900;">????????????</span>
			<ul class="main-menu" style="width: 730px; font-size: 14px; float: right; margin-top: 20px; margin-bottom: 15px;"> <!-- margin-right: 26%; -->
				<li><a href="javascript: greeting();">?????????</a></li>
				<li><a href="javascript: operating();">????????????</a></li>
				<li><a href="javascript: vision();">????????? ??????</a></li>
				<li><a href="javascript: pathway();">????????????</a></li>
				<li><a href="javascript: together();">???????????? ?????????</a></li>
				<li><a href="javascript: centerInfo();">????????????</a></li>
				<li><a href="javascript: directions();">????????????</a></li>
			</ul>
		</div>
		
		<!-- content ?????? -->
		<div id="greeting">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 920px; margin: auto; margin-top: 30px;">
				<img src='/gnoincoun/images/cenIntro2.jpg' alt="????????????" style="width: 920px;"/>
			</div>
			<div style="width: 100%; text-align: center; margin-top: 20px;">
				<!-- <button type="button" class="btn btn-warning" style="border-radius: 11px;" >???????????? ????????????</button> -->
			</div>
		</div>
		<div id="operating">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 100%; margin: auto; text-align: center; margin-top: 30px; margin-bottom: 30px;">
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: operatingBtn('1')">??????</button>
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: operatingBtn('2')">????????????</button>
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: operatingBtn('3')">????????????</button>
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: operatingBtn('4')">?????????</button>
			</div>
			
			<div id="operating1" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro6.jpg' alt="????????????" style="width: 920px;"/>
			</div>
			<div id="operating2" style="width: 920px; margin: auto;">
				<!-- <img src='/gnoincoun/images/cenIntro3.jpg' alt="????????????" style="width: 920px;"/> -->
			</div>
			<div id="operating3" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro7.jpg' alt="????????????" style="width: 920px;"/>
			</div>
			<div id="operating4" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro8.jpg' alt="????????????" style="width: 920px;"/>
			</div>
			
		</div>
		<div id="vision">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro4.jpg' alt="???????????????" style="width: 920px;"/>
			</div>
			<div style="width: 100%; text-align: center; margin-top: 20px;">
				<!-- <button type="button" class="btn btn-success" style="border-radius: 11px;" onclick="location.href='/gnoincoun/comfCnsWrite.do'">??????????????? ????????????</button> -->
			</div>
		</div>
		<div id="pathway">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro4.jpg' alt="???????????????" style="width: 920px;"/>
			</div>
			<div style="width: 100%; text-align: center; margin-top: 20px;">
				<!-- <button type="button" class="btn btn-success" style="border-radius: 11px;" onclick="location.href='/gnoincoun/comfCnsWrite.do'">??????????????? ????????????</button> -->
			</div>
		</div>
		<div id="together">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 920px; margin: auto; margin-top: 30px;">
				<img src='/gnoincoun/images/cenIntro3.jpg' alt="???????????????" style="width: 920px;"/>
			</div>
			<div style="width: 100%; text-align: center; margin-top: 20px;">
				<!-- <button type="button" class="btn btn-success" style="border-radius: 11px;" onclick="location.href='/gnoincoun/comfCnsWrite.do'">??????????????? ????????????</button> -->
			</div>
		</div>
		<div id="centerInfo">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 920px; margin: auto; margin-top: 30px;">
				<img src='/gnoincoun/images/cenIntro4.jpg' alt="???????????????" style="width: 920px;"/>
			</div>
			<div style="width: 100%; text-align: center; margin-top: 20px;">
				<!-- <button type="button" class="btn btn-success" style="border-radius: 11px;" onclick="location.href='/gnoincoun/comfCnsWrite.do'">??????????????? ????????????</button> -->
			</div>
		</div>
		<div id="directions">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro5.jpg' alt="???????????????" style="width: 920px;"/>
			</div>
			<div style="width: 100%; text-align: center; margin-top: 20px;">
				<!-- <button type="button" class="btn btn-success" style="border-radius: 11px;" onclick="location.href='/gnoincoun/comfCnsWrite.do'">??????????????? ????????????</button> -->
			</div>
		</div>
		
		
	</div>
</section> <!-- End section -->