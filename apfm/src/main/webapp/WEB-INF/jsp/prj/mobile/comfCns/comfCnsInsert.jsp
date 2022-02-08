<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="file:///C|/Users/asdf/Documents/favicon.ico">
    <title>맘편한 상담</title>
    <!-- Bootstrap core CSS -->
    <link href="/mgnoincoun/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="/mgnoincoun/assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="/mgnoincoun/css/jquery-ui.css" rel="stylesheet">
    <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/mgnoincoun/assets/js/ie-emulation-modes-warning.js"></script>
    <script src="/mgnoincoun/js/jquery-ui.min.js" ></script>
    <script src="/mgnoincoun/js/jquery-1.11.2.min.js" ></script>
<!--     <link rel="stylesheet" href="/mgnoincoun/css/style.css"> -->
    <!-- <script src="/mgnoincoun/js/common.js" ></script> -->
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5shiv.min.js"></script>
      <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <!-- Custom styles for this template -->
    <link href="/mgnoincoun/assets/css/theme.css" rel="stylesheet">
  </head>
  <script>
  
  	$(document).ready(function() {
		var msg = "${msg}";
		if(msg.length > 0) {
			alert(msg);
			document.location = "/mgnoincoun/login.do";
		}
		
		$('input:radio[name=gender]:input[value="${map.gender}"]').attr("checked", true);
	});
  	
  	function fn_reg() {
		if(confirm("등록 하시겠습니까?")){
			/* var phone1 = $("#phone1").val();
			var phone2 = $("#phone2").val();
			var phone3 = $("#phone3").val();
			var phone =  phone1+phone2+phone3;
			$("#phone").val(phone); */
			document.frm.action = "/mgnoincoun/comfCnsReg.do";
	       	document.frm.submit();
	       	alert("등록이 완료됐습니다.");
		}		
	}
  	
  </script>
