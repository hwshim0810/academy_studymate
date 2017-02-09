<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
					<h2 class="normal w300 subsize">${reviewDto.borvTitle}</h2>
					<div class="dtoinfo">
						작성일 <strong>${reviewDto.borvRegdate}</strong>&nbsp;조회수 <strong>${reviewDto.borvReadcount}</strong>
					</div>
				</header>
				<div class="main">
					${reviewDto.borvContent}
				</div>
				<!-- ReplyList Area -->
				<article class="replyread_div col-xs-12">
					<div class="pull-left reply_list"><strong>댓글목록</strong></div>
					<table class="table">
						<tbody id="replyresult">
							<c:choose>
								<c:when test="${not empty reviewReply}">
									<c:forEach var="reply" items="${reviewReply}">
										<tr>
											<td>${reply.memName}</td>
											<td>${reply.repContent}</td>
											<td>${reply.repRegdate}</td>
											<c:choose>
												<c:when test="${not empty reply.memName}">
													<td><button class="btn btn-danger pull-right" id="btnrepdel">삭제</button></td>
												</c:when>
												<c:otherwise>
													<td></td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
								<tr>
									<td class="table_center" colspan="4">등록된 댓글이 없습니다.</td>
								</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
						<tfoot id="tfoot">
							<tr id="tfpaging">
								<td id="tftd" colspan="4" align="center">
									${replyPaging}
								</td>
							</tr>
						</tfoot>
					</table>					
					<form action="${pageContext.request.contextPath}/revReplyList" method="POST" id="pagingform">
						<input type="hidden" name="borvNum" value="${reviewDto.borvNum}" id="replyBorv" />
						<input type="hidden" name="replyPage" value=""  id="replyPage"/>
					</form>
				</article>
				<!-- ReplyWrite Area -->
				<article class="replywrite_div col-xs-12">
					<form id="replyform" method="POST" action="${pageContext.request.contextPath}/revReplyWrite">
						<hr>
						<div class="row">
							<div class="col-xs-3 reply_column"><strong>작성자</strong></div>
							<div class="col-xs-9">${reviewDto.memName}</div>
						</div>
						<div class="row">
							<div class="col-xs-3 reply_column"><strong>내용</strong></div>
							<div class="col-xs-7"><input name="repContent" class="form-control" maxlength="50"/></div>
							<div class="col-xs-2">
								<button class="btn btn-success btn-font pull-right" id="btnreply" type="button">등록</button>
								<!-- <input type="submit"/> -->
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12"></div>
						</div>
						<hr>
						<c:choose>
							<c:when test="${not empty replyPage}">
								<input type="hidden" name="replyPage" value="${replyPage}" />
							</c:when>
							<c:otherwise>
								<input type="hidden" name="replyPage" value="1" />
							</c:otherwise>
						</c:choose>
						<input type="hidden" name="memId" value="${reviewDto.memId}">
						<input type="hidden" name="memName" value="${reviewDto.memName}">
						<input type="hidden" name="borvNum" value="${borvNum}">
					</form>
				</article>
				<br><br>
				<hr>
				<!-- Button Area -->
				<%@include file="../common/boardBtn/ReadBtn.jsp" %>
			</article>
		</section>
		<!-- Hidden parameter -->
		<input type="hidden" id="boardid" value="review">
		<input type="hidden" id="boardtitle" value="방문후기">
		<input type="hidden" id="boardsubtitle" value="${reviewDto.borvNum}번 글">
		<input type="hidden" id="boardupdate" value="${updateUrl}">
		<input type="hidden" id="boarddelete" value="${deleteUrl}">
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
	</body>
</html>