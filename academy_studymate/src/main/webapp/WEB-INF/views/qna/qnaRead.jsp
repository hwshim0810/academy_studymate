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
					<div class="pull-left">
						<button class="btn btn-warning btn-font" id="btnupdate">수정</button>
						<button class="btn btn-danger btn-font" id="btndelete">삭제</button>
						<c:if test="${qnaDto.boqLev == 0}">
							<button class="btn btn-info btn-font" id="btncomment">답글</button>
						</c:if>
					</div>				
					<div class="pull-right">
						<c:url value="/qnaList/${currentPage}" var="listUrl">
							<c:if test="${not empty param.keyField && not empty param.keyWord}">
								<c:param name="keyField" value="${param.keyField}" />
								<c:param name="keyWord" value="${param.keyWord}" />
							</c:if>
						</c:url>
						<button class="btn btn-info btn-font" id="btnback">뒤로</button>
						<a class="btn btn-primary btn-font" href="${listUrl}">목록</a>
					</div>
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
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
	</body>
</html>