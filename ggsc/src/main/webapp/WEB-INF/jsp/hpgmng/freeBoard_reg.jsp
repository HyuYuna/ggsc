<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="/gnoincoundb/css/style.css" rel="stylesheet">
<script src="/gnoincoundb/editor/js/summernote_0.8.3.js"></script>
<script src="/gnoincoundb/editor/js/summernote_0.8.3.min.js"></script>
<script src="/gnoincoundb/editor/lang/summernote-ko-KR.js"></script>
<script src="/gnoincoundb/editor/js/bootstrap_3.3.5.js"></script>
<link rel="stylesheet" href="/gnoincoundb/editor/css/summernote_0.8.3.css">
<link rel="stylesheet" href="/gnoincoundb/editor/css/bootstrap_3.3.5.css">

<script type="text/javascript">
	$(document).ready(function() {
	   $('#rcontent').summernote({
	        minHeight: 400,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR',
	        callbacks: {	//이미지 첨부하는 부분
	        	onImageUpload : function(files) {
	        		for (var i = files.length - 1; i >= 0; i--) {
	        			uploadImgFile(files[i], this);
	                  }
	        	}
	        }
	   });
	   $("#rcontent").focus();
	   //$("#downBtn").css("display", "none");
	   
	});
	
	$(document).on('click', '#delete', function(e) {
		fn_deleteFile($(this));
	})
	
	function uploadImgFile(file, editor){
		var token = $("meta[name='_csrf']").attr("th:content");
		var header = $("meta[name='_csrf_header']").attr("th:content");
		
		data = new FormData();
        data.append("file", file);
        $.ajax({
            data : data,
            type : "POST",
            url : "/gnoincoundb/ImageUpload.do",
            enctype : "multipart/form-data",
            contentType : false,
            processData : false,
            beforeSend : function(xhr){
		           xhr.setRequestHeader(header, token);
		    },
            success : function(data) {
                $(editor).summernote('insertImage', "/gnoincoundb/getImage.do?fileNm=" + data.url);
               //$("#imgPath").val(data.url);
            }
        });
	}
	
	
	function fn_reg(param){
		
		var title = $('input[name=title]').val();
		var rcontent = $("#rcontent").val();
		if(title == "") {
			alert("제목을 입력해 주세요.");
			$("#title").focus();
			return;
		}
		if(rcontent == ""){
			alert("내용을 입력해 주세요.");
			$("#rcontent").focus();
			return;
		}
		/* if(rcontent.length > 20000){
			alert("내용을 20000자 이내로 입력해 주세요.");
			$("#rcontent").focus();
			return;
		} */
		if(param == "S") {
			if(confirm("등록 하시겠습니까?")){
				$("#num").val(0);
				document.frm.action = "/gnoincoundb/freeBoardReg.do?save=" +param;
		       	document.frm.submit();
			}
		}
		
	}  	
	function fn_list(mnuCd){
		document.location.href = "/gnoincoundb/freeBoardList.do?mnuCd=" + mnuCd;
	}  	
	
	function fn_down(fileNm, sysFileNm, filePath){
		$("#fileNm").val(fileNm);
		$("#sysFileNm").val(sysFileNm);
		$("#filePath").val(filePath);
		document.downForm.action = "/gnoincoundb/fileDown.do";
       	document.downForm.submit();
	}
	
	function fn_deleteFile(obj) {
		obj.parent().remove();
	}
	
	var file_count = 1;
	
	function fn_addFile() {
		var str ="<p><input type='file' name='file_"+(file_count++)+"' style='width:auto;'>";
			str +="<button type='button' id='delete' class='btn-basic' name='delete' style='background-color:#7f7f7f;'>삭제</button></p>";
			$(".filebox").append(str);
			$("#delete").on("click", function(e) {
				fn_deleteFile($(this));
			});
			console.log(file_count);
	}
	
</script>
<style>
	.filebox input[type="file"] {
	    overflow: hidden;
	}
	.filebox label {
	    display: inline-block;
	    padding: 2px 20px;
	    color: #999;
	    vertical-align: middle;
	    background-color: #fdfdfd;
	    cursor: pointer;
	    border: 1px solid #ebebeb;
	    border-radius: 5px;
	}
	
	/* named upload */
	.filebox .upload-name {
	    display: inline-block;
	    height: 25px;
	    font-size:18px; 
	    padding: 0 10px;
	    vertical-align: middle;
	    background-color: #f5f5f5;
	    border: 1px solid #ebebeb;
	    border-radius: 5px;
	    width: 600px;
	}
</style>
<section id="content">
	<h2 class="h2-title"><i class="fa fa-check-square"></i>자유게시판 등록</h2>
	<form name="downForm" id="downForm" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" id="fileNm" name="fileNm" value="" />
		<input type="hidden" id="sysFileNm" name="sysFileNm" value="" />
		<input type="hidden" id="filePath" name="filePath" value="" />
	</form>
	<form id="frm" name="frm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" id="mnuCd" name="mnuCd" value="${mnuCd }" />
		<input type="hidden" id="currentPageNo" name="currentPageNo" value="${currentPageNo }" />
		<input type="hidden" id="num" name="num" value="${freeBoard.num }" />
		<table class="table-write" >
			<colgroup>
				<col width="10%" />
				<col width="*" />		
			</colgroup>
			<tr>
				<th>제목</th>
				<td><input type="text" id="title" name="title" maxlength="50" value="${freeBoard.title }" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td style="text-align: left;"><textarea id="rcontent" name="cntn" cols="100" rows="20"><c:out value="${freeBoard.cntn }" escapeXml="false"/></textarea></td>
			</tr>
			<tr>
			<th>첨부파일</th>
				<td>
					<div class="filebox"> 
						<p>
							<input type="file" id="file" name="file_0" style="width:auto;">
							<button type="button" id="delete" class="btn-basic" name="delete_${var.index}" style="background-color:#7f7f7f;">삭제</button>
						</p>
					</div>
				</td>
			</tr>
		</table>
	</form>
	<div class="btn" style="text-align: right; display: block;">
		<button type="button" class="btn-basic" id="addFile" onclick="fn_addFile();" style="background-color:green;color:white;">파일추가</button>
		<button type="button" class="btn-basic" id="saveBtn" onClick="javascript:fn_reg('S');" style="background-color:green;color:white;">등록</button>
		<button type="button" class="btn-basic" onClick="javascript:fn_list('${mnuCd}');" style="background-color:#fc692f;color:white;">목록</button>
	</div>	
</section>
</html>