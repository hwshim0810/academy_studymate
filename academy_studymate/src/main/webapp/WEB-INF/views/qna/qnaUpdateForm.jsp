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
		<div class="body_top">
		</div>
		<section class="body center_align">
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
				<footer id="con_footer">
					<div class="btndiv">
						<div class="pull-right">
							<button class="btn btn-success btn-font"  type="button" id="btnreg">수정</button>
						</div>
						<div class="pull-left">
							<button class="btn btn-info btn-font"  type="button" id="btnback">뒤로</button>
							<button class="btn btn-primary btn-font" type="button" id="btnlist">목록</button>
						</div>
					</div>
				</footer>
			</form:form>
		</section>
		<input type="hidden" id="boardtitle" value="QnA">
		<input type="hidden" id="boardid" value="qna">
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
		<script src="<c:url value='/resources/js/boardWrite/qnaWrite.js'/>" charset="utf-8"></script>
	</body>
</html>