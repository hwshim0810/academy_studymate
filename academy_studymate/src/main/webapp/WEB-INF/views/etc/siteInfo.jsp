<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="../common/Head.jsp" %>
		<link rel="stylesheet" href="<c:url value='/resources/css/intro.css?v=10' />" />
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
		<section class="scene one">
			<header>
				<h1>공부하는 공간에 대한 Studymate의 생각</h1>
			</header>
		</section>
		<section class="scene two">
			<header>
				<h1>공부하는 공간에 대한 Studymate의 생각</h1>
			</header>
		</section>
		<section class="scene three">
			<header>
				<h1>공부하는 공간에 대한 Studymate의 생각</h1>
			</header>
		</section>
		<%@include file="../common/Footer.jsp" %>
		</div>
	</body>
</html>