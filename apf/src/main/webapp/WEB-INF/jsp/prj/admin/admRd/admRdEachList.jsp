<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- wrap --> 
<div class="wrap"> 
	
	<!-- container --> 
	<div class="container">
		<!-- snb --> 
		<div class="snb">
			<div class="left_title">
				<h1>개별등록</h1>
			</div>
			<div class="nav-container">
				<ul class="left_nav">
					<li>
						<a href="/admRdCntList.do">차수관리</a>
					</li>
					<li>
						<a href="/admRdBdList.do">신탁계약등록</a>
					</li>
					<li>
						<a href="/admRdBdRstList.do">신탁계약결과</a>
					</li>
					<li>
						<a href="/admRdDirList.do">요양지시서등록</a>
					</li>
					<li>
						<a href="/admRdDirRstList.do">요양지시서결과</a>
					</li>
					<li class="active">
						<a href="/admRdEachList.do">개별등록</a>
					</li>
				</ul>
			</div>
		</div> 
		<!-- //snb --> 
		
		<form commandName="searchVO" id="admRdFrm" name="admRdFrm" method="post">
		<!-- content --> 
		<div class="content"> 
			<div class="paT40 paB25">
				<h1>개별등록 목록</h1>
			</div>
			
			
			<!-- 검색영역 --> 
			<div class="search_box">
				<fieldset>
					<legend>검색영역</legend>
					<div class="search_group ">
						<strong style="color:black;"><b>년  도</b></strong>
						<span class="search_line">|</span>
						<select id="sch_year" name="sch_year" style="width:120px;"> 
							<option value="9999" <c:if test="${searchVO.sch_year=='9999'}"> selected </c:if>  >전체</option>
							<option value="2021" <c:if test="${searchVO.sch_year=='2021'}"> selected </c:if>  >2021년</option>
							<option value="2020" <c:if test="${searchVO.sch_year=='2020'}"> selected </c:if>  >2020년</option>
							<option value="2019" <c:if test="${searchVO.sch_year=='2019'}"> selected </c:if>  >2019년</option> 
							<option value="2018" <c:if test="${searchVO.sch_year=='2018'}"> selected </c:if>  >2018년</option>
							<option value="2017" <c:if test="${searchVO.sch_year=='2017'}"> selected </c:if>  >2017년</option>	
						</select>
					</div>
					<div class="search_group mgT5">
						<strong style="color:black;"><b>월</b></strong>
						<span class="search_line">|</span>
						<select id="sch_month" name="sch_month" style="width:120px;"> 
								<option value="99" <c:if test="${searchVO.sch_month=='99'}"> selected </c:if>  >전체</option>
								<option value="12" <c:if test="${searchVO.sch_month=='12'}"> selected </c:if>  >12월</option>
						 		<option value="11" <c:if test="${searchVO.sch_month=='11'}"> selected </c:if>  >11월</option>
								<option value="10" <c:if test="${searchVO.sch_month=='10'}"> selected </c:if>  >10월</option>
								<option value="09" <c:if test="${searchVO.sch_month=='09'}"> selected </c:if>  >9월</option>
								<option value="08" <c:if test="${searchVO.sch_month=='08'}"> selected </c:if>  >8월</option>
								<option value="07" <c:if test="${searchVO.sch_month=='07'}"> selected </c:if>  >7월</option>
								<option value="06" <c:if test="${searchVO.sch_month=='06'}"> selected </c:if>  >6월</option>
								<option value="05" <c:if test="${searchVO.sch_month=='05'}"> selected </c:if>  >5월</option>
								<option value="04" <c:if test="${searchVO.sch_month=='04'}"> selected </c:if>  >4월</option>
								<option value="03" <c:if test="${searchVO.sch_month=='03'}"> selected </c:if>  >3월</option>
								<option value="02" <c:if test="${searchVO.sch_month=='02'}"> selected </c:if>  >2월</option>
								<option value="01" <c:if test="${searchVO.sch_month=='01'}"> selected </c:if>  >1월</option>
						</select>
						<a class="btn_search" href="javascript:fn_sch();">검색</a>
					</div>
				</fieldset> 
			</div>
			<!-- //검색영역 -->
			
			
			<p class="board_total">Total : ${paginationInfo.totalRecordCount} (개인별 개별등록 페이지입니다.)</p>
			<!-- list  start -->
			<table class="notice_tbl" border="0" cellspacing="0" summary="요양지시서관리입니다."> 
			<caption></caption> 
			<colgroup> 
				<col width="10%"></col>
				<col width="10%"></col>
				<col width="10%"></col>
				<col width="10%"></col>
				<col width="10%"></col>
				<col width="30%"></col>
				<col width="10%"></col>
				<col width="10%"></col>
			</colgroup> 
			<thead> 
			<tr> 
				<th scope="col">번호</th>
				<th scope="col">구분</th> 
				<th scope="col">년도</th> 
				<th scope="col">월</th> 
				<th scope="col">차수</th>
				<th scope="col">제목</th> 
				<th scope="col">작성일자</th> 
				<th scope="col">상세보기</th>
			</tr> 
			</thead> 
			<tbody> 
			
			<input type="hidden" id="selectedId" name="selectedId" value=""/>
			
			
			<c:forEach var="result" items="${admRdEachList}" varStatus="status">
				<c:if test="${result.rdGb=='3'}">
					<tr style="cursor:pointer;" onclick="javascript:fn_detail('<c:out value="${result.rdNum}"/>');" onmouseover="this.style.backgroundColor='#f1f1f1'" onmouseout="this.style.backgroundColor='#ffffff'">
				</c:if>
				<c:if test="${result.rdGb!='3'}">
					<tr>
				</c:if>
						<td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td> 
					<c:if test="${result.rdGb=='1'}">
						<td>신탁계약</td>
					</c:if>
					<c:if test="${result.rdGb=='2'}">
						<td>의료요양지시서</td>
					</c:if>
					<c:if test="${result.rdGb=='3'}">
						<td>개별등록</td>
					</c:if>
						<td><c:out value="${result.year}"/></td> 
						<td><c:out value="${result.month}"/></td> 
						<td><c:out value="${result.cnt}"/></td>
						<td class="txtL paL10"><c:out value="${result.title}"/></td>
						<td><c:out value="${result.regDt}"/></td> 
						<td><a href="javascript:fn_view('<c:out value="${result.rdNum}"/>');" class="btn_big"><strong>상세보기</strong></a></td> 
					</tr>
				
			</c:forEach>
			
			</tbody>
			</table>
			<div class="paginate"> 
				<div id="paging">
                    <ul class="pagination">
                      	<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
                      	<form:hidden path="pageIndex" />
                    </ul>
                </div>
			</div>
			<!-- list  end -->
			
		</div> 
		<!-- //content --> 
		</form>
		
	</div> 
	<!-- //container --> 
	