<!--   <style>
  	.input-datepicker1{width:79px !important;border-right:none !important;}
  </style> -->
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
                <li class="active"><a href="/mgnoincoun/comfCnsInsert.do">맘편한 상담<i class="fa fa-caret-right"></i></a></li>
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
        <h1 class="title"><i class="fa fa-comments-o"></i>맘편한 상담</h1>
        <ol class="breadcrumb">
          <li><a href="/mgnoincoun/mobileMainList.do">Home</a></li>
          <li><a href="#">센터소개</a></li>
          <li class="active">맘편한 상담</li>
        </ol>
      </div>
      <div class="content">
        <div class="quick-tel pt5 pb5 line bt bb mb10">
          <button type="button" class="btn btn-default item01" onclick="document.location.href='tel:1833-2255'"><i class="fa fa-phone"></i>전화상담</button>
          <button type="button" class="btn btn-default item02" onclick="document.location.href='tel:1833-2255'"><i class="fa fa-phone"></i>내방상담</button>
          <button type="button" class="btn btn-default item03">온라인상담</button>
        </div>
        <div class="panel panel-style01">
          <div class="panel-heading">
            쉿!<br />
            상담은 모두 비밀입니다.<br />
            <p class="text">아래 사항은 귀하의 상담을 원활하게 지원하고자 최소한의 정보만 수집합니다.<br />마음 편히 이용하세요.</p>
          </div>
        </div>
        <!-- <h2 class="title">상담신청</h2>
        <form class="form-wrap">
          <div class="form-group">
            <label class="control-label" for="">성명<i class="cr">*</i></label>
            <input type="text" class="form-control" id="">
          </div>
          <div class="form-group line bb pb10">
            <label class="control-label" for="">성별<i class="cr">*</i></label>
            <div class="fr">
              <span class="radio-custom"><input type="radio" name="" id="" value="" checked="checked"><label for=""><i></i><span>남</span></label></span>
              <span class="radio-custom"><input type="radio" name="" id="" value="" ><label for=""><i></i><span>여</span></label></span>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label" for="">출생년도<i class="cr">*</i></label>
            <div class="input-group">
              <input type="text" id="" class="form-control" value="2020-05-22">
              <span class="input-group-btn">
                <button class="btn btn-default ico"><i class="fa fa-calendar"></i></button>
              </span>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label" for="">연락처<i class="cr">*</i></label>
            <input type="text" class="form-control" id="">
          </div>
          <div class="form-group">
            <label class="control-label" for="">지역<i class="cr">*</i></label>
            <input type="text" class="form-control" id="">
          </div>
          <div class="form-group line bb pb10">
            <label class="control-label" for="">주호소<i class="cr">*</i></label>
            <div class="block">
              <span class="radio-custom block mb5"><input type="radio" name="" id="" value="" checked="checked"><label for=""><i></i><span>심리정서</span></label></span>
              <span class="radio-custom block mb5"><input type="radio" name="" id="" value="" ><label for=""><i></i><span>대인관계</span></label></span>
              <span class="radio-custom block mb5"><input type="radio" name="" id="" value="" ><label for=""><i></i><span>치매</span></label></span>
              <span class="radio-custom block mb5"><input type="radio" name="" id="" value="" ><label for=""><i></i><span>중독</span></label></span>
              <span class="radio-custom block mb5"><input type="radio" name="" id="" value="" ><label for=""><i></i><span>정신건강장애</span></label></span>
              <span class="radio-custom block mb5"><input type="radio" name="" id="" value="" ><label for=""><i></i><span>건강</span></label></span>
              <span class="radio-custom block mb5"><input type="radio" name="" id="" value="" ><label for=""><i></i><span>경제</span></label></span>
              <span class="radio-custom block mb5"><input type="radio" name="" id="" value="" ><label for=""><i></i><span>생활</span></label></span>
              <span class="radio-custom block mb5"><input type="radio" name="" id="" value="" ><label for=""><i></i><span>성</span></label></span>
              <span class="radio-custom block mb5"><input type="radio" name="" id="" value="" ><label for=""><i></i><span>부부</span></label></span>
              <span class="radio-custom block mb5"><input type="radio" name="" id="" value="" ><label for=""><i></i><span>가족</span></label></span>
              <span class="radio-custom block mb5"><input type="radio" name="" id="" value="" ><label for=""><i></i><span>역할상실</span></label></span>
              <span class="radio-custom block mb5"><input type="radio" name="" id="" value="" ><label for=""><i></i><span>생애진로</span></label></span>
              <span class="radio-custom block mb5"><input type="radio" name="" id="" value="" ><label for=""><i></i><span>기타</span></label></span>
            </div>
          </div>
        </form>.form-wrap /
        <div class="text-center mt30 mb50">
          상담을 진행하기 위해<br />개인정보제공에 동의함
          <span class="radio-custom ml5"><input type="radio" name="" id="" value="" ><label for=""><i></i><span class="sr-only">개인정보제공에 동의</span></label></span>
        </div>
        이전버전 내용 
        <div class="form-wrap">
          <div class="form-group line bb pb10">
            <label class="control-label" for="">성별<i class="cr">*</i></label>
            <div class="fr">
              <span class="radio-custom"><input type="radio" name="" id="" value="" checked="checked"><label for=""><i></i><span>남</span></label></span>
              <span class="radio-custom"><input type="radio" name="" id="" value="" ><label for=""><i></i><span>여</span></label></span>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label" for="">제목</label>
            <input type="text" class="form-control" id="">
          </div>
          <div class="form-group">
            <label class="control-label" for="">비밀번호</label>
            <input type="text" class="form-control" id="">
          </div>
          <div class="form-group">
            <label class="control-label" for="">문의내용</label>
            <textarea rows="5" class="form-control" id=""  ></textarea>
          </div>
          <div class="form-group">
            <label class="control-label" for="">작성일자</label>
            <div class="input-group">
              <input type="text" id="" class="form-control" value="2020-05-22">
              <span class="input-group-btn">
                <button class="btn btn-default ico"><i class="fa fa-calendar"></i></button>
              </span>
            </div>
          </div>
        </div> -->
        <h2 class="title">상담신청</h2>
          <div class="table-wrap write row">
        	<form class="form-wrap" name="frm" method="post" enctype="multipart/form-data">
        	<!-- <input type="hidden" id="phone" name="phone" /> -->
        	<input type="hidden" id="zoneGb" name="zoneGb" value="${map.zoneGb }" />
        	<input type="hidden" id="localGb" name="localGb" value="9" />
        	<input type="hidden" id="sigunCd" name="sigunCd" value="${map.sigunCd }" />
        	<input type="hidden" id="centerGb" name="centerGb" value="${map.centerGb }" />
            <table  class="table table-condensed line bb">
              <col width="70px" />
              <col />
              <tbody>
                <tr>
                  <th scope="row">상담신청<br />구분</th>
                  <td>
                    <div class="select">
                      	<select class="form-control" id="cnsReqGb" name="cnsReqGb">
							<c:forEach items="${cnsReqCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th scope="row">상담구분</th>
                  <td>
                    <div class="select">
                      	<select class="form-control" id="cnsGb" name="cnsGb">
							<c:forEach items="${cnsGbCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select>
                    </div>
                  </td>
                </tr>
                <%-- <tr>
                  <th scope="row">상담경위</th>
                  <td>
                    <div class="select">
			            <select class="form-control" id="cnsDtl" name="cnsDtl">
							<c:forEach items="${cnsDtlCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select>
                    </div>
                  </td>
                </tr>                
                <tr>
                  <th scope="row">노인과의 관계</th>
                  <td>
                    <div class="select">
		                <select class="form-control" id="olderRel" name="olderRel">
							<c:forEach items="${olderRelCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th scope="row">결혼상태</th>
                  <td>
                    <div class="select">
						<select class="form-control" id="merrStat" name="merrStat">
							<c:forEach items="${merrStatCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th scope="row">동거형태</th>
                  <td>
                    <div class="select">
						<select class="form-control" id="liveForm" name="liveForm">
							<c:forEach items="${liveCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select>
                    </div>
                  </td>
                </tr>    
                <tr>
                  <th scope="row">지역구분</th>
                  <td>
                    <div class="select">
						<select class="form-control" id="localGb" name="localGb">
							<c:forEach items="${localGbCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select>
                    </div>
                  </td>
                </tr>             
                <tr>
                  <th scope="row">주택형태</th>
                  <td>
                    <div class="select">
						<select class="form-control" id="houseForm" name="houseForm">
							<c:forEach items="${houseCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th scope="row">주거형태</th>
                  <td>
                    <div class="select">
						<select class="form-control" id="livgForm" name="livgForm">
							<c:forEach items="${livgCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select> 
                    </div>
                  </td>
                </tr>  
                <tr>
                  <th scope="row">주요문제</th>
                  <td>
                    <div class="select">
						<select class="form-control" id="majorProb" name="majorProb">
							<c:forEach items="${majorProbCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select>  
                    </div>
                  </td>
                </tr> --%>
                <tr>
                  <th scope="row">주호소 문제</th>
                  <td>
                    <div class="select">
						<select class="form-control" id="majorApplCd" name="majorApplCd">
							<c:forEach items="${majorApplCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select>  
                    </div>
                  </td>
                </tr>
                <%-- <tr>
                  <th scope="row">종교</th>
                  <td>
                    <div class="select">
						<select class="form-control" id="relg" name="relg">
		                  <option value="1">무교</option>
		                  <option value="2">기독교</option>
		                  <option value="3">천주교</option>
		                  <option value="4">불교</option>
		                  <option value="5">원불교</option>
		                  <option value="6">기타</option>
		                </select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th scope="row">학력</th>
                  <td>
                    <div class="select">
		                <select class="form-control" id="edu" name="edu">
							<c:forEach items="${eduCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select>
                    </div>
                  </td>
                </tr>                                               
                <tr>
                  <th scope="row">권역</th>
                  <td>
                    <div class="select">
                      	<select class="form-control" id="zoneGb" name="zoneGb">
							<c:forEach items="${zoneGbCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th scope="row">센터</th>
                  <td>
                    <div class="select">
                      	<select class="form-control" id="centerGb" name="centerGb">
							<c:forEach items="${centerGbCode }" var="code">
								<option value="${code.odr }">${code.mclassNm }</option>
							</c:forEach>
						</select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th scope="row">상담일<i class="cr">*</i></th>
                  <td>
                    <div class="input-group">
                        <input type="text" id="datepicker1" name="cnsDt" class="form-control" value="2020-05-22">
                         <span class="input-group-btn">
                           <button class="btn btn-default ico"><i class="fa fa-calendar"></i></button>
                        </span>
                    </div>                   
                  </td>
                </tr>
                <tr>
                  <th scope="row">시간<i class="cr">*</i></th>
                  <td>
                  	<input type="text" id="cnsDtStdHour" name="cnsDtStdHour" class="form-control" maxlength="2" style="width: 42px;float: left;" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('tel').val(this.value);"><span style="float: left; line-height: 33px;">시</span>
		            <input type="text" id="cnsDtStdMin" name="cnsDtStdMin" class="form-control" maxlength="2" style="width: 42px; float: left;" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('tel').val(this.value);"><span style="float: left; line-height: 33px;">분</span>
		            <span style="float: left; line-height: 33px;">&nbsp;&nbsp;~&nbsp;&nbsp;</span>
		            <input type="text" id="cnsDtEndHour" name="cnsDtEndHour" class="form-control" maxlength="2" style="width: 42px; float: left;" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('tel').val(this.value);"><span style="float: left; line-height: 33px;">시</span>
		            <input type="text" id="cnsDtEndMin" name="cnsDtEndMin" class="form-control" maxlength="2" style="width: 42px; float: left;" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('tel').val(this.value);"><span style="float: left; line-height: 33px;">분 &nbsp;&nbsp;(</span>
		            <input type="text" id="cnsDtTotMin" name="cnsDtTotMin" class="form-control" maxlength="2" style="width: 42px; float: left;" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('tel').val(this.value);"><span style="float: left; line-height: 33px;">분)</span>
                  </td>
                </tr> --%>                                    
                <tr>
                  <th scope="row">이름<i class="cr">*</i></th>
                  <td><input type="text" class="form-control" id="userNm" name="userNm" maxlength="6" readonly value="${map.userNm }"></td>
                </tr>
                <tr>
                  <th scope="row">성별<i class="cr">*</i></th>
                  <td>
                    <span class="radio-custom"><input type="radio" name="gender" id="gender1" value="M" checked="checked"><label for="gender1"><i></i><span>남</span></label></span>
                    <span class="radio-custom"><input type="radio" name="gender" id="gender2" value="F" ><label for="gender2"><i></i><span>여</span></label></span>
                  </td>
                </tr>
                <tr>
                  <th scope="row">생년월일<i class="cr">*</i></th>
                  <td>
                    <div>
                        <input type="text" id="birth" name="birth" class="form-control" maxlength="8" placeholder="ex)20201025" value="${map.birthDt }" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('tel').val(this.value);" readonly>
                        <!-- <span class="input-group-btn">
                          <button class="btn btn-default ico" id="datepicker1"><i class="fa fa-calendar"></i></button>
                        </span> -->
                    </div>
                  </td>
                </tr>
                <tr>
                  <th scope="row">이메일</th>
                  <td><input type="text" class="form-control" id="email" name="email" maxlength="30" placeholder="" value="${map.email }" readonly></td>
                </tr>
                <!-- <tr>
                  <th scope="row">전화번호</th>
                  <td><input type="text" class="form-control" id="tel" name="" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('tel').val(this.value);"></td>
                </tr>
                <tr>
                  <th scope="row" class="vt">핸드폰<i class="cr">*</i></th>
                  <td>
                    <div class="row">
                      <div class="col-xs-4 pr0">
                        <div class="input-group">
                          <input type="text" class="form-control" id="phone1" name="phone1" maxlength="3" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('phone1').val(this.value);">
                          <span class="input-group-addon">-</span>
                        </div>
                      </div>
                      <div class="col-xs-4 pr0 pl0">
                        <div class="input-group">
                          <input type="text" class="form-control" id="phone2" name="phone2" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('phone2').val(this.value);">
                          <span class="input-group-addon">-</span>
                        </div>
                      </div>
                      <div class="col-xs-4 pl0"><input type="text" class="form-control" id="phone3" name="phone3" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, ''); $('phone3').val(this.value);"></div>
                    </div>
                  </td>
                </tr> -->
                <tr>
                  <th scope="row" class="vt">전화번호<i class="cr">*</i></th>
                  <td><input type="text" class="form-control" id="phone" name="phone" value="${map.mobile }" readonly /></td>
                </tr>
                <tr>
                  <th scope="row" class="vt">주소<i class="cr">*</i></th>
                  <td>
                    <!-- <div class="input-group">
                        <input name="" id="" type="text" class="form-control" placeholder="0000-0000">
                        <span class="input-group-btn"><button type="button" class="btn btn-primary ">우편번호</button></span>
                    </div> -->
                   <input name="address" id="address" type="text" maxlength="50" class="form-control" value="${map.addr }" readonly />
                  </td>
                </tr>
                <!-- <tr>
                  <td><input type="text" class="form-control" id="" placeholder=""></td>
                </tr>
                <tr>
                  <td><input type="text" class="form-control" id="" placeholder=""></td>
                </tr> -->
                <tr>
                  <th scope="row" class="vt">상담이력</th>
                  <td>
                    <span class="radio-custom"><input type="radio" name="cnsHistYn" id="cnsHistYn1" value="Y" checked="checked"><label for="cnsHistYn1"><i></i><span>유</span></label></span>
                    <span class="radio-custom"><input type="radio" name="cnsHistYn" id="cnsHistYn2" value="N" ><label for="cnsHistYn2"><i></i><span>무</span></label></span>
                  </td>
                </tr>
                <!-- <tr>
                  <td colspan="2">
                    <div class="form-group">
                      <label class="control-label" for="">주상담 희망내용</label>
                      <textarea rows="5" class="form-control" id=""></textarea>
                    </div>
                  </td>
                </tr> -->
                <!-- <tr>
                  <th scope="row" class="vt">주상담<br />희망내용</th>
                  <td>
                      <textarea rows="5" class="form-control" id="cnsCntn" name="cnsCntn"></textarea>
                  </td>
                </tr>
                <tr>
                  <th scope="row" class="vt">심리검사</th>
                  <td>
                      <textarea rows="5" class="form-control" id="psyExam" name="psyExam" ></textarea>
                  </td>
                </tr> -->              
                <!-- <tr>
                  <td colspan="2">
                    파일첨부 /
                    <div class="form-group">
                      <label class="control-label" for="">첨부파일</label>
                      <div class="filebox"> <input class="upload-name" value="파일선택" disabled="disabled"><label for="ex_filename">파일</label> <input type="file" id="ex_filename" class="upload-hidden"></div>
                      <div class="filebox"> <input class="upload-name" value="파일선택" disabled="disabled"><label for="ex_filename2">파일</label> <input type="file" id="ex_filename2" class="upload-hidden"></div>
                      <div class="filebox"> <input class="upload-name" value="파일선택" disabled="disabled"><label for="ex_filename3">파일</label> <input type="file" id="ex_filename3" class="upload-hidden"></div>
                      <div class="btn-group mt5 fr">
                        <button class="btn btn-xs btn-default" type="button"><i class="fa fa-plus"></i><span class="blind">추가</span></button>
                        <button class="btn btn-xs btn-default" type="button"><i class="fa fa-minus"></i><span class="blind">삭제</span></button>
                      </div>
                    </div> 
                    파일첨부 /
                  </td>
                </tr>
                <tr>
                  <th scope="row" class="vt">파일첨부</th>
                  <td>
                    <div class="filebox"> <input class="upload-name" value="파일선택" disabled="disabled"><label for="ex_filename">파일</label> <input type="file" id="ex_filename" name="file" class="upload-hidden"></div>
                    <div class="filebox"> <input class="upload-name" value="파일선택" disabled="disabled"><label for="ex_filename2">파일</label> <input type="file" id="ex_filename2" class="upload-hidden"></div>
                    <div class="filebox"> <input class="upload-name" value="파일선택" disabled="disabled"><label for="ex_filename3">파일</label> <input type="file" id="ex_filename3" class="upload-hidden"></div>
                    <div class="btn-group mt5 fr">
                      <button class="btn btn-xs btn-default" type="button"><i class="fa fa-plus"></i><span class="blind">추가</span></button>
                      <button class="btn btn-xs btn-default" type="button"><i class="fa fa-minus"></i><span class="blind">삭제</span></button>
                    </div>
                  </td>
                </tr> -->
              </tbody>
            </table>
            </form> <!-- 상담신청하기 form -->
          </div>

          <div class="btn-wrap line pb20">
            <button type="button" class="btn btn-primary btn-lg w100p" onClick="javascript:fn_reg();">신청하기</button>
          </div>
        <!-- </form> --><!-- .form-wrap /-->
        <div class="btn-wrap line bt bb pt10 pb10">
          <button type="button" class="btn btn-default" onclick="location.href='/mgnoincoun/'">홈</button>
          <!-- <button type="button" class="fr btn btn-normal" onclick="location.href=/mgnoincounaddComfCnsInsert.do'">추가자료입력</button> -->
        </div>
      </div><!-- .content /-->
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
        
        // 첨부파일 
        var fileTarget = $('.filebox .upload-hidden'); 
        fileTarget.on('change', function(){  // 값이 변경되면 
          if(window.FileReader){ // modern browser 
            var filename = $(this)[0].files[0].name; 
          } 
          else {  // old IE 
              var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출 
          } 
          // 추출한 파일명 삽입 
          $(this).siblings('.upload-name').val(filename); 
          }); 
        
        
        });
		</script>
  </body>
</html>