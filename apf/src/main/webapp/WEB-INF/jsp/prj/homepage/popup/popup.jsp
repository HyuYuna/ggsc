<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${popupNum}</title>
<script type="text/javascript">
	function setCookie( name, value, expirehours ) {
		var todayDate = new Date();
		todayDate.setHours( todayDate.getHours() + expirehours );
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	}
	
	function closeWin(id,checkbox) {
		if (checkbox.checked ) {
			setCookie(id, "done" , 1 );
		}
		self.close();
	}
</script>
<style>
	body{ margin:0px;}
</style>
</head>
<body>
	<img src="${filePath}" alt="경기도노인종합상담센터" class='logo' width="${width}" height="${height}" />
	<form name='popup_close' style="height:15px; margin-bottom:0px; margin-top:0px">
		<input type='checkbox' name='chkbox[]' value='checkbox' onclick="closeWin(${popupNum},this);">
		오늘하루 이창을 열지 않기
	</form>
</body>
</html>