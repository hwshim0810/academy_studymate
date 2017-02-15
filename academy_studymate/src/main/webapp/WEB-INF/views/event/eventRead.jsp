<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
			<%@include file="../common/Body_top.jsp"%>
			<section class="body_high center_align">
				<div class="boardtitle lottemartdream"></div>
				<article id="contents">
					<header id="con_header" class="col-xs-12 lottemartdream">
						<h2 class="normal w300 subsize">${eventDto.boeTitle}</h2>
						<div class="lottemartdream">
							등록일 <strong>${eventDto.boeRegdate}</strong>
						</div>
						<hr>
					</header>
					<div class="main">
						<div class="row read_row">
							<div class="col-xs-12 read_mainimg text-center">
								<img class="img-circle" id="read_mainimg" alt="지점이미지" src="${pageContext.request.contextPath}/resources/eventImg/${eventDto.boeMain}">
							</div>
						</div>
						<div class="row read_row">
							<div class="col-xs-12 lottemartdream">
								<p>${eventDto.boeContent}</p>							
							</div>
						</div>
						<div class="row read_row">
							<div class="col-xs-12 text-center">
								<c:if test="${eventDto.boeIsEnd eq 'N' }">
									<button id="btnevent" class="btn btn-success btn-font" type="button">
									응모하기<span class="glyphicon glyphicon-heart-empty"></span>
									</button>
								</c:if>
							</div>
						</div>
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
			<input type="hidden" id="boardid" value="event">
			<input type="hidden" id="boardtitle" value="이벤트">
			<input type="hidden" id="boardsubtitle" value="${eventDto.boeNum}번글">
			<input type="hidden" id="boardupdate" value="${updateUrl}">
			<input type="hidden" id="boarddelete" value="${deleteUrl}">
			<input type="hidden" id="boardinfo" value="다양한 이벤트를 만나보세요.">
			<input type="hidden" id="boeNum" value="${eventDto.boeNum}">
			<input type="hidden" id="memId" value="${sessionScope.memId}">
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/Board.jsp" %>
			<%@include file="../common/scriptCssLoad/EventPageScript.jsp" %>
		</div>
	</body>
</html>