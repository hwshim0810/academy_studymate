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
			<div class="body_top">
			</div>
			<section class="body center_align">
				<%@include file="../common/AdminSubnav.jsp" %>
				<div class="boardtitle lottemartdream"></div>
				<article id="contents">
					<header id="con_header" class="col-xs-12">
						<h2 class="normal w300 subsize">${memDto.memId} 님의 정보</h2>
						<div>
							가입일 <strong>${memDto.memRegdate}</strong>&nbsp;탈퇴여부 <strong>${memDto.memSiteout}</strong>
						</div>
					</header>
					<br><br><br>
					<article class="main">
						<form:form id="memForm" class="form-horizontal" method="POST" commandName="memDto" action="${pageContext.request.contextPath}/memberUpdate/${currentPage}">
							<fieldset>
								<!-- Form Name -->
								<legend class="sr-only">회원정보수정</legend>
								<div class="col-xs-12">
									<h2>정보 수정</h2>
									<br><hr>
								</div>
								<div class="form-group mzbzero">
									<label class="col-xs-4 control-label" for="memId">아이디</label>  
									<div class="col-xs-6">
										<form:input path="memId" value="${memDto.memId}" readonly="true" cssClass="form-control"/>
									</div>
									<div class="col-xs-2">
									</div>
								</div>
								<div class="col-xs-12">
									<h2>개인정보</h2>
									<br><hr>
								</div>
								<div class="form-group">
									<label class="col-xs-4 control-label" for="memName">이름</label>  
									<div class="col-xs-6">
										<form:input path="memName" placeholder="이름" value="${memDto.memName}" readonly="true" maxlength="10" cssClass="form-control" />
									</div>
									<div class="col-xs-2">
										<form:errors path="memName" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-xs-4 control-label" for="memAddr">주소</label>  
									<div class="col-xs-6">
										<form:input path="memAddr" id="addr" value="${memDto.memAddr}" placeholder="주소" cssClass="form-control" readonly="true"/>
										<button type="button" class="btn btn-default pull-left"  id="btnaddr" >주소찾기</button>
									</div>
									<div class="col-xs-2">
										<form:errors path="memAddr" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-xs-4 control-label" for="detailaddr">상세주소</label>  
									<div class="col-xs-6">
										<form:input path="memArea" id="detailaddr" value="${memDto.memArea}" placeholder="상세주소" cssClass="form-control" maxlength="20"/>
									</div>
									<div class="col-xs-2">
										<form:errors path="memArea" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-xs-4 control-label" for="memEmail">Email</label>  
									<div class="col-xs-6">
										<form:input path="memEmail" value="${memDto.memEmail}" placeholder="예)exam@exam.com" cssClass="form-control" maxlength="20"/>
									</div>
									<div class="col-xs-2">
										<form:errors path="memEmail" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-xs-4 control-label" for="memSex">성별</label>  
									<div class="col-xs-6">
										<c:choose>
											<c:when test="${memDto.memSex eq '남자'}">
												<span class="pull-left"><form:radiobutton path="memSex" checked="true" value="남자" label="남자" /></span>
											</c:when>
											<c:otherwise>
												<span class="pull-left"><form:radiobutton path="memSex" checked="true" value="여자" label="여자"/></span>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="col-xs-2">
										<form:errors path="memSex" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-xs-4 control-label" for="memBirth">생년월일</label>  
									<div class="col-xs-6">
										<c:choose>
											<c:when test="${not empty memDto.memBirth}">
												<form:input path="memBirth" value="${memDto.memBirth}" cssClass="form-control birthdate" readonly="true" />
											</c:when>
											<c:otherwise>
												<form:input path="memBirth" cssClass="form-control birthdate" readonly="true" />
											</c:otherwise>
										</c:choose>
									</div>
									<div class="col-xs-2">
										<form:errors path="memBirth" />
									</div>
								</div>
							</fieldset>
							<!-- Button Area -->
							<footer id="con_footer">
								<div class="btndiv">
									<div class="pull-right">
										<c:if test="${sessionScope.memId eq 'admin'}">
											<button class="btn btn-warning btn-font btn-read" >수정</button>
										</c:if>
									</div>
									<%@include file="../common/boardBtn/ReadBtn.jsp"%>
								</div>
							</footer>
						</form:form>
					</article>
					<br><br>
					<hr>
				</article>
			</section>
			<!-- Hidden parameter -->
			<input type="hidden" id="boardid" value="member">
			<input type="hidden" id="boardtitle" value="회원관리">
			<input type="hidden" id="boardsubtitle" value="${memDto.memId}님">
			<input type="hidden" id="boardupdate" value="${updateUrl}">
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/Board.jsp" %>
		</div>
	</body>
</html>