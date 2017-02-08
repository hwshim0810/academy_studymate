<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<article id="contents">
				<header id="con_header" class="col-xs-12">
					<h2 class="normal w300 subsize">${memDto.memId} 님의 정보</h2>
					<div class="dtoinfo">
						가입일 <strong>${memDto.memRegdate}</strong>&nbsp;탈퇴여부 <strong>${memDto.memSiteout}</strong>
					</div>
				</header>
				<br><br><br>
				<article class="main">
					<table class="table">
						<tr>
							<td><label>회원ID</label></td>
							<td>${memDto.memId}</td>
						</tr>
						<tr>
							<td><label>회원이름</label></td>
							<td>${memDto.memName}</td>
						</tr>
						<tr>
							<td><label>회원성별</label></td>
							<td>${memDto.memSex}</td>
						</tr>
						<tr>
							<td><label>회원생일</label></td>
							<td>${memDto.memBirth}</td>
						</tr>
						<tr>
							<td><label>회원주소</label></td>
							<td>${memDto.memAddr}</td>
						</tr>
						<tr>
							<td><label>상세주소</label></td>
							<td>${memDto.memArea}</td>
						</tr>
						<tr>
							<td><label>회원Email</label></td>
							<td>${memDto.memEmail}</td>
						</tr>
						<tr>
							<td><label>탈퇴여부</label></td>
							<td>${memDto.memSiteout}</td>
						</tr>
						<tr>
							<td><label>가입일</label></td>
							<td>${memDto.memRegdate}</td>
						</tr>
					</table>
				</article>
			<br><br>
			<hr>
			<!-- Button Area -->
			<footer id="con_footer">
				<div class="btndiv">
					<%@include file="../common/boardBtn/ReadBtn_updel.jsp" %>			
					<div class="pull-right">
						<c:url value="/memberList/${currentPage}" var="listUrl">
							<c:if test="${not empty param.keyField && not empty param.keyWord}">
								<c:param name="keyField" value="${param.keyField}" />
								<c:param name="keyWord" value="${param.keyWord}" />
							</c:if>
						</c:url>
						<a class="btn btn-primary btn-font" href="${listUrl}">목록</a>
					</div>
				</div>
			</footer>
			</article>
		</section>
		<!-- Hidden parameter -->
		<input type="hidden" id="boardtitle" value="회원관리">
		<input type="hidden" id="boardid" value="member">
		<input type="hidden" id="boardupdate" value="/${currentPage}-${memDto.memId}">
		<input type="hidden" id="realdelete" value="/${currentPage}/?memId=${memDto.memId}">
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
	</body>
</html>