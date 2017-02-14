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
			<section class="body_low center_align">
				<%@include file="../common/BoardSubnav.jsp" %>
				<div class="boardmaintitle lottemartdream"></div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th width="10%" class="hidden-xs hidden-sm">번호</th>
							<th width="40%">제목</th>
							<th width="20%">글쓴이</th>
							<th width="20%">작성일</th>
							<th width="10%" class="hidden-xs hidden-sm">조회</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${reviewList}">
							<c:url value="/reviewRead/${currentPage}-${item.borvNum}" var="readUrl">
								<c:param name="update" value="n" />
								<c:if test="${not empty keyField && not empty keyWord}">
									<c:param name="keyField" value="${keyField}" />
									<c:param name="keyWord" value="${keyWord}" />
								</c:if>
							</c:url>
							<tr>
								<td class="hidden-xs hidden-sm table_center">${item.borvNum}</td>
								<td class="table_center">
									<a href="${readUrl}">${item.borvTitle}</a> <span class="badge">${item.borvReplycount}</span>
									<c:if test="${item.borvLike >= 10 }"><span class="glyphicon glyphicon-thumbs-up"></span></c:if>
								</td>
								<td class="table_center">${item.memName}</td>
								<td class="table_center">${item.borvRegdate}</td>
								<td class="hidden-xs hidden-sm table_center">${item.borvReadcount}</td>
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
				<%@include file="../common/search/QnaSearch.jsp" %>
				<br>
				<footer id="con_footer">
					<div class="btndiv">
						<div class="pull-right">
							<c:if test="${not empty sessionScope.memId}">
								<button class="btn btn-success btn-font" id="btnwrite">글쓰기</button>
							</c:if>
						</div>
						<div class="pull-left">
							<button class="btn btn-primary btn-font" id="btnlist">목록</button>
						</div>
					</div>
				</footer>
			</section>
			<input type="hidden" id="boardid" value="review">
			<input type="hidden" id="boardtitle" value="방문후기">
			<input type="hidden" id="boardpage" value="${currentPage}">
			<input type="hidden" id="boardtotal" value="${totalCount}">
			<input type="hidden" id="boardinfo" value="Studymate의 후기를 읽어보세요">
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/Board.jsp" %>
		</div>
	</body>
</html>