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
	
	function list2() {
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		$.ajax({
			type : "POST",
			url : "<c:out value="${pageContext.request.contextPath}" />/appleStateList_ajax.do",
			data : $("#searchForm").serialize(),
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			}
		}).done(function(json){
			$("#tbl_item_box tr.item, #tbl_item_box2 tr.item").remove();
			for(var i=0;i<json.list.length;i++){
				var obj = json.list[i];
				
				if(obj.ageStr==null) {
					$("#tbl_item_box").append('<tr class="item"><td colspan=8>등록된 정보가 없습니다.</td></tr>');
					$("#tbl_item_box2").append('<tr class="item"><td colspan=8>등록된 정보가 없습니다.</td></tr>');
				} else {
					$("#tbl_item_box").append('<tr class="item">' + 
						'<td>' + obj.ageStr + '</td>' +
						'<td>' + obj.a0 + '</td>' +
						'<td>' + obj.a1 + '</td>' +
						'<td>' + obj.a2 + '</td>' +
						'<td>' + obj.a3 + '</td>' +
						'<td>' + obj.a4 + '</td>' +
						'<td>' + obj.a5 + '</td>' +
						'<td>' + obj.a6 + '</td>' +
						'<td>' + obj.a7 + '</td>' +
						'</tr>'
					);
					$("#tbl_item_box2").append('<tr class="item">' + 
						'<td>' + obj.ageStr + '</td>' +
						'<td>' + obj.h0 + '</td>' +
						'<td>' + obj.h1 + '</td>' +
						'<td>' + obj.h2 + '</td>' +
						'<td>' + obj.h3 + '</td>' +
						'<td>' + obj.h4 + '</td>' +
						'<td>' + obj.h5 + '</td>' +
						'<td>' + obj.h6 + '</td>' +
						'<td>' + obj.h7 + '</td>' +
						'</tr>'
					);
				};
			}
		}).fail(function(e){
			alert("서버와 통신 오류입니다.");
		});
	}
	
	
	function list() {
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		$.ajax({
			type : "POST",
			url : "<c:out value="${pageContext.request.contextPath}" />/ysmStateList_ajax.do" ,
			data : $("#searchForm").serialize(),
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			}
		}).done(function(json){
			var d = json.list[0];
			var obj = Object.entries(d);
			//alert(obj.length);
			for(var i=0;i<obj.length;i++){
				var c = obj[i];
				$("td[data-class='" + c[0] + "']").text(c[1]);
			}
			list2();
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

	<h2 class="h2-title"><i class="fa fa-check-square"></i>Test13현황</h2>
		
		<div class="box-style1 x-scroll-auto" >
				<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" action="/bbsList.do" method="post" onsubmit ="return false">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" name="mnuCd" name="mnuCd" value="${mnuCd }" />
			<div class="search-box">
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>생일</label></span>
					<span class="label2">
						<input type="text" name="schBirthGb" id="datepicker1" value="" style="width:246px;" readOnly />
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
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(2);">테스트12</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin; background-color: gray;">테스트13</li>
					<li style="border-style: solid; border-bottom-style:none; border-width: thin;" onclick="fn_goLink(4);">무작위</li>
					
				</ul>
			</div>
		
		
			<h3 class="h3-title" style="margin-top: 15px; margin-bottom:15px; ">○ YSM , YUNA 통계</h3>
			
            <table class="table-style1" style="margin-top:1px;">
                <colgroup>
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col" rowspan="2">총합</th>
                        <th scope="col" colspan="5">YSM 나이</th>
                        <th scope="col" rowspan="2">총합</th>
                        <th scope="col" colspan="5">YUNA 나이 (검색값 미적용)</th>
                    </tr>
                    <tr>
                        <td>85세 이상</td>
                        <td>80세 ~ 85세</td>
                        <td>75세 ~ 80세</td>
                        <td>70세 ~ 75세</td>
                        <td>60세 이하</td>
                        <td>85세 이상</td>
                        <td>80세 ~ 85세</td>
                        <td>75세 ~ 80세</td>
                        <td>70세 ~ 75세</td>
                        <td>60세 이하</td>
                    </tr>
                    <tr>
                    	<td data-class='y0'>&nbsp;</td>
                    	<td data-class='y1'>&nbsp;</td>
                    	<td data-class='y2'>&nbsp;</td>
                    	<td data-class='y3'>&nbsp;</td>
                    	<td data-class='y4'>&nbsp;</td>
                    	<td data-class='y5'>&nbsp;</td>
                    	<td data-class='u0'>&nbsp;</td>
                    	<td data-class='u1'>&nbsp;</td>
                    	<td data-class='u2'>&nbsp;</td>
                    	<td data-class='u3'>&nbsp;</td>
                    	<td data-class='u4'>&nbsp;</td>
                    	<td data-class='u5'>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
            
            <h3 class="h3-title" style="margin-top :15px;">1. 사과 </h3>
            <table class="table-style1">
            	<colgroup>
            		<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
            	</colgroup>
            	<tbody id ="tbl_item_box">
            		<tr>
            			<th scope="col" rowspan="2">나이</th>
            			<th scope="col" colspan="8">사과
            		</tr>
            		<tr>
            			<td>총합</td>
            			<td>diverse</td>
            			<td>diverse</td>
            			<td>diverse</td>
            			<td>diverse</td>
            			<td>enormous</td>
            			<td>enormous</td>
            			<td>enormous</td>
            		</tr>
            	</tbody>
            </table>
            
            
            <h3 class="h3-title" style="margin-top: 15px;">2. 휴유나 (검색값 미적용)</h3>
            <table class="table-style1">
            	<colgroup>
            		<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
                	<col style="width: 8%;" />
            	</colgroup>
            	<tbody id='tbl_item_box2'>
            		<tr>
            			<th scope='col' rowspan="2">날짜</th>
            			<th scope='col' colspan="8">휴유나</th>
            		</tr>
            		<tr>
            			<td>총합</td>
            			<td>match</td>
            			<td>match</td>
            			<td>match</td>
            			<td>match</td>
            			<td>interval</td>
            			<td>interval</td>
            			<td>interval</td>
            	</tbody>
            </table>
            
			
		</div>
		<!-- end -->

	</section>

</html>