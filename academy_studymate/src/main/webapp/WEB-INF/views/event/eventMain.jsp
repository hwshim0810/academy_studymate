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
			<%@include file="../common/Body_top.jsp"%>
			<section class="body_higher center_align">
				<c:if test="${sessionScope.memId eq 'admin'}">
					<%@include file="../common/nav/AdminSubnav.jsp" %>
				</c:if>
				<div class="boardmaintitle lottemartdream"></div>
				<article>
					<c:choose>
						<c:when test="${empty eventList}">
						
						</c:when>
						<c:otherwise>
							<c:forEach var="item" items="${eventList}">
	 							<c:url value="/eventRead/${currentPage}-${item.boeNum}" var="readUrl">
									<c:if test="${not empty keyField && not empty keyWord}">
										<c:param name="keyField" value="${keyField}" />
										<c:param name="keyWord" value="${keyWord}" />
									</c:if>
									<c:param name="update" value="n" />
								</c:url>
								<div class="row">
									<div class="hidden-xs col-sm-3 event left">
										<a href="${readUrl}">
						        			<img alt="이벤트썸네일" src="${pageContext.request.contextPath}/resources/eventImg/${item.boeMain}">
						        		</a>
									</div>
									<div class="col-xs-12 col-sm-9 event right lottemartdream">
										<h3 id="eventTitle"><a href="${readUrl}">${item.boeTitle}</a></h3>
										<p>기간 : ${item.boeDaterange}</p>
										<p>남은인원 : ${item.boeAble}</p>
										<span>조회수 : ${item.boeReadcount}</span>&nbsp;
										<c:if test="${item.boeIsEnd eq 'Y'}"><span class="label label-danger">이벤트마감</span></c:if>
									</div>
								</div>
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
				<%@include file="../common/search/EventSearch.jsp" %>
				<br>
				<c:choose>
					<c:when test="${sessionScope.memId eq 'admin'}">
						<%@include file="../common/boardBtn/ListBtn_withWrite.jsp"%>
						<input type="hidden" id="boardtitle" value="이벤트관리">
					</c:when>
					<c:otherwise>
						<%@include file="../common/boardBtn/ListBtn.jsp"%>
						<input type="hidden" id="boardtitle_client" value="이벤트">
						<input type="hidden" id="client_page" value="eventList/1">
					</c:otherwise>
				</c:choose>
			</section>
			<!-- Hidden parameter -->
			<input type="hidden" id="boardid" value="event">
			<input type="hidden" id="boardpage" value="${currentPage}">
			<input type="hidden" id="boardtotal" value="${totalCount}">
			<input type="hidden" id="boardinfo" value="Studymate의 이벤트가 모인 공간입니다.">
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/loadscript/Board.jsp" %>
			<%@include file="../common/scriptCssLoad/EventPageScript.jsp" %>
		</div>
	</body>
</html>