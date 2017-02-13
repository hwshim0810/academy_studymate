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
			<%@include file="../common/BoardSubnav.jsp" %>
			<div class="body_top">
			</div>
			<div class="body center_align">
				<div class="boardtitle lottemartdream"></div>
				<br><br><br>
				<form:form id="multiform" action="${pageContext.request.contextPath}/roomWrite" method="POST" enctype="multipart/form-data" commandName="roomDto">
					<table class="table">
						<tr>
							<td class="col-xs-9">
								<label for="memName pull-left">작성자 : ${sessionScope.memId}</label>
							</td>
							<td class="col-xs-3" colspan="2"></td>
						</tr>
						<tr>
							<td class="col-xs-9">
								<label for="borName pull-left">지점명</label>
								<form:input id="borName" path="borName" cssClass="form-control" maxlength="10" placeholder="예)ㅇㅇ지점"/>
							</td>
							<td class="col-xs-3"></td>
						</tr>
						<tr>
							<td class="col-xs-9"></td>
							<td class="col-xs-3"><form:errors path="borName" delimiter="/" cssClass="label label-danger"/></td>
						</tr>
						<tr>
							<td class="col-xs-9">
								<label for="borAddr pull-left">주소</label>
								<form:input path="borAddr" id="addr" placeholder="주소" cssClass="form-control" readonly="true" /><button type="button" class="btn btn-default"  id="btnaddr" >주소찾기</button>
							</td>
							<td class="col-xs-3"></td>
						</tr>
						<tr>
							<td class="col-xs-9"></td>
							<td class="col-xs-3"><form:errors path="borAddr" delimiter="/" cssClass="label label-danger"/></td>
						</tr>
						<tr>
							<td class="col-xs-9">
								<label for="borArea pull-left">상세주소</label>
								<form:input path="borArea" id="detailaddr" placeholder="상세주소" cssClass="form-control" maxlength="20"/>
							</td>
							<td class="col-xs-3"></td>
						</tr>
						<tr>
							<td class="col-xs-9"></td>
							<td class="col-xs-3"><form:errors path="borArea" delimiter="/" cssClass="label label-danger"/></td>
						</tr>
						<tr>
							<td class="col-xs-9">
								<label for="file">메인썸네일</label>
								<div class="form-group">
									<input type="file" name="main" />
									<span class="help-block">개당 업로드 3Mb / 파일 1개 필수.</span>
								</div>
							</td>
							<td class="col-xs-3"></td>
						</tr>
						<tr>
							<td class="col-xs-9">
								<label for="file">서브썸네일</label>
								<div class="form-group">
									<input type="file" name="sub" />
									<span class="help-block">개당 업로드 3Mb / 파일2개 필수.</span>
								</div>
							</td>
							<td class="col-xs-3"></td>
						</tr>
						<tr>
							<td class="col-xs-9">
								<label>파일리스트</label>
								<span id="filelist"></span>
								<span id="sublist"></span>
							</td>
							<td class="col-xs-3" colspan="2"></td>
						</tr>
						<tr>
							<td class="col-xs-9">
								<label for="borIntro">한줄소개</label><form:input path="borIntro" cssClass="form-control" maxlength="25"/>
							</td>
							<td class="col-xs-3"><form:errors path="borIntro" /></td>
						</tr>
						<tr>
							<td class="col-xs-9"></td>
							<td class="col-xs-3"><form:errors path="borIntro" delimiter="/" cssClass="label label-danger"/></td>
						</tr>
					</table>
					<br><br>
					<hr>
					<!-- Button Area -->
					<%@include file="../common/boardBtn/WriteFormBtn.jsp" %>
				</form:form>
			</div>
			<input type="hidden" id="boardid" value="room">
			<input type="hidden" id="boardtitle" value="지점관리">
			<input type="hidden" id="boardsubtitle" value="지점등록">
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/Board.jsp" %>
		</div>
	</body>
</html>