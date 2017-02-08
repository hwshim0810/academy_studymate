<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="../common/Head.jsp" %>
	</head>
	<body>
		<%@include file="../common/Header.jsp" %>
		<div class="body_top">
		</div>
		<section class="body center_align">
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
						<button type="button" class="btn btn-primary pull-right" id="btntoindex">메인페이지로</button>
					</div>
					<div class="col-xs-6">
						<button type="button" class="btn btn-success pull-left" id="btntologin">로그인페이지로</button>
					</div>
				</div>
			</article>
		</section>
		<!-- Hidden parameter -->
		<input type="hidden" id="boardtitle" value="회원가입">
		<input type="hidden" id="boardid" value="member">
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
	</body>
</html>