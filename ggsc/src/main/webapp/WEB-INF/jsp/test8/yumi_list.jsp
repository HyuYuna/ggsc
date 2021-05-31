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
			url : "<c:out value="${pageContext.request.contextPath}" />/yumiStateList_ajax.do",
			data : $("#searchForm").serialize(),
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			}
		}).done(function(json){
			$("#tbl_item_box tr.item").remove();
			for(var i=0;i<json.list.length;i++){
				var obj = json.list[i];
				
				if(obj.title==null) {
					$("#tbl_item_box").append('<tr class="item"><td colspan=6>등록된 정보가 없습니다.</td></tr>');
				} else {
					var p_total = Number(obj.p1) + Number(obj.p2) + Number(obj.p3) + Number(obj.p4) + Number(obj.p5);
					$("#tbl_item_box").append('<tr class="item">' + 
						'<td>' + p_total + '</td>' +
						'<td>' + obj.p1 + '</td>' +
						'<td>' + obj.p2 + '</td>' +
						'<td>' + obj.p3 + '</td>' +
						'<td>' + obj.p4 + '</td>' +
						'<td>' + obj.p5 + '</td>' +
						'</tr>'
					);
				};
			}
		}).fail(function(e) {
			alert("서버와 통신 오류입니다");
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

	<h2 class="h2-title"><i class="fa fa-check-square"></i>Test12현황</h2>
		
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
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>diverse</label></span>
					<span class="label2">
						<select name="schG1Gb" style="width:275px;">
							<option value="">전체</option>
							<c:forEach items="${g1List }" var="list">
								<option value="${list.odr }"  <c:if test="${list.odr == vo.schG1Gb}">selected</c:if> >${list.ysmMclassNm }</option>
							</c:forEach>
						</select>
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
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(1);">테스트11</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin; background-color: gray;">테스트12</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(3);">테스트13</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(4);">무작위</li>
				</ul>
			</div>
		
			<h3 class="h3-title" style="margin-top: 15px; margin-bottom:15px; ">○ Test12통계</h3>
			
			
            <table class="table-style1" style="margin-top:1px;">
                <colgroup>
                	<col style="width: 9%;" />
                	<col style="width: 9%;" />
                	<col style="width: 9%;" />
                	<col style="width: 9%;" />
                	<col style="width: 9%;" />
                	<col style="width: 9%;" />
                </colgroup>
                <tbody id='tbl_item_box'>
                    <tr>
                        <th scope="col" rowspan="2">제목</th>
                        <th scope="col" colspan="5">유미</th>
                    </tr>
                    <tr>
                        <td>diverse</td>
                        <td>diverse</td>
                        <td>enormous</td>
                        <td>enormous</td>
                        <td>enormous</td>
                    </tr>
                </tbody>
            </table>
			
		</div>
		<!-- end -->

	</section>

</html>