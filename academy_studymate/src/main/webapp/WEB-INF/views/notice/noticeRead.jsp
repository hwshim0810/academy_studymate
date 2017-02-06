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
			<footer id="con_footer">
				<div class="btndiv">
					<div class="pull-left">
						<button class="btn btn-warning btn-font" id="btnupdate">수정</button>
						<button class="btn btn-danger btn-font" id="btndelete">삭제</button>
					</div>				
					<div class="pull-right">
						<c:url value="/noticeList/${currentPage}" var="listUrl">
							<c:param name="keyField" value="${keyField}" />
							<c:param name="keyWord" value="${keyWord}" />
						</c:url>
						<a class="btn btn-primary btn-font" href="${listUrl}">목록</a>
					</div>
				</div>
			</footer>
			</article>
		</div>
		<input type="hidden" id="boardupdate" value="/${currentPage}-${noticeDto.bonNum}/?update=y">
		<input type="hidden" id="boarddelete" value="?currentPage=${currentPage}&bonNum=${noticeDto.bonNum}">
		<input type="hidden" id="boardid" value="notice">
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
	</body>
</html>