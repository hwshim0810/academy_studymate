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
			<form name = "updateform" action="noticeUpdate/${currentPage}" method="post">
				<div>
					<input type="hidden" name="bonNum" value="${noticeDto.bonNum}"/>
					<label for="bonTitle">제목</label><br>
					<input id="bonTitle" name="bonTitle" value="${noticeDto.bonTitle}"/>
				</div>
				<br>
				<div>
					<label class="sr-only" for="bonContent">내용</label><br>
					<textarea name="bonContent" rows="10" cols="100" id="bonContent" >${noticeDto.bonContent}</textarea>
				</div>
			<br><br>
			<hr>
			<!-- Button Area -->
			<footer id="con_footer">
				<div class="btndiv">
					<div class="pull-right">
						<button class="btn btn-primary btn-font" id="btnreg">수정</button>
					</div>
					<div class="pull-left">
						<button class="btn btn-info btn-font" id="btnback">뒤로</button>
						<button class="btn btn-primary btn-font" id="btnlist">목록</button>
					</div>
				</div>
			</footer>
			</form>
		</section>
		<input type="hidden" id="boardid" value="notice">
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
		<script src="<c:url value='/resources/js/boardWrite/noticeWrite.js'/>" charset="utf-8"></script>
	</body>
</html>