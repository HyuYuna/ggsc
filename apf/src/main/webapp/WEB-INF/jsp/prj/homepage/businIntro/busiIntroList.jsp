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
	  		$("#weakSupp2").css("display","none");
	  		$("#sigunSupp2").css("display","none");
	  		$("#genderEdu").css("display","none");
	  		
	  		
	  		var gubun = "${gubun}"
	  		
	  		if(gubun == "" || gubun == null) {
		  		$("#sigunSupp").css("display","");
		  		$("#focus1").css("font-weight","bolder");
	  		}
	  		if(gubun == "noin") {
				$("#noin24").css("display","");
				$("#focus2").css("font-weight","bolder");
	  		}
	  		
	  		if(gubun == "mid") {
		  		$("#middleCns").css("display","");
		  		$("#focus3").css("font-weight","bolder");
	  		}
	  		
	  		if(gubun == "weak") {
		  		$("#weakSupp").css("display","");
		  		$("#focus4").css("font-weight","bolder");
	  		}
	  		
	  		if(gubun == "gender") {
		  		$("#genderEdu").css("display","");
		  		$("#focus5").css("font-weight","bolder");
	  		}
	  		
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
	<section class="title_explain hidden-xs">
		<div class="container">
			<dl>
				<dt>사업소개</dt>
				<dd class="explanation">마음으로 만나는 어르신의 행복한 노후</dd>
				<dd class="explanEng">Enterprise Guidance</dd>
			</dl>
		</div>
	</section>
<section class="service-2 section">
	<div id="wrap">
		<!-- content 영역 -->
		<div id="sigunSupp">
			<div id="sigunSupp1" class="menu">
				<img src='/gnoincoun/images/busi13.jpg' alt="전화상담" style="width: 920px;"/>
			</div>
			<div style="width: 100%; text-align: center; margin-top: 20px;">
				<!-- <button type="button" class="btn btn-warning" style="border-radius: 11px;" >전화상담 신청하기</button> -->
			</div>
		</div>
		<div id="noin24">
			<div class="menu">
				<img src='/gnoincoun/images/busi8.png' alt="내방상담" style="width: 920px;"/>
			</div>
		</div>
		<div id="middleCns">
			<div class="menu">
				<img src='/gnoincoun/images/busi9.png' alt="온라인상담" style="width: 920px;" usemap ="#onMaum"/>
				<map name="onMaum">
    				<area target="_blank" alt="" title="" href="https://docs.google.com/forms/d/e/1FAIpQLSeOWHP4sSmpQJ055KTYCK3vUk8fMCjAf2KiGlthYIvCx0xkvg/viewform" coords="25,674,190,697" shape="rect">
				</map>
			</div>
		</div>
		<div id="weakSupp">
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
			<div class="menu">
				<img src='/gnoincoun/images/busi12.png' alt="온라인상담" style="width: 920px;"/>
			</div>
		</div>
		
	</div>
</section> <!-- End section -->