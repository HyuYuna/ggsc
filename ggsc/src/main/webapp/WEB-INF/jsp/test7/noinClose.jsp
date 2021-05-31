<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script src="<c:out value="${pageContext.request.contextPath}" />/js/html2canvas.min.js" ></script>
<script src="<c:out value="${pageContext.request.contextPath}" />/js/jspdf.min.js" ></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		
	});
	
	
	
	
	function findYsmUser() {
		var ysmNm = $("#ysmNm").val();
		ysmNm = encodeURI(encodeURIComponent(ysmNm));	
		var url ="<c:out value= "${pageContext.request.contextPath}" />/findYsmUser.do?ysmNm=" + ysmNm+"&ysmGb=Y";
		var name ="ysm찾기"
		var option ="width=530 , height = 750 , top = 50, left = 100, location = yes";
		window.open(url,name,option);
		encodeURI(encodeURIComponent(jindan_name));
	}
		
	

	function fn_reg(){
		
		if(confirm("등록 하시겠습니까?")){
			document.frm.action = "<c:out value="${pageContext.request.contextPath}" />/noinCloseReg.do?mnuCd=${mnuCd}";
	       	document.frm.submit();
		}
		
	}  	
	
	function fn_close(){
		window.close();
	}
		
</script>
<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>노인상담 종결</h2>
		<div class="btn" style="float: right; margin: 0;">
			<button type="button" class="btn-basic" onClick="javascript:fn_close();" style="background-color:green; color:white;">닫기</button>
			<button type="button" class="btn-basic" onClick="javascript:fn_reg();" style="background-color:green; color:white;">저장</button>
		</div>
		<div class="box-style1 x-scroll-auto" >
			<form id="frm" name="frm" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
				<input type="hidden" id="num" name="num" value="${detail.num }" />
				<table class="table-write">
					<colgroup>
						<col width="15%"></col>
						<col width="10%"></col> 
						<col width="25%"></col>
						<col width="15%"></col>
						<col width="35%"></col>
					</colgroup>
				<tr>
					<th>사용자 아이디</th>
					<td colspan="2">
						<input type="text" class="wd200" id="userId" name="userId" value="${map.userId }" readonly />
					</td>
					<th>사용자이름</th>
					<td>
						<input type="text" class="wd200" id="userId" name="userNm" value="${map.userNm }" readonly />
					</td>
				<tr>
					<th rowspan="2">YSM</th>
					<th>이름</th>
					<td><input type="text" class="wd200" id="ysmNm" name="ysmNm" value="${detail.ysmNm}" readonly /><button type="button" class="btn-basic" style="padding: 2px 6px;" onclick="javascript:findYsmUser();">찾기</button></td>
					<th>ID</th>
					<td><input type="text" id="ysmId" name="ysmId" style="width:200px;" value="${detail.ysmId}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>narcissus</th>
					<td><input type="text" id="narcissus" name="narcissus" value="${detail.narcissus}" style="width: 200px;" readonly="readonly" /></td>
					<th>ysmNo</th>
					<td><input type="text" id="ysmNo" name="ysmNo" style="width: 200px;"  value="${detail.ysmNo}" readonly="readonly" /></td>
				</tr>
				
				<tr>
					<th rowspan="2" style="text-align:center">연락처</th>
					<td colspan="2">
						HOME .<input type="text" id="phone" name="phone" value="" />
					</td>
					<th rowspan="2">주소</th>
					<td rowspan="2">
						<input type="text" id="addr" name="addr" value="${detail.addr}" />
					</td>
				</tr>
				<tr>
					<td colspan="2"> 
						H . P <input type="text" id="tel" name="tel" value="" /> 
					</td>	
				</tr>
				<tr>
					<th rowspan="2">상담만족도</th>
					<td colspan="4">
						<input type="radio" id="stft1" name="stft" value="1" /><label for="stft1">1</label>
						<input type="radio" id="stft2" name="stft" value="2" /><label for="stft2">2</label>
						<input type="radio" id="stft3" name="stft" value="3" /><label for="stft3">3</label>
						<input type="radio" id="stft4" name="stft" value="4" /><label for="stft4">4</label>
						<input type="radio" id="stft5" name="stft" value="5" /><label for="stft5">5</label>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						건의사항 : <br/>
						<textarea id ="sug" name="sug"></textarea>
					</td>
				</tr>
				<tr>
					<th>checkbox</th>
					<td colspan="4">
						<c:forEach items="${g2List }" var="list">
							<input type="checkbox" id="g2Gb${list.odr}" name="g2Gb" value="${list.odr }" /><label for="g2Gb${list.odr }">${list.ysmMclassNm }</label>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th rowspan="2">텍스트</th>
					<th>텍스트1</th>
					<td colspan="4">
						<textarea name="content">${detail.content}</textarea>
					</td>
				</tr>
				<tr>
					<th>텍스트2</th>
					<td colspan="4">
						<input type="text" id="title" name="title" value="${detail.title}" />
					</td>
				</tr>
				</table>
			</form>
		</div>
		<!-- end -->
	</section>
</html>

