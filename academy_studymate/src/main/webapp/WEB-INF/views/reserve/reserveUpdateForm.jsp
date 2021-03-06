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
			<section class="body_high center_align">
				<c:if test="${sessionScope.memId eq 'admin' }">
					<%@include file="../common/nav/AdminSubnav.jsp" %>
				</c:if>
				<article>
					<div class="boardtitle lottemartdream"></div>
					<form:form name = "updateform" action="${pageContext.request.contextPath}/reserveUpdate/${currentPage}-${resDto.resNum}" method="post" commandName="resDto">
						<table class="table">
							<tr>
								<td><label>회원ID</label></td>
								<td>${resDto.memId}</td>
								<td><input type="hidden" name="memId" value="${resDto.memId}" /></td>
							</tr>
							<tr>
								<td><label for="memName">예약자명</label></td>
								<td><form:input path="memName" placeholder="예약자명" readonly="true" maxlength="10" value="${resDto.memName}"/></td>
								<td><form:errors path="memName" /></td>
							</tr>
							<tr>
								<td><label>Email</label></td>
								<td><form:input path="memEmail" placeholder="exam@exam.com" readonly="true" maxlength="30" value="${resDto.memEmail}" /></td>
								<td><form:errors path="memEmail" /></td>
							</tr>
							<tr>
								<td><label for="borName">예약지점</label></td>
								<td>
									<form:input path="borName" id="resborName" value="${resDto.borName}" cssClass="form-control" readonly="true" />
								</td>
							</tr>
							<tr>
								<td><label for="resDate">예약일</label></td>
								<td><form:input id="resDate" path="resDate" value="${resDto.resDate}"/></td>
								<td><form:errors path="resDate" /></td>
							</tr>
							<tr>
								<td><label for="resVisit">방문예정시간</label></td>
								<td><form:input id="resVisit" path="resVisit" value="${resDto.resVisit}"/></td>
								<td><form:errors path="resVisit" /></td>
							</tr>
							<tr>
								<td><label for="resTime">이용예정시간</label></td>
								<td><input type="number" name="resTime" min="1" max="12"  value="${resDto.resTime}" /></td>
								<td></td>
							</tr>
							<tr>
								<td><label for="resCount">예약인원</label></td>
								<td><input type="number" name="resCount" min="1" max="10"  value="${resDto.resCount}"/></td>
								<td></td>
							</tr>
						</table>
						<br><br>
						<hr>
						<!-- Button Area -->
						<footer id="con_footer">
							<div class="btndiv">
								<div class="pull-right">
									<input type="submit" class="btn btn-success btn-font" value="수정">
								</div>
								<div class="pull-left">
									<c:if test="${sessionScope.memId eq 'admin'}">
										<button class="btn btn-primary btn-font" id="btnlist" type="button">목록</button>
									</c:if>
									<button class="btn btn-info btn-font" id="btnback" type="button">뒤로</button>
								</div>
							</div>
						</footer>
					</form:form>
				</article>
			</section>
			<c:choose>
				<c:when test="${sessionScope.memId eq 'admin' }">
					<input type="hidden" id="boardid" value="reserve">
					<input type="hidden" id="boardtitle" value="예약관리">
					<input type="hidden" id="boardsubtitle" value="예약수정">
					<input type="hidden" id="boardinfo" value="관리자권한의 예약수정입니다">
				</c:when>
				<c:otherwise>
					<input type="hidden" id="boardid" value="reserve">
					<input type="hidden" id="client_page" value="memberMypage">
					<input type="hidden" id="boardtitle_client" value="마이페이지">
					<input type="hidden" id="boardsubtitle" value="예약수정">
					<input type="hidden" id="boardinfo" value="예약전일까지 수정가능합니다">
				</c:otherwise>
			</c:choose>
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/loadscript/Board.jsp" %>
		</div>
	</body>
</html>