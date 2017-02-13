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
			<div class="body_higher center_align">
				<c:if test="${sessionScope.memId eq 'admin'}">
					<%@include file="../common/AdminSubnav.jsp" %>
				</c:if>
				<div class="boardtitle lottemartdream"></div>
				<br><br><br>
				<form:form id="multiform" action="${pageContext.request.contextPath}/roomUpdate" method="POST" enctype="multipart/form-data" commandName="roomDto">
					<table class="table">
						<tr>
							<td class="col-xs-9">
								<label for="memName pull-left">작성자 : ${sessionScope.memName}</label>
							</td>
							<td class="col-xs-3" colspan="2"></td>
						</tr>
						<tr>
							<td class="col-xs-9">
								<label for="borName pull-left">지점명</label>
								<form:input id="borName" path="borName" cssClass="form-control" maxlength="10" placeholder="예)ㅇㅇ지점" value="${roomDto.borName}"/>
							</td>
							<td class="col-xs-3"></td>
						</tr>
						<tr>
							<td class="col-xs-9"><form:errors path="borName" delimiter="/" cssClass="label label-danger"/></td>
							<td class="col-xs-3"></td>
						</tr>
						<tr>
							<td class="col-xs-9">
								<label for="borAddr pull-left">주소</label>
								<form:input path="borAddr" id="addr" placeholder="주소" cssClass="form-control" readonly="true" value="${roomDto.borAddr}"/><button type="button" class="btn btn-default"  id="btnaddr" >주소찾기</button>
							</td>
							<td class="col-xs-3"></td>
						</tr>
						<tr>
							<td class="col-xs-9"><form:errors path="borAddr" delimiter="/" cssClass="label label-danger"/></td>
							<td class="col-xs-3"></td>
						</tr>
						<tr>
							<td class="col-xs-9">
								<label for="borArea pull-left">상세주소</label>
								<form:input path="borArea" id="detailaddr" placeholder="상세주소" cssClass="form-control" maxlength="20" value="${roomDto.borArea}"/>
							</td>
							<td class="col-xs-3"></td>
						</tr>
						<tr>
							<td class="col-xs-9"><form:errors path="borArea" delimiter="/" cssClass="label label-danger"/></td>
							<td class="col-xs-3"></td>
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
								<label for="borIntro">한줄소개</label><form:input path="borIntro" cssClass="form-control" maxlength="25" value="${roomDto.borIntro}"/>
							</td>
							<td class="col-xs-3"></td>
						</tr>
						<tr>
							<td class="col-xs-9"><form:errors path="borIntro" delimiter="/" cssClass="label label-danger"/></td>
							<td class="col-xs-3"></td>
						</tr>
						<tr>
							<td class="col-xs-9">
								<label for="borIntro">지하철?</label><form:input path="borMetro" cssClass="form-control" maxlength="40" value="${roomDto.borMetro}"/>
							</td>
							<td class="col-xs-3"></td>
						</tr>
						<tr>
							<td class="col-xs-9">
								<label for="borIntro">버스?</label><form:input path="borBus" cssClass="form-control" maxlength="40" value="${roomDto.borBus}"/>
							</td>
							<td class="col-xs-3"></td>
						</tr>
					</table>
					<br><br>
					<hr>
					<!-- Button Area -->
					<footer id="con_footer">
						<div class="btndiv">
							<div class="pull-right">
								<input type="submit" class="btn btn-success btn-font"  value="수정">
							</div>
							<div class="pull-left">
								<button class="btn btn-primary btn-font" id="btnlist" type="button">목록</button>
								<button class="btn btn-info btn-font" id="btnback" type="button">뒤로</button>
							</div>
						</div>
					</footer>
					<input type="hidden" name="currentPage" value="${currentPage}" />
					<input type="hidden" name="borNum"  value="${roomDto.borNum}" />
				</form:form>
			</div>
			<input type="hidden" id="boardid" value="room">
			<input type="hidden" id="boardtitle" value="지점관리">
			<input type="hidden" id="boardsubtitle" value="지점수정">
			<input type="hidden" id="boardinfo" value="지점정보를 수정합니다">
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/Board.jsp" %>
		</div>
	</body>
</html>