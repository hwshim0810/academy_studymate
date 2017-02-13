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
			<section class="body_high center_align">
				<c:if test="${sessionScope.memId eq 'admin'}">
					<%@include file="../common/AdminSubnav.jsp" %>
				</c:if>
				<div class="boardtitle lottemartdream"></div>
				<article class="resInfo">
					<div class="container col-xs-12">
				    	<div class="jumbotron">
						    <h3>안내사항</h3>      
						    <p>예약에 관한 주의사항을 알려드립니다.</p>
						</div>
						<p class="infoP"><span class="badge">1</span> 이용요금은 현장결제입니다.</p>      
						<p class="infoP"><span class="badge">2</span> 예약정보는 예약확인시 이용되니 정확히 입력바랍니다.</p>
						<p class="infoP margin_btm"><span class="badge">3</span> 예약내역은 [마이페이지]에서 확인가능합니다.</p> 
					</div>
				</article>
				<article>
					<form:form id="resForm" class="form-horizontal" method="POST" commandName="reserveDto" action="${pageContext.request.contextPath}/reserveWrite">
						<div class="container col-xs-12">
							<fieldset>
								<!-- Form Name -->
								<legend class="sr-only">지점예약</legend>
								<div class="col-xs-12">
									<h3>예약정보 입력</h3>
									<hr>
								</div>
								<div class="form-group">
									<label class="col-xs-4 control-label" for="memId">아이디</label>  
									<div class="col-xs-6">
										<form:input path="memId" placeholder="아이디" readonly="true" cssClass="form-control" value="${sessionScope.memId}" />
									</div>
									<div class="col-xs-2">
									</div>
								</div>
								<div class="form-group">
									<label class="col-xs-4 control-label" for="memName">예약자명</label>  
									<div class="col-xs-6">
										<form:input path="memName" placeholder="예약자명" maxlength="10" cssClass="form-control" />
									</div>
									<div class="col-xs-2">
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-4"></div>
									<div class="col-xs-8"><form:errors path="memName" delimiter="/" cssClass="label label-danger"/></div>
								</div>
								<div class="form-group">
									<label class="col-xs-4 control-label" for="memEmail">Email</label>  
									<div class="col-xs-6">
										<form:input path="memEmail" placeholder="예)exam@exam.com" cssClass="form-control" maxlength="20"/>
									</div>
									<div class="col-xs-2">
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-4"></div>
									<div class="col-xs-8"><form:errors path="memEmail" delimiter="/" cssClass="label label-danger"/></div>
								</div>
								<div class="form-group">
									<label class="col-xs-4 control-label" >안내메일 수신여부</label>  
									<div class="col-xs-6">
										<input type="checkbox" name='mailCheck' checked="checked" value="OK">&nbsp;
										체크시 발송됩니다.
									</div>
									<div class="col-xs-2">
									</div>
								</div>
								<div class="form-group">
									<label class="col-xs-4 control-label" for="borName">예약지점명</label>  
									<div class="col-xs-6">
										<form:input path="borName" readonly="true" maxlength="30" value="${borName}" cssClass="form-control"/>
										<form:hidden path="borNum" value="${borNum}"/>
									</div>
									<div class="col-xs-2">
										<form:errors path="borName" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-xs-4 control-label" for="resDate">예약날짜</label>  
									<div class="col-xs-6">
										<form:input path="resDate" placeholder="예약날짜" cssClass="form-control date" />
									</div>
									<div class="col-xs-2">
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-4"></div>
									<div class="col-xs-8"><form:errors path="resDate" delimiter="/" cssClass="label label-danger"/></div>
								</div>
								<div class="form-group">
									<label class="col-xs-4 control-label" for="resVisit">방문예정시간</label>  
									<div class="col-xs-6">
										<form:input path="resVisit" cssClass="form-control" id="resVisit" />
									</div>
									<div class="col-xs-2">
										<form:errors path="resVisit" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-xs-4 control-label" for="resTime">이용예정시간</label>  
									<div class="col-xs-6">
										<input type="number" name="resTime" min="1" max="12"  value="1" />&nbsp;시간
									</div>
									<div class="col-xs-2">
									</div>
								</div>
								<div class="form-group">
									<label class="col-xs-4 control-label" for="resCount">예약인원</label>  
									<div class="col-xs-6">
										<input type="number" name="resCount" min="1" max="10"  value="1" />&nbsp;명
									</div>
									<div class="col-xs-2">
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
									<button class="btn btn-success btn-font" id="btnres">예약</button>
								</div>
								<div class="pull-left">
									<c:choose>
										<c:when test="${sessionScope.memId eq 'admin'}">
											<button class="btn btn-primary btn-font"  type="button"  id="btnlist">목록</button>
											<button class="btn btn-info btn-font" id="btnback">뒤로</button>
											<input type="hidden" id="boardid" value="reserve">
											<input type="hidden" id="boardtitle" value="예약관리">
											<input type="hidden" id="boardsubtitle" value="예약추가">
										</c:when>
										<c:otherwise>
											<button class="btn btn-info btn-font" id="btnback">뒤로</button>
											<input type="hidden" id="boardid" value="room">
											<input type="hidden" id="boardtitle" value="지점소개">
											<input type="hidden" id="boardsubtitle" value="지점예약">
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</footer>
					</form:form>
				</article>
			</section>
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/Board.jsp" %>
		</div>
	</body>
</html>