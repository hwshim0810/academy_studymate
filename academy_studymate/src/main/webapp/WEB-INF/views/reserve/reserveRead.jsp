<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<%@include file="../common/AdminSubnav.jsp" %>
			<div class="boardtitle lottemartdream"></div>
			<article id="contents">
				<header id="con_header" class="col-xs-12">
					<h2 class="normal w300 subsize">${resDto.memId} 님의 예약</h2>
					<div class="dtoinfo">
						예약일 <strong>${resDto.resRegdate}</strong>&nbsp;예약번호 <strong>${resDto.resNum}</strong>
					</div>
				</header>
				<br><br><br>
				<article class="main">
					<table class="table">
						<tr>
							<td><label>회원ID</label></td>
							<td>${resDto.memId}</td>
						</tr>
						<tr>
							<td><label>예약자명</label></td>
							<td>${resDto.memName}</td>
						</tr>
						<tr>
							<td><label>예약 Email</label></td>
							<td>${resDto.memEmail}</td>
						</tr>
						<tr>
							<td><label>예약지점</label></td>
							<td>${resDto.borName}</td>
						</tr>
						<tr>
							<td><label>이용예정일</label></td>
							<td>${resDto.resDate}</td>
						</tr>
						<tr>
							<td><label>방문예정시간</label></td>
							<td>${resDto.resVisit}</td>
						</tr>
						<tr>
							<td><label>이용예정시간</label></td>
							<td>${resDto.resTime}</td>
						</tr>
						<tr>
							<td><label>예약인원</label></td>
							<td>${resDto.resCount}</td>
						</tr>
						<tr>
							<td><label>예약일자</label></td>
							<td>${resDto.resRegdate}</td>
						</tr>
					</table>
				</article>
				<br><br>
				<hr>
				<!-- Button Area -->
				<footer id="con_footer">
					<div class="btndiv">
						<div class="pull-right">
							<c:if test="${sessionScope.memId eq 'admin'}">
								<button class="btn btn-warning btn-font btn-read"   id="btnupdate">수정</button>
								<button class="btn btn-danger btn-font btn-read"  id="btndelete">삭제</button>
							</c:if>
						</div>
						<%@include file="../common/boardBtn/ReadBtn.jsp"%>
					</div>
				</footer>
			</article>
		</section>
		<!-- Hidden parameter -->
		<input type="hidden" id="boardid" value="reserve">
		<input type="hidden" id="boardtitle" value="예약정보">
		<input type="hidden" id="boardsubtitle" value="${resDto.resNum}번 예약">
		<input type="hidden" id="boardupdate" value="${updateUrl}">
		<input type="hidden" id="boarddelete" value="${deleteUrl}">
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
	</body>
</html>