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
				<br><br><br>
				<form:form id= "updateform" action="${pageContext.request.contextPath}/noticeUpdate/${currentPage}" method="post" commandName="noticeDto">
					<table class="table">
						<tr>
							<td><label for="memName">작성자</label></td>
							<td>${sessionScope.memName}</td>
							<td><form:hidden path="bonNum" value="${noticeDto.bonNum}"/></td>
						</tr>
						<tr>
							<td><label for="bonTitle">제목</label></td>
							<td><form:input id="bonTitle" path="bonTitle" maxlength="20" value="${noticeDto.bonTitle}" cssClass="form-control" /></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td class="errormsg" colspan="2">
								<form:errors path="bonTitle" delimiter="/" cssClass="label label-danger"/>
								<form:errors path="bonContent" delimiter="/" cssClass="label label-danger"/>
							</td>
						</tr>
						<tr>
							<td><label for="bonContent">내용</label></td>
							<td><form:textarea cssClass="textcontent" path="bonContent" value="${qnaDto.boqContent}" cols="100" rows="20"/></td>
							<td></td>
						</tr>
					</table>
					<br><br>
					<hr>
					<!-- Button Area -->
					<%@include file="../common/boardBtn/UpdatePageBtn.jsp"%>
				</form:form>
			</section>
			<input type="hidden" id="boardid" value="notice">
			<input type="hidden" id="boardtitle" value="공지사항">
			<input type="hidden" id="boardsubtitle" value="공지수정">
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/Board.jsp" %>
			<script src="<c:url value='/resources/js/boardWrite/noticeWrite.js'/>" charset="utf-8"></script>
		</div>
	</body>
</html>