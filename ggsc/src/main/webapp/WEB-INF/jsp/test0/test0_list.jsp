<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="<c:out value="${pageContext.request.contextPath}" />/js/util/paging.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="<c:out value="${pageContext.request.contextPath}" />/js/html2canvas.min.js" ></script>
<script src="<c:out value="${pageContext.request.contextPath}" />/js/jspdf.min.js" ></script>
<script src="<c:out value="${pageContext.request.contextPath}" />/js/jquery-accordion-menu.js" ></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		var page = "${page}";
		if(page == ""){
			page = 1;
		}
		list(page);
	});

	function fn_reg(){
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/test0Dtl.do?mnuCd=${mnuCd}";
	}
	
	function fn_detail(){
		document.location.href = "<c:out value="${pageContext.request.contextPath}" />/test0Dtl.do?mnuCd=${mnuCd}";
	}
	
	function list(curPage) {
		$("#currentPageNo").val(curPage);
		var param = $("#searchForm").serialize(); //ajax로 넘길 data
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		$.ajax({
			type : "POST",
			url : "<c:out value="${pageContext.request.contextPath}" />/test0List_ajax.do",
			data : param,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				var html = '';
				$("#totalPageCnt").html(json.totalPageCnt);
				$.each(json.list, function(i, d) {
					var num = 0;
					num = (json.totalPageCnt - d.rnum) + 1;
					html += '<tr onclick="javascript:fn_detail();">';
					html += '<td>' + num + '</td>';
					html += '<td>' + d.ysmHclassNm + '</td>';
					html += '<td>' + d.ysmMclassNm + '</td>';
					html += '</tr>';
					
				});
				if (json.list.length == 0) {
					html += '<tr><td colspan="3">정보가 없습니다.</td></tr>';
				}
				$("#tby1").html(html);
	
				var p = json.paginationInfo;
	        	var pageView = Paging(p.totalRecordCount,10,10,
	        			p.currentPageNo ,'list' ,1);
	        	$("#page1").empty().html(pageView);
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    list(1);
		  };
	});
</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>대분류관리</h2>
		<div class="box-style1 x-scroll-auto" >
		
			<span style="float: left; margin: 0;">
				검색 총수 : <span id="totalPageCnt"><c:out value="${totalPageCnt }"/></span> 건 
			</span>
			<div class="btn" style="float: right; margin: 0;">
				<button type="button" class="btn-basic" onClick="javascript:fn_reg();" style="background-color:green; color:white;">등록</button>
			</div>	
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="3%"></col>
					<col width="5%"></col> 
					<col width="15%"></col>
					<col width="25%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">대분류코드</th>
						<th scope="col">대분류명</th> 
					</tr>
				</thead>
				<tbody id="tby1">
				
				</tbody>
			</table>
		
			<div class="paginate" id="page1">

			</div>
			<!-- // 페이징 -->
		</div>
		<!-- end -->
	</section>

</html>

