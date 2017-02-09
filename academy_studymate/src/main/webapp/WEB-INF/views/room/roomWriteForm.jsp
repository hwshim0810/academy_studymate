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
		<%@include file="../common/BoardSubnav.jsp" %>
		<div class="body_top">
		</div>
		<div class="body center_align">
			<div class="boardtitle lottemartdream"></div>
			<br><br><br>
			<form:form id="multiform" action="${pageContext.request.contextPath}/roomWrite" method="POST" enctype="multipart/form-data" commandName="roomDto">
				<table class="table">
					<tr>
						<td><label for="memName">작성자</label></td>
						<td colspan="2">${sessionScope.memId}</td>
					</tr>
					<tr>
						<td><label for="borName">지점명</label></td>
						<td><form:input id="borName" path="borName" maxlength="10" placeholder="예)ㅇㅇ지점"/></td>
						<td><form:errors path="borName" /></td>
					</tr>
					<tr>
						<td class="col-xs-2"><label for="borAddr">주소</label></td>
						<td class="col-xs-6"><form:input path="borAddr" id="addr" placeholder="주소" cssClass="form-control" /><button type="button" class="btn btn-default"  id="btnaddr" >주소찾기</button></td>
						<td class="col-xs-4"><form:errors path="borAddr" /></td>
					</tr>
					<tr>
						<td class="col-xs-2"><label for="borArea">상세주소</label></td>
						<td class="col-xs-6"><form:input path="borArea" id="detailaddr" placeholder="상세주소" cssClass="form-control" maxlength="20"/></td>
						<td class="col-xs-4"><form:errors path="borArea" /></td>
					</tr>
					<tr>
						<td><label for="file">썸네일</label></td>
						<td>
							<div class="form-group">
								<input type="file" name="file" />
								<span class="help-block">업로드는 3Mb까지 가능합니다.</span>
							</div>
						</td>
						<td></td>
					</tr>
					<tr>
						<td><label>파일리스트</label></td>
						<td id="filelist" colspan="2"></td>
					</tr>
				</table>
				<br><br>
				<hr>
				<!-- Button Area -->
				<footer id="con_footer">
					<div class="btndiv">
						<div class="pull-right">
							<button class="btn btn-success btn-font" id="btnreg">예약</button>
						</div>
						<div class="pull-left">
							<button class="btn btn-primary btn-font" id="btnlist">목록</button>
							<button class="btn btn-info btn-font" id="btnback">뒤로</button>
						</div>
					</div>
				</footer>
			</form:form>
		</div>
		<input type="hidden" id="boardid" value="room">
		<input type="hidden" id="boardtitle" value="지점관리">
		<input type="hidden" id="boardsubtitle" value="지점등록">
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
	</body>
</html>