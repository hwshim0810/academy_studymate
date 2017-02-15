<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<section class="body_low center_align">
				<div class="boardtitle lottemartdream"></div>
				<article id="contents">
					<header id="con_header">
						<div class="container col-xs-12">
					    	<div class="jumbotron">
							    <h3>환영합니다!</h3>      
							    <p class='hidden-xs'>Studymate의 서비스를 이용해보세요.</p>
							</div>
						</div>
					</header>
					<div class="main">
						<div class="col-xs-6">
							<button type="button" class="btn btn-primary btn-font pull-right" id="btntoindex">홈으로</button>
						</div>
						<div class="col-xs-6">
							<button type="button" class="btn btn-success btn-font pull-left" id="btntologin">로그인</button>
						</div>
					</div>
				</article>
			</section>
			<!-- Hidden parameter -->
			<input type="hidden" id="boardid" value="member">
			<input type="hidden" id="boardtitle_client" value="회원가입">
			<input type="hidden" id="boardinfo" value="회원가입을 환영합니다">
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/loadscript/Board.jsp" %>
			<%@include file="../common/loadscript/Joinscript.jsp" %>
		</div>
	</body>
</html>