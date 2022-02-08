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
    <title>사별스트레스척도</title>
    <!-- Bootstrap core CSS -->
    <link href="/mgnoincoun/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="/mgnoincoun/assets/css/font-awesome.min.css" rel="stylesheet">
    <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/mgnoincoun/assets/js/ie-emulation-modes-warning.js"></script>
    <script src="/mgnoincoun/js/jquery-1.11.2.min.js" ></script>
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
			
		  $('input:radio[name=gender]:input[value="${map.gender}"]').attr("checked", true);
		  $("#cnsleNm").val("${map.userNm}");
		  $("#telNo").val("${map.mobile}");
		  
		  let today = new Date();
		  var year = today.getFullYear(); // 년도
		  var month = today.getMonth()+1;  // 월
		  var date = today.getDate();  // 날짜
		  var nowDate = year+"."+month+"."+date;
		  $("#writeDt").val(nowDate);
			
	  });
	  
/* 	  function fn_reg() {
		  if(confirm("등록 하시겠습니까?")){
		    var total = 0;
		    var no;
		    for(i=1; i<16; i++) {
		   	    no = $('input[name="no'+i+'"]:checked').val();
		   	    if(no  == "Y") {
		   		    total++;
		   	    }
		    }			 
		    $("#sumCnt").val(total);
			var param = $("#frm").serialize(); 
			$.ajax({
				type : "POST",
				url : "/psyBereavDocRegAjax.do",
				data : param,
				dataType : "json",
				success : function(json) {
					alert(json.message);
				},
				error : function(e) {
					alert("서버와 통신 오류입니다.");
				}
			});
		  }
		} */
	  
	  function fn_reg() {
			
		  var arr = [];
		  for(i=1; i<20; i++) {
			  arr[i] = $('input[name="no'+i+'"]:checked').val();
			  
			  if (arr[i] == undefined) {
				  alert(i+"번 내용을 입력해주세요");
				  return false;
			  }
		  }	
		  
		  var total = 0;
		  var sumCnt = $("#sumCnt").val();
		  if(sumCnt != "") {
			  if(confirm("자가진단을 다시 하시겠습니까?")){
				  location.href="/mgnoincoun/psyAnxiDoc.do";
				  return false;
			  }
			  return false;
		  }
		  if(confirm("자가진단 작성을 완료하셨습니까?")){
		    var no;
		    for(i=1; i<20; i++) {
		   	    no = $('input[name="no'+i+'"]:checked').val();
		   		total = total+parseInt(no);
		    }
			$("#sumCnt").val(total);
			alert(total);
			return false;
			var param = $("#frm").serialize(); 
			$.ajax({
				type : "POST",
				url : "/mgnoincoun/psyDukeDocRegAjax.do",
				data : param,
				dataType : "json",
				success : function(json) {
					alert("사별스트레스척도 심리검사 결과 점수는"+total+"점 입니다.");
				},
				error : function(e) {
					alert("서버와 통신 오류입니다.");
				}
			});
		  }
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
                <li class="active"><a href="/mgnoincoun/psyCnsList.do">간편한 심리검사<i class="fa fa-caret-right"></i></a></li>
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
        <h1 class="title" style="text-align: center;">사별 스트레스 척도</h1>
        <ol class="breadcrumb">
          <li><a href="/mgnoincoun/mobileMainList.do">Home</a></li>
          <!--<li><a href="#">센터소개</a></li>-->
          <li class="active">간편한 심리검사</li>
        </ol>
      </div>
      <div class="table-wrap">
      	<form id="frm" name="frm" method="post">
      	   <input type="hidden" id="cnsleId" name="cnsleId" value="${map.userId }" >
           <table class="table table-condensed">
                <caption>대인관계변화척도</caption>
                <colgroup>
                    <col width="50px"/>
	       			<col width="90px"/>
	       			<col width="60px"/>
	       			<col width="100px"/>
	       			<col width="60px"/>
	       			<col width="100px"/>
                </colgroup>
                <tbody>
                    <tr>
                      <th scope="col">이&nbsp;&nbsp;&nbsp;&nbsp;름</th>
                      <td>
                          <input type="text" id="cnsleNm" name="cnsleNm" style="width: 90px;" readonly="readonly">
                      </td>
                      <th scope="col">연락처</th>
                      <td>
                          <input type="text" id="telNo" name="telNo" style="width: 100px;" readonly="readonly" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                      </td>
                      <th scope="col">검사일</th>
                      <td>
                          <input type="text" id="writeDt" name="writeDt" style="width: 100px;" readonly="readonly">
                      </td>
                    </tr>
                </tbody>
            </table>
            <div class="txt mt15">
                ※ 다음은 어르신께서 배우자와 사별하고 혼자 살면서 경험할 수 있는 여러 가지 스트레스에 관한 질문입니다. 잘 읽고 해당되는 곳에 ‘√’표시 해 주시길 바랍니다.
            </div>
            <table class="table table-condensed">
                <caption>사별스트레스척도</caption>
                <colgroup>
                    <col style="width: 5%;" />
                    <col style="width: 50%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="2">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</th>
                        <th scope="col">전혀<br>그렇지<br>않다</th>
                        <th scope="col">그렇지<br>않다</th>
                        <th scope="col">보통<br>이다</th>
                        <th scope="col">그렇다</th>
                        <th scope="col" class="bRight-none">매우<br>그렇다</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="bBottom2">
                        <td class="bRight-none">1.</td>
                        <td class="txt-left">배우자가 없어서 외롭다고 느낄 때가 많다.</td>
                        <td><input type="radio" id="no11" name="no1" value="0" /></td>
                        <td><input type="radio" id="no12" name="no1" value="1" /></td>
                        <td><input type="radio" id="no13" name="no1" value="2" /></td>
                        <td><input type="radio" id="no14" name="no1" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no15" name="no1" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">2.</td>
                        <td class="txt-left">부부동반 모임에 가야할 때 어려움을 느낀다.</td>
                        <td><input type="radio" id="no21" name="no2" value="0" /></td>
                        <td><input type="radio" id="no22" name="no2" value="1" /></td>
                        <td><input type="radio" id="no23" name="no2" value="2" /></td>
                        <td><input type="radio" id="no24" name="no2" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no25" name="no2" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">3.</td>
                        <td class="txt-left">배우자와 사별하고 경제적으로 어려웠다.</td>
                        <td><input type="radio" id="no31" name="no3" value="0" /></td>
                        <td><input type="radio" id="no32" name="no3" value="1" /></td>
                        <td><input type="radio" id="no33" name="no3" value="2" /></td>
                        <td><input type="radio" id="no34" name="no3" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no35" name="no3" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">4.</td>
                        <td class="txt-left">중요한 결정을 할 때 상의할 대상이 없어서 힘들다.</td>
                        <td><input type="radio" id="no41" name="no4" value="0" /></td>
                        <td><input type="radio" id="no42" name="no4" value="1" /></td>
                        <td><input type="radio" id="no43" name="no4" value="2" /></td>
                        <td><input type="radio" id="no44" name="no4" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no45" name="no4" value="4" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">5.</td>
                        <td class="txt-left">혼자 있어서 자주 쓸쓸한 마음이 든다.</td>
                        <td><input type="radio" id="no51" name="no5" value="0" /></td>
                        <td><input type="radio" id="no52" name="no5" value="1" /></td>
                        <td><input type="radio" id="no53" name="no5" value="2" /></td>
                        <td><input type="radio" id="no54" name="no5" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no55" name="no5" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">6.</td>
                        <td class="txt-left">혼자라고 무시하는 눈초리가 느껴진다.</td>
                        <td><input type="radio" id="no61" name="no6" value="0" /></td>
                        <td><input type="radio" id="no62" name="no6" value="1" /></td>
                        <td><input type="radio" id="no63" name="no6" value="2" /></td>
                        <td><input type="radio" id="no64" name="no6" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no65" name="no6" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">7.</td>
                        <td class="txt-left">생계가 막막하다.</td>
                        <td><input type="radio" id="no71" name="no7" value="0" /></td>
                        <td><input type="radio" id="no72" name="no7" value="1" /></td>
                        <td><input type="radio" id="no73" name="no7" value="2" /></td>
                        <td><input type="radio" id="no74" name="no7" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no75" name="no7" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">8.</td>
                        <td class="txt-left">배우자가 없어서 자녀들과 소통이 안될 때 힘들다.</td>
                        <td><input type="radio" id="no81" name="no8" value="0" /></td>
                        <td><input type="radio" id="no82" name="no8" value="1" /></td>
                        <td><input type="radio" id="no83" name="no8" value="2" /></td>
                        <td><input type="radio" id="no84" name="no8" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no85" name="no8" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">9.</td>
                        <td class="txt-left">혼자 있을 때 배우자 생각이 나서 허무할 때가 있다.</td>
                        <td><input type="radio" id="no91" name="no9" value="0" /></td>
                        <td><input type="radio" id="no92" name="no9" value="1" /></td>
                        <td><input type="radio" id="no93" name="no9" value="2" /></td>
                        <td><input type="radio" id="no94" name="no9" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no95" name="no9" value="4" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">10.</td>
                        <td class="txt-left">주위사람들의 시선이 신경 쓰여 불편하다.</td>
                        <td><input type="radio" id="no101" name="no10" value="0" /></td>
                        <td><input type="radio" id="no102" name="no10" value="1" /></td>
                        <td><input type="radio" id="no103" name="no10" value="2" /></td>
                        <td><input type="radio" id="no104" name="no10" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no105" name="no10" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">11.</td>
                        <td class="txt-left">자녀들에게 경제적으로 부담을 주고 있다.</td>
                        <td><input type="radio" id="no111" name="no11" value="0" /></td>
                        <td><input type="radio" id="no112" name="no11" value="1" /></td>
                        <td><input type="radio" id="no113" name="no11" value="2" /></td>
                        <td><input type="radio" id="no114" name="no11" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no115" name="no11" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">12.</td>
                        <td class="txt-left">집안일을 배우자 몫까지 내가 해야만 하는 것이 힘들다.</td>
                        <td><input type="radio" id="no121" name="no12" value="0" /></td>
                        <td><input type="radio" id="no122" name="no12" value="1" /></td>
                        <td><input type="radio" id="no123" name="no12" value="2" /></td>
                        <td><input type="radio" id="no124" name="no12" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no125" name="no12" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">13.</td>
                        <td class="txt-left">사랑을 주고받으며 살고 싶은 마음이 간절하다.</td>
                        <td><input type="radio" id="no131" name="no13" value="0" /></td>
                        <td><input type="radio" id="no132" name="no13" value="1" /></td>
                        <td><input type="radio" id="no133" name="no13" value="2" /></td>
                        <td><input type="radio" id="no134" name="no13" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no135" name="no13" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">14.</td>
                        <td class="txt-left">배우자가 없어서 사람들을 만나는 것이 꺼려진다.</td>
                        <td><input type="radio" id="no141" name="no14" value="0" /></td>
                        <td><input type="radio" id="no142" name="no14" value="1" /></td>
                        <td><input type="radio" id="no143" name="no14" value="2" /></td>
                        <td><input type="radio" id="no144" name="no14" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no145" name="no14" value="4" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">15.</td>
                        <td class="txt-left">앞으로 살아가는데 경제적으로 더 어려울 것이다.</td>
                        <td><input type="radio" id="no151" name="no15" value="0" /></td>
                        <td><input type="radio" id="no152" name="no15" value="1" /></td>
                        <td><input type="radio" id="no153" name="no15" value="2" /></td>
                        <td><input type="radio" id="no154" name="no15" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no155" name="no15" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">16.</td>
                        <td class="txt-left">생활고 때문에 싫어도 돈을 벌어야 하는 것이 힘들다.</td>
                        <td><input type="radio" id="no161" name="no16" value="0" /></td>
                        <td><input type="radio" id="no162" name="no16" value="1" /></td>
                        <td><input type="radio" id="no163" name="no16" value="2" /></td>
                        <td><input type="radio" id="no164" name="no16" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no165" name="no16" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">17.</td>
                        <td class="txt-left">혼자서 잠자리에 누웠을 때 배우자가 그립다.</td>
                        <td><input type="radio" id="no171" name="no17" value="0" /></td>
                        <td><input type="radio" id="no172" name="no17" value="1" /></td>
                        <td><input type="radio" id="no173" name="no17" value="2" /></td>
                        <td><input type="radio" id="no174" name="no17" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no175" name="no17" value="4" /></td>
                    </tr>
                    <tr class="bBottom2">
                        <td class="bRight-none">18.</td>
                        <td class="txt-left">주위의 유혹이 있을 때 힘이 든다.</td>
                        <td><input type="radio" id="no181" name="no18" value="0" /></td>
                        <td><input type="radio" id="no182" name="no18" value="1" /></td>
                        <td><input type="radio" id="no183" name="no18" value="2" /></td>
                        <td><input type="radio" id="no184" name="no18" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no185" name="no18" value="4" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">19.</td>
                        <td class="txt-left">집안의 큰 행사가 있을 때 배우자의 빈자리가 느껴진다.</td>
                        <td><input type="radio" id="no191" name="no19" value="0" /></td>
                        <td><input type="radio" id="no192" name="no19" value="1" /></td>
                        <td><input type="radio" id="no193" name="no19" value="2" /></td>
                        <td><input type="radio" id="no194" name="no19" value="3" /></td>
                        <td class="bRight-none"><input type="radio" id="no195" name="no19" value="4" /></td>
                    </tr>
                </tbody>
            </table>
          </form>
       <div class="btn-wrap line pb20">
         <button type="button" class="btn btn-primary btn-lg w100p" onClick="javascript:fn_reg();">자가진단하기</button>
         <button type="button" class="btn btn-primary btn-lg w100p" id="save" onclick="location.href='/mgnoincoun/psyCnsList.do'" style="color: #fff; background-color: #78849E; border-color: #78849E;">목록</button>
       </div>
       </div>
      <div style="height: 50px;">
           <div class="total fr mt15">
               <div style="float: left; line-height: 30px; margin-right: 10px;">
                   총 점
               </div>
               <div style="float: left;">
                   <input type="text" class="inp num2" id="sumCnt" name="sumCnt" readonly="readonly" style="border:1px solid black; margin-top: 5px; width: 60px;">
          	 	</div>
           </div>
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