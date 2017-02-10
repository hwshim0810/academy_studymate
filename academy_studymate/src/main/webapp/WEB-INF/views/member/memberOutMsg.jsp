<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<div class="boardtitle lottemartdream"></div>
			<article id="contents">
				<div class="main">
					<div class="container col-xs-12">
						<div class="panel panel-info">
						    <div class="panel-heading"><h4 class="lottemartdream text-center">탈퇴완료</h4></div>
						    <div class="panel-body">
							    <div class="text-center">
						    		<h4 class="lottemartdream">그 동안 이용해주셔서 감사합니다.</h4>
						    	</div>
						    </div>
					    </div>
					</div>
					<div class="col-xs-12 text-center">
						<button type="button" class="btn btn-primary pull-right" id="btntoindex">메인페이지</button>
					</div>
				</div>
			</article>
		</section>
		<!-- Hidden parameter -->
		<input type="hidden" id="boardid" value="member">
		<input type="hidden" id="boardtitle_client" value="회원탈퇴">
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
		<%@include file="../common/Joinscript.jsp" %>
	</body>
</html>