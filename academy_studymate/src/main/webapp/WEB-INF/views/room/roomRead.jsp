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
					<header id="con_header" class="col-xs-12">
						<h2 class="normal w300 subsize">${roomDto.borName}</h2>
						<div>
							등록일 <strong>${roomDto.borRegdate}</strong>
						</div>
					</header>
					<div class="main">
						<div class="row read_row">
							<div class="col-xs-12 col-sm-5 read_mainimg text-center">
								<img id="read_mainimg" alt="지점이미지" src="${pageContext.request.contextPath}/resources/roomImg/${roomDto.borMain}">
							</div>
							<div class="col-xs-12 col-sm-7 read_info lottemartdream">
								<h2>${roomDto.borName}</h2>
									<h4>주소</h4>
									<p>${roomDto.borAddr}</p>
									<p>${roomDto.borArea}</p>
									<h4>한줄소개</h4>
									<p>${roomDto.borIntro}</p>
							</div>
						</div>
						<div class="row hidden-xs">
							<div class="col-xs-5">
								<div class="col-xs-4 read_img">
									<img id="main_thumb" class="room_thumb" alt="지점이미지" src="${pageContext.request.contextPath}/resources/roomImg/${roomDto.borMain}">
								</div>
								<c:forEach var="item" items="${subFileList}">
									<div class="col-xs-4 read_img">
										<img class="room_thumb" alt="지점이미지" src="${pageContext.request.contextPath}/resources/roomImg/${item.borSub}">
									</div>
								</c:forEach>
							</div>
							<div class="col-xs-7">
							
							</div>
						</div>
						<div class="row read_row">
							<div class="col-xs-12 col-sm-5 read_map" >
								<div id="map" class="hidden-xs"></div>
							</div>
							<div class="col-xs-12 col-sm-7 read_info lottemartdream">
								<h2>오시는 길</h2>
									<h4>지하철</h4>
									<p>${roomDto.borMetro}</p>
									<h4>버스</h4>
									<p>${roomDto.borBus}</p>
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
			<input type="hidden" id="boardtitle" value="지점소개">
			<input type="hidden" id="boardsubtitle" value="${roomDto.borName}">
			<input type="hidden" id="boardupdate" value="${updateUrl}">
			<input type="hidden" id="boarddelete" value="${deleteUrl}">
			<input type="hidden" id="borAddr" value="${roomDto.borAddr}">
			<input type="hidden" id="boardinfo" value="지역별 지점소개입니다">
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/Board.jsp" %>
			<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=60028587da6bdcb31d41cbd67222999d"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/roomRead.js?v=14"></script>
		</div>
	</body>
</html>