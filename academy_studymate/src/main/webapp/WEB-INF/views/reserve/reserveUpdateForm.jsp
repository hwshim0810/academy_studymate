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
			<article>
				<form:form name = "updateform" action="/studymate/qnaUpdate/${currentPage}-${resDto.resNum}" method="post" commandName="resDto">
					<table class="table">
						<tr>
							<td><label>회원ID</label></td>
							<td>${resDto.memId}</td>
							<td></td>
						</tr>
						<tr>
							<td><label>Email</label></td>
							<td><form:input path="memEmail" placeholder="exam@exam.com" maxlength="30" value="${resDto.memEmail}" /></td>
							<td><form:errors path="memEmail" /></td>
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
					<!-- 수정요망 -->
					<input type="hidden" name="memId" value="${resDto.memId}" />
					<input type="hidden" name="borName" id="resborName" value="${resDto.borName}" />
					<br><br>
					<hr>
					<!-- Button Area -->
					<footer id="con_footer">
						<div class="btndiv">
							<div class="pull-right">
								<button class="btn btn-success btn-font" id="btnreg">수정</button>
							</div>
							<div class="pull-left">
								<button class="btn btn-primary btn-font" id="btnlist">목록</button>
							</div>
						</div>
					</footer>
				</form:form>
			</article>
		</section>
		<input type="hidden" id="boardtitle" value="예약관리">
		<input type="hidden" id="boardid" value="reserve">
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
	</body>
</html>