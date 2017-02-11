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
		<!-- 관리자 여부로 서브메뉴 구분필요 -->
			<c:if test="${sessionScope.memId eq 'admin'}">
				<%@include file="../common/AdminSubnav.jsp" %>
			</c:if>
			<div class="boardtitle lottemartdream"></div>
			<article class="resInfo">
				<div class="container col-xs-12">
			    	<div class="jumbotron">
					    <h3>회원정보찾기</h3>      
					    <p class='hidden-xs'>아이디 / 비밀번호 찾기</p>
					</div>
				</div>
			</article>
			<article>
				<form:form id="findIdForm" class="form-horizontal" method="POST" commandName="findIdDto" action="${pageContext.request.contextPath}/memberFindId">
					<div class="container col-xs-12">
						<fieldset>
							<!-- Form Name -->
							<legend class="sr-only">아이디 찾기</legend>
							<div class="col-xs-12">
								<h3>아이디 찾기</h3>
								<p>가입시 입력한 이름과 Email을 입력해주세요</p>
								<hr>
							</div>
							<div class="form-group">
								<label class="col-xs-4 control-label" for="memName">이름</label>  
								<div class="col-xs-6">
									<form:input path="memName" placeholder="이름" maxlength="10" cssClass="form-control" />
								</div>
								<div class="col-xs-2">
									<form:errors path="memName" />
								</div>
							</div>
							<div class="form-group">
							<label class="col-xs-4 control-label" for="memEmail">Email</label>  
							<div class="col-xs-6">
								<form:input id="memEmail" path="memEmail" placeholder="예)exam@exam.com" maxlength="20" cssClass="form-control" />
							</div>
							<div class="col-xs-2">
								<form:errors path="memEmail" />
							</div>
							</div>
							<div class="col-xs-12">
								<button class="btn btn-success btn-font pull-right" id="btnfindid" type="button">찾기</button>
							</div>
							</fieldset>
						</div>
				</form:form>
				<form:form id="findPassForm" class="form-horizontal" method="POST" commandName="findPassDto" action="${pageContext.request.contextPath}/memberFindPass">
					<div class="container col-xs-12">
						<fieldset>
							<!-- Form Name -->
							<legend class="sr-only">비밀번호 찾기</legend>
							<div class="col-xs-12">
								<h3>비밀번호 찾기</h3>
								<p>아이디, 이름, Email을 입력해주세요</p>
								<hr>
							</div>
							<div class="form-group">
								<label class="col-xs-4 control-label" for="memId">아이디</label>  
								<div class="col-xs-6">
									<form:input path="memId" placeholder="아이디" maxlength="11" cssClass="form-control" />
								</div>
								<div class="col-xs-2">
									<form:errors path="memId" />
								</div>
							</div>							
							<div class="form-group">
								<label class="col-xs-4 control-label" for="memName">이름</label>  
								<div class="col-xs-6">
									<form:input path="memName" placeholder="이름" maxlength="10" cssClass="form-control" />
								</div>
								<div class="col-xs-2">
									<form:errors path="memName" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-4 control-label" for="memEmail">Email</label>  
								<div class="col-xs-6">
									<form:input id="memEmail" path="memEmail" placeholder="예)exam@exam.com" maxlength="20" cssClass="form-control" />
								</div>
								<div class="col-xs-2">
									<form:errors path="memEmail" />
								</div>
							</div>
							<div class="col-xs-12">
								<button class="btn btn-success btn-font pull-right" id="btnfindpass" type="button">찾기</button>
							</div>
							<div class="col-xs-12">
								<hr>
							</div>
						</fieldset>
					</div>
				</form:form>
				<!-- Button Area -->
				<footer id="con_footer">
					<div class="btndiv">
						<div class="pull-right">
						</div>
						<div class="pull-left">
							<button class="btn btn-info btn-font" id="btnback"  type="button">뒤로</button>
						</div>
					</div>
				</footer>
			</article>
		</section>
		<input type="hidden" id="boardid" value="member">
		<input type="hidden" id="boardtitle_client" value="로그인">
		<input type="hidden" id="boardsubtitle" value="회원정보찾기">
		<input type="hidden" id="client_page" value="${pageContext.request.contextPath}/login">
		<!-- 관리자와 구분필요 -->
		<%@include file="../common/JoinFooter.jsp" %>
		<%@include file="../common/Board.jsp" %>
		<%@include file="../common/Joinscript.jsp" %>
	</body>
</html>