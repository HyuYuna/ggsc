<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header --> 
	<div class="header"> 
		<div class="top_logo">
			<ul>
				<li class="fl_L"><a href="/usrMngList.do" target="_self"><img src="<c:url value='/adm/img/logo.jpg'/>" alt="고령자미래설계지원센터"></a></li>
				<li class="fl_R"> <a href="/admLoginOut.do" class="btn_logout">로그아웃</a></li>
			</ul>
		</div>
		<nav>
			<ul class="cont clearfix">
				<li class="dropdown">
					<a href="/usrMngList.do">회원관리</a>
					<ul class="sub-menu">
						<li><a href="/usrMngList.do">회원정보</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="/admNotList.do">소통마당</a>
					<ul class="sub-menu">
						<li><a href="/admNotList.do">공지사항관리</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="/admCdList.do">등록 &middot; 관리</a>
					<ul class="sub-menu">
						<li class="active">
							<a href="/admCdList.do">지시서관리</a>
						</li>
						<li>
							<a href="/admTrstList.do">신탁계약서관리</a>
						</li>
						<li>
							<a href="/admCdFileList.do">요양지지서첨부파일</a>
						</li>
						<li>
							<a href="/admTrstFileList.do">신탁계약서첨부파일</a>
						</li>
					</ul>
				</li>
				
			</ul>
		</nav>
	</div> 
<!-- //header --> 