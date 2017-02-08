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
			<%@include file="../common/AdminSubnav.jsp" %>
			<div class="boardmaintitle lottemartdream"></div>
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
						        	<img alt="지점이미지" src="/studymate/resources/roomImg/${item.borFilename}">
						        </a>
						        <figcaption>
						        	<ul>
						        		<li><label>지점명: </label>${item.borName}</li>
						        		<li><label>주소: </label>${item.borAddr}&nbsp;${item.borArea}</li>
						        		<li><label>평점: </label></li>
						        	</ul>
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
			<%@include file="../common/boardBtn/ListBtn_admin.jsp" %>
		</section>
		<!-- Hidden parameter -->
		<input type="hidden" id="boardpage" value="${currentPage}">
		<input type="hidden" id="boardtotal" value="${totalCount}">
		<input type="hidden" id="boardtitle" value="지점관리">
		<input type="hidden" id="boardid" value="room">
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
	</body>
</html>