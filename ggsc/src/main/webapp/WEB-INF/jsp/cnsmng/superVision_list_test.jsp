<html>
<head>
<meta charset="UTF-8">
<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	
	<!--  agGrid Lib -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.23.0/moment.min.js"></script>
    <script src="https://unpkg.com/ag-grid/dist/ag-grid.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/@ag-grid-community/all-modules@26.1.0/dist/styles/ag-grid.css" />
	<link rel="stylesheet" href="https://unpkg.com/@ag-grid-community/all-modules@26.1.0/dist/styles/ag-theme-alpine.css" />
	<script src="https://unpkg.com/@ag-grid-enterprise/all-modules@26.1.0/dist/ag-grid-enterprise.min.js">

	<script src="/gnoincoundb/js/util/paging.js"></script>
    <script src="/gnoincoundb/js/html2canvas.min.js" ></script>
    <script src="/gnoincoundb/js/jspdf.min.js" ></script>
   
    <style>
		ul.tabs{
		margin : 30px 0 30px 0;
		padding: 0px;
		list-style: none;
		border-bottom-style: solid;
		border-width: thin;
		}
		ul.tabs li{
			background: none;
			color: #222;
			display: inline-block;
			padding: 10px 15px;
			cursor: pointer;
		}
		
		.ag-header-row {
 			 border-bottom: 1px solid #ccc;
  			border-top: 1px solid #ccc;
		}
		.ag-header-cell-resize {
  			width: 1px;
  			height: 70%;
  			background-color: #ccc;
		}

		.ag-paging-panel {
  			float: right;
		}

		.ag-paging-button {
  			border: none;
  			background: #fff;
		}

		.ag-paging-row-summary-panel {
  			text-align: right;
		}

		.ag-cell-label-container,
			.ag-header-cell-label {
  				height: 100%;
		}
		
		.ag-row .ag-cell {
  			display: flex;
  			justify-content: center; /* align horizontal */
  			align-items: center;
  		}
  		
  		.ag-header .ag-cell {
  			display: flex;
  			justify-content: center; /* align horizontal */
  			align-items: center;
  		}
	</style>
	<script>
	var gridOptions;
	
		$(document).ready(
			function(){
				createGrid(); // 그리드 생성 
				
				// pagenation js util 
				$("button[ref=btPrevious]").html('<i class="fa fa-step-backward" />');
				$("button[ref=btFirst]").html('<i class="fa fa-fast-backward" />');
				$("button[ref=btNext]").html('<i class="fa fa-step-forward" />');
				$("button[ref=btLast]").html('<i class="fa fa-fast-forward" />');
			}		
		);
		
		function createGrid(){
			// column 설정 
			var columnDefs = [
				  { headerName: '순번' , width:70 ,field:'num' },
				  { headerName: '상담구분' ,field:'cnsGb' ,width:140},
				  { headerName: '센터명',field:'relOrgNm',width:350},
				  { headerName: '상담사구분',field:'cnsrGb' },
				  { headerName: '의뢰자' ,field:'reqCnsr'},
				  { headerName: '의뢰일자',field:'reqDt'},
				  { headerName: '수퍼바이저', field:'rplyCnsr'},
				  { headerName: '답변여부' ,field:'answerYn'}
				];
				
				// 그리드 기본 옵션 설정 
				gridOptions = {
				  columnDefs: columnDefs,
				  rowHeight: 40,
				  defaultColDef: {		
				    resizable: true,		// 리 사이징 
				    filter: true,			
				    flex: 1,
				    minWidth: 60			// column 최소 사이즈 
				  },
				  
				  onCellClicked:function(e){
				    	var num = e.data.num;
				    	document.location.href = "/gnoincoundb/superVisionDtl_test.do?num="+ num +"&mnuCd="+"${mnuCd}";
				  },
				  suppressRowClickSelection: true,
				  enableRangeSelection: true,
				  pagination: true,
				  paginationPageSize: 10
				  };
				
				var gridDiv = document.querySelector('#agGrid'); // 해당그리드에 정보를 가지고 옴 
				new agGrid.Grid(gridDiv, gridOptions); 			 // 해당 아이디에 옵션을 적용시켜 그리드를 띄움 
				getSuperVisionList(gridOptions);
		}
		
		
		function getSuperVisionList(gridOptions){
			var token = $("meta[name='_csrf']").attr("th:content");
			var header = $("meta[name='_csrf_header']").attr("th:content");
			
			$.ajax({
					url : "/gnoincoundb/superVisionList_ajax.do",
					type : "post",
					dataType : "json",
					beforeSend : function(xhr){
						xhr.setRequestHeader(header, token);
					},
					success : function(json){
						var sList = json.sList
						
						console.log(sList);
						
						$.each(sList,function(index,sv){
							
							if(sv.answerYn == "N"){
								sv.answerYn = "답변요청중"
							}else{
								sv.answerYn = "답변완료"
							}
							
							if(sv.cnsGb == "1"){
								sv.cnsGb = "노인상담"
							}else{
								sv.cnsGb = "중장년상담"
							}
							
							if(sv.cnsrGb == "1"){
								sv.cnsrGb = "전체운영자"
							}else if(sv.cnsrGb == "2"){
								sv.cnsrGb = "센터운영자"
							}else if(sv.cnsrGb == "3"){
								sv.cnsrGb = "전문상담사"
							}else if(sv.cnsrGb == "4"){
								sv.cnsrGb = "생명사랑교육단"
							}else if(sv.cnsrGb == "5"){
								sv.cnsrGb = "실버보듬이"
							}else if(sv.cnsrGb == "6"){
								sv.cnsrGb = "실무자"
							}else if(sv.cnsrGb = "7"){
								sv.cnsrGb = "기타"
							}
						});
						
						gridOptions.api.setRowData(sList);
					}
				});
		}
		
		function fn_reg(mndCd){
			document.location.href = "/gnoincoundb/superVisionDtl_test.do?mnuCd=" + "${mnuCd}";
		}
		
		function fn_goLink(no){
			var url = "";
			
			if(no == 1){
				url = "/gnoincoundb/perCnsList_test.do?mnuCd=${mnuCd}";	
			}else if(no == 2){
				url = "/gnoincoundb/gCnsList_test.do?mnuCd=${mnuCd}";
			}else if(no == 3){
				url = "/gnoincoundb/psyCnsList.do?mnuCd=${mnuCd}";
			}else if(no == 4){
				url = "/gnoincoundb/linkageReqList_test.do?mnuCd=${mnuCd}";
			}else{
				url = "/gnoincoundb/superVisionList_test.do?mnuCd=${mnuCd}";
			}
			document.location.href = url;
		}
		
		function fn_search(mnuCd){
			var token = $("meta[name='_csrf']").attr("th:content");
			var header = $("meta[name='_csrf_header']").attr("th:content");
			
			var schCnsGb = $("#schCnsGb").val()
			var schCnsleNm = $("#schCnsleNm").val()
			var schStartDate = $("#datepicker1").val()
			var schEndDate = $("#datepicker2").val()

			$.ajax({
				url : "/gnoincoundb/superVisionList_ajax.do",
				type : "post",
				dataType : "json",
				data:{"schCnsGb":schCnsGb , "schCnsleNm":schCnsleNm ,"schStartDate" :schStartDate,"schEndDate":schEndDate},
				beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
				},
				success : function(json){
					var sList = json.sList
					
					console.log(sList);
					
					$.each(sList,function(index,sv){
						
						if(sv.answerYn == "N"){
							sv.answerYn = "답변요청중"
						}else{
							sv.answerYn = "답변완료"
						}
						
						if(sv.cnsGb == "1"){
							sv.cnsGb = "노인상담"
						}else{
							sv.cnsGb = "중장년상담"
						}
						
						if(sv.cnsrGb == "1"){
							sv.cnsrGb = "전체운영자"
						}else if(sv.cnsrGb == "2"){
							sv.cnsrGb = "센터운영자"
						}else if(sv.cnsrGb == "3"){
							sv.cnsrGb = "전문상담사"
						}else if(sv.cnsrGb == "4"){
							sv.cnsrGb = "생명사랑교육단"
						}else if(sv.cnsrGb == "5"){
							sv.cnsrGb = "실버보듬이"
						}else if(sv.cnsrGb == "6"){
							sv.cnsrGb = "실무자"
						}else if(sv.cnsrGb = "7"){
							sv.cnsrGb = "기타"
						}
					});
					
					console.log(gridOptions.api);
					
					if(gridOptions != null){
						
						gridOptions.api.setRowData([]);
					}
					
					gridOptions.api.setRowData(sList);
				}
			});
		}
	</script>
