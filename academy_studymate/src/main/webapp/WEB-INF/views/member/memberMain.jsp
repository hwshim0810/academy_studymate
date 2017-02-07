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
			<div class="boardtitle lottemartdream"></div>
			<div class="pull-left count">
				<span>총 ${totalCount}건 ${currentPage}페이지</span>
			</div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="hidden-xs hidden-sm">회원이름</th>
						<th>아이디</th>
						<th>가입일</th>
						<th>탈퇴여부</th>
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
			<%@include file="../common/MemSearch.jsp" %>
			<br>
			<footer id="con_footer">
				<div class="btndiv">
					<div class="pull-right">
						<button class="btn btn-success btn-font" id="btnwrite">추가</button>
					</div>
					<div class="pull-left">
						<button class="btn btn-primary btn-font" id="btnlist">목록</button>
					</div>
				</div>
			</footer>
		</section>
		<input type="hidden" id="boardtitle" value="회원관리">
		<input type="hidden" id="boardid" value="member">
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
	</body>
</html>