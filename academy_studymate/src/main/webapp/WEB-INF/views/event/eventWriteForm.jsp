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
			<div class="body_high center_align">
				<%@include file="../common/nav/BoardSubnav.jsp" %>
				<div class="boardtitle lottemartdream"></div>
				<br><br><br>
				<form:form id="multiform" method="POST" commandName="eventDto" enctype="multipart/form-data" action="${pageContext.request.contextPath}/eventWrite">
					<table class="table">
						<tr>
							<td><label>작성자</label></td>
							<td>${sessionScope.memName}
								<input type="hidden" name="memName" value="${sessionScope.memName}">
								<input type="hidden" name="memId" value="${sessionScope.memId}">
							</td>
						</tr>
						<tr>
							<td><label for="boeTitle">제목</label></td>
							<td><form:input path="boeTitle" maxlength="25" cssClass="form-control" placeholder="제목을 입력해주세요"/></td>
						</tr>
						<tr>
							<td class="errormsg" colspan="2">
								<form:errors path="boeTitle" delimiter="/" cssClass="label label-danger"/>
								<form:errors path="boeContent" delimiter="/" cssClass="label label-danger"/>
							</td>
						</tr>
						<tr>
							<td><label for="boeContent">내용</label></td>
							<td><form:textarea cssClass="textcontent" path="boeContent" cols="100" rows="20"/></td>
						</tr>
						<tr>
							<td>
								<label for="boeAble pull-left">참여인원</label>
							</td>
							<td>
								<input type="number" name="boeAble" min="1" max="20"  value="1" />&nbsp;명
							</td>
						</tr>
						<tr>
							<td>
								<label for="boeDaterange">기간</label>
							</td>
							<td>
								<form:input path="boeDaterange" cssClass="form-control" placeholder="이벤트 기간" />
							</td>
						</tr>
						<tr>
							<td><form:errors path="boeDaterange" delimiter="/" cssClass="label label-danger"/></td>
							<td></td>
						</tr>
						<tr>
							<td>
								<label for="file">메인썸네일</label>
							</td>
							<td>
								<div class="form-group">
									<input type="file" name="main" />
									<span class="help-block">개당 업로드 3Mb / 파일 1개 필수.</span>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<label>파일리스트</label>
								<span id="filelist"></span>
								<span id="sublist"></span>
							</td>
							<td colspan="2"></td>
						</tr>
					</table>
					<br><br>
					<hr>
					<!-- Button Area -->
					<%@include file="../common/boardBtn/WriteFormBtn.jsp" %>
				</form:form>
			</div>
			<input type="hidden" id="boardid" value="event">
			<input type="hidden" id="boardtitle" value="이벤트">
			<input type="hidden" id="boardsubtitle" value="이벤트등록">
			<input type="hidden" id="boardinfo" value="새로운 이벤트를 등록합니다">
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/loadscript/Board.jsp" %>
			<%@include file="../common/scriptCssLoad/EventPageScript.jsp" %>
			<script src="<c:url value='/resources/js/boardWrite/eventWrite.js?v=1'/>" charset="utf-8"></script>
		</div>
	</body>
</html>