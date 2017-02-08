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
		<section class="body center_align">
			<div class="boardtitle lottemartdream"></div>
			<article id="contents">
				<header id="con_header" class="col-xs-12">
					<h2 class="normal w300 subsize">${noticeDto.bonTitle}</h2>
					<div class="dtoinfo">
						작성일 <strong>${noticeDto.bonRegdate}</strong>&nbsp;조회수 <strong>${noticeDto.bonReadcount}</strong>
					</div>
				</header>
				<div class="main">
					${noticeDto.bonContent}
				</div>
				<br><br>
				<hr>
				<!-- Button Area -->
				<%@include file="../common/boardBtn/ReadBtn.jsp"%>
			</article>
		</section>
		<!-- Hidden parameter -->
		<input type="hidden" id="boardid" value="notice">
		<input type="hidden" id="boardtitle" value="공지사항">
		<input type="hidden" id="boardsubtitle" value="${noticeDto.bonNum}번글">
		<input type="hidden" id="boardupdate" value="${updateUrl}">
		<input type="hidden" id="boarddelete" value="${deleteUrl}">
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
	</body>
</html>