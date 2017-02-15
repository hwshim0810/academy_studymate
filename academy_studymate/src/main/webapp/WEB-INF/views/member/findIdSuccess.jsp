<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
					<div class="main">
						<div class="container col-xs-12">
							<div class="panel panel-info">
							    <div class="panel-heading"><h4 class="lottemartdream text-center">아이디목록</h4></div>
							    <div class="panel-body">
							    	<div>
							    		<ol class="text-center nonestyle lottemartdream">
											<c:forEach var="item" items="${memList}" >
												<li>아이디: ${item.memId}**&nbsp;&nbsp;&nbsp;가입일 : ${item.memRegdate}</li>
											</c:forEach>
							    		</ol>
							    	</div>
							    </div>
						    </div>
						</div>
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
			<input type="hidden" id="boardtitle_client" value="로그인">
			<input type="hidden" id="boardsubtitle" value="찾기완료">
			<input type="hidden" id="client_page" value="${pageContext.request.contextPath}/login">
			<input type="hidden" id="boardinfo" value="아이디를 확인하세요">
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/loadscript/Board.jsp" %>
			<%@include file="../common/loadscript/Joinscript.jsp" %>
		</div>
	</body>
</html>