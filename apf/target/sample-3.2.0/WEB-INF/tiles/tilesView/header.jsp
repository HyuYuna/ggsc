<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="egovframework.user.main.service.LoginVO" %>
	<%-- <header id="header">      
        <div class="container">
            <div class="row">
                <div class="col-sm-12 overflow">
                
    <% if(session.getAttribute("loginInfo")==null){   %>

                  <div class="social-icons pull-right">
                        <ul class="nav nav-pills">
                            <!-- <li><a href="/loginProc.do" class="txtCB"><i class="fa fa-unlock-alt"></i> 로그인</a></li> -->
                            <li><a href="/regCd.do" class="txtCB"><i class="fa fa-unlock-alt"></i> 로그인</a></li>
                            <li><a href="/memberMove.do" class="txtCB"><i class="fa fa-user-plus"></i> 회원가입</a></li>
							<li><button type="button" onclick="window.open('/usrMng/admLogin.do')" class="btn btn-default mgmT7"><i class="fa fa-cog"></i> 관리자</button></li>
                        </ul>
                  </div> 
                
    <% }else{    
    	LoginVO loginVO = (LoginVO)session.getAttribute("loginInfo");
    	
    	%>
    			<div class="social-icons pull-right">
                        <ul class="nav nav-pills">
                            <li><a href="/loginOut.do" class="txtCB"><i class="fa fa-unlock-alt"></i><%=loginVO.getName()%>&nbsp;&nbsp;&nbsp;&nbsp; 로그아웃</a></li>
                            
                        </ul>
                  </div> 
    <%  } %>
                  </div>
                          
        </div>
        </div>
        <div class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <a class="navbar-brand" href="/egovMainList.do">
                        <h1><img src="images/logo.png" alt="logo"></h1>
                    </a>
                    
                </div>
                
                <!-- 동적 메늎 부분 Start -->
                
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown"><a href="aboutIntro.do">센터소개 <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="aboutIntro.do">센터소개</a></li>
                                <li><a href="aboutMap.do">오시는 길</a></li>
                            </ul>
                        </li>     
                        <li class="dropdown"><a href="busi01.do">사업소개 <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="busi01.do">법적미래설계</a></li>
                                <li><a href="busi02.do">사전의료요양지시서</a></li>
                                <li><a href="busi03.do">지속적대리권</a></li>
                                <li><a href="busi04.do">고령자신탁</a></li>
                            </ul>
                        </li>                    
                        <li class="dropdown"><a href="regView.do">등록안내 <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="regView.do">등록안내</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href="regCd.do">등록하기 <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="regCd.do">사전의료요양지시서</a></li>
                                <li><a href="regTrst.do">신탁계약서</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href="notList.do">소통마당 <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="notList.do">공지사항</a></li>
                                <li><a href="faqView.do">FAQ</a></li>
                            </ul>
                        </li>                         
                        <li class="dropdown"><a href="mypageInfo.do">마이페이지 <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="mypageInfo.do">회원정보</a></li>
                                <li><a href="myRptReg.do">보고서등록</a></li>
                                <li><a href="mypageReportMain.do">감독기록등록</a></li>
                            </ul>
                        </li>                    
                    </ul>
                </div>
                
                <!-- 동적 메늎 부분 End -->
                
                
							
						
                
				 <div class="search">
                    <form role="form">
                    <!--     <i class="fa fa-search"></i> -->
                        <div class="field-toggle">
                            <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                        </div>
                    </form>
                </div>
			</div>
        </div>
    </header> --%>
    <!--/#header-->
