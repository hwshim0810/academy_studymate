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
			<section class="body_high center_align">
				<div class="boardmaintitle lottemartdream"></div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th width="10%" class="hidden-xs hidden-sm">번호</th>
							<th width="50%">제목</th>
							<th width="30%">작성일</th>
							<th width="10%" class="hidden-xs hidden-sm">조회</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${noticeList}">
							<c:url value="/noticeRead/${currentPage}-${item.bonNum}" var="readUrl">
								<c:param name="update" value="n" />
								<c:if test="${not empty keyField && not empty keyWord}">
									<c:param name="keyField" value="${keyField}" />
									<c:param name="keyWord" value="${keyWord}" />
								</c:if>
							</c:url>
							<tr>
								<td class="table_center hidden-xs">${item.bonNum}</td>
								<td class="table_center"><a href="${readUrl}">${item.bonTitle}</a></td>
								<td class="table_center">${item.bonRegdate}</td>
								<td class="table_center">${item.bonReadcount}</td>
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
				<%@include file="../common/search/NoticeSearch.jsp" %>
				<br>
				<footer id="con_footer">
					<div class="btndiv">
						<div class="pull-right">
							<c:if test="${sessionScope.memId eq 'admin'}">
								<button class="btn btn-success btn-font" id="btnwrite">글쓰기</button>
							</c:if>
						</div>
						<div class="pull-left">
							<button class="btn btn-primary btn-font" id="btnlist">목록</button>
						</div>
					</div>
				</footer>
			</section>
			<input type="hidden" id="boardid" value="notice">
			<input type="hidden" id="boardtitle" value="공지사항">
			<input type="hidden" id="boardpage" value="${currentPage}">
			<input type="hidden" id="boardtotal" value="${totalCount}">
			<input type="hidden" id="boardinfo" value="Studymate에서 보내드리는 소식들입니다">
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/loadscript/Board.jsp" %>
		</div>
	</body>
</html>