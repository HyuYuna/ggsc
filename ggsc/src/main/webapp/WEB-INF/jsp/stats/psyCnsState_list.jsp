<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script src="/gnoincoundb/js/util/paging.js"></script>

<script type="text/javascript">
	$(function(){
		console.log(list);
		list();
	});
	function fn_excelDown(){
		document.location.href = "/gnoincoundb/center_ExcelDown.do";
	}

	function list() {
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/psyCnsStateList_ajax.do",
			data : $("#searchForm").serialize(),
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			}
		}).done(function(json){
			var d = json.list[0];
			var obj = Object.entries(d);
			for (var i=0; i<obj.length;i++) {
				var p = obj[i];
				$("td[data-class='" + p[0] + "']").text(p[1]);
			}
					
			}).fail(function(e){
				alert("서버와 통신 오류입니다.");
			});
		}
</script>
<style>
	.search-group select{width:150px;}
	.label {margin-right:40px;}
	.label2 {display:inline-block;width:275px;color:#333;padding-right:5px;margin-bottom:2px;letter-spacing:-0.5px;text-align:right;}
	
</style>
<section id="content">

	<h2 class="h2-title"><i class="fa fa-check-square"></i>심리검사별현황</h2>
		
		<div class="box-style1 x-scroll-auto" >
				<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" action="/bbsList.do" method="post" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<div class="search-box">
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>상담구분</label></span>
					<span class="label2">
						 <select name="schCnsGb" style="width:275px;">
						 	<option value="">전체</option>
							<c:forEach items="${cnsGbList }" var="list">
								<option value="${list.odr }" <c:if test="${list.odr == vo.schCnsGb}">selected</c:if>>${list.mclassNm }</option>
							</c:forEach>
						</select>
					</span>
					<!-- <span class="form"><input type="text" name="schText" id="schText" value="" /></span> -->
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>센터구분</label></span>
					<span class="label2">
						<select name="schCenterGb" style="width:275px;">
							<option value="">전체</option>
							<c:forEach items="${cnsCenterList}" var="list">
								<c:choose>
									<c:when test="${authCd > 1}">
										<c:if test="${ list.num eq vo.schCenterGb }" >
											<option value="${list.num}" selected >${list.centerGb}</option>
										</c:if>
									</c:when>
									<c:when test="${authCd <= 1 }">								
										<option value="${list.num}" >${list.centerGb}</option>
									</c:when>
								</c:choose>
							</c:forEach>
						</select>
					</span>
				</div>
				<br>
				<div class="btn" style="padding-bottom:15px;padding-right:120px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:list(1);">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
				<div class="search-group" style="margin-left:70px;">
					<span class="label"><label>기간</label></span>
					<span class="label2">
						<input type="text" name="schDateGb" id="datepicker1" value="" style="width: 246px;" readOnly />
					</span>
				</div>
			</div>
		</form>
			<h3 class="h3-title" style="margin-top: 15px; margin-bottom:15px; ">○ 심리검사
				<div class="btn" style="float: right; margin: 0;">
					<button type="button" class="btn-basic" onclick="fn_excelDownload(1, document.searchForm)" style="background-color:green;color:white;">Excel 다운로드</button>		
				</div>
			</h3>
			
			
            <table class="table-style1" style="margin-top:1px;">
                <colgroup>
                	<col style="width: 5%;" />
                	<col style="width: 5%;" />
                	<col style="width: 5%;" />
                	<col style="width: 5%;" />
                	<col style="width: 5%;" />
                	<col style="width: 5%;" />
                	<col style="width: 5%;" />
                	<col style="width: 5%;" />
                	<col style="width: 5%;" />
                	<col style="width: 5%;" />
                	<col style="width: 5%;" />
                	<col style="width: 5%;" />
                	<col style="width: 5%;" />
                	<col style="width: 5%;" />
                	<col style="width: 5%;" />
                	<col style="width: 5%;" />
                	<col style="width: 5%;" />
                </colgroup>
                <tbody id="tbl_item_box">
                    <tr>
                        <th scope="col" rowspan="2">계(건)</th>
                        <th scope="col" colspan="16">심리검사</th>
                    </tr>
                    <tr>
                        <td>상담사전사후기록지</td>
                        <td>DUKE-AD 간략우울</td>
                        <td>죽음학대 질문지</td>
                        <td>GDS-KR 노인우울</td>
                        <td>GDS-SI 노인우울 자살사고</td>
                        <td>노인절망감척도</td>
                        <td>사회적지지척도</td>
                        <td>대인관계변화척도</td>
                        <td>한국형 알코올 중독 선별 검사</td>
                        <td>불안척도</td>
                        <td>스트레스 척도</td>
                        <td>사별스트레스 척도</td>
                        <td>부부친밀감 척도</td>
                        <td>부부의사소통 척도</td>
                        <td>문장완성검사</td>
                        <td>MMSE-K 치매선별</td>
                    </tr>
                     <tr>
                        <td data-class='p0'></td>
                        <td data-class='p1'></td>
                        <td data-class='p2'></td>
                        <td data-class='p3'></td>
                        <td data-class='p4'></td>
                        <td data-class='p5'></td>
                        <td data-class='p6'></td>
                        <td data-class='p7'></td>
                        <td data-class='p8'></td>
                        <td data-class='p9'></td>
                        <td data-class='p10'></td>
                        <td data-class='p11'></td>
                        <td data-class='p12'></td>
                        <td data-class='p13'></td>
                        <td data-class='p14'></td>
                        <td data-class='p15'></td>
                        <td data-class='p16'></td>
                    </tr>
                </tbody>
            </table>
			
		</div>
		<!-- end -->

	</section>

</html>