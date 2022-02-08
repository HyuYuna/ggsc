<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="file:///C|/Users/asdf/Documents/favicon.ico">
    <title>알려드려요&amp;자유게시판</title>
    <!-- Bootstrap core CSS -->
    <link href="/mgnoincoun/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="/mgnoincoun/assets/css/font-awesome.min.css" rel="stylesheet">
    <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/mgnoincoun/assets/js/ie-emulation-modes-warning.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5shiv.min.js"></script>
      <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <!-- Custom styles for this template -->
    <script src="/mgnoincoun/js/jquery-1.11.2.min.js" ></script>
    <link href="/mgnoincoun/assets/css/theme.css" rel="stylesheet">
  </head>
  <script>
	$(document).ready(function() {
		$("#iBtn").css("display", "block");
		$("#pBtn").css("display", "none");
		$("#frmR").css("display", "none");
		
		/* var findId = $("#findId").val();
		var findPw = $("#findPw").val();
		
		$("#sBtn").css("display", "none");
		$("#cnsrDtl_table").css("display", "none");
		$('input:radio[name=cnsrGb]:input[value="${detail.cnsrGb}"]').attr("checked", true);
		$('input:radio[name=gender]:input[value="${detail.gender}"]').attr("checked", true);
		$('#cnsGb').val('${detail.cnsGb}').attr('selected','selected');
		$('#centerGb').val('${detail.centerGb}').attr('selected','selected');
		$('#edu').val('${detail.edu}').attr('selected','selected'); */
		
	});
	
	function fn_findType(param) {
		if(param == "I") {
			$("#iBtn").css("display", "block");
			$("#pBtn").css("display", "none");
			$("#userNm").val("");
			$("#tel").val("");
			$("#email").val("");
		} else if(param == "P") {
			$("#iBtn").css("display", "none");
			$("#pBtn").css("display", "block");
			$("#userNm").val("");
			$("#tel").val("");
			$("#email").val("");
		}
	}
	
	 function fn_findIdPw(findGb) {
		if(confirm("ID/PW 찾기를 하시겠습니까?")) {
		 	var userNm = $("#userNm").val().replace(/ /gi, ""); // 성명
		 	var tel = $("#tel").val().replace(/ /gi, ""); // 핸드폰
		 	var email = $("#email").val().replace(/ /gi, ""); // 핸드폰
		 	$("#findGb").val(findGb);
	
			if(userNm.length == 0) {
				alert("[성명]을 입력해주십시오.");
				$("#userNm").focus();
				return;
			}
		 	
			if(tel.length == 0) {
				alert("[핸드폰]을 입력해주십시오.");
				$("#userNm").focus();
				return;
			}
			
			if(email.length == 0) {
				alert("[이메일]을 입력해주십시오.");
				$("#email").focus();
				return;
			}
		 	var param = $("#frm").serialize(); 
			$.ajax({
				type : "POST",
				url : "/mgnoincoun/findIdPwAjax.do",
				// data : {acptYn:"Y", caseNo:caseNo, cnsGb:cnsGb, userId:userId, userNm:userNm},
				// data : {userId:userId} ,
				data : param,
				dataType : "json",
				success : function(json) {
					var findGb = json.findGb;
					if(findGb == "I") {
						var result = json.result;
						if(result == null) {
							alert("일치하는 정보가 없습니다.");
						} else {
							var userId = json.result.userId;
							var userNm = json.result.userNm;
							var email = json.result.email;
							var cntn = "회원님의 아이디는 ["+userId+"] 입니다.";
							var title = "경기도노인종합상담센터 ID를 확인하세요."
							$("#sendList").val(email);
							$("#title").val(title);
							$("#cntn").val(cntn);
							$("#sendGb").val("I");
							alert(userNm+"님의 ID를 이메일로 전송했습니다.");	
							
							document.sendMail.action = "/mgnoincoun/mailSend.do";
							document.sendMail.submit();	
							// location.href = "/mgnoincoun/login.do";
						}
					} else if(findGb == "P") {
						var findPwChk = json.findPwChk;
						if(findPwChk == 1) {
							
							 var newPsswrod;
							 var randomValue = "abcdefghijklmnopqrstuvwxyz0123456789";
							 
							 for(i=1; i<=8; i++){
							  randomPoint = Math.round(Math.random()*34+1);
							  Pwdchar = randomValue.charAt(randomPoint);
							  if(i == 1){
							   newPassword = Pwdchar;
							  }else{
							   newPassword += Pwdchar;
							  }
							 }
							 
							var email = $("#email").val();
							var userNm = $("#userNm").val();
							var tel = $("#tel").val();
							var title = "경기도노인종합상담센터 임시비밀번호를 확인하세요."
							var cntn = "회원님의 임시비밀번호는 ["+newPassword+"] 입니다.";
							$("#sendList").val(email);
							$("#title").val(title);
							$("#cntn").val(cntn);
							$("#newPw").val(newPassword);
							$("#sendGb").val("P");
							$("#MuserNm").val(userNm);
							$("#Memail").val(email);
							$("#Mtel").val(tel);
							alert(userNm+"님의 임시비밀번호를 이메일로 전송했습니다.");	
							document.sendMail.action = "/mgnoincoun/mailSend.do";
							document.sendMail.submit();	
						} else {
							alert("일치하는 정보가 없습니다.");
						}
					}
					
				},
				error : function(e) {
				  	alert("서버와 통신 오류입니다.");
				}
			});
		} // confirm end
	 }
	 
	 function fn_pwReset() {
		 if(confirm("비밀번호를 재설정하시겠습니까?")) {
			 
  			var pw = $("#pw").val().replace(/ /gi, "") // 비밀번호
  			var pwChk = $("#pwChk").val().replace(/ /gi, "") // 비밀번호 확인
  			
			var num = pw.search(/[0-9]/g);
			var eng = pw.search(/[a-z]/ig);
			var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
			if(pw.length < 8 || pw.length > 20){
				 alert("8자리 ~ 20자리 이내로 입력해주세요.");
				 $("#pw").focus();
				 return false;
			}else if(pw.search(/\s/) != -1){
				 alert("비밀번호는 공백 없이 입력해주세요.");
				 $("#pw").focus();
				 return false;
			}else if(num < 0 || eng < 0){
				 alert("영문,숫자를 혼합하여 입력해주세요.");
				 $("#pw").focus();
				 return false;
		 	}
			
			if(pw != pwChk) {
  				alert("비밀번호가 동일하지 않습니다.");
  				$("#pwChk").focus();
  				return;
  			}
  			
		 	var param = $("#frmR").serialize(); 
			$.ajax({
				type : "POST",
				url : "/mgnoincoun/pwResetAjax.do",
				// data : {acptYn:"Y", caseNo:caseNo, cnsGb:cnsGb, userId:userId, userNm:userNm},
				// data : {userId:userId} ,
				data : param,
				dataType : "json",
				success : function(json) {
					alert(json.msg);
					location.href = "/mgnoincoun/login.do";
					
				},
				error : function(e) {
				  	alert("서버와 통신 오류입니다.");
				}
			});
			 
		 } // confirm end
	 }	 
	 
  </script>
  <body>
    <!-- 헤더 ================================================== -->
    <header class="navbar-wrapper">
      <nav class="navbar navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <a class="navbar-brand" href="/mgnoincoun/mobileMainList.do"><img src="/mgnoincoun/assets/img/logo.png" alt="경기도노인종합상담센터" /></a>
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">전체메뉴</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li><a href="/mgnoincoun/psyCnsIntro.do">이렇게 이용하세요<i class="fa fa-caret-right"></i></a></li>
                <li><a href="/mgnoincoun/psyCnsList.do">간편한 심리검사<i class="fa fa-caret-right"></i></a></li>
                <li><a href="/mgnoincoun/comfCnsInsert.do">맘편한 상담<i class="fa fa-caret-right"></i></a></li>
                <li><a href="/mgnoincoun/mypageView.do">마이 페이지<i class="fa fa-caret-right"></i></a></li>
                <li><a href="/mgnoincoun/noticeList.do">센터소식 &amp; 공지사항<i class="fa fa-caret-right"></i></a></li>
                <li><a href="/mgnoincoun/freeBbsList.do">문서자료실 &amp; 자유게시판<i class="fa fa-caret-right"></i></a></li>
                <li><a href="/mgnoincoun/cnsAskList.do">상담문의하기<i class="fa fa-caret-right"></i></a></li>                
              </ul>
            </div>
          </div>
        </nav>
        <div class="social-icons pull-right">
          <ul class="nav nav-pills">
            <li><a href="/mgnoincoun/mobileMainList.do" class="btn btn-primary btn-xs"><i class="fa fa-home mr5"></i>홈</a></li>
             <c:choose>
				 <c:when test="${loginYn eq 'Y'}">
				     <li><a href="/mgnoincoun/logout.do" class="btn btn-primary btn-xs"><i class="fa fa-lock mr5"></i>로그아웃</a></li>
				     <li><a href="/mgnoincoun/mypageView.do" class="btn btn-primary  btn-xs"><i class="fa fa-user mr5"></i>마이페이지</a></li>
				 </c:when>
				 <c:otherwise>
				     <li><a href="/mgnoincoun/login.do" class="btn btn-primary btn-xs"><i class="fa fa-unlock-alt mr5"></i>로그인</a></li>
				     <li><a href="/mgnoincoun/agree.do" class="btn btn-primary  btn-xs"><i class="fa fa-user mr5"></i>회원가입</a></li>
				 </c:otherwise>
			 </c:choose>
          </ul>
        </div>
    </header><!-- header.navbar-wrapper /-->
    <!-- 컨텐츠  ================================================== -->
    <div class="container content-wrapper">
      <div class="page-header">
        <h1 class="title"><i class="fa fa-comments-o"></i>ID/PW 찾기</h1>
        <ol class="breadcrumb">
          <li><a href="/mgnoincoun/mobileMainList.do">Home</a></li>
          <!--<li><a href="#">센터소개</a></li>-->
          <li class="active">ID/PW 찾기</li>
        </ol>
      </div>
      <!-- <h2 class="title">ID/PW 찾기</h2> -->
      <div class="login-content">
      	<label class="control-label" for=""></label>
        <div class="fr">
          <span class="radio-custom"><input type="radio" name="joinPath" id="joinPath1" value="I" onClick="javascript:fn_findType('I');" checked="checked"><label for="joinPath1"><i></i><span>ID찾기</span></label></span>
          <span class="radio-custom"><input type="radio" name="joinPath" id="joinPath2" value="Y" onClick="javascript:fn_findType('P');" ><label for="joinPath2"><i></i><span>비밀번호찾기</span></label></span>
        </div>	
        <form class="form-wrap" id="sendMail" name="sendMail" method="post">
		  <input type="hidden" id="sendList" name="sendList" />
		  <input type="hidden" id="cntn" name="cntn" />
		  <input type="hidden" id="title" name="title" />
		  <input type="hidden" id="sendGb" name="sendGb" />
		  <input type="hidden" id="MuserNm" name="userNm" />
		  <input type="hidden" id="Memail" name="email" />
		  <input type="hidden" id="newPw" name="newPw" />
		  <input type="hidden" id="Mtel" name="tel" />
        </form>
		<form class="form-wrap" id="frm" name="frm" method="post">
		  <input type="hidden" id="findGb" name="findGb" />
          <div class="form-group">
            <label class="control-label" for="userNm">성명<i class="cr">*</i></label>
            <input type="text" id="userNm" name="userNm" class="form-control">
          </div>
          <div class="form-group">
            <label class="control-label" for="tel">핸드폰<i class="cr">*</i></label>
            <input type="text" class="form-control" id="tel" name="tel">
          </div>
          <div class="form-group">
            <label class="control-label" for="email">이메일<i class="cr">*</i></label>
            <input type="text" class="form-control" id="email" name="email">
          </div>
          <div class="btn-wrap line bt pt20">
            <button type="button" id="iBtn" class="btn btn-primary btn-lg w100p" onClick="javascript:fn_findIdPw('I');">ID 찾기</button>
            <button type="button" id="pBtn" class="btn btn-primary btn-lg w100p" onClick="javascript:fn_findIdPw('P');">비밀번호찾기</button>
            <!-- <button type="button" class="btn btn-primary btn-lg w100p" onclick="location.href=/mgnoincounlogin.do'" style="color: #fff; background-color: #78849E; border-color: #78849E;">비밀번호찾기</button> -->
          </div>
        </form>
        <!-- PW 재설정 from -->
		<form class="form-wrap" id="frmR" name="frmR" method="post">
		  <input type="hidden" id="RuserNm" name="userNm" />
		  <input type="hidden" id="Rtel" name="tel" />
		  <h2 class="title">비밀번호 재설정</h2>
          <div class="form-group">
            <label class="control-label" for="pw">비밀번호<i class="cr">*</i></label>
            <input type="password" id="pw" name="pw" class="form-control">
          </div>
          <div class="form-group">
            <label class="control-label" for="pwChk">비밀번호 확인<i class="cr">*</i></label>
            <input type="password" class="form-control" id="pwChk" name="pwChk">
          </div>
          <div class="btn-wrap line bt pt20">
            <button type="button" id="pBtn" class="btn btn-primary btn-lg w100p" onClick="javascript:fn_pwReset();">비밀번호 재설정</button>
          </div>
        </form>      
	  </div>
    </div><!-- .container.content-wrapper /-->
    <!-- FOOTER -->
    <footer>
      <div class="copyaddress">
        <ul>
          <li><b>경기도노인종합상담센터</b></li>
          <li><span>주소 : </span><a href="javascript:top_address()">경기도 수원시 장안구 경수대로 1150, 도서관 3층</a></li>
          <li><span>사업자등록번호 : </span>722-82-00367<span class="ml10">대표 : </span>김미나</li>
          <li><span> TEL : </span> <a href="javascript:top_tel()">031-222-1360</a></li>
          <li><span> FAX : </span><a href="javascript:top_fax()">070-4832-6366</a></li>
          <li><span>E-mail : </span><a href="javascript:top_email()">ggnoincoun@gmail.com</a></li>
          <li><span>개인정보담당자 : </span>김지원  </li>
          <li class="copyright">COPYRIGHT(c) <b>GNOIN</b> ALL RIGHT RESERVED</li>
        </ul>
      </div>
    </footer>

    <script src="/mgnoincoun/assets/js/jquery.min.js"></script>
    <script src="/mgnoincoun/assets/js/bootstrap.min.js"></script>
    <!--<script src="assets/js/docs.min.js"></script>-->
    <script src="/mgnoincoun/assets/js/ie10-viewport-bug-workaround.js"></script>
    <script>
      $(document).ready(function(){ 
          // 로그인 회원가입 관리자 메뉴  
        $('.navbar-toggle').on('click', function() {
          $('.social-icons').fadeToggle(200);
        });
      });
		</script>
  </body>
</html>