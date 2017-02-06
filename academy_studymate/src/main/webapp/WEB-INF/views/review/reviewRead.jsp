<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="../common/Head.jsp" %>
	</head>
	<body>
		<%@include file="../common/Header.jsp" %>
		<div class="body_top">
		</div>
		<div class="body center_align">
			<div class="boardtitle lottemartdream"></div>
			<div class="pull-right">
				<ol class="breadcrumb">
				  <li><a href="/studymate">Home</a></li>
				  <li class="active">방문후기</li>
				</ol>
			</div>
			<article id="contents">
				<header id="con_header" class="col-xs-12">
					<h2 class="normal w300 subsize">${reviewDto.borvTitle}</h2>
					<div class="dtoinfo">
						작성일 <strong>${reviewDto.borvRegdate}</strong>&nbsp;조회수 <strong>${reviewDto.borvReadcount}</strong>
					</div>
				</header>
				<div class="main">
					${reviewDto.borvContent}
				</div>
			<!-- Button Area -->
			<footer id="con_footer">
				<div class="btndiv">
					<div class="pull-left">
						<button class="btn btn-warning btn-font" id="btnupdate">수정</button>
						<button class="btn btn-danger btn-font" id="btndelete">삭제</button>
					</div>				
					<div class="pull-right">
						<c:url value="/reviewList/${currentPage}" var="listUrl">
							<c:param name="keyField" value="${keyField}" />
							<c:param name="keyWord" value="${keyWord}" />
						</c:url>
						<a class="btn btn-primary btn-font" href="${listUrl}">목록</a>
					</div>
				</div>
			</footer>
			</article>
		</div>
		<input type="hidden" id="boardtitle" value="방문후기">
		<input type="hidden" id="boardupdate" value="/${currentPage}-${reviewDto.borvNum}/?update=y">
		<input type="hidden" id="boarddelete" value="/?currentPage=${currentPage}&borvNum=${reviewDto.borvNum}">
		<input type="hidden" id="boardid" value="review">
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
	</body>
</html>