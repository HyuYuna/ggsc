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
    <title>마이 페이지</title>
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
		  //$("#sumCnt").val(3);
		  
		  
	  });
	  
	  /* function fn_reg() {
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
				url : "/mgnoincoun/psyGdsDocRegAjax.do",
				data : param,
				dataType : "json",
				success : function(json) {
					alert("심리검사 결과 점수는"+json.sumCnt+"점 입니다.");
				},
				error : function(e) {
					alert("서버와 통신 오류입니다.");
				}
			});
		  }
		} */
	  
	  function fn_reg() {
		  var total = 0; // 단축형노인우울척도(S-GDS) 총점
		  var total2 = 0; // 자살사고 총점
		  var sumCnt = $("#sumCnt").val();
		  if(sumCnt != "") {
			  if(confirm("자가진단을 다시 하시겠습니까?")){
				  location.href="/mgnoincoun/psyGdsDoc.do";
				  return false;
			  }
			  return false;
		  }
		  if(confirm("자가진단 작성을 완료하셨습니까?")){
		    var no;
		    var no2;
		    for(i=1; i<16; i++) {
		   	    no = $('input[name="no'+i+'"]:checked').val();
		   	    if(no=="N") {
		   	    	total = total+1;
		   	    }
		   		// total = total+parseInt(no);
		    }
		    
		    for(i=16; i<20; i++) {
		   	    no2 = $('input[name="no'+i+'"]:checked').val();
		   	    total2 = total2+parseInt(no2);
		   	    
		    }
		    
		    $("#sumCnt").val(total);
		    $("#sumCnt2").val(total2);
			var param = $("#frm").serialize(); 
			$.ajax({
				type : "POST",
				url : "/mgnoincoun/psyDukeDocRegAjax.do",
				data : param,
				dataType : "json",
				success : function(json) {
					alert("GDS-SI 심리검사 결과 점수는"+total+"점 입니다.");
					alert("자살사고 심리검사 결과 점수는"+total2+"점 입니다.");
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
                <li><a href="/mgnoincoun/freeBbsList.do">알려드려요 &amp; 자유게시판<i class="fa fa-caret-right"></i></a></li>
                <li><a href="/mgnoincoun/careLibraryList.do">마음돌봄 자료실<i class="fa fa-caret-right"></i></a></li>
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
        <h1 class="title" style="text-align: center;">노인 우울 및 자살사고 척도(GDS-SI)</h1>
        <ol class="breadcrumb">
          <li><a href="/mgnoincoun/mobileMainList.do">Home</a></li>
          <!--<li><a href="#">센터소개</a></li>-->
          <li class="active">마이 페이지</li>
        </ol>
      </div>
      <div class="table-wrap">
	      <form id="frm" name="frm" method="post">
	      <input type="hidden" id="cnsleId" name="cnsleId" value="${map.userId }" >
            <table class="table table-condensed">
                <caption>노인우울및자살사고척도</caption>
                <colgroup>
                    <col width="30px"/>
          			<col width="70px"/>
          			<col width="30px"/>
          			<col width="70px"/>
          			<col width="30px"/>
          			<col width="30px"/>
          			<col width="40px"/>
          			<col width="80px"/>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col">이름</th>
                        <td>
                            <input type="text" id="cnsleNm" name="cnsleNm" style="width: 70px;" readonly="readonly">
                        </td>
                        <th scope="col">성별</th>
                        <td>
                            <label for="gender1" style="margin-right: 10px;">남</label><input type="radio" id="gender1" name="gender" value="M" style="margin-bottom: 5px;"/> /
                            <label for="gender2" style="margin-right: 10px;">여</label><input type="radio" id="gender2" name="gender" value="F" style="margin-bottom: 5px;"/>
                        </td>
                        <th scope="col">나이</th>
                        <td>
                            <input type="text" id="age" name="age" style="width: 30px;" oninput="this.value = this.value.replace(/[^0-9]/g, '');" readonly="readonly" value="${map.age }">
                        </td>
                        <th scope="col">연락처</th>
                        <td>
                            <input type="text" id="telNo" name="telNo" style="width: 100px;" readonly="readonly" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="tbl-title mt20">
                ◉ 단축형노인우울척도(S-GDS)
            </div>
            <div class="table-wrap">
	            <table class="table table-condensed">
	                <caption>노인상담선별척도지</caption>
	                <colgroup>
	                    <col style="width: 5%;" />
	                    <col style="width: 60%;" />
	                    <col style="width: 10%;" />
	                    <col style="width: 10%;" />
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th scope="col"></th>
	                        <th scope="col">지난 한 주 동안의 느낌</th>
	                        <th scope="col">예</th>
	                        <th scope="col">아니요</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                        <td>1</td>
	                        <td class="txt-left">현재의 생활에 대체적으로 만족하십니까?</td>
	                        <td><input type="radio" id="no11" name="no1" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no12" name="no1" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td>2</td>
	                        <td class="txt-left">요즈음 들어 활동량이나 의욕이 많이 떨어지셨습니까?</td>
	                        <td><input type="radio" id="no21" name="no2" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no22" name="no2" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td class="bgG">3</td>
	                        <td class="txt-left">자신이 헛되이 살고 있다고 느끼십니까?</td>
	                        <td><input type="radio" id="no31" name="no3" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no32" name="no3" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td>4</td>
	                        <td class="txt-left">생활이 지루하게 느껴질 때가 많습니까?</td>
	                        <td><input type="radio" id="no41" name="no4" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no42" name="no4" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td>5</td>
	                        <td class="txt-left">평소에 기분은 상쾌한 편이십니까?</td>
	                        <td><input type="radio" id="no51" name="no5" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no52" name="no5" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td class="bgG">6</td>
	                        <td class="txt-left">자신에게 불길한 일이 닥칠 것 같아 불안하십니까?</td>
	                        <td><input type="radio" id="no61" name="no6" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no62" name="no6" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td>7</td>
	                        <td class="txt-left">대체로 마음이 즐거운 편이십니까?</td>
	                        <td><input type="radio" id="no71" name="no7" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no72" name="no7" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td>8</td>
	                        <td class="txt-left">절망적이라는 느낌이 자주 드십니까?</td>
	                        <td><input type="radio" id="no81" name="no8" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no82" name="no8" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td>9</td>
	                        <td class="txt-left">바깥에 나가기가 싫고 집에만 있고 싶습니까?</td>
	                        <td><input type="radio" id="no91" name="no9" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no92" name="no9" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td>10</td>
	                        <td class="txt-left">비슷한 나이의 다른 노인들 보다 기억력이 더 나쁘다고 느끼십니까?</td>
	                        <td><input type="radio" id="no101" name="no10" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no102" name="no10" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td class="bgG">11</td>
	                        <td class="txt-left">현재 살아 있다는 것이 즐겁게 생각되십니까?</td>
	                        <td><input type="radio" id="no111" name="no11" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no112" name="no11" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td class="bgG">12</td>
	                        <td class="txt-left">지금의 내 자신이 아무 쓸모없는 사람이라고 느끼십니까?</td>
	                        <td><input type="radio" id="no121" name="no12" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no122" name="no12" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td>13</td>
	                        <td class="txt-left">기력이 좋은 편이십니까?</td>
	                        <td><input type="radio" id="no131" name="no13" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no132" name="no13" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td class="bgG">14</td>
	                        <td class="txt-left">지금 자신의 처지가 아무런 희망도 없다고 느끼십니까?</td>
	                        <td><input type="radio" id="no141" name="no14" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no142" name="no14" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td>15</td>
	                        <td class="txt-left">자신이 다른 사람들의 처지보다 더 못하다고 생각하십니까?</td>
	                        <td><input type="radio" id="no151" name="no15" value="Y" /></td>
	                        <td class="bRight-none"><input type="radio" id="no152" name="no15" value="N" /></td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">총점</td>
	                        <td colspan="2"><input type="text" id="sumCnt" name="sumCnt" maxlength="2" readonly="readonly" style="width: 50px; text-align: right; margin-bottom: 2px;"> / 15</td>
	                    </tr>
	                </tbody>
	            </table>
	          </div>
            <div class="tbl-title mt30">
                ◉ 자살사고
            </div>
            <div class="table-wrap">
	            <table class="table table-condensed">
	                <caption>노인상담선별척도지</caption>
	                <colgroup>
	                    <col style="width: 5%;" />
	                    <col style="width: 53%;" />
	                    <col style="width: 10%;" />
	                    <col style="width: 12%;" />
	                    <col style="width: 10%;" />
	                    <col style="width: 10%;" />
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th scope="col"></th>
	                        <th scope="col">질문사항</th>
	                        <th scope="col">전혀 없다</th>
	                        <th scope="col">한두번있다</th>
	                        <th scope="col">가끔있다</th>
	                        <th scope="col">자주 있다</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                        <td>1</td>
	                        <td class="txt-left">과거에 스스로 목숨을 끊으려고 시도한 적이 있다</td>
	                        <td><input type="radio" class="inp txt-center" id="no161" name="no16" value="0" /></td>
	                        <td><input type="radio" class="inp txt-center" id="no162" name="no16" value="1" /></td>
	                        <td><input type="radio" class="inp txt-center" id="no163" name="no16" value="2" /></td>
	                        <td><input type="radio" class="inp txt-center" id="no164" name="no16" value="3" /></td>
	                    </tr>
	                    <tr>
	                        <td>2</td>
	                        <td class="txt-left">최근에 스스로 목숨을 끊고 싶다는 생각을 해 본 적이 있다</td>
	                        <td><input type="radio" class="inp txt-center" id="no171" name="no17" value="0" /></td>
	                        <td><input type="radio" class="inp txt-center" id="no172" name="no17" value="1" /></td>
	                        <td><input type="radio" class="inp txt-center" id="no173" name="no17" value="2" /></td>
	                        <td><input type="radio" class="inp txt-center" id="no174" name="no17" value="3" /></td>
	                    </tr>
	                    <tr>
	                        <td>3</td>
	                        <td class="txt-left">누군가에게 죽고 싶다는 말을 해 본 적이 있다</td>
	                        <td><input type="radio" class="inp txt-center" id="no181" name="no18" value="0" /></td>
	                        <td><input type="radio" class="inp txt-center" id="no182" name="no18" value="1" /></td>
	                        <td><input type="radio" class="inp txt-center" id="no183" name="no18" value="2" /></td>
	                        <td><input type="radio" class="inp txt-center" id="no184" name="no18" value="3" /></td>
	                    </tr>
	                    <tr>
	                        <td>4</td>
	                        <td class="txt-left">최근 들어 스스로 목숨을 끊고 싶다는 생각이 들었다면 구체적인 방법까지 계획했다</td>
	                        <td colspan="4">
	                            예(<input type="radio" class="inp month txt-center" id="no191" name="no19" value="1" />)&nbsp;&nbsp;&nbsp;&nbsp;
	                            아니오(<input type="radio" class="inp month txt-center" id="no192" name="no19" value="0" />)
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
	        </div>
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
                   <input type="text" class="inp num2" id="sumCnt2" name="sumCnt2" readonly="readonly" style="border:1px solid black; margin-top: 5px;">
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