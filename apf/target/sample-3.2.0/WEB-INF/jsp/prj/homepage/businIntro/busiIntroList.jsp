<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
    <script>
	  	$(document).ready(function() {
	  		
	  		$("#noin24").css("display","none");
	  		$("#middleCns").css("display","none");
	  		$("#weakSupp").css("display","none");
	  		$("#sigunSupp2").css("display","none");
		});
	  	
	  	function sigunSupp() {
	  		$("#sigunSupp").css("display","");
	  		$("#noin24").css("display","none");
	  		$("#middleCns").css("display","none");
	  		$("#weakSupp").css("display","none");
		}
	  	
	  	function noin24() {
	  		$("#sigunSupp").css("display","none");
	  		$("#noin24").css("display","");
	  		$("#middleCns").css("display","none");
	  		$("#weakSupp").css("display","none");
		}
	  	
	  	function middleCns() {
	  		$("#sigunSupp").css("display","none");
	  		$("#noin24").css("display","none");
	  		$("#middleCns").css("display","");
	  		$("#weakSupp").css("display","none");
		}
	  	
	  	function weakSupp() {
	  		$("#sigunSupp").css("display","none");
	  		$("#noin24").css("display","none");
	  		$("#middleCns").css("display","none");
	  		$("#weakSupp").css("display","");
		}
	  	
		function sigunSuppBtn(no) {
			if(no == "1") {
				$("#sigunSupp1").css("display","");
				$("#sigunSupp2").css("display","none");
			} else if(no == "2") {
				$("#sigunSupp1").css("display","none");
				$("#sigunSupp2").css("display","");
			}
		}
		
		function weakSuppBtn(no) {
			if(no == "1") {
				$("#weakSupp1").css("display","");
				$("#weakSupp2").css("display","none");
			} else if(no == "2") {
				$("#weakSupp1").css("display","none");
				$("#weakSupp2").css("display","");
			}
		}
		
  </script>
<style>
	#wrap {width: 100%; margin: auto; height: auto;}
</style>
<section class="service-2 section">
	<div id="wrap">
        <div style="border-top: 1px solid #f09d4c;">
			<img src='/gnoincoun/images/busi1.jpg' alt="센터사업소개" style="width: 1920px;"/>
		</div>
		<div style="width: 910px; margin: auto;">
			<span style="float: left; margin-top: 20px; margin-bottom: 15px; font: bold; font-weight: 900;">센터사업소개</span>
			<ul class="main-menu" style="width: 500px; font-size: 14px; float: right; margin-top: 20px; margin-bottom: 15px;"> <!-- margin-right: 26%; -->
				<li><a href="javascript: sigunSupp();">시군지원사업</a></li>
				<li><a href="javascript: noin24();">24노인온라인상담</a></li>
				<li><a href="javascript: middleCns();">중장년마음돌봄<br/>전화상담</a></li>
				<li><a href="javascript: weakSupp();">취약노인지원사업</a></li>
			</ul>
		</div>
		
		<!-- content 영역 -->
		<div id="sigunSupp">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 100%; margin: auto; text-align: center; margin-top: 30px; margin-bottom: 30px;">
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: sigunSuppBtn('1')">소개</button>
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: sigunSuppBtn('2')">설립목적</button>
			</div>
			<div id="sigunSupp1" style="width: 920px; margin: auto; margin-top: 30px;">
				<img src='/gnoincoun/images/busi2.jpg' alt="전화상담" style="width: 920px;"/>
			</div>
			<div id="sigunSupp2" style="width: 920px; margin: auto; margin-top: 30px;">
				<img src='/gnoincoun/images/busi3.jpg' alt="전화상담" style="width: 920px;"/>
			</div>
			<div style="width: 100%; text-align: center; margin-top: 20px;">
				<!-- <button type="button" class="btn btn-warning" style="border-radius: 11px;" >전화상담 신청하기</button> -->
			</div>
		</div>
		<div id="noin24">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			
			<div style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/busi4.jpg' alt="내방상담" style="width: 920px;"/>
			</div>
		</div>
		<div id="middleCns">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 920px; margin: auto; margin-top: 30px;">
				<img src='/gnoincoun/images/busi5.jpg' alt="온라인상담" style="width: 920px;"/>
			</div>
			
		</div>
		<div id="weakSupp">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 100%; margin: auto; text-align: center; margin-top: 30px; margin-bottom: 30px;">
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: weakSuppBtn('1')">소개</button>
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: weakSuppBtn('2')">설립목적</button>
			</div>
			<div id="weakSupp1" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/busi6.jpg' alt="온라인상담" style="width: 920px;"/>
			</div>
			<div id="weakSupp2" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/busi7.jpg' alt="온라인상담" style="width: 920px;"/>
			</div>
		</div>
		
	</div>
</section> <!-- End section -->