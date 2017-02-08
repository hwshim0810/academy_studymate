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
			<div class="boardmaintitle lottemartdream"></div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="hidden-xs hidden-sm">번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${noticeList}">
						<c:url value="/noticeRead/${currentPage}-${item.bonNum}" var="readUrl">
							<c:param name="update" value="n" />
							<c:param name="keyField" value="${keyField}" />
							<c:param name="keyWord" value="${keyWord}" />
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
		<input type="hidden" id="boardtitle" value="공지사항">
		<input type="hidden" id="boardid" value="notice">
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
	</body>
</html>