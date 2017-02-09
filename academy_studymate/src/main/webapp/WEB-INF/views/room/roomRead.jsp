<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="../common/Head.jsp" %>
	</head>
	<body>
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
					<h2 class="normal w300 subsize">${roomDto.borName}</h2>
					<div class="dtoinfo">
						등록일 <strong>${roomDto.borRegdate}</strong>
					</div>
				</header>
				<div class="main">
					<div class="col-xs-5 read_img">
						<img alt="지점이미지" src="${pageContext.request.contextPath}/resources/roomImg/${roomDto.borFilename}">
					</div>
					<div class="col-xs-5">
						<ol>
							<li></li>
						</ol>
					</div>					
				</div>
				<br><br>
				<hr>
				<!-- Button Area -->
				<footer id="con_footer">
					<div class="btndiv">
						<div class="pull-left">
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
		<input type="hidden" id="boardid" value="room">
		<input type="hidden" id="boardtitle" value="지점정보">
		<input type="hidden" id="boardsubtitle" value="${reviewDto.borNum}번 방">
		<input type="hidden" id="boardupdate" value="${updateUrl}">
		<input type="hidden" id="boarddelete" value="${deleteUrl}">
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
	</body>
</html>