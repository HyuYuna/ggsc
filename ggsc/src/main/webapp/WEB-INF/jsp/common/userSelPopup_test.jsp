<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="/gnoincoundb/js/util/paging.js"></script>
<style>
	#content{width:605px;padding: 0 0 0 0;}
	body{min-width: 620px;}
</style>
<script type="text/javascript">
	var checkBoxArr = [];
	var checkBoxArr2 = [];
	$(function() {
		list(1); // ajax 불러오기
		$("#header").css("display","none");
	});
	
	function fn_select(){
		
		if(opener.document.getElementById("atdeNm")){
			opener.document.getElementById("atdeNm").value = checkBoxArr; // hidden type 으로 숨겨져 있던 값을 부모 페이지에 컴포넌트를 집어 값을 할당하는 것 
			opener.document.getElementById("atdeId").value = checkBoxArr2;
			opener.document.getElementById("atdeCnt").value = checkBoxArr.length; // 참석자 란에 수기로 입력할 필요 없게 만듬
		}
		
		window.close();
	}
	
	function list(curPage) {
		
		$("#currentPageNo").val(curPage);
		var param = $("#searchForm").serialize(); //ajax로 넘길 data
		var token = $("meta[name='_csrf']").attr("th:content");	
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		
		$.ajax({
			type : "POST",
			url : "/gnoincoundb/userSelPopupAjax_test.do",
			data : param,
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(json) {
				console.log(json.list);
				//console.log(json.totalPageCnt); 이 값 안 쓰임 
				
				var html = '';
				
				//$("#totalPageCnt").html(json.totalPageCnt); 
				
				
				$.each(json.list, function(i, d) {
				
					console.log(d);
					
					html += '<tr onclick="javascript:fn_sel(\''+ d.rnum +'\',\''+ d.userId +'\');">'; 
					html += '<td><input type="checkbox" id="chk'+d.rnum+'" name="userChk" value="'+d.userNm+'"></td>';
					html += '<td>' + d.rnum + '</td>';
					html += '<td>' + d.caseNo+ '</td>';
					html += '<td>' + d.cnsGb+ '</td>';
					html += '<td style="text-align: left; text-indent:10px;">' + d.userId + '</td>';
					html += '<td>' + d.userNm + '</td>';
					html += '</tr>';
					
				});
				
				if (json.list.length == 0) {
					html += '<tr><td colspan="6">정보가 없습니다.</td></tr>';
				}
				
				$("#tby1").html(html);

				var p = json.paginationInfo;
	        	var pageView = Paging(p.totalRecordCount,10,10, p.currentPageNo ,'list' ,1);
	        	$("#page1").empty().html(pageView);
	        	
	        	var checkBoxArr = $("#checkBoxArr").val();
	        	
	    		if(checkBoxArr.length > 0) { 							// 배열 안에 값이 있다면 
	    			if(checkBoxArr != "") {  							// 배열이 비어 있지 않다면 
	    				var checkBoxArrSplit = checkBoxArr.split(",");  // , 기점으로 자른 후 
	    				for (var idx in checkBoxArrSplit) { 			// check 상태를 true 로 만들어라 
	    					$("input[name=userChk][value=" + checkBoxArrSplit[idx] + "]").attr("checked", true);
	    				}			
	    			}
	    		}
	        	
			},
			error : function(e) {
				alert("서버와 통신 오류입니다.");
			}
		});
	}
	
	function fn_sel(rowId,userId) { // 클릭할때마다 정보가 들어온다 . 
		
		var row = "chk"+rowId;
		
		// toggle
		if($("input[name=userChk][id="+row+"]").is(":checked") == true) { 
			$("input[name=userChk][id="+row+"]").attr("checked", false);  // 체크를 풀어라 
			checkBoxArr.pop(); // 끝 배열의 값을 지운다 
		} else {
			$("input[name=userChk][id="+row+"]").attr("checked", true); // 체크가 되어 있지 않은 상태 
			var value = $("input[name=userChk][id="+row+"]").val(); // 값을 가지고 온 뒤에 
			checkBoxArr.push(value);	// 배열에 밀어 넣어라 
		}
		// 결론 클릭 시 , 체크 된 상태면 값을 제거 아닌 경우에는 체크를 true 로 만들고 값을 밀어 넣는 if
		
		if($("input[name=userChk][id="+row+"]").is(":checked") == true) {
			checkBoxArr2.push(userId);
		} else {
			checkBoxArr2.pop();
		}
			
		$("#checkBoxArr").val(checkBoxArr);
		$("#checkBoxArr2").val(checkBoxArr2);
	}
	
	
</script>
<section id="content">
	<h2 class="h2-title mg-t20 mg-l25">
		<i class="fa fa-circle"></i>
		회원 찾기
	</h2>
		<input type="hidden" id="checkBoxArr" name="checkBoxArr" />
		<input type="hidden" id="checkBoxArr2" name="checkBoxArr2" />
		<!-- 검색영역 -->
		<form name="searchForm" id="searchForm" method="post" onsubmit="return false">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
			<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
			<div class="search-box">
				<div class="search-group" style="margin-left:0px;">
					<span class="label"><label>회원ID</label></span>
					<span class="label2">
						<input type='text' name='schUserId' maxLength=12 style="width: 100px;" value='${vo.schUserId}' enterSearch data-button='#searchBtn'/>
					</span>
				</div>
				<div class="search-group" style="margin-left:0px; ">
					<span class="label"><label>회원명</label></span>
					<span class="label2">
						<input type='text' name='schUserNm' maxLength=12 style="width: 100px;" value='${vo.schUserNm}' enterSearch data-button='#searchBtn'/>
					</span>
				</div>
				<br>
				<div class="btn" style="padding-right:10px;">
					<button type="button" class="btn-search" id="searchBtn" onclick="javascript:list(1);">
						<i class="fa fa-search"></i>검색
					</button>
				</div>
			</div>
		</form>
		
		<table class="table-style1" style="margin-bottom: 5px;">
			<colgroup> 
				<col width="3%"></col>
				<col width="10%"></col>
				<col width="20%"></col>
				<col width="15%"></col>
				<col width="15%"></col>
				<col width="15%"></col>
			</colgroup>
						
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col">순번</th>
					<th scope="col">caseNo</th>
					<th scope="col">상담구분</th>
					<th scope="col">ID</th>
					<th scope="col">성명</th> 
				</tr>
			</thead>
			<tbody id="tby1">
			
			</tbody>

		</table>
		<div class="paginate" id="page1">

		</div>
		<!-- // 페이징 -->
		
	<div>
		<button type="button" class="btn-basic" onclick="javascript:fn_select();">확인</button>
		<button type="button" class="btn-basic" onclick="window.close();">닫기</button>
	</div>
</section>
</html>