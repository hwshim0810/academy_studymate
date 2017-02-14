<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="header">
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>                        
				</button>
				<div class="hidden_brand">
					<a class="navbar-brand hidden-sm hidden-md hidden-lg" href="${pageContext.request.contextPath}">StudyMate</a>
				</div>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<div class="row">
					<ul class="nav navbar-nav navbar-right loginnav lottemartdream normal w400">
							<li><a href="${pageContext.request.contextPath}/logoutConfirm">로그아웃</a></li>
							<c:choose>
								<c:when test="${sessionScope.memId eq 'admin'}">
									<li class="hidden-xs hidden-sm bar">|</li>
									<li><a href="${pageContext.request.contextPath}/reserveList/1">관리페이지</a></li>
								</c:when>
								<c:otherwise>
									<li class="hidden-xs hidden-sm bar">|</li>
									<li><a href="${pageContext.request.contextPath}/memberMypage">마이페이지</a></li>
								</c:otherwise>
							</c:choose>
					</ul>
				</div>
				<ul class="nav navbar-nav logonav lottemartdream normal w400 navsize">
					<li class="active"><a href="${pageContext.request.contextPath}/siteInfo">사이트 소개</a></li>
						<li class="hidden-xs hidden-sm bar">|</li>
					<li><a href="${pageContext.request.contextPath}/noticeList/1">공지사항</a></li>
						<li class="hidden-xs hidden-sm bar">|</li>
					<li><a class="hidden-xs logolink" href="${pageContext.request.contextPath}">
							<img src="${pageContext.request.contextPath}/resources/img/StudyMateLogo.png" alt="로고">
						 </a></li>
						<li class="hidden-xs hidden-sm bar">|</li>
					<li><a href="${pageContext.request.contextPath}/roomList/1">지점소개</a></li>
						<li class="hidden-xs hidden-sm bar">|</li>
					<!-- <li><a href="${pageContext.request.contextPath}/findList/1">모임찾기</a></li>
						<li class="hidden-xs hidden-sm bar">|</li> -->
					<li class="dropdown">
						<a class="dropbtn dropdown-toggle" data-toggle="dropdown" href="#">커뮤니티<span class="caret hidden-md hidden-lg"></span></a>
						<ul class="nonestyle dropdown-menu hidden-md hidden-lg" >
								<li><a href="${pageContext.request.contextPath}/qnaList/1">QnA</a></li>
								<li><a href="${pageContext.request.contextPath}/reviewList/1">방문후기</a></li>
								<li><a href="#">이벤트</a></li>
						</ul>
						<div class="dropdown-content hidden-xs hidden-sm">
							<ul class="nonestyle" >
								<li><a href="${pageContext.request.contextPath}/qnaList/1">QnA</a></li>
								<li><a href="${pageContext.request.contextPath}/reviewList/1">방문후기</a></li>
								<li><a href="${pageContext.request.contextPath}/faq">이벤트</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</header>