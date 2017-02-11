<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="../common/Head.jsp" %>
	</head>
	<body>
		<div class="wrapper">
			<c:choose>
				<c:when test="${not empty sessionScope.memId}">
					<%@include file="../common/Header_afterIn.jsp"%>
				</c:when>
				<c:otherwise>
					<%@include file="../common/Header.jsp"%>
				</c:otherwise>
			</c:choose>
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
							<div class="pull-right">
								<c:if test="${sessionScope.memId eq 'admin'}">
									<button class="btn btn-warning btn-font btn-read"   id="btnupdate">수정</button>
									<button class="btn btn-danger btn-font btn-read"  id="btndelete">삭제</button>
								</c:if>
							</div>
							<%@include file="../common/boardBtn/ReadBtn.jsp"%>
						</div>
					</footer>
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
		</div>
	</body>
</html>