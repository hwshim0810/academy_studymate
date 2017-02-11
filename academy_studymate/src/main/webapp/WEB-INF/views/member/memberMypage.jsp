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
			<div class="body_top">
			</div>
			<section class="body center_align">
				<div class="boardtitle lottemartdream"></div>
				<div class="subnav lottemartdream normal w400" >
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
										<h2>${memDto.memId} 님의 정보</h2>
										<br><hr>
										<div class="row mypage_row">
											<div class="col-xs-3">이름</div>
											<div class="col-xs-9">${memDto.memName}</div>
										</div>
										<div class="row mypage_row">
											<div class="col-xs-3">주소</div>
											<div class="col-xs-9">${memDto.memAddr}</div>
										</div>
										<div class="row mypage_row">
											<div class="col-xs-3"></div>
											<div class="col-xs-9">${memDto.memArea}</div>
										</div>
										<div class="row mypage_row">
											<div class="col-xs-3">Email</div>
											<div class="col-xs-9">${memDto.memEmail}</div>
										</div>
										<div class="row mypage_row">
											<div class="col-xs-3">생일</div>
											<div class="col-xs-9">
												<c:choose>
													<c:when test="${not empty memDto.memBirth}">
														${memDto.memBirth}
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
													<c:when test="${not empty memDto.memSex}">
														${memDto.memSex}
													</c:when>
													<c:otherwise>
														미입력
													</c:otherwise>
												</c:choose>
											</div>
										</div>
										<div class="row mypage_row">
											<div class="col-xs-3">가입일</div>
											<div class="col-xs-9">${memDto.memRegdate}</div>
										</div>
										<p>
											<a class="btn btn-success" href="http://j.mp/metronictheme" target="_blank">
												Learn more...
											</a>
										</p>
									</div>
									<!-- Member Update -->
									<div class="tab-pane" id="mem_update">
										<form:form id="memForm" class="form-horizontal" method="POST" commandName="memDto" action="${pageContext.request.contextPath}/memberUpdateClient">
											<fieldset>
												<!-- Form Name -->
												<legend class="sr-only">정보수정</legend>
												<div class="col-xs-12">
													<h2>비밀번호 수정</h2>
													<br><hr>
												</div>
												<div class="form-group mzbzero">
													<label class="col-xs-4 control-label" for="memId">아이디</label>  
													<div class="col-xs-6">
														<form:input path="memId" value="${memDto.memId}" readonly="true" cssClass="form-control"/>
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
														<form:errors path="memPass" />
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
													<br><hr>
												</div>
												<div class="form-group">
													<label class="col-xs-4 control-label" for="memName">이름</label>  
													<div class="col-xs-6">
														<form:input path="memName" placeholder="이름" value="${memDto.memName}" readonly="true" maxlength="10" cssClass="form-control" />
													</div>
													<div class="col-xs-2">
														<form:errors path="memName" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-xs-4 control-label" for="memAddr">주소</label>  
													<div class="col-xs-6">
														<form:input path="memAddr" id="addr" value="${memDto.memAddr}" placeholder="주소" cssClass="form-control" readonly="true"/>
														<button type="button" class="btn btn-default pull-left"  id="btnaddr" >주소찾기</button>
													</div>
													<div class="col-xs-2">
														<form:errors path="memAddr" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-xs-4 control-label" for="detailaddr">상세주소</label>  
													<div class="col-xs-6">
														<form:input path="memArea" id="detailaddr" value="${memDto.memArea}" placeholder="상세주소" cssClass="form-control" maxlength="20"/>
													</div>
													<div class="col-xs-2">
														<form:errors path="memArea" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-xs-4 control-label" for="memEmail">Email</label>  
													<div class="col-xs-6">
														<form:input path="memEmail" value="${memDto.memEmail}" placeholder="예)exam@exam.com" cssClass="form-control" maxlength="20"/>
													</div>
													<div class="col-xs-2">
														<form:errors path="memEmail" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-xs-4 control-label" for="memSex">성별</label>  
													<div class="col-xs-6">
														<c:choose>
															<c:when test="${memDto.memSex eq '남자'}">
																<span class="pull-left"><form:radiobutton path="memSex" checked="true" value="남자" label="남자" /></span>
															</c:when>
															<c:otherwise>
																<span class="pull-left"><form:radiobutton path="memSex" checked="true" value="여자" label="여자"/></span>
															</c:otherwise>
														</c:choose>
													</div>
													<div class="col-xs-2">
														<form:errors path="memSex" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-xs-4 control-label" for="memBirth">생년월일</label>  
													<div class="col-xs-6">
														<c:choose>
															<c:when test="${not empty memDto.memBirth}">
																<form:input path="memBirth" value="${memDto.memBirth}" cssClass="form-control birthdate" readonly="true" />
															</c:when>
															<c:otherwise>
																<form:input path="memBirth" cssClass="form-control birthdate" readonly="true" />
															</c:otherwise>
														</c:choose>
													</div>
													<div class="col-xs-2">
														<form:errors path="memBirth" />
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
											<tbody>
												<c:forEach var="item" items="${resList}">
													<c:url value="/reserveRead/${currentPage}-${item.resNum}" var="readUrl">
														<c:if test="${not empty keyField && not empty keyWord}">
															<c:param name="keyField" value="${keyField}" />
															<c:param name="keyWord" value="${keyWord}" />
														</c:if>
													</c:url>
													<tr>
														<td class="hidden-xs hidden-sm table_center">${item.resNum}</td>
														<td class="table_center"><a href="${readUrl}">${item.memName}</a></td>
														<td class="table_center">${item.borName}</td>
														<td class="table_center">${item.resDate}</td>
														<td class="table_center">${item.resTime}</td>
													</tr>
												</c:forEach>
											</tbody>
											<tfoot>
												<tr>
													<td colspan="5" align="center">${pageHtml}</td>
												</tr>
											</tfoot>
										</table>
									</div>
									<!-- Siteout Information -->
									<div class="tab-pane" id="mem_siteout">
										<div class="panel panel-warning">
										    <div class="panel-heading"><h4 class="lottemartdream text-center">회원탈퇴</h4></div>
										    <div class="panel-body">
										    	<div>
										    		<ul class="text-center nonestyle lottemartdream">
										    			<li>회원탈퇴시 예약은 모두 취소됩니다.</li>
										    			<li>아이디는 중복가입을 막기위해 보존됩니다.</li>
										    			<li>아이디를 제외한 정보는 모두 삭제됩니다.</li>
										    			<li>게시판의 글은 보존되나 삭제를 원하시면 탈퇴전 QnA게시판에 문의바랍니다.</li>
										    		</ul>
										    	</div>
											    <div class="text-center">
										    		<h4 class="lottemartdream">위 사항에 모두 동의하신다면 탈퇴버튼을 눌러주세요.</h4>
										    		<form action="${pageContext.request.contextPath}/memberDelete" method="POST" id="siteoutForm">
										    			<input type="hidden" name="memId" value="${memDto.memId}">
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
			<input type="hidden" id="boardsubtitle" value="${memDto.memId}님">
			<input type="hidden" id="client_page" value="${pageContext.request.contextPath}/memberMypage">
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/Board.jsp" %>
			<%@include file="../common/MypageScript.jsp" %>
		</div>
	</body>
</html>