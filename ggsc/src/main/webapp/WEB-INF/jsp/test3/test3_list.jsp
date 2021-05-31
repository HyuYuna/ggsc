<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="<c:out value="${pageContext.request.contextPath}" />/js/util/paging.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		
		var page = "${page}";
		if(page == ""){
			page = 1;
		}
		list(page);
	});

	function fn_join(){
		var openwin;
		var url = "<c:out value="${pageContext.request.contextPath}" />/yuna_join_info.do";
		var name="유나 가입";
		var option= "width=530, height=800, left=250, location=yes";
		openwin = window.open(url, name, option);
	}
	
	function list(curPage) {
		$("#currentPageNo").val(curPage);
		var param = $("#searchForm").serialize(); //ajax로 넘길 data
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
       	
       	
		$.ajax({
			type : "POST",
			url : "<c:out value="${pageContext.request.contextPath}" />/test3List_ajax.do",
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
					//num = json.totalPageCnt-1;
					html += '<tr>';
					//html += '<td>' + num + '</td>';
					html += '<td onclick="javascript:fn_popup(\''+ d.ysmId +'\');">' + num + '</td>';
					html += '<td onclick="javascript:fn_popup(\''+ d.ysmId +'\');">' + d.ysmId+ '</td>';
					html += '<td onclick="javascript:fn_popup(\''+ d.ysmId +'\');">' + d.ysmNm+ '</td>';
					html += '<td onclick="javascript:fn_popup(\''+ d.ysmId +'\');">' + d.mobile+ '</td>';
					if(d.gender == 'M') {
						html += '<td>남성</td>';
					} else {
						html += '<td>여성</td>';
					} 			
					html += '<td onclick="javascript:fn_popup(\''+ d.ysmId +'\');">' + d.fate + '</td>'; /* cnsrGb */
					html += '<td onclick="javascript:fn_popup(\''+ d.ysmId +'\');">' + d.narcissus + '</td>';
					if(d.yunaYn == 'Y') {
						html += '<td>작성</td>';
					} else {
						html += '<td><button type="button" class="btn-basic" style="line-height:17px;" onClick="fn_security(\''+ d.ysmId +'\',\''+ d.ysmYn +'\')">미작성</button></td>';
					}
					if(d.ysmYn == 'Y') {
						html += '<td>승인</td>';
					} else {
						html += '<td>미승인</td>';
					} 					
					html += '</tr>';
					
				});
				if (json.list.length == 0) {
					html += '<tr><td colspan="9">정보가 없습니다.</td></tr>';
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
	
	function fn_popup(ysmId) {
		var openwin;
		var url = "<c:out value="${pageContext.request.contextPath}" />/test3Dtl.do";
		var name = "test3Dtl";
		var option = "width = 530 , height=750, left=200, location=yes";
		openwin = window.open(url, name, option);
		
		document.form2.ysmId.value = ysmId;
		document.form2.method = 'post';
		document.form2.action = url;
		document.form2.target = name;
		document.form2.submit();
	}
	
	function fn_security(ysmId,ysmYn) {
		if(ysmYn == "N") {
			alert("아직 승인되지 않았습니다.");
			return false;
		}
		var oepnwin;
		var url = "<c:out value="${pageContext.request.contextPath}" />/securityYuna_popup.do";
		var name = "securityYuna_popup";
		var option = "width=735, height=750, left=100, location=yes";
		oepnwin = window.open(url, name, option);
		
		document.form2.ysmId.value = ysmId;
		document.form2.method = 'post';
		document.form2.action = url;
		document.form2.target = name;
		document.form2.submit();
	}
	
	
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    list(1);
		  };
	});
</script>

<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>Yuna</h2>
		<div class="box-style1 x-scroll-auto" >
		
		<form name='form2' method='post'>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type='hidden' name='ysmId' />
		</form>
		
		<form name="searchForm" id="searchForm" action="/bbsList.do" method="get" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			
			<div class="search-box">
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>Fate</label></span>
					<span class="label2">
						 <select name="schFate" style="width:275px;">
							<option value="">전체</option>
							<c:forEach items="${test1List }" var="list">
								<option value="${list.num }" <c:if test="${list.num == vo.schFate}">selected</c:if>>${list.title }</option>
							</c:forEach>
						</select>
					</span>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>narcissus</label></span>
					<span class="label2">
						<select name="schNarcissus" style="width:275px;">
							<option value="">전체</option>
							<c:forEach items="${test2List }" var="list">
								<option value="${list.num }" <c:if test="${list.num == vo.schNarcissus}">selected</c:if>>${list.title }</option>
							</c:forEach>
						</select>
					</span>
				</div>
				
				<div class="btn" style="padding-bottom:15px; padding-right:120px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:list(1);">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
			</div>
		</form>
		
		<form name="frm" id="frm" method="post" onsubmit="return false">
			<span style="float: left; margin: 0;">
				검색 총수 : <span id="totalPageCnt"><c:out value="${totalPageCnt }"/></span> 건 
			</span>
			<div class="btn" style="float: right; margin: 0;">
				<button type="button" class="btn-basic" onClick="javascript:fn_join();" style="background-color:green; color:white;">등록</button>
			</div>	
			<table class="table-style1" style="margin-bottom: 5px;">
				<colgroup> 
					<col width="3%"></col>
					<col width="5%"></col> 
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="5%"></col>
					<col width="4%"></col>
					<col width="4%"></col>
					<col width="4%"></col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">아이디</th>
						<th scope="col">이름</th>
						<th scope="col">연락처</th>
						<th scope="col">성별</th>
						<th scope="col">Fate</th>
						<th scope="col">Narcissus</th>
						<th scope="col">보안서약서</th>
						<th scope="col">승인여부</th> 
					</tr>
				</thead>
				<tbody id="tby1">
				
				</tbody>
			</table>
		</form>
		
			<!-- // 페이징 -->
			<div class ="paginate" id="page1">
			
			</div>		
		<!-- end -->
	</section>

</html>

