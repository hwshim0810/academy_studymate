<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
				<div class="boardtitle lottemartdream"></div>
				<article id="contents">
					<form:form name = "updateform" action="${pageContext.request.contextPath}/qnaUpdate/${currentPage}-${qnaDto.boqNum}" method="post" commandName="qnaDto">
						<table class="table">
							<tr>
								<td><label for="memName">작성자</label></td>
								<td>${qnaDto.memName}</td>
								<td></td>
							</tr>
							<tr>
								<td><label for="boqTitle">제목</label></td>
								<td><form:input id="boqTitle" path="boqTitle" maxlength="20" value="${qnaDto.boqTitle}" /></td>
								<td><form:errors path="boqTitle" /></td>
							</tr>
							<tr>
								<td><label for="boqContent">내용</label></td>
								<td><form:textarea cssClass="textcontent" path="boqContent" value="${qnaDto.boqContent}" /></td>
								<td></td>
							</tr>
						</table>
						<br><br>
						<hr>
						<!-- Button Area -->
						<%@include file="../common/boardBtn/UpdatePageBtn.jsp"%>
					</form:form>
				</article>
			</section>
			<input type="hidden" id="boardid" value="qna">
			<input type="hidden" id="boardtitle" value="QnA">
			<input type="hidden" id="boardsubtitle" value="글 수정">
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/Board.jsp" %>
			<script src="<c:url value='/resources/js/boardWrite/qnaWrite.js'/>" charset="utf-8"></script>
		</div>
	</body>
</html>