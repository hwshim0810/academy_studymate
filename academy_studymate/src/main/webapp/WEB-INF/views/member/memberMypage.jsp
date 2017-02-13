<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="../common/Head.jsp" %>
		<link rel="stylesheet" href="<c:url value='/resources/css/mypage.css' />" />
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
			<section class="body_high center_align">
				<div class="boardtitle lottemartdream"></div>
				<div class="mypage lottemartdream normal w400" >
					<article class="main">
						<div class="tabbable-panel">
							<div class="tabbable-line">
								<ul class="nav nav-tabs ">
									<li class="active">
										<a href="#mem_info" data-toggle="tab">회원정보</a>
									</li>
									<li>
										<a href="#mem_update" data-toggle="tab">정보수정</a>
									</li>
									<li>
										<a href="#mem_reserve" data-toggle="tab">예약내역</a>
									</li>
									<li>
										<a href="#mem_siteout" data-toggle="tab">회원탈퇴</a>
									</li>
								</ul>
								<div class="tab-content">
									<!-- Member Info -->
									<div class="tab-pane active" id="mem_info">
										<h2>${memberDto.memId} 님의 정보</h2>
										<br><hr>
										<div class="row mypage_row">
											<div class="col-xs-3">이름</div>
											<div class="col-xs-9">${memberDto.memName}</div>
										</div>
										<div class="row mypage_row">
											<div class="col-xs-3">주소</div>
											<div class="col-xs-9">${memberDto.memAddr}</div>
										</div>
										<div class="row mypage_row">
											<div class="col-xs-3"></div>
											<div class="col-xs-9">${memberDto.memArea}</div>
										</div>
										<div class="row mypage_row">
											<div class="col-xs-3">Email</div>
											<div class="col-xs-9">${memberDto.memEmail}</div>
										</div>
										<div class="row mypage_row">
											<div class="col-xs-3">생일</div>
											<div class="col-xs-9">
												<c:choose>
													<c:when test="${not empty memberDto.memBirth}">
														${memberDto.memBirth}
													</c:when>
													<c:otherwise>
														미입력
													</c:otherwise>
												</c:choose>
											</div>
										</div>
										<div class="row mypage_row">
											<div class="col-xs-3">성별</div>
											<div class="col-xs-9">
												<c:choose>
													<c:when test="${not empty memberDto.memSex}">
														${memberDto.memSex}
													</c:when>
													<c:otherwise>
														미입력
													</c:otherwise>
												</c:choose>
											</div>
										</div>
										<div class="row mypage_row">
											<div class="col-xs-3">가입일</div>
											<div class="col-xs-9">${memberDto.memRegdate}</div>
										</div>
									</div>
									<!-- Member Update -->
									<div class="tab-pane" id="mem_update">
										<form:form id="memForm" class="form-horizontal" method="POST" commandName="memberDto" action="${pageContext.request.contextPath}/memberUpdateClient">
											<fieldset>
												<!-- Form Name -->
												<legend class="sr-only">정보수정</legend>
												<div class="col-xs-12">
													<h2>비밀번호 수정</h2>
													<hr>
												</div>
												<div class="form-group mzbzero">
													<label class="col-xs-4 control-label" for="memId">아이디</label>  
													<div class="col-xs-6">
														<form:input path="memId" value="${memberDto.memId}" readonly="true" cssClass="form-control"/>
													</div>
													<div class="col-xs-2">
													</div>
												</div>
												<div class="form-group" >
													<div class="col-xs-4"></div>
													<div class="col-xs-6">
														 <span class="help-block pull-left">알파벳으로 시작/알파벳,숫자 혼용 5~11자 가능</span>
													</div>
													<div class="col-xs-2"></div>
												</div>
												<div class="form-group mzbzero">
													<label class="col-xs-4 control-label" for="memPass">현재비밀번호</label>  
													<div class="col-xs-6">
														<input id="oldPass" type="password" class="form-control"  placeholder="비밀번호" maxlength="12" />
														<span class="help-block pull-left">현재 비밀번호를 입력해주세요</span>
													</div>
													<div class="col-xs-2">
													</div>
												</div>
												<div class="form-group" >
													<label class="col-xs-4 control-label" for="memPassConfirm">새비밀번호</label>  
													<div class="col-xs-6">
														<form:password id="memPass" path="memPass" placeholder="비밀번호" maxlength="12" cssClass="form-control" />
														<span class="help-block pull-left">비밀번호 6~12자 가능</span>
													</div>
													<div class="col-xs-2">
													</div>
												</div>
												<div class="form-group" >
													<label class="col-xs-4 control-label" for="memPassConfirm">새비밀번호확인</label>  
													<div class="col-xs-6">
														<input type="password"  id="memPassConfirm" placeholder="새비밀번호확인" maxlength="12"  class="form-control" />
													</div>
													<div class="col-xs-2">
													</div>
												</div>
												<div class="form-group" >
													<div class="col-xs-6 msgbox" id="passMsg">
													</div>
													<div class="col-xs-6 msgbox" id="lengthmsg">
														<span class="label label-success pull-left" >패스워드길이:</span>
													</div>
												</div>
												<div class="col-xs-12">
													<h2>개인정보</h2>
													<hr>
												</div>
												<div class="form-group">
													<label class="col-xs-4 control-label" for="memName">이름</label>  
													<div class="col-xs-6">
														<form:input path="memName" placeholder="이름" value="${memberDto.memName}" readonly="true" maxlength="10" cssClass="form-control" />
													</div>
													<div class="col-xs-2">
													</div>
												</div>
												<div class="form-group">
													<label class="col-xs-4 control-label" for="memAddr">주소</label>  
													<div class="col-xs-6">
														<form:input path="memAddr" id="addr" value="${memberDto.memAddr}" placeholder="주소" cssClass="form-control" readonly="true"/>
														<button type="button" class="btn btn-default pull-left"  id="btnaddr" >주소찾기</button>
													</div>
													<div class="col-xs-2">
													</div>
												</div>
												<div class="form-group">
													<div class="col-xs-4"></div>
													<div class="col-xs-6">
														<form:errors path="memAddr" cssClass="label label-danger pull-left" delimiter="/"/>
													</div>
													<div class="col-xs-2"></div>
												</div>
												<div class="form-group">
													<label class="col-xs-4 control-label" for="detailaddr">상세주소</label>  
													<div class="col-xs-6">
														<form:input path="memArea" id="detailaddr" value="${memberDto.memArea}" placeholder="상세주소" cssClass="form-control" maxlength="20"/>
													</div>
													<div class="col-xs-2">
													</div>
												</div>
												<div class="form-group">
													<div class="col-xs-4"></div>
													<div class="col-xs-6">
														<form:errors path="memArea" cssClass="label label-danger pull-left" delimiter="/"/>
													</div>
													<div class="col-xs-2"></div>
												</div>
												<div class="form-group">
													<label class="col-xs-4 control-label" for="memEmail">Email</label>  
													<div class="col-xs-6">
														<input type="email"  id="memEmail" name="memEmail" value="${memberDto.memEmail}" placeholder="예)exam@exam.com" class="form-control" maxlength="20" />
													</div>
													<div class="col-xs-2">
													</div>
												</div>
												<div class="form-group">
													<div class="col-xs-4"></div>
													<div class="col-xs-6">
														<form:errors path="memEmail" cssClass="label label-danger pull-left" delimiter="/"/>
													</div>
													<div class="col-xs-2"></div>
												</div>
												<div class="form-group">
													<label class="col-xs-4 control-label" for="memSex">성별</label>  
													<div class="col-xs-6">
														<c:choose>
															<c:when test="${memberDto.memSex eq '남자'}">
																<span class="pull-left"><form:radiobutton path="memSex" checked="true" value="남자" label="남자" /></span>
															</c:when>
															<c:otherwise>
																<span class="pull-left"><form:radiobutton path="memSex" checked="true" value="여자" label="여자"/></span>
															</c:otherwise>
														</c:choose>
													</div>
													<div class="col-xs-2">
													</div>
												</div>
												<div class="form-group">
													<label class="col-xs-4 control-label" for="memBirth">생년월일</label>  
													<div class="col-xs-6">
														<c:choose>
															<c:when test="${not empty memberDto.memBirth}">
																<form:input path="memBirth" value="${memberDto.memBirth}" cssClass="form-control birthdate" readonly="true" />
															</c:when>
															<c:otherwise>
																<form:input path="memBirth" cssClass="form-control birthdate" readonly="true" />
															</c:otherwise>
														</c:choose>
													</div>
													<div class="col-xs-2">
													</div>
												</div>
												<div class="col-xs-12">
													<hr>								
													<div class="pull-right">
														<button class="btn btn-success btn-font" id="btnclientUpdate" type="button">수정</button>
													</div>
												</div>
											</fieldset>
										</form:form>
									</div>
									<!-- 전체 예약내역 -->
									<div class="tab-pane" id="mem_reserve">
										<table class="table table-hover">
											<thead>
												<tr>
													<th class="hidden-xs hidden-sm">번호</th>
													<th>예약자명</th>
													<th>예약지점</th>
													<th>예약날짜</th>
													<th>예약시간</th>
												</tr>
											</thead>
											<tbody id="resResult">
												<c:forEach var="item" items="${resList}">
													<tr>
														<td class="hidden-xs hidden-sm table_center">${item.resNum}</td>
														<td class="table_center"><a class="resDetail cursor_p" id="${item.resNum}">${item.memName}</a></td>
														<td class="table_center">${item.borName}</td>
														<td class="table_center">${item.resDate}</td>
														<td class="table_center">${item.resTime}</td>
													</tr>
												</c:forEach>
											</tbody>
											<tfoot id="tfoot">
												<tr>
													<td colspan="5" align="center">${pageHtml}</td>
												</tr>
											</tfoot>
										</table>
										<form action="${pageContext.request.contextPath}/memResDetail" method="POST" id="detailform">
											<input type="hidden" name="resNum" value="" />
										</form>
										<form action="${pageContext.request.contextPath}/memResPaging" method="POST" id="pagingform">
											<input type="hidden" name="totalCount" value="${totalCount}" id="totalCount" />
											<input type="hidden" name="resPage" value=""  id="resPage"/>
											<input type="hidden" name="memId" value="${memberDto.memId}">
										</form>
										
										<div id="detailResult">
										</div>
									</div>
									<!-- Siteout Information -->
									<div class="tab-pane" id="mem_siteout">
										<div class="panel panel-warning">
										    <div class="panel-heading"><h4 class="lottemartdream text-center">회원탈퇴</h4></div>
										    <div class="panel-body">
										    	<div>
										    		<ul class="text-center nonestyle lottemartdream">
										    			<li class="mypage_row">회원탈퇴시 예약은 모두 취소됩니다.</li>
										    			<li class="mypage_row">회원님이 게시판에 쓴 모든글은 삭제됩니다.</li>
										    			<li class="mypage_row">${memDto.memId}님이 탈퇴하는 경우 모든 정보는 되돌릴 수 없습니다.</li>
										    		</ul>
										    	</div>
											    <div class="text-center">
										    		<h4 class="lottemartdream">위 사항에 모두 동의하신다면 탈퇴버튼을 눌러주세요.</h4>
										    		<form action="${pageContext.request.contextPath}/memberDelete" method="POST" id="siteoutForm">
										    			<input type="hidden" name="memId" value="${memberDto.memId}">
											    		<button type="button" class="btn btn-danger btn-font" id="btnsiteout">회원탈퇴</button>
										    		</form>
										    	</div>
										    </div>
									    </div>
									</div>
								</div>
							</div>
						</div>
					</article>
					<br><br>
					<hr>
				</div>
			</section>
			<!-- Hidden parameter -->
			<input type="hidden" id="boardid" value="member">
			<input type="hidden" id="boardtitle_client" value="마이페이지">
			<input type="hidden" id="boardsubtitle" value="${memberDto.memId}님">
			<input type="hidden" id="client_page" value="${pageContext.request.contextPath}/memberMypage">
			<input type="hidden" id="boardinfo" value="회원님의 정보를 확인해보세요">
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/Board.jsp" %>
			<%@include file="../common/MypageScript.jsp" %>
		</div>
	</body>
</html>