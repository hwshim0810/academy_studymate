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
				<%@include file="../common/BoardSubnav.jsp" %>
				<div class="boardtitle lottemartdream"></div>
				<br><br><br>
				<form:form method="POST" commandName="reviewDto" action="${pageContext.request.contextPath}/reviewWrite">
					<table class="table">
						<tr>
							<td><label for="memName">작성자</label></td>
							<td>${sessionScope.memName}</td>
							<td>
								<input type="hidden" name="memName" value="${sessionScope.memName}">
								<input type="hidden" name="memId" value="${sessionScope.memId}">
							</td>
						</tr>
						<tr>
							<td><label for="borvTitle">제목</label></td>
							<td><form:input id="borvTitle" path="borvTitle" maxlength="25" cssClass="form-control" placeholder="제목을 입력해주세요"/></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td class="errormsg" colspan="2">
								<form:errors path="borvTitle" delimiter="/" cssClass="label label-danger"/>
								<form:errors path="borvContent" delimiter="/" cssClass="label label-danger"/>
							</td>
						</tr>
						<tr>
							<td><label for="borvContent">내용</label></td>
							<td><form:textarea cssClass="textcontent" path="borvContent" cols="100" rows="20"/></td>
							<td></td>
						</tr>
					</table>
					<br><br>
					<hr>
					<!-- Button Area -->
					<%@include file="../common/boardBtn/WriteFormBtn.jsp" %>
				</form:form>
			</div>
			<input type="hidden" id="boardid" value="review">
			<input type="hidden" id="boardtitle" value="방문후기">
			<input type="hidden" id="boardsubtitle" value="후기작성">
			<input type="hidden" id="boardinfo" value="지점별 리뷰를 남겨주세요">
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/Board.jsp" %>
			<script src="<c:url value='/resources/js/boardWrite/reviewWrite.js'/>" charset="utf-8"></script>
		</div>
	</body>
</html>