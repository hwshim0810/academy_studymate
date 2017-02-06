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
		<%@include file="../common/BoardSubnav.jsp" %>
		<div class="body_top">
		</div>
		<div class="body center_align">
			<div class="boardtitle lottemartdream"></div>
			<div class="pull-right">
				<ol class="breadcrumb">
				  <li><a href="/studymate">Home</a></li>
				  <li class="active">방문후기</li>
				</ol>
			</div>
			<form:form method="POST" commandName="reviewDto" action="/studymate/reviewWrite">
				<table class="table">
					<tr>
						<td><label for="memName">작성자</label></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td><label for="borvTitle">제목</label></td>
						<td><form:input id="borvTitle" path="borvTitle" maxlength="30"/></td>
						<td><form:errors path="borvTitle" /></td>
					</tr>
					<tr>
						<td><label for="borvContent">내용</label></td>
						<td><form:textarea cssClass="textcontent" path="borvContent" cols="100" rows="20"/></td>
						<td></td>
					</tr>
				</table>
				<div class="btndiv">
					<div class="pull-right">
						<button class="btn btn-success btn-font" id="btnreg">등록</button>
					</div>
					<div class="pull-left">
						<button class="btn btn-primary btn-font" id="btnlist">목록</button>
					</div>
				</div>
			</form:form>
		</div>
		<input type="hidden" id="boardtitle" value="방문후기">
		<input type="hidden" id="boardid" value="review">
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
		<script src="<c:url value='/resources/js/boardWrite/reviewWrite.js'/>" charset="utf-8"></script>
	</body>
</html>