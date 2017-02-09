<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<%@include file="../common/BoardSubnav.jsp" %>
			<div class="boardmaintitle lottemartdream"></div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="hidden-xs hidden-sm">번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>작성일</th>
						<th class="hidden-xs hidden-sm">조회</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${qnaList}">
						<c:url value="/qnaRead/${currentPage}-${item.boqNum}" var="readUrl">
							<c:param name="update" value="n" />
							<c:if test="${not empty keyField && not empty keyWord}">
								<c:param name="keyField" value="${keyField}" />
								<c:param name="keyWord" value="${keyWord}" />
							</c:if>
						</c:url>
						<tr>
							<td class="hidden-xs hidden-sm table_center">${item.boqNum}</td>
							<c:choose>
								<c:when test="${item.boqLev > 0 }">
								<td class="table_center"><a href="${readUrl}">답변 : ${item.boqTitle}</a></td>
								</c:when>
								<c:otherwise>
								<td class="table_center"><a href="${readUrl}">${item.boqTitle}</a></td>
								</c:otherwise>
							</c:choose>
							<td class="table_center">${item.memName}</td>
							<td class="table_center">${item.boqRegdate}</td>
							<td class="hidden-xs hidden-sm table_center">${item.boqReadcount}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5" align="center">${pageHtml}</td>
					</tr>
				</tfoot>
			</table>
			<br>
			<hr>
			<!-- Button Area -->
			<%@include file="../common/search/QnaSearch.jsp" %>
			<br>
			<footer id="con_footer">
				<div class="btndiv">
					<div class="pull-right">
						<button class="btn btn-success btn-font" id="btnwrite">글쓰기</button>
					</div>
					<div class="pull-left">
						<button class="btn btn-primary btn-font" id="btnlist">목록</button>
					</div>
				</div>
			</footer>
		</section>
		<input type="hidden" id="boardpage" value="${currentPage}">
		<input type="hidden" id="boardtotal" value="${totalCount}">
		<input type="hidden" id="boardtitle" value="QnA">
		<input type="hidden" id="boardid" value="qna">
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
	</body>
</html>