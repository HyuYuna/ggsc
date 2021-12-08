<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    

    <script>
	  	$(document).ready(function() {
	  		
	  		$("#sigunSupp").css("display","none");
	  		$("#noin24").css("display","none");
	  		$("#middleCns").css("display","none");
	  		$("#weakSupp").css("display","none");
	  		$("#sigunSupp2").css("display","none");
	  		$("#genderEdu").css("display","none");
	  		
	  		var gubun = "${gubun}"
	  		
	  		if(gubun == "" || gubun == null) {
		  		$("#sigunSupp").css("display","");
	  		}
	  		if(gubun == "noin") {
				$("#noin24").css("display","");
	  		}
	  		
	  		if(gubun == "mid") {
		  		$("#middleCns").css("display","");
	  		}
	  		
	  		if(gubun == "weak") {
		  		$("#weakSupp").css("display","");
	  		}
	  		
	  		if(gubun == "gender") {
		  		$("#genderEdu").css("display","");
	  		}
	  		
	  		$("#focus1").css("font-weight","bolder");
		});
	  	
	  	function sigunSupp() {
	  		$("#sigunSupp").css("display","");
	  		$("#noin24").css("display","none");
	  		$("#middleCns").css("display","none");
	  		$("#weakSupp").css("display","none");
	  		$("#genderEdu").css("display","none");
	  		
	  		$("#focus1").css("font-weight","bolder");
	  		$("#focus2").css("font-weight","normal");
	  		$("#focus3").css("font-weight","normal");
	  		$("#focus4").css("font-weight","normal");
	  		$("#focus5").css("font-weight","normal");
		}
	  	
	  	function noin24() {
	  		$("#sigunSupp").css("display","none");
	  		$("#noin24").css("display","");
	  		$("#middleCns").css("display","none");
	  		$("#weakSupp").css("display","none");
	  		$("#genderEdu").css("display","none");
	  		
	  		$("#focus1").css("font-weight","normal");
	  		$("#focus2").css("font-weight","bolder");
	  		$("#focus3").css("font-weight","normal");
	  		$("#focus4").css("font-weight","normal");
	  		$("#focus5").css("font-weight","normal");
		}
	  	
	  	function middleCns() {
	  		$("#sigunSupp").css("display","none");
	  		$("#noin24").css("display","none");
	  		$("#middleCns").css("display","");
	  		$("#weakSupp").css("display","none");
	  		$("#genderEdu").css("display","none");
	  		
	  		$("#focus1").css("font-weight","normal");
	  		$("#focus2").css("font-weight","normal");
	  		$("#focus3").css("font-weight","bolder");
	  		$("#focus4").css("font-weight","normal");
	  		$("#focus5").css("font-weight","normal");
		}
	  	
	  	function weakSupp() {
	  		$("#sigunSupp").css("display","none");
	  		$("#noin24").css("display","none");
	  		$("#middleCns").css("display","none");
	  		$("#weakSupp").css("display","");
	  		$("#weakSupp1").css("display","");
	  		$("#weakSupp2").css("display","none");
	  		$("#genderEdu").css("display","none");
	  		
	  		$("#focus1").css("font-weight","normal");
	  		$("#focus2").css("font-weight","normal");
	  		$("#focus3").css("font-weight","normal");
	  		$("#focus4").css("font-weight","bolder");
	  		$("#focus5").css("font-weight","normal");
		}
	  	
	  	function genderEdu() {
	  		$("#sigunSupp").css("display","none");
	  		$("#noin24").css("display","none");
	  		$("#middleCns").css("display","none");
	  		$("#weakSupp").css("display","none");
	  		$("#genderEdu").css("display","");
	  		
	  		$("#focus1").css("font-weight","normal");
	  		$("#focus2").css("font-weight","normal");
	  		$("#focus3").css("font-weight","normal");
	  		$("#focus4").css("font-weight","normal");
	  		$("#focus5").css("font-weight","bolder");
		}
	  	
		/* function sigunSuppBtn(no) {
			if(no == "1") {
				$("#sigunSupp1").css("display","");
				$("#sigunSupp2").css("display","none");
			} else if(no == "2") {
				$("#sigunSupp1").css("display","none");
				$("#sigunSupp2").css("display","");
			}
		}
		 */
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
		
		ul[style] li a{
			font-size:17px;
		}
	</style>
<section class="service-2 section">
	<div id="wrap">
        <div style="border-top: 1px solid #f09d4c; overflow: hidden;">
			<img src='/gnoincoun/images/busi1.jpg' alt="센터사업소개" />
		</div>
		<div style="width: 910px; margin: auto;">
			<span class="menu-current">센터사업소개</span>
			<ul class="main-menu" style="width: 650px; float: right; margin-top: 9px; margin-bottom: 15px; align-items:center;"> <!-- margin-right: 26%; -->
				<li><a href="javascript: sigunSupp();" id="focus1">시군지원사업</a></li>
				<li><a href="javascript: noin24();" id="focus2">24시노인온상담</a></li>
				<li><a href="javascript: middleCns();" id="focus3">중장년마음돌봄<br/>전화상담</a></li>
				<li><a href="javascript: weakSupp();" id="focus4">취약노인<br/>지원사업</a></li>
				<li><a href="javascript: genderEdu();" id="focus5">성인지교육사업</a></li>
			</ul>
		</div>
		
		<!-- content 영역 -->
		<div id="sigunSupp">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div id="sigunSupp1" class="menu">
				<img src='/gnoincoun/images/busi13.jpg' alt="전화상담" style="width: 920px;"/>
			</div>
			<div style="width: 100%; text-align: center; margin-top: 20px;">
				<!-- <button type="button" class="btn btn-warning" style="border-radius: 11px;" >전화상담 신청하기</button> -->
			</div>
		</div>
		<div id="noin24">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			
			<div class="menu">
				<img src='/gnoincoun/images/busi8.png' alt="내방상담" style="width: 920px;"/>
			</div>
		</div>
		<div id="middleCns">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div class="menu">
				<img src='/gnoincoun/images/busi9.png' alt="온라인상담" style="width: 920px;" usemap ="#onMaum"/>
				<map name="onMaum">
    				<area target="_blank" alt="" title="" href="https://docs.google.com/forms/d/e/1FAIpQLSeOWHP4sSmpQJ055KTYCK3vUk8fMCjAf2KiGlthYIvCx0xkvg/viewform" coords="25,674,190,697" shape="rect">
				</map>
			</div>
		</div>
		<div id="weakSupp">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 100%; margin: auto; text-align: center; margin-top: 30px; margin-bottom: 30px;">
				<button type="button" class="btn btn-primary sub-menu" style="width: 190px;" onclick="javascript: weakSuppBtn('1')"><font size = "4px">노인맞춤돌봄서비스</font></button>
				<button type="button" class="btn btn-primary sub-menu" style="width: 190px;" onclick="javascript: weakSuppBtn('2')"><font size = "4px">응급안전안심서비스</font></button>
				<!--  font size up -->
			</div>
			<div id="weakSupp1" class="menu">
				<img src='/gnoincoun/images/busi10.png' alt="온라인상담" style="width: 920px;"/>
			</div>
			<div id="weakSupp2" class="menu">
				<img src='/gnoincoun/images/busi11.png' alt="온라인상담" style="width: 920px;"/>
			</div>
		</div>
		<div id="genderEdu">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div class="menu">
				<img src='/gnoincoun/images/busi12.png' alt="온라인상담" style="width: 920px;"/>
			</div>
		</div>
		
	</div>
</section> <!-- End section -->