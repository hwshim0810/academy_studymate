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
			<header class="lottemartdream">
				<h1>공부하는 공간에 대한 Studymate의 생각</h1>
				<p>디지털 시대로써, 교육 컨텐츠가 범람하고 있으며</p>
				<p>전자책 등으로 인하여 공부도구의 혁신이 일어나고 있습니다.</p>
				<p>샐러던트란 말에서 알 수 있듯이 직장인들도 끊임없이 공부하며, </p>
				<p>제2의 전성기를 준비하는 사람들을 위한 교육상품도 쏟아지고 있습니다.</p>
			</header>
		</section>
		<section class="scene two">
			<header class="lottemartdream">
				<h1>공부하는 장소의 진화</h1>
				<p>공부방법과 컨텐츠가 진화하듯</p>
				<p>학습공간도 학습자의 다양성을 반영할 수 있는 전문공간이 필요합니다.</p>
				<p>이에 Studymate는 ’새로운 독서실’ 이 아닌</p>
				<p>다양한 학습스타일을 지닌 고객들을 위한 ‘새로운 학습공간’ 개발에 집중하였습니다.</p>
			</header>
		</section>
		<section class="scene three">
			<header class="lottemartdream">
				<h1>Studymate 서비스의 시작</h1>
				<p>공부가 가장 잘 되는 환경’에 대한 답을 찾기 위해</p>
				<p>고객의 학습행태와 학업능력과의 상관지수에 대해 알아보았습니다.</p>
				<p>분석한 결과, 최적의 공부 환경은 공부 공간, 관리 시스템 으로 이루어진다는 것이었습니다.</p>
				<br>
				<p>이러한 시대에 맞추어, Studymate 서비스가 시작되었습니다.</p>
			</header>
		</section>
		<%@include file="../common/Footer.jsp" %>
		</div>
	</body>
</html>