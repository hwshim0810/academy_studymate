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
			<section class="body_higher center_align">
				<c:if test="${sessionScope.memId eq 'admin'}">
					<%@include file="../common/AdminSubnav.jsp" %>
				</c:if>
				<div class="boardmaintitle lottemartdream"></div>
				<div class="row text-center">
					<div class="col-xs-3"><strong>지역별</strong></div>
					<div class="col-xs-9">
						<ul class="list-inline">
							<li>강남구</li>
							<li>강북구</li>
							<li>서초구</li>
							<li>동작구</li>
						</ul>
					</div>
				</div>
				<article id="roomcolumn">
					<c:choose>
						<c:when test="${empty roomList}">
						
						</c:when>
						<c:otherwise>
							<c:forEach var="item" items="${roomList}">
	 							<c:url value="/roomRead/${currentPage}-${item.borNum}" var="readUrl">
									<c:if test="${not empty keyField && not empty keyWord}">
										<c:param name="keyField" value="${keyField}" />
										<c:param name="keyWord" value="${keyWord}" />
									</c:if>
								</c:url>
								<figure>
						        	<a href="${readUrl}">
						        		<img alt="지점썸네일" src="${pageContext.request.contextPath}/resources/roomImg/${item.borMain}">
						        	</a>
							        <figcaption>
							        	<ul class="ul_padding list-unstyled">
							        		<li><h3>${item.borName}</h3></li>
							        		<li>${item.borAddr}&nbsp;${item.borArea}</li>
							        	</ul>
							        	<div class="pull-right">
								        	<a href="${readUrl}" class="btn btn-info btn-font">상세정보</a>
								        	<c:url value="/reserveSeleted/${item.borNum}" var="selectedRes">
								        		<c:param name="borName" value="${item.borName}" />
								        	</c:url>
								        	<a class="btn btn-success btn-font btnwrite" href="${selectedRes}">예약하기</a>
							        	</div>
							        </figcaption>
						     	</figure>
					     	</c:forEach>
						</c:otherwise>
					</c:choose>
				</article>
				<table class="table">
					<tr>
						<td colspan="5" align="center">${pageHtml}</td>
					</tr>
				</table>
				<hr>
				<!-- Button Area -->
				<%@include file="../common/search/RoomSearch.jsp" %>
				<br>
				<c:choose>
					<c:when test="${sessionScope.memId eq 'admin'}">
						<%@include file="../common/boardBtn/ListBtn_withWrite.jsp"%>
						<input type="hidden" id="boardtitle" value="지점관리">
					</c:when>
					<c:otherwise>
						<%@include file="../common/boardBtn/ListBtn.jsp"%>
						<input type="hidden" id="boardtitle_client" value="지점소개">
						<input type="hidden" id="client_page" value="roomList/1">
					</c:otherwise>
				</c:choose>
			</section>
			<!-- Hidden parameter -->
			<input type="hidden" id="boardid" value="room">
			<input type="hidden" id="boardpage" value="${currentPage}">
			<input type="hidden" id="boardtotal" value="${totalCount}">
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/Board.jsp" %>
		</div>
	</body>
</html>