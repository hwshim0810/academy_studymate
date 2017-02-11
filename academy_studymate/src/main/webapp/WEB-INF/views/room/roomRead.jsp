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
					<div>
						등록일 <strong>${roomDto.borRegdate}</strong>
					</div>
				</header>
				<div class="main">
					<div class="row read_row">
						<div class="col-xs-5 read_img">
							<img alt="지점이미지" src="${pageContext.request.contextPath}/resources/roomImg/${roomDto.borFilename}">
						</div>
						<div class="col-xs-7 read_info">
							<h2>${roomDto.borName}</h2>
							<dl>
								<dt>주소</dt>
								<dd>${roomDto.borAddr}</dd>
								<dd>${roomDto.borArea}</dd>
								<dt>한줄소개</dt>
								<dd>${roomDto.borIntro}</dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-5">
							<div class="col-xs-4 read_img">
								<img alt="지점이미지" src="${pageContext.request.contextPath}/resources/roomImg/${roomDto.borFilename}">
							</div>
							<div class="col-xs-4 read_img">
								<img alt="지점이미지" src="${pageContext.request.contextPath}/resources/roomImg/${roomDto.borFilename}">
							</div>
							<div class="col-xs-4 read_img">
								<img alt="지점이미지" src="${pageContext.request.contextPath}/resources/roomImg/${roomDto.borFilename}">
							</div>
						</div>
						<div class="col-xs-7">
						
						</div>
					</div>
					<div class="row read_row">
						<div class="col-xs-5 read_img" >
							<div id="map" class="hidden-xs hidden-sm"></div>
						</div>
						<div class="col-xs-7 read_info">
							<h2>오시는 길</h2>
							<dl>
								<dt>지하철</dt>
								<dd>${roomDto.borAddr}</dd>
								<dt>버스</dt>
								<dd></dd>
								<dt>자가용</dt>
								<dd></dd>
							</dl>
							<br><br><br>
							<hr>
				        	<c:url value="/reserveSeleted/${roomDto.borNum}" var="selectedRes">
				        		<c:param name="borName" value="${roomDto.borName}" />
				        	</c:url>
				        	<a class="btn btn-success btn-font btnwrite pull-right" href="${selectedRes}">예약하기</a>
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
		<input type="hidden" id="boardid" value="room">
		<input type="hidden" id="boardtitle" value="지점정보">
		<input type="hidden" id="boardsubtitle" value="${roomDto.borName}">
		<input type="hidden" id="boardupdate" value="${updateUrl}">
		<input type="hidden" id="boarddelete" value="${deleteUrl}">
		<input type="hidden" id="borAddr" value="${roomDto.borAddr}">
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=60028587da6bdcb31d41cbd67222999d"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/roomRead.js?v=12"></script>
	</body>
</html>