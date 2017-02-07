<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="../common/Head.jsp" %>
	</head>
	<body>
		<%@include file="../common/Header.jsp" %>
		<div class="body_top">
		</div>
		<section class="body center_align">
		<%@include file="../common/AdminSubnav.jsp" %>
			<div class="boardtitle lottemartdream"></div>
			<article class="resInfo">
				<div class="container">
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
				<form:form id="resForm" method="POST" commandName="resDto" action="/studymate/reserveWrite">
					<table class="table">
						<tr>
							<td><label>아이디</label></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td><label for="borName">예약지점</label></td>
							<td>
								<select name="borNum" id="borselect">
									<c:forEach var="rooms" items="${rooms}">
										<option value="${rooms.borNum}">${rooms.borName}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td><label for="resDate">예약일</label></td>
							<td><form:input id="resDate" path="resDate"/></td>
							<td><form:errors path="resDate" /></td>
						</tr>
						<tr>
							<td><label for="resTime">예약시간</label></td>
							<td><form:input id="resTime" path="resTime"/></td>
							<td><form:errors path="resTime" /></td>
						</tr>
						<tr>
							<td><label for="resCount">예약인원</label></td>
							<td><input type="number" name="resCount" min="1" max="10"  /></td>
							<td></td>
						</tr>
					</table>
					<!-- 수정요망 -->
					<input type="hidden" name="memId" value="admin" />
					<input type="hidden" name="borName" id="resborName" value="" />
					<br><br>
					<hr>
					<!-- Button Area -->
					<footer id="con_footer">
						<div class="btndiv">
							<div class="pull-right">
								<button class="btn btn-success btn-font" id="btnres">예약</button>
							</div>
							<div class="pull-left">
								<button class="btn btn-primary btn-font" id="btnlist">목록</button>
							</div>
						</div>
					</footer>
				</form:form>
			</article>
		</section>
		<input type="hidden" id="boardtitle" value="예약하기">
		<input type="hidden" id="boardid" value="reserve">
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
	</body>
</html>