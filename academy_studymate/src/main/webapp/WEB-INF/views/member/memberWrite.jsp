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
			<section class="body_higher center_align">
			<!-- 관리자 여부로 서브메뉴 구분필요 -->
				<c:if test="${sessionScope.memId eq 'admin'}">
					<%@include file="../common/AdminSubnav.jsp" %>
				</c:if>
				<div class="boardtitle lottemartdream"></div>
				<article class="resInfo">
					<div class="container col-xs-12">
				    	<div class="jumbotron">
						    <h3>환영합니다</h3>      
						    <p class='hidden-xs'>가입 후 모든 서비스를 이용할 수 있습니다.</p>
						</div>
						<p class="infoP"> <strong class="text-danger">* 가 붙은 입력란은 필수입력입니다.</strong></p>      
					</div>
				</article>
				<article>
					<form:form id="memForm" class="form-horizontal" method="POST" commandName="memberDto" action="${pageContext.request.contextPath}/memberWrite">
						<div class="container col-xs-12">
							<fieldset>
								<!-- Form Name -->
								<legend class="sr-only">회원가입</legend>
								<div class="col-xs-12">
									<h3>사이트 이용정보 입력</h3>
									<hr>
								</div>
								<div class="form-group mzbzero">
									<label class="col-xs-4 control-label" for="memId">*아이디</label>  
									<div class="col-xs-6">
										<div class="input-group">
											 <form:input path="memId" id="memId" placeholder="아이디" readonly="true" cssClass="form-control" />
											 <div class="input-group-btn">
												 <a class="btn btn-default" id="btnid"><i title="아이디검색" class="glyphicon glyphicon-search"></i></a>
											 </div>
										</div>
									</div>
									<div class="col-xs-2">
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-4"></div>
									<div class="col-xs-6">
										<form:errors path="memId" cssClass="label label-danger" delimiter="/"/>
									</div>
									<div class="col-xs-2"></div>
								</div>
								<div class="form-group" >
									<div class="col-xs-4"></div>
									<div class="col-xs-6">
										 <span class="help-block pull-left">알파벳으로 시작/알파벳,숫자 혼용 5~11자 가능</span>
									</div>
									<div class="col-xs-2"></div>
								</div>
								<div class="form-group mzbzero">
									<label class="col-xs-4 control-label" for="memPass">*비밀번호</label>  
									<div class="col-xs-6">
										<form:password id="memPass" path="memPass" placeholder="비밀번호" maxlength="12" cssClass="form-control" />
										<span class="help-block">비밀번호 6~12자 가능</span>
									</div>
									<div class="col-xs-2">
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-4"></div>
									<div class="col-xs-6">
										<form:errors path="memPass" cssClass="label label-danger" delimiter="/"/>
									</div>
									<div class="col-xs-2"></div>
								</div>
								<div class="form-group" >
									<label class="col-xs-4 control-label" for="memPassConfirm">*비밀번호확인</label>  
									<div class="col-xs-6">
										<input type="password"  id="memPassConfirm" placeholder="비밀번호확인" maxlength="12"  class="form-control" />
									</div>
									<div class="col-xs-2">
									</div>
								</div>
								<div class="form-group" >
									<div class="col-xs-6 msgbox" id="passMsg">
									</div>
									<div class="col-xs-6 msgbox" id="lengthmsg">
										<span class="label label-success pull-left" >패스워드길이:</span>
									</div>
								</div>
								<div class="col-xs-12">
									<h3>개인정보 입력</h3>
									<hr>
								</div>
								<div class="form-group">
									<label class="col-xs-4 control-label" for="memName">*이름</label>  
									<div class="col-xs-6">
										<form:input path="memName" placeholder="이름" maxlength="10" cssClass="form-control" />
									</div>
									<div class="col-xs-2">
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-4"></div>
									<div class="col-xs-6">
										<form:errors path="memName" cssClass="label label-danger" delimiter="/"/>
									</div>
									<div class="col-xs-2"></div>
								</div>
								<div class="form-group">
									<label class="col-xs-4 control-label" for="memAddr">*주소</label>  
									<div class="col-xs-6">
										<form:input path="memAddr" id="addr" placeholder="주소" cssClass="form-control" readonly="true"/>
										<button type="button" class="btn btn-default"  id="btnaddr" >주소찾기</button>
									</div>
									<div class="col-xs-2">
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-4"></div>
									<div class="col-xs-6">
										<form:errors path="memAddr" cssClass="label label-danger" delimiter="/"/>
									</div>
									<div class="col-xs-2"></div>
								</div>
								<div class="form-group">
									<label class="col-xs-4 control-label" for="detailaddr">*상세주소</label>  
									<div class="col-xs-6">
										<form:input path="memArea" id="detailaddr" placeholder="상세주소" cssClass="form-control" maxlength="20"/>
									</div>
									<div class="col-xs-2">
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-4"></div>
									<div class="col-xs-6">
										<form:errors path="memArea" cssClass="label label-danger" delimiter="/"/>
									</div>
									<div class="col-xs-2"></div>
								</div>
								<div class="form-group">
									<label class="col-xs-4 control-label" for="memEmail">*Email</label>  
									<div class="col-xs-6">
										<form:input path="memEmail" placeholder="예)exam@exam.com" cssClass="form-control" maxlength="20"/>
									</div>
									<div class="col-xs-2">
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-4"></div>
									<div class="col-xs-6">
										<form:errors path="memEmail" cssClass="label label-danger" delimiter="/" />
									</div>
									<div class="col-xs-2"></div>
								</div>
								<div class="form-group">
									<label class="col-xs-4 control-label" for="memSex">성별</label>  
									<div class="col-xs-6">
										<form:radiobutton path="memSex" value="남자" label="남자"/>
										<form:radiobutton path="memSex" value="여자" label="여자"/>
									</div>
									<div class="col-xs-2">
										<form:errors path="memSex" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-xs-4 control-label" for="memBirth">생년월일</label>  
									<div class="col-xs-6">
										<form:input path="memBirth" cssClass="form-control birthdate" readonly="true" />
									</div>
									<div class="col-xs-2">
										<form:errors path="memBirth" />
									</div>
								</div>
								<div class="col-xs-12">
									<hr>
								</div>
							</fieldset>
						</div>
						<!-- Button Area -->
						<footer id="con_footer">
							<div class="btndiv">
								<div class="pull-right">
									<button class="btn btn-success btn-font" id="btnrwrite">가입</button>
								</div>
								<div class="pull-left">
									<button class="btn btn-info btn-font" id="btnback"  type="button">뒤로</button>
								</div>
							</div>
						</footer>
					</form:form>
				</article>
			</section>
			<input type="hidden" id="boardid" value="member">
			<input type="hidden" id="boardtitle_client" value="회원가입">
			<input type="hidden" id="boardinfo" value="Studymate의 모든 서비스를 이용해보세요">
			<!-- 관리자와 구분필요 -->
			<%@include file="../common/JoinFooter.jsp" %>
			<%@include file="../common/Board.jsp" %>
			<%@include file="../common/Joinscript.jsp" %>
		</div>
	</body>
</html>