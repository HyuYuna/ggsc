<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html><head>

<link href="/css/style.css" rel="stylesheet" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"  />

<script src="/js/jquery-1.11.2.min.js" type="text/javascript" ></script>
<script src="/js/util/paging.js" type="text/javascript" ></script>

<script type="text/javascript">

	$(document).ready(function() {
		authGrpListCombo();
	} ) ;
	
	
	function inputFormReset(){ $("#inputForm")[0].reset(); }
	
	
	function authGrpListCombo() {
		$.ajax({
			type : "POST",
			url : "/authGrpListComboAjax.do",
			data : $("#schForm").serialize() ,
			dataType : "json",
			success : function(json) {
				html = '';
				$.each(json.list, function(i, d) {
					html += '<option value="' + d.authGrpCd + '">' + d.authGrpNm + '</option>';
				});
				$('#authGrpCd').html( html ) ;
				
				initInput();
			},
			error : function(e) { alert("오류가 발생했습니다."); 	}
		});
	}

	
	function initInput(){
		
		$("#authNo").val( '<c:out value="${vo.authNo}" />' );
		
		if( 'Ins' == '${vo.saveFlag}' ) {
			
		} else {
			$.ajax({
				type : "POST",
				url : "/authDtlAjax.do",
				data : $("#inputForm").serialize(),
				dataType : "json",
				success : function(json) {
					$.each(json.list, function(i, d) {
						$('#authNo').val(d.authNo) ;
						$('#authCd').val(d.authCd) ;
						$('#authNm').val(d.authNm) ;
						$('#authGrpCd').val(d.authGrpCd) ;
						$('#cntn').val(d.cntn) ;
						$('#odr').val(d.odr) ;
						$('#useYn').val(d.useYn) ;
						
						$('#authCd').attr("readonly",true);
						$('#delBtn').show();
					});
				},
				error : function(e) { alert("오류가 발생했습니다."); 	}
			});
		}
	}

	
	function del() {
		
		if( true == confirm("삭제하시겠습니까?") ) { 
			$.ajax({
				type : "POST",
				url : "/authDelAjax.do",
				data : $("#inputForm").serialize() ,
				dataType : "json",
				success : function(json) {
					alert('삭제되었습니다.');
					$('#inputForm').submit();
				},
				error : function(e) { alert("오류가 발생했습니다."); 	}
			});
		} 
	}

	
	function save() {
		
		if ( true == confirm("저장하시겠습니까?") ) {
			$.ajax({
				type : "POST",
				url : "/auth" + $("#saveFlag").val() + "Ajax.do" ,
				data : $("#inputForm").serialize(),
				dataType : "json",
				success : function(json) {
					alert('저장되었습니다.');
					if( "Ins" == $("#saveFlag").val() ) {
						$('#schColm').val("1");
						$('#schStr').val("");
						$('#curPage').val("1");
						$('#inputForm').submit();
					} else if( "Upd" == $("#saveFlag").val() ) {
						$('#inputForm').submit();
					}
				},
				error : function(e) { alert("오류가 발생했습니다."); 	}
			});
		}
	}
	

</script>
</head>



<body>


<section id="content" >


<h2 class="h2-title"><i class="fa fa-check-square"></i>상세</h2>
	

<div class="box-style1 x-scroll-auto" >

<form name="inputForm" id="inputForm" method="post" action='/authList.do'>

	<input type='hidden' id='saveFlag' name='saveFlag' value='${vo.saveFlag}'/>
	<input type='hidden' id='schColm' name='schColm' value='${vo.schColm}' />
	<input type='hidden' id='schStr' name='schStr' value='${vo.schStr}' />
	<input type='hidden' id='schFrom' name='schFrom' value='${vo.schFrom}' />
	<input type='hidden' id='schTo' name='schTo' value='${vo.schTo}' />
	<input type='hidden' id='fromIndex' name='fromIndex' value='${vo.fromIndex}' />
	<input type='hidden' id='toIndex' name='toIndex' value='${vo.toIndex}' />
	<input type='hidden' id='curPage' name='curPage' value='${vo.curPage}' />

	<input type='hidden' id='authNo' name='authNo' value='${vo.authNo}' />
	
	<table class="table-style1" style="margin-bottom: 5px;">
	
	
		<colgroup> 
			<col width="8%"></col>
			<col width="17%"></col> 
			<col width="8%"></col>
			<col width="17%"></col> 
			<col width="8%"></col>
			<col width="17%"></col> 
			<col width="8%"></col>
			<col width="17%"></col> 
		</colgroup>
					
		<thead>
			<tr>
				<th scope="col"></th>
				<th scope="col"></th>
				<th scope="col"></th>
				<th scope="col"></th>
				<th scope="col"></th> 
				<th scope="col"></th>
				<th scope="col"></th> 
				<th scope="col"></th>
			</tr>
		</thead>
		
		<tbody>
		
			<tr>
				<td>권한코드</td>
				<td><input type='text' id='authCd' name='authCd' /></td>
				<td>권한명</td>
				<td><input type='text' id='authNm' name='authNm' /></td>
				<td>그룹권한명</td>
				<td><select id='authGrpCd' name="authGrpCd" ></select></td>
				<td>정렬순서</td>
				<td><input type='text' id='odr' name='odr' /></td>
			</tr>
			
			<tr>
				<td>설명</td>
				<td colspan='3'><input type='text' id='cntn' name='cntn' /></td>
				<td>사용여부</td>
				<td>
					<select id='useYn' name="useYn" >
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select>
				</td>
				<td colspan='2'></td>
			</tr>
			

			<tr>
				<td colspan='8' style='text-align:right;' >
					<button type="button" class="btn-basic" onClick="save();" style="background-color:#fc692f;color:white;">저장</button>
					<button id='delBtn' type="button" class="btn-basic" onClick="del();" style="background-color:#fc692f;color:white;display:none;">삭제</button>
				</td>
			</tr>

		</tbody>   

	</table>
</form>

</div>


</section>


</body></html>