</head>
<body>
<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>수퍼비전</h2>
	<div class="search-box">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>상담구분</label></span>
					<span class="label2">
						 <select name="schCnsGb" style="width:180px;" id = "schCnsGb">
						 	<option value="">전체</option>
						 	<c:forEach items="${cnsGbList }" var="result">
								<option value="${result.odr }" <c:if test="${result.odr eq vo.schCnsGb}">selected</c:if>>${result.mclassNm }</option>
							</c:forEach>						 	
						</select>
					</span>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>상담사명</label></span>
					<span class="label2">
						<input type="text" name="schCnsleNm" style="width:180px;" value="${vo.schCnsleNm}" enterSearch data-button='#searchBtn' id = "schCnsleNm">
					</span>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label">등록일</span> <input type="text" name="schStartDate" id="datepicker1" value="${vo.schStartDate }" style="width: 100px;" readOnly/> &nbsp;&nbsp;&nbsp; ~ &nbsp;<input type="text" name="schEndDate" id="datepicker2" value="${vo.schEndDate}" style="width: 100px;" readOnly/>
				</div>
				<div class="btn" style="padding-right: 100px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:fn_search('${mnuCd}');">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
			</div>
			
			<div>
				<ul class="tabs">
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(1);">개인상담</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(2);">집단상담</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(3);">심리검사</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(4);">연계의뢰서</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;background-color: gray;">수퍼비전</li>
				</ul>
			</div>
			<h3 class="h3-title" style="display: inline-block;"><i class="fa fa-star"></i>수퍼비전</h3>
			<div id = "agGrid" style = "width:1550px; height:500px;" class="ag-theme-alpine"></div>
			<br>
			<button type="button" class="btn-basic" onClick="javascript:fn_reg('${mnuCd }');" style="background-color: green;color:white;">신규등록</button>
		</section>
</body>
</html>