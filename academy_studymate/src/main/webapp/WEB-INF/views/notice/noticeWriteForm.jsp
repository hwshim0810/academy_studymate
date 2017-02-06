<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
			<div class="boardtitle lottemartdream"></div>
			<form:form method="POST" commandName="noticeDto" action="/studymate/noticeWrite" cssClass="center_align">
				<div>
					<label for="title">제목</label><br>
					<form:input path="bonTitle" maxlength="30" />
					<form:errors path="bonTitle" />
				</div>
				<br>
				<div>
					<label class="sr-only" for="bon_content">내용</label><br>
					<form:textarea path="bonContent" rows="20" cols="100" id="bonContent"/>
				</div>
				<!-- Button Area -->
				<div class="btndiv">
					<div class="pull-right">
						<button class="btn btn-primary btn-font" id="btnreg">등록</button>
					</div>
					<div class="pull-left">
						<button class="btn btn-primary btn-font" id="btnlist">목록</button>
					</div>
				</div>
			</form:form>
		</div>
		<input type="hidden" id="boardtitle" value="공지사항">
		<input type="hidden" id="boardid" value="notice">
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
		<script src="<c:url value='/resources/js/boardWrite/noticeWrite.js'/>" charset="utf-8"></script>
	</body>
</html>
