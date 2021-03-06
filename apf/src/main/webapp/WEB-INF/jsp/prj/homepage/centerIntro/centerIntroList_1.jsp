<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
	
	<style>
		table {
		    text-align : center;
		}
		th {
			text-align : center;
			padding : 10px 18px 12px;
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
		
  </script>
<style>
	#wrap {width: 100%; margin: auto; height: auto;}
</style>
<section class="service-2 section">
	<div id="wrap">
        <div style="border-top: 1px solid #f09d4c; overflow: hidden;">
			<img src='/gnoincoun/images/cenIntro1.jpg' alt="????????? ??????" />
		</div>
		<div style="width: 910px; margin: auto;">
			<span style="float: left; margin-top: 20px; margin-bottom: 15px; font: bold; font-weight: 900;">????????????</span>
			<ul class="main-menu" style="width: 730px; font-size: 14px; float: right; margin-top: 20px; margin-bottom: 15px;"> <!-- margin-right: 26%; -->
				<li><a href="javascript: greeting();">?????????</a></li>
				<li><a href="javascript: operating();">????????????</a></li>
				<li><a href="javascript: vision();">????????? ??????</a></li>
				<li><a href="javascript: pathway();">????????????</a></li>
				<li><a href="javascript: together();">????????????<br/>?????????</a></li>
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
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: operatingBtn('1')"><font size = "3px">??????</font></button>
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: operatingBtn('2')"><font size = "3px">????????????</font></button>
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: operatingBtn('3')"><font size = "3px">????????????</font></button>
				<button type="button" class="btn btn-primary" style="width: 150px; background-color: #f09d4c; border-color: #f09d4c;" onclick="javascript: operatingBtn('4')"><font size = "3px">?????????</font></button>
			</div>
			
			<div id="operating1" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro6.jpg' alt="????????????" style="width: 920px;"/>
			</div>
			<div id="operating2" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro15.png' alt="????????????" style="width: 920px;"/> 
			</div>
			<div id="operating3" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro7.jpg' alt="????????????" style="width: 920px;"/>
			</div>
			<div id="operating4" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro13.png' alt="????????????" style="width: 920px;"/>
			</div>
			
		</div>
		<div id="vision">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 920px; margin: auto; margin-top: 30px;">
				<img src='/gnoincoun/images/cenIntro16.png' alt="????????? ??????" style="width: 920px;"/>
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
				<img src='/gnoincoun/images/cenIntro9.png' alt="????????????" style="width: 920px;"/>
			</div>
			<div id="pathwayBtn2" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro10.png' alt="????????????" style="width: 920px;"/>
			</div>
			<div id="pathwayBtn3" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro11.png' alt="????????????" style="width: 920px;"/>
			</div>
			<div id="pathwayBtn4" style="width: 920px; margin: auto;">
				<img src='/gnoincoun/images/cenIntro12.png' alt="????????????" style="width: 920px;"/>
			</div>
		</div>
		<div id="together">
			<div style="border-bottom: 1px solid #CFCFCF; padding-bottom: 63px;">
			</div>
			<div style="width: 920px; margin: auto; margin-top: 30px;">
				<img src='/gnoincoun/images/cenIntro14.png' alt="???????????? ?????????"
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
								<th scope="col" colspan="2">??????</th>
								<th scope="col">??????</th>
								<th scope="col">????????????</th>
								<th scope="col">????????????</th>
							</tr>
						</thead>
						<tbody style="vertical-align:middle;">
							<tr>
								<td colspan="2" rowspan="2">?????????</th>
								<td rowspan="2">?????????</td>
								<td rowspan="2">070-4832-6360</td>
								<td>??? ?????? ?????? ??????</td>
							</tr>
							<tr>
								<td>??? ?????? ????????????</td>
							</tr>
							<tr>
								<td rowspan="5">?????????????????????</th>
								<td rowspan="2">??????</td>
								<td rowspan="2">?????????</td>
								<td rowspan="2">070-4832-6361</td>
								<td>??? ?????? ?????? ??????</td>
							</tr>
							<tr>	
								<td>??? ?????? ??? ????????????</td>
							</tr>
							<tr>
								<td rowspan="3">??????</th>
								<td rowspan="3">?????????</td>
								<td rowspan="3">070-4832-6363</td>
								<td>??? ??????????????????</td>
							</tr>
							<tr>	
								<td>??? ??????????????????</td>
							</tr>
							<tr>	
								<td>??? ??????????????????</td>
							</tr>
						</tbody>
					</table>
				</div> -->
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