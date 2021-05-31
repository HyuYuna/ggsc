<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script src="<c:out value="${pageContext.request.contextPath}" />/js/util/paging.js"></script>

<script type="text/javascript">
	$(function(){
		list();
	});
	
	function list() {
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		$.ajax({
			type : "POST",
			url : "<c:out value="${pageContext.request.contextPath}" />/test8StateList_ajax.do",
			data : $("#searchForm").serialize(),
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			}
		}).done(function(json){
			var d = json.list[0];
			var obj = Object.entries(d);
			for(var i=0;i<obj.length;i++){
				var c = obj[i];
				$("td[data-class='" + c[0] + "']").text(c[1]);
			}
			console.log(d);
		}).fail(function(e){
			alert("서버와 통신 오류입니다.");
		});
	}
	
	function fn_goLink(no){
		var url = "";
		
		if(no == 1) {
			url = "<c:out value="${pageContext.request.contextPath}" />/test8List.do?mnuCd=${mnuCd}";
		} else if (no == 2) {
			url = "<c:out value="${pageContext.request.contextPath}" />/yumiList.do?mnuCd=${mnuCd}";
		} else if (no == 3) {
			url = "<c:out value="${pageContext.request.contextPath}" />/appleList.do?mnuCd=${mnuCd}";
		} else if (no == 4) {
			url = "<c:out value="${pageContext.request.contextPath}" />/randomList.do?mnuCd=${mnuCd}";
		}
		document.location.href = url;
	}


	
</script>
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
	.search-group select{width:150px;}
	.label {margin-right:40px;}
	.label2 {display:inline-block;width:275px;color:#333;padding-right:5px;margin-bottom:2px;letter-spacing:-0.5px;text-align:right;}
	
</style>
<section id="content">

	<h2 class="h2-title"><i class="fa fa-check-square"></i>Test11현황</h2>
		
		<div class="box-style1 x-scroll-auto" >
				<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" action="/bbsList.do" method="post" onsubmit ="return false">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" name="mnuCd" name="mnuCd" value="${mnuCd }" />
			<div class="search-box">
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>기간</label></span>
					<span class="label2">
						<input type="text" name="schDateGb" id="datepicker1" value="" style="width:246px;" readOnly />
					</span>
				</div>
			
				<div class="btn" style="padding-right:120px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:list(1);">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
				
			</div>
		</form>
			
			<div>
				<ul class="tabs">
					<li style="border-style: solid; border-bottom-style:none; border-width: thin; background-color: gray;">테스트11</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(2);">테스트12</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(3);">테스트13</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(4);">무작위</li>
				</ul>
			</div>
		
			<h3 class="h3-title" style="margin-top: 15px; margin-bottom:15px; ">○ Test11통계</h3>
			
			
            <table class="table-style1" style="margin-top:1px;">
                <colgroup>
                	<col style="width: 9%;" />
                	<col style="width: 9%;" />
                	<col style="width: 9%;" />
                	<col style="width: 9%;" />
                	<col style="width: 9%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col" rowspan="2">총합</th>
                        <th scope="col" colspan="5">유키</th>
                    </tr>
                    <tr>
                        <td>diverse</td>
                        <td>enormous</td>
                        <td>제목</td>
                        <td>내용</td>
                    </tr>
                    <tr>
                    	<td data-class='yukiTotal'>&nbsp;</td>
                    	<td data-class='diverse'>&nbsp;</td>
                    	<td data-class='enormous'>&nbsp;</td>
                    	<td data-class='title'>&nbsp;</td>
                    	<td data-class='content'>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
			
		</div>
		<!-- end -->

	</section>

</html>