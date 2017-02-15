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
			<section class="body center_align">
				<%@include file="../common/nav/BoardSubnav.jsp" %>
				<div class="boardtitle lottemartdream"></div>
				<form:form name = "updateform" action="${pageContext.request.contextPath}/qnaComment/${currentPage}" method="post" commandName="qnaDto">
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
							<td><label for="boqTitle">제목</label></td>
							<td>${qnaDto.boqTitle}</td>
							<td>	<input type="hidden" name="boqTitle" value="${qnaDto.boqTitle}"></td>
						</tr>
						<tr>
							<td></td>
							<td class="errormsg" colspan="2">
								<form:errors path="boqTitle" delimiter="/" cssClass="label label-danger"/>
								<form:errors path="boqContent" delimiter="/" cssClass="label label-danger"/>
							</td>
						</tr>
						<tr>
							<td><label for="boqContent">내용</label></td>
							<td><form:textarea cssClass="textcontent" path="boqContent" value="${qnaDto.boqContent}" cols="100" rows="20"/></td>
							<td></td>
						</tr>
					</table>
					<br><br>
					<hr>
					<!-- Button Area -->
					<footer id="con_footer">
					<div class="btndiv">
						<div class="pull-right">
							<button class="btn btn-success btn-font" id="btnreg">등록</button>
						</div>
						<div class="pull-left">
							<button class="btn btn-info btn-font" id="btnback">뒤로</button>
							<button class="btn btn-primary btn-font" id="btnlist">목록</button>
						</div>
					</div>
					</footer>
					<input type="hidden" name="boqNum" value="${qnaDto.boqNum}">
					<input type="hidden" name="boqGroupnum" value="${qnaDto.boqGroupnum}">
				</form:form>
			</section>
			<input type="hidden" id="boardid" value="qna">
			<input type="hidden" id="boardtitle" value="QnA">
			<input type="hidden" id="boardsubtitle" value="답변작성">
			<input type="hidden" id="boardinfo" value="문의에 대한 답변을 작성합니다">
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/loadscript/Board.jsp" %>
			<script src="<c:url value='/resources/js/boardWrite/qnaWrite.js'/>" charset="utf-8"></script>
		</div>
	</body>
</html>