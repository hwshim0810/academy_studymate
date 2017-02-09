<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="../common/Head.jsp" %>
	</head>
	<body>
		<c:choose>
			<c:when test="${not empty sessionScope.memId}">
				<%@include file="../common/Header_afterIn.jsp"%>
			</c:when>
			<c:otherwise>
				<%@include file="../common/Header.jsp"%>
			</c:otherwise>
		</c:choose>
		<%@include file="../common/BoardSubnav.jsp" %>
		<div class="body_top">
		</div>
		<div class="body center_align">
			<div class="boardtitle lottemartdream"></div>
			<br><br><br>
			<form:form method="POST" commandName="qnaDto" action="${pageContext.request.contextPath}/qnaWrite">
				<table class="table">
					<tr>
						<td><label for="memName">작성자</label></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td><label for="boqTitle">제목</label></td>
						<td><form:input id="boqTitle" path="boqTitle" maxlength="30" placeholder="제목을 입력해주세요"/></td>
						<td><form:errors path="boqTitle" /></td>
					</tr>
					<tr>
						<td><label for="boqContent">내용</label></td>
						<td><form:textarea cssClass="textcontent" path="boqContent" cols="100" rows="20"/></td>
						<td></td>
					</tr>
				</table>
				<hr>
				<div class="btndiv">
					<div class="pull-right">
						<button class="btn btn-success btn-font" id="btnreg">등록</button>
					</div>
					<div class="pull-left">
						<button class="btn btn-primary btn-font" id="btnlist">목록</button>
					</div>
				</div>
				<!-- 수정요망 -->
				<input type="hidden" name="memId" value="user111" />
				<input type="hidden" name="memName" id="memName" value="사람" />
			</form:form>
		</div>
		<input type="hidden" id="boardtitle" value="QnA">
		<input type="hidden" id="boardid" value="qna">
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
		<script src="<c:url value='/resources/js/boardWrite/qnaWrite.js?v=2'/>" charset="utf-8"></script>
	</body>
</html>