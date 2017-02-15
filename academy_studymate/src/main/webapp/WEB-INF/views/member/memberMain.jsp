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
				<%@include file="../common/nav/AdminSubnav.jsp" %>
				<div class="boardmaintitle lottemartdream"></div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th width="20%" class="hidden-xs hidden-sm">회원이름</th>
							<th width="40%">아이디</th>
							<th width="30%">가입일</th>
							<th width="20%">탈퇴여부</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${memList}">
							<c:url value="/memberAdRead/${currentPage}-${item.memId}" var="readUrl">
								<c:if test="${not empty keyField && not empty keyWord}">
									<c:param name="keyField" value="${keyField}" />
									<c:param name="keyWord" value="${keyWord}" />
								</c:if>
							</c:url>
							<tr>
								<td class="hidden-xs hidden-sm table_center">${item.memName}</td>
								<td class="table_center"><a href="${readUrl}">${item.memId}</a></td>
								<td class="table_center">${item.memRegdate}</td>
								<td class="table_center">${item.memSiteout}</td>
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
				<%@include file="../common/search/MemSearch.jsp" %>
				<br>
				<%@include file="../common/boardBtn/ListBtn_withWrite.jsp"%>
			</section>
			<!-- Hidden parameter -->
			<input type="hidden" id="boardid" value="member">
			<input type="hidden" id="boardtitle" value="회원관리">
			<input type="hidden" id="boardpage" value="${currentPage}">
			<input type="hidden" id="boardtotal" value="${totalCount}">
			<input type="hidden" id="boardinfo" value="관리자권한의 회원관리입니다">
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/loadscript/Board.jsp" %>
		</div>
	</body>
</html>