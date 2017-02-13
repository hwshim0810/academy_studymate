<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
					<form:form id="loginForm" class="form-horizontal" method="POST" commandName="loginDto" action="${pageContext.request.contextPath}/login">
						<div class="container col-xs-12">
							<fieldset>
								<!-- Form Name -->
								<legend class="sr-only">로그인</legend>
								<div class="form-group">
									<label class="col-xs-4 control-label" for="memId">아이디</label>  
									<div class="col-xs-8 col-sm-6">
										 <form:input path="memId" id="memId" placeholder="아이디" cssClass="form-control" />
									</div>
									<div class="hidden-xs col-sm-2 nopadding">
										<form:errors path="memId" cssClass="label label-danger" delimiter="/"/>
									</div>
								</div>
								<div class="form-group">
									<label class="col-xs-4 control-label" for="memPass">비밀번호</label>  
									<div class="col-xs-8 col-sm-6">
										<form:password id="memPass" path="memPass" placeholder="비밀번호" maxlength="12" cssClass="form-control" />
									</div>
									<div class="hidden-xs col-sm-2 nopadding">
										<form:errors path="memPass" cssClass="label label-danger" delimiter="/"/>
									</div>
								</div>
								
								<div class="form-group lottemartdream w250">
									<label class="hidden-xs col-sm-4 control-label" for="saveId"></label>  
									<div class="col-xs-12 col-sm-6">
										<input type="checkbox" id="saveId" name="saveId"  /><span>&nbsp;아이디 저장</span>
										<button type="button" class="btn btn-success btn-font pull-right"  type="button" id="btnlogin">로그인</button>
									</div>
									<div class="hidden-xs  col-sm-2">
									</div>
								</div>
								
								<!-- Button Area -->
								<div class="row">
									<div class="hidden-xs  col-sm-4"></div>
									<div class="col-xs-12 col-sm-6 lottemartdream w250">
										<span>아직 회원이 아니신가요???</span>
										<button type="button" class="btn btn-primary btn-font pull-right"  type="button" id="btntojoin">회원가입</button>
									</div>
									<div class="hidden-xs  col-sm-2"></div>
								</div>
								 <br>
								<div class="row">
									<div class="hidden-xs  col-sm-4"></div>
									<div class="col-xs-12 col-sm-6 lottemartdream w250">
										<span>아이디나 비밀번호를 잊어버렸어요.</span>
									</div>
									<div class="hidden-xs  col-sm-2"></div>
								</div>
								<div class="row">
									<div class="hidden-xs col-sm-4"></div>
									<div class="col-xs-12 col-sm-6">
										<a class="btn btn-info btn-font pull-right"  href="/studymate/memberFindPass">비밀번호찾기</a>
										<a id="id_a"  class="btn btn-info btn-font pull-right"  href="/studymate/memberFindId">아이디찾기</a>
									</div>
									<div class="hidden-xs col-xm-2"></div>
								</div>
	
								<div class="col-xs-12">
									<hr>
								</div>
							</fieldset>
						</div>
						<!-- Button Area -->
						<footer id="con_footer">
							<div class="btndiv">
								<div class="pull-left">
									<button class="btn btn-info btn-font" id="btnback" type="button">뒤로</button>
									<button class="btn btn-primary btn-font" id="btntoindex" type="button">홈으로</button>
								</div>
							</div>
						</footer>
					</form:form>
				</article>
			</section>
			<!-- Hidden parameter -->
			<input type="hidden" id="boardid" value="member">
			<input type="hidden" id="boardtitle_client" value="로그인">
			<input type="hidden" id="boardinfo" value="Studymate에 오신걸 환영합니다">
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/Board.jsp" %>
			<%@include file="../common/Joinscript.jsp" %>
		</div>
	</body>
</html>