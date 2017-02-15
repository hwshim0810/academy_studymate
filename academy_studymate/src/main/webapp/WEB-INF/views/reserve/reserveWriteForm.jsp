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
			<section class="body center_align">
			<%@include file="../common/nav/AdminSubnav.jsp" %>
				<div class="boardtitle lottemartdream"></div>
				<article class="resInfo">
					<div class="container col-xs-12">
				    	<div class="jumbotron">
						    <h3>안내사항</h3>      
						    <p>관리자 예약추가 주의사항</p>
						</div>
						<p class="infoP"><span class="badge">1</span> 이용요금은 현장결제입니다.</p>      
						<p class="infoP"><span class="badge">2</span> 예약정보는 예약확인시 이용되니 정확히 입력바랍니다.</p>
						<p class="infoP margin_btm"><span class="badge">3</span> 예약내역은 [예약관리]에서 확인가능합니다.</p> 
					</div>
				</article>
				<article>
					<form:form id="resForm" method="POST" commandName="resDto" action="/studymate/reserveWrite">
						<table class="table">
							<tr>
								<td><label>아이디</label></td>
								<td>${sessionScope.memId}</td>
								<td><input type="hidden" name="memId" value="${sessionScope.memId}" /></td>
							</tr>
							<tr>
								<td><label for="memName">예약자명</label></td>
								<td><form:input path="memName" placeholder="예약자명" maxlength="10"/></td>
								<td><form:errors path="memName" /></td>
							</tr>
							<tr>
								<td><label for="memEmail">Email</label></td>
								<td><form:input path="memEmail" placeholder="예)exam@exam.com" maxlength="30"/></td>
								<td><form:errors path="memEmail" /></td>
							</tr>
							<tr>
								<td><label>안내메일 수신여부</label></td>
								<td><input type="checkbox" name='mailCheck'  value="OK"></td>
								<td></td>
							</tr>
							<tr>
								<td><label for="borNum">예약지점</label></td>
								<td>
									<select name="borNum" id="borselect">
										<c:forEach var="rooms" items="${rooms}">
											<option value="${rooms.borNum}">${rooms.borName}</option>
										</c:forEach>
									</select>
									<input type="hidden" name="borName"  id="roomName" value="" />
								</td>
							</tr>
							<tr>
								<td><label for="resDate">예약일</label></td>
								<td><form:input class="date" path="resDate"/></td>
								<td><form:errors path="resDate" /></td>
							</tr>
							<tr>
								<td><label for="resVisit">방문예정시간</label></td>
								<td><form:input id="resVisit" path="resVisit"/></td>
								<td><form:errors path="resVisit" /></td>
							</tr>
							<tr>
								<td><label for="resTime">이용예정시간</label></td>
								<td><input type="number" name="resTime" min="1" max="12"  />시간</td>
								<td></td>
							</tr>
							<tr>
								<td><label for="resCount">예약인원</label></td>
								<td><input type="number" name="resCount" min="1" max="10"  />명</td>
								<td></td>
							</tr>
						</table>
						<br><br>
						<hr>
						<!-- Button Area -->
						<footer id="con_footer">
							<div class="btndiv">
								<div class="pull-right">
									<button class="btn btn-success btn-font" type="button" id="btnres_unselect">예약</button>
								</div>
								<div class="pull-left">
									<button class="btn btn-primary btn-font" type="button" id="btnlist">목록</button>
								</div>
							</div>
						</footer>
					</form:form>
				</article>
			</section>
			<input type="hidden" id="boardid" value="reserve">
			<input type="hidden" id="boardtitle" value="지점관리">
			<input type="hidden" id="boardsubtitle" value="예약추가">
			<input type="hidden" id="boardinfo" value="관리자권한의 예약추가입니다">
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/loadscript/Board.jsp" %>
		</div>
	</body>
</html>