<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.HrowColor { cursor:pointer}
.HrowColor.active { background-color:rgb(252, 230, 224)}
.MrowColor { cursor:pointer}
.MrowColor.active { background-color:rgb(252, 230, 224)}
</style>

<script type="text/javascript">
	$(document).ready(function() {
	  
		listH("${schYsmHclassNm}");	 
	});
	
	
	function fn_reg(no){
		
		if(no == 1) {
			var ysmHclassNm = $("#ysmHclassNm").val();
			addYsmHclass(ysmHclassNm);
		} else if (no == 2){
			var ysmHclassCd = $("#ysmHclassCd").val();
			var ysmMclassNm = $("ysmMclassNm").val();
			addYsmMclass(ysmHclassCd,ysmMclassNm);
		}
		
	}  	
	
	function fn_list(mnuCd){
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/test0List.do?mnuCd=" + mnuCd;
	}  	
	
	function fn_clear(cd) {
		if(cd == "h") {
			$("#ysmHclassNm").val("");
		} else if(cd == "m") {
			$("#ysmMclassNm").val("");
		} 
	}
	
	$(document).on('click','.HrowColor',function(){
		$(".HrowColor").removeClass("active");
		$(this).addClass('active');
		
		var cd = $(this).data('cd');
		var nm = $(this).data('nm');
		
		fn_regHTxt(cd,nm,0);
		
	});
	
	// 중분류 click 이벤트
	$(document).on('click','.MrowColor',function(){
		$(".MrowColor").removeClass("active");
		$(this).addClass('active');
		
		var cd = $(this).data('cd');
		var nm = $(this).data('nm');
		
		fn_regMTxt(cd,nm,0);
		
	});
	
	
	function listH(schYsmHclassNm) {
		// var param = $("#searchForm").serialize(); //ajax로 넘길 data
		var param = {schYsmHclassNm : schYsmHclassNm};
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		$.ajax({
			type : "POST",
			url : "<c:out value="${pageContext.request.contextPath}" />/test0Dtl_ajax.do",
			data : param,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				var html = '';
				var html2 = '';
				$.each(json.listH, function(i, d) {
					html += '<tr class="HrowColor" data-cd ='+d.ysmHclassCd+' data-nm='+d.ysmHclassNm+' >';
					html += '<td style="text-align: center;">' + d.ysmHclassNm + '</td>';
					html += '<td style="text-align: center;">' + d.ysmHclassCd + '</td>';
					html += '<td style="text-align: center;">' + d.odr + '</td>';
					html += '</tr>';
				});
				
				if (json.listH.length == 0) {
					html += '<tr><td colspan="3" style="text-align: center;">정보가 없습니다.</td></tr>';
				}
				$("#tby1").html(html);
				
				html2 += '<tr><td colspan="3" style="text-align: center;">정보가 없습니다.</td></tr>';
				$("#tby2").html(html2);

				/* var p = json.paginationInfo;
	        	var pageView = Paging(p.totalRecordCount,10,10,
	        			p.currentPageNo ,'list' ,1);
	        	$("#page1").empty().html(pageView); */
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	
	
	function listM(ysmHclassCd) {
		var param = {mclList : ysmHclassCd};
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		$.ajax({
			type : "POST",
			url : "<c:out value="${pageContext.request.contextPath}" />/test0Dtl_ajax.do",
			data : param,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				var html = '';
				$.each(json.listM, function(i, d) {	
					html += '<tr class="MrowColor" data-cd ='+d.ysmMclassCd+' data-nm='+d.ysmMclassNm+'>';
					html += '<td style="text-align: center;">' + d.ysmMclassNm + '</td>';
					html += '<td style="text-align: center;">' + d.ysmMclassCd + '</td>';
					html += '<td style="text-align: center;">' + d.odr + '</td>';
					html += '</tr>';
				});
				if (json.listM.length == 0) {
					html += '<tr><td colspan="3" style="text-align: center;">정보가 없습니다.</td></tr>';
				}
				$("#tby2").html(html);
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	
	function addYsmHclass(ysmHclassNm) {
		if(ysmHclassNm.length < 1) {
			alert('[대분류명]을 입력하세요');
			return false;
		}
		var param = {addYsmHclassNm : ysmHclassNm};
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		$.ajax({
			type : "POST",
			url : "<c:out value="${pageContext.request.contextPath}" />/test0Dtl_ajax.do",
			data : param,
			dataType : "json" ,
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header,token);
			},
			success : function(json) {
				if(json.error) {
				alert(json.error);
			} else {
				var ysmMclassCd = "${ysmMclassCd}";
				listH();
			}
			
		},
		error : function(e) {
			alert("서버와 통신 오류입니다");
			}
		});
	}
	
	function addYsmMclass(ysmHclassCd,ysmMclassNm) {
		if(ysmMclassNm.length <1){
			alert('[중분류명]을 입력해주세요.');
			return false;
		}
		
		var param = {addYsmHclassCd : ysmHclassCd , addYsmMclassNm : ysmMclassNm};
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		$.ajax({
			type : "POST",
			url : "<c:out value="${pageContext.request.contextPath}" />/test0Dtl_ajax.do",
			data : param,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				if(json.error){
					alert(json.error);
				}else{
					listM(ysmHclassCd);
				}
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	
	
	function fn_regHTxt(ysmHclassCd, ysmHclassNm) {
		
		$("#ysmHclassNm").val(ysmHclassNm);
		$("#ysmHclassCd").val("");
		$("#ysmHclassCd").val(ysmHclassCd);
		
		listM(ysmHclassCd);
	}
	
	function fn_regMTxt(ysmMclassCd, ysmMclassNm) {
		
		$("#ysmMclassNm").val(ysmMclassNm);
	}
	
	function search() {
		var schYsmHclassNm = $("#schYsmHclassNm").val();
		listH(schYsmHclassNm);
	}
	
</script>
<style>
	.table-style1 input {width:150px;}
	td:nth-child(even){text-align:left;}
	/* td:nth-child(odd){text-align:left;} 홀수 이벤트*/
	#oneBlock {width:48.5%;float:left;}
	#scroll {height:300px;overflow:auto;};
	#twoBlock {width:48.5%;}
	/*#threeBlock {width:48.5%;}*/
	#newHclass {text-align:right;margin-right:18px;margin-top:25px;}
	#newMclass {text-align:right;margin-right:18px;margin-top:25px;}
	
</style>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>
		분류정보 등록
	</h2>
	<div class="box-style1">
		<form id="frm" name="frm" method="post" encType="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<div class="search-box" style="width:99.2%;">
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>대분류</label></span>
					<span class="label2">
						 <input type="text" name="schYsmHclassNm" id="schYsmHclassNm" style="width: 275px;" value="${schYsmHclassNm}" />
					</span>
				</div>
				<div class="btn" style="padding-right: 70px;">
					<button type="button" class="btn-search" id="searchBtn"  style="background-color:#3781ba;color:white;" onclick="javascript:search();">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
			</div>
			
			
		</form>
		<div id="oneBlock">
			<form id="frm2" name="frm2" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
		<div id="scroll">
			<table id="tableH" class="table-write mg-t5" style="width:93%;">
				<colgroup> 
					<col width="20%"></col>
					<col width="20%"></col> 
					<col width="5%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col" style="position: sticky;top: 0;">대분류명</th>
						<th scope="col" style="position: sticky;top: 0;">대분류코드</th>
						<th scope="col" style="position: sticky;top: 0;">순번</th> 
					</tr>
				</thead>
				<tbody id ="tby1">
				
				</tbody>
			</table>
		</div>
		<div id="newHclass">
			대분류명<input type="text" name="ysmHclassNm" id="ysmHclassNm" value="" style="width: 275px;" />
		</div>
		<div class="btn" style="text-align: right; display: block;width:95.5%;margin-top:10px;">
					<button type="button" class="btn-basic" onClick="javascript:fn_clear('h');"><i class="fa fa-repeat"></i>초기화</button>
					<button type="button" class="btn-basic" onClick="javascript:fn_reg(1);" style="background-color:#fc692f;color:white;">저장</button>
					<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd}');"<%-- onClick="javascript:fn_list('${mnuCd}');" --%> style="background-color:#fc692f;color:white;">목록</button>
				</div>
			</form>
		</div>	
		<div id="twoBlock">
			<form id="frm3" name="frm3" method="post">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
				<input type="hidden" id="mnuCd"	name="mnuCd" value="${mnuCd }">
				<input type="hidden" id="ysmHclassCd" name="ysmHclassCd" value="" />
			<div id="scroll">
				<table class="table-write mg-t5" style="width:93%;margin-left:20px;">
					<colgroup> 
						<col width="20%"></col>
						<col width="20%"></col> 
						<col width="5%"></col>
					</colgroup>
					<thead>
						<tr>
							<th scope="col" style="position: sticky;top: 0;">중분류명</th>
							<th scope="col" style="position: sticky;top: 0;">중분류코드</th>
							<th scope="col" style="position: sticky;top: 0;">순번</th> 
						</tr>
					</thead>
					<tbody id="tby2">
					
					</tbody>
				</table>
			</div>
				<div id="newMclass">
					중분류명<input type="text" name="ysmMclassNm" id="ysmMclassNm" value=""  style="width: 275px;" />
				</div>
			</form>
			<div class="btn" style="text-align: right; display: block;width:97.8%;margin-top:10px;">
				<button type="button" class="btn-basic" onClick="javascript:fn_clear('m');"><i class="fa fa-repeat"></i>초기화</button>
				<button type="button" class="btn-basic" onClick="javascript:fn_reg(2);" style="background-color:#fc692f;color:white;">저장</button>
				<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd}');"<%-- onClick="javascript:fn_list('${mnuCd}');" --%> style="background-color:#fc692f;color:white;">목록</button>
			</div>
		</div>	
	</div>		
</section>
</html>