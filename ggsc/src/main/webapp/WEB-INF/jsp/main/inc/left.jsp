<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<h1 class="logo txt-center"><a href="/gnoincoundb/main.do"><img src="/gnoincoundb/images/logo.png" /></a></h1>
	   <div class="side-nav">
        <div id="lnb">
            <ul>
            	<c:if test="${mnuList.size() > 0 }">
	            	<c:forEach var="result" items="${mnuList}">
						<c:if test="${result.mnuLvl == 1 }">
							<li class="noto500 fMenu" id="${result.mnuCd }"><a href="#" class="fmOn" onclick="javascript:fn_goPage('${result.mnuPath }', '${result.mnuCd }')"><img src="/gnoincoundb/${result.icon }">${result.mnuNm }</a></li>
						</c:if>
						<c:if test="${result.mnuLvl == 2 }">
							<c:if test="${mnuCd==result.mnuCd }">
								<li class="noto500 sMenu" id="${result.mnuCd }"><a class="ssmOn" href="javascript:fn_goPage('${result.mnuPath }', '${result.mnuCd }')">${result.mnuNm }</a></li>
							</c:if>
							<c:if test="${mnuCd!=result.mnuCd }">
								<c:choose>
									<c:when test="${fn:substring(result.mnuCd, 3, 5) == '01' && fn:length(mnuCd) == 3 }">
										<li class="noto500 sMenu" id="${result.mnuCd }"><a class="ssmOn" href="javascript:fn_goPage('${result.mnuPath }', '${result.mnuCd }')">${result.mnuNm }</a></li>									
									</c:when>
									<c:otherwise>
										<li class="noto500 sMenu" id="${result.mnuCd }"><a href="javascript:fn_goPage('${result.mnuPath }', '${result.mnuCd }')">${result.mnuNm }</a></li>
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:if>
					
					</c:forEach>
            	</c:if>
            	<!--  초기 조회값이 null 로 갔기 때문에 이 결과가 도출됨 , 추후에 페이지 이동 후 에는 이 if 는 동작되지 않음  -->
            	<!--  mnuList 가 조회되지 않았을 시 에 , goPage 함수에 메뉴코드를 넘겨주어 가공하여 path를 location.href로 호출함  -->
            	<c:if test="${mnuList.size() == 0 }">
            	
            		<li class="noto500 fMenu" id=""><a class="fmOn" href="javascript:fn_goPage('/counsellor_mng_list.do', 'M01')">운영관리</a></li>
            		<li class="noto500 fMenu" id=""><a class="fmOn" href="javascript:fn_goPage('/cnsAcceptList.do', 'M02')">상담관리</a></li>
            		<li class="noto500 fMenu" id=""><a class="fmOn" href="javascript:fn_goPage('/cnsBookList.do', 'M03')">보고서</a></li>
            		<li class="noto500 fMenu" id=""><a class="fmOn" href="javascript:fn_goPage('/resultReportList.do', 'M04')">실적및통계</a></li>
            		<li class="noto500 fMenu" id=""><a class="fmOn" href="javascript:fn_goPage('/relatedOrgan_mng_list.do', 'M05')">유관기관관리</a></li>
            		<li class="noto500 fMenu" id=""><a class="fmOn" href="javascript:fn_goPage('/overrollStatus.do', 'M06')">모니터링</a></li>
            		
            		<c:choose>
						<c:when test="${authCd eq 1 || authCh eq 2 }">
							<li class="noto500 fMenu" id=""><a class="fmOn" href="javascript:fn_goPage('/noticeList.do', 'M07')">행정지원</a></li>
		            		<li class="noto500 fMenu" id=""><a class="fmOn" href="javascript:fn_goPage('/centerNewsList.do', 'M08')">홈페이지관리</a></li>
		            		<li class="noto500 fMenu" id=""><a class="fmOn" href="javascript:fn_goPage('/menu_mng.do', 'M09')">공통관리</a></li>
						</c:when>
					</c:choose>
            	</c:if>
            </ul>
        </div>
    </div>
	 
	<script type="text/javascript">
	
		$(document).ready(function() {
			console.log("${mnuList}");
		});

		function fn_goPage(path, mnuCd){
			path = "/gnoincoundb" + path;
			path += "?mnuCd=" + mnuCd;
			console.log(path);
		 	// path 체크를 하면 request parameter 에 메뉴코드가 항시 들어있게 만들어져 있음 .
		 	// 그렇기 때문에 ,
			document.location.href = path;
		}
	</script>
