<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
				<form:form id="loginForm" class="form-horizontal" method="POST" commandName="loginDto" action="${pageContext.request.contextPath}/login">
					<div class="container col-xs-12">
						<fieldset>
							<!-- Form Name -->
							<legend class="sr-only">로그인</legend>
							<div class="form-group">
								<label class="col-xs-4 control-label" for="memId">아이디</label>  
								<div class="col-xs-6">
									 <form:input path="memId" id="memId" placeholder="아이디" cssClass="form-control" />
								</div>
								<div class="col-xs-2">
									<form:errors path="memId" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-4 control-label" for="memPass">비밀번호</label>  
								<div class="col-xs-6">
									<form:password id="memPass" path="memPass" placeholder="비밀번호" maxlength="12" cssClass="form-control" />
								</div>
								<div class="col-xs-2">
									<form:errors path="memPass" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-xs-4 control-label" for="saveId"></label>  
								<div class="col-xs-6">
									<input type="checkbox" id="saveId" name="saveId" />&nbsp;아이디 저장
								</div>
								<div class="col-xs-2">
								</div>
							</div>
							
							<!-- Button Area -->
							<div class="col-xs-6">
								<button type="button" class="btn btn-primary btn-font pull-right"  type="button" id="btntojoin">회원가입</button>
							</div>
							<div class="col-xs-3 divLogin">
								<button type="button" class="btn btn-success btn-font pull-left form-control"  type="button" id="btnlogin">로그인</button>
							</div>
							<div class="col-xs-3"></div>

							<div class="col-xs-12">
								<hr>
							</div>
						</fieldset>
					</div>
					<!-- Button Area -->
					<footer id="con_footer">
						<div class="btndiv">
							<div class="pull-left">
								<button class="btn btn-info btn-font" id="btnback">뒤로</button>
								<button class="btn btn-primary btn-font" id="btntoindex">홈으로</button>
							</div>
						</div>
					</footer>
				</form:form>
			</article>
		</section>
		<!-- Hidden parameter -->
		<input type="hidden" id="boardid" value="member">
		<input type="hidden" id="boardtitle_client" value="로그인">
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
		<%@include file="../common/Joinscript.jsp" %>
	</body>
</html>