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
				<div class="boardtitle lottemartdream"></div>
				<article id="contents">
					<div class="main">
						<div class="container col-xs-12">
							<div class="panel panel-info">
							    <div class="panel-heading lottemartdream"><h2 class="text-center">예약완료</h2></div>
							    <div class="panel-body">
							    	<div>
							    		<ol class="text-center nonestyle lottemartdream">
							    			<li>예약번호 :<span class="bora">${resDto.resNum} 번</span></li>
							    			<li>예약자명 : <span class="bora">${resDto.memName}</span></li>
							    			<li>이용예정일:  <span class="bora">${resDto.resDate}</span></li>
							    			<li>방문예정시간: <span class="bora">${resDto.resVisit}</span></li>
							    			<li>이용예정시간: <span class="bora">${resDto.resTime} 시간</span></li>
							    			<li>예약지점: <span class="bora">${resDto.borName}</span></li>
							    			<li>예약인원: <span class="bora">${resDto.resCount} 명</span></li>
							    		</ol>
							    	</div>
							    	<hr>
								    <div class="text-center lottemartdream">
							    		<h4>예약시간에 맞추어 방문해주시기를 바랍니다.</h4>
							    	</div>
							    </div>
						    </div>
						</div>
						<div class="col-xs-6">
							<button type="button" class="btn btn-primary btn-font pull-right" id="btntoindex">홈으로</button>
						</div>
						<div class="col-xs-6">
							<button type="button" class="btn btn-success btn-font pull-left" id="btntomypage">내정보</button>
						</div>
					</div>
				</article>
			</section>
			<!-- Hidden parameter -->
			<input type="hidden" id="boardid" value="member">
			<input type="hidden" id="boardtitle_client" value="예약완료">
			<input type="hidden" id="boardinfo" value="예약해주셔서 감사합니다">
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/Board.jsp" %>
			<%@include file="../common/Joinscript.jsp" %>
		</div>
	</body>
</html>