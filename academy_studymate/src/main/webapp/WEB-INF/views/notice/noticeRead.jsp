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
			<footer id="con_footer">
				<div class="btndiv">
					<%@include file="../common/boardBtn/ReadBtn_updel.jsp" %>		
					<div class="pull-right">
						<c:url value="/noticeList/${currentPage}" var="listUrl">
							<c:if test="${not empty param.keyField && not empty param.keyWord}">
								<c:param name="keyField" value="${param.keyField}" />
								<c:param name="keyWord" value="${param.keyWord}" />
							</c:if>
						</c:url>
						<a class="btn btn-primary btn-font" href="${listUrl}">목록</a>
					</div>
				</div>
			</footer>
			</article>
		</section>
		<!-- Hidden parameter -->
		<input type="hidden" id="boardupdate" value="/${currentPage}-${noticeDto.bonNum}/?update=y">
		<input type="hidden" id="boarddelete" value="?currentPage=${currentPage}&bonNum=${noticeDto.bonNum}">
		<input type="hidden" id="boardid" value="notice">
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
	</body>
</html>