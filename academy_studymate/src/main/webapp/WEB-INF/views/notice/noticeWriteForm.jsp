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
			<%@include file="../common/Body_top.jsp"%>
			<div class="body center_align">
				<div class="boardtitle lottemartdream"></div>
				<br><br><br>
				<form:form method="POST" commandName="noticeDto" action="${pageContext.request.contextPath}/noticeWrite">
					<table class="table">
						<tr>
							<td><label for="bonTitle">제목</label></td>
							<td><form:input id="bonTitle" path="bonTitle" maxlength="25" cssClass="form-control" placeholder="제목을 입력해주세요"/></td>
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
							<td><form:textarea cssClass="textcontent" path="bonContent" cols="100" rows="20"/></td>
							<td></td>
						</tr>
					</table>
					<br><br>
					<hr>
					<!-- Button Area -->
					<%@include file="../common/boardBtn/WriteFormBtn.jsp" %>
				</form:form>
			</div>
			<input type="hidden" id="boardid" value="notice">
			<input type="hidden" id="boardtitle" value="공지사항">
			<input type="hidden" id="boardsubtitle" value="공지작성">
			<input type="hidden" id="boardinfo" value="공지사항을 작성합니다">
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/loadscript/Board.jsp" %>
			<script src="<c:url value='/resources/js/boardWrite/noticeWrite.js?v=1'/>" charset="utf-8"></script>
		</div>
	</body>
</html>