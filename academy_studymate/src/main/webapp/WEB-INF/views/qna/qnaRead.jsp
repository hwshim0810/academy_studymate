<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<%@include file="../common/BoardSubnav.jsp" %>
				<div class="boardtitle lottemartdream"></div>
				<article id="contents">
					<header id="con_header" class="col-xs-12">
						<h2 class="normal w300 subsize">${qnaDto.boqTitle}</h2>
						<div class="dtoinfo">
							작성일 <strong>${qnaDto.boqRegdate}</strong>&nbsp;조회수 <strong>${qnaDto.boqReadcount}</strong>
						</div>
					</header>
					<article class="main">
						${qnaDto.boqContent}
					</article>
					<br><br>
					<hr>
					<!-- Button Area -->
					<footer id="con_footer">
						<div class="btndiv">
							<div class="pull-right">
								<c:if test="${sessionScope.memId eq qnaDto.memId}">
									<button class="btn btn-warning btn-font btn-read"   id="btnupdate">수정</button>
									<button class="btn btn-danger btn-font btn-read"  id="btndelete">삭제</button>
								</c:if>
								<c:if test="${qnaDto.boqLev == 0 and sessionScope.memId eq 'admin' and commentCount == 1}">
									<button class="btn btn-info btn-font" id="btncomment">답글</button>
								</c:if>
							</div>
							<%@include file="../common/boardBtn/ReadBtn.jsp"%>
						</div>
					</footer>
				</article>
			</section>
			<!-- Hidden parameter -->
			<input type="hidden" id="boardid" value="qna">
			<input type="hidden" id="boardtitle" value="QnA">
			<input type="hidden" id="boardsubtitle" value="${qnaDto.boqNum}번 글">
			<input type="hidden" id="boardupdate" value="${updateUrl}">
			<input type="hidden" id="boarddelete" value="${deleteUrl}">
			<input type="hidden" id="boardcomment" value="${commentUrl}">
			<input type="hidden" id="boardinfo" value="궁금한점이 있다면 문의주세요">
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/Board.jsp" %>
		</div>
	</body>
</html>