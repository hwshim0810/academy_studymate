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
		<div class="body center_align">
			<%@include file="../common/BoardSubnav.jsp" %>
			<div class="boardtitle lottemartdream"></div>
			<div class="pull-left count">
				<span>총 ${totalCount}건 ${currentPage}페이지</span>
			</div>
			<div class="pull-right">
				<ol class="breadcrumb">
				  <li><a href="/studymate">Home</a></li>
				  <li class="active">방문후기</li>
				</ol>
			</div>
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
							<td class="table_center"><a href="${readUrl}">${item.borvTitle}</a></td>
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
			<%@include file="../common/BoardSearch.jsp" %>
			<br>
			<div class="btndiv">
				<div class="pull-right">
					<button class="btn btn-success btn-font" id="btnwrite">글쓰기</button>
				</div>
				<div class="pull-left">
					<button class="btn btn-primary btn-font" id="btnlist">목록</button>
				</div>
			</div>
		</div>
		<input type="hidden" id="boardtitle" value="방문후기">
		<input type="hidden" id="boardid" value="review">
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
	</body>
</html>