</div>
<!-- /wrap -->  
	
	
	<!--/#action-->
    <script type="text/javaScript" language="javascript" defer="defer">
        
	    /* 검색하기 */
	    function fn_sch() {
	    	
	       	document.admRdFrm.action = "/admRdEachList.do";
	       	document.admRdFrm.submit();
	    }
	    
	    
	    /* 목록 상세페이지로 이동 */
        function fn_detail(rdNum) {
        	
        	document.admRdFrm.selectedId.value = rdNum;
        	
        	document.admRdFrm.action = "/admRdEachView.do";
           	document.admRdFrm.submit();
        }
	    
	    
	    
        /* 글 수정 화면 function */
        function fn_view(rdNum) {
        	
        	document.admRdFrm.selectedId.value = rdNum;
        	
        	//document.admRdFrm.action = "/admRdEach_view.do";
        	document.admRdFrm.action = "/admRdEachViewList.do";
           	document.admRdFrm.submit();
        }
        
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	
        	alert("pageNo ====  "+pageNo);
        	//document.admNotFrm.pageIndex.value = pageNo;
        	//alert("document.admNotFrm.pageIndex.value == "+document.admNotFrm.pageIndex.value);
        	
        	document.admRdFrm.action = "/admRdEachList.do";
           	document.admRdFrm.submit();
        }
        
        
        
        /* 등록화면으로 이동 */
        function fn_Reg() {
        	
           	document.admRdFrm.action = "/admRdEachRegMove.do";
           	document.admRdFrm.submit();
        }
        
        
        //-->
    </script>
	
	
	<!-- footer --> 
	<div class="footer"> 
		<p>All Rights Reserved.</p>
	</div> 
	<!-- //footer --> 