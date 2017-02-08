<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header class="header">
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>                        
				</button>
				<a class="navbar-brand" href="/studymate">Logo</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav lottemartdream normal w400 navsize">
					<li class="active"><a href="${pageContext.request.contextPath}/siteInfo">사이트 소개</a></li>
						<li class="hidden-xs hidden-sm bar">|</li>
					<li><a href="${pageContext.request.contextPath}/noticeList/1">공지사항</a></li>
						<li class="hidden-xs hidden-sm bar">|</li>
					<li><a href="${pageContext.request.contextPath}/roomList/1">지점소개</a></li>
						<li class="hidden-xs hidden-sm bar">|</li>
					<li><a href="${pageContext.request.contextPath}/findList/1">모임찾기</a></li>
						<li class="hidden-xs hidden-sm bar">|</li>
					<li class="dropdown">
						<a class="dropbtn dropdown-toggle" data-toggle="dropdown" href="#">커뮤니티<span class="caret hidden-md hidden-lg"></span></a>
						<ul class="nonestyle dropdown-menu hidden-md hidden-lg" >
								<li><a href="${pageContext.request.contextPath}/qnaList/1">QnA</a></li>
								<li><a href="${pageContext.request.contextPath}/reviewList/1">방문후기</a></li>
								<li><a href="#">FAQ</a></li>
						</ul>
						<div class="dropdown-content hidden-xs hidden-sm">
							<ul class="nonestyle" >
								<li><a href="${pageContext.request.contextPath}/qnaList/1">QnA</a></li>
								<li><a href="${pageContext.request.contextPath}/reviewList/1">방문후기</a></li>
								<li><a href="${pageContext.request.contextPath}/faq">FAQ</a></li>
							</ul>
						</div>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
					<li class="hidden-xs hidden-sm bar">|</li>
					<li><a href="${pageContext.request.contextPath}/memberWrite">회원가입</a></li>
					<li class="hidden-xs hidden-sm bar">|</li>
					<li><a href="${pageContext.request.contextPath}/reserveList/1">관리페이지</a></li>
				</ul>
			</div>
		</div>
	</nav>
</header>