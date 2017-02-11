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
				<%@include file="../common/AdminSubnav.jsp" %>
				<div class="boardmaintitle lottemartdream"></div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th class="hidden-xs hidden-sm">번호</th>
							<th>예약회원</th>
							<th>예약지점</th>
							<th>예약날짜</th>
							<th>예약시간</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${resList}">
							<c:url value="/reserveRead/${currentPage}-${item.resNum}" var="readUrl">
								<c:if test="${not empty keyField && not empty keyWord}">
									<c:param name="keyField" value="${keyField}" />
									<c:param name="keyWord" value="${keyWord}" />
								</c:if>
							</c:url>
							<tr>
								<td class="hidden-xs hidden-sm table_center">${item.resNum}</td>
								<td class="table_center"><a href="${readUrl}">${item.memId}</a></td>
								<td class="table_center">${item.borName}</td>
								<td class="table_center">${item.resDate}</td>
								<td class="table_center">${item.resTime}</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5" align="center">${pageHtml}</td>
						</tr>
					</tfoot>
				</table>
				<hr>
				<!-- Button Area -->
				<%@include file="../common/search/ResSearch.jsp" %>
				<br>
				<%@include file="../common/boardBtn/ListBtn.jsp" %>
			</section>
			<!-- Hidden parameter -->
			<input type="hidden" id="boardid" value="reserve">
			<input type="hidden" id="boardtitle" value="예약관리">
			<input type="hidden" id="boardpage" value="${currentPage}">
			<input type="hidden" id="boardtotal" value="${totalCount}">
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/Board.jsp" %>
		</div>
	</body>
</html>