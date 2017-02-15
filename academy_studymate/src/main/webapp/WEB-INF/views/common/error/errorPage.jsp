<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="../Head.jsp" %>
	</head>
	<body>
		<div class="wrapper">
			<c:choose>
				<c:when test="${not empty sessionScope.memId}">
					<%@include file="../Header_afterIn.jsp"%>
				</c:when>
				<c:otherwise>
					<%@include file="../Header.jsp"%>
				</c:otherwise>
			</c:choose>
			<%@include file="../Body_top.jsp"%>
			<section class="body center_align">
				<div class="boardtitle lottemartdream"></div>
				<article id="contents">
					<div class="main">
						<div class="container col-xs-12">
							<div class="panel panel-info">
							    <div class="panel-heading"><h4 class="lottemartdream text-center">일시적인 문제</h4></div>
							    <div class="panel-body">
								    <div class="text-center">
							    		<h4 class="lottemartdream">일시적 장애가 발생했습니다! 관리자에게 문의하세요</h4>
							    	</div>
							    </div>
						    </div>
						</div>
						<div class="col-xs-7">
							<button type="button" class="btn btn-primary btn-font pull-right" id="btntoindex">홈으로</button>
						</div>
						<div class="col-xs-5"></div>
					</div>
				</article>
			</section>
			<!-- Hidden parameter -->
			<input type="hidden" id="boardid" value="member">
			<input type="hidden" id="boardtitle_client" value="회원탈퇴">
			<input type="hidden" id="boardinfo" value="다음에 또 이용바랍니다">
			<%@include file="../Footer.jsp" %>
			<%@include file="../loadscript/Board.jsp" %>
			<%@include file="../loadscript/Joinscript.jsp" %>
		</div>
	</body>
</html>