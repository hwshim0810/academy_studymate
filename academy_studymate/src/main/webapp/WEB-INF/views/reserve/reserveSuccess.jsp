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
			<div class="body_top">
			</div>
			<section class="body center_align">
				<div class="boardtitle lottemartdream"></div>
				<article id="contents">
					<div class="main">
						<div class="container col-xs-12">
							<div class="panel panel-info">
							    <div class="panel-heading"><h4 class="lottemartdream text-center">예약완료</h4></div>
							    <div class="panel-body">
							    	<div>
							    		<ol class="text-center nonestyle lottemartdream">
							    			<li>예약번호 : ${resDto.resNum}</li>
							    			<li>예약자명 : ${resDto.memName}</li>
							    			<li>이용예정일:  ${resDto.resDate}</li>
							    			<li>방문예정시간: ${resDto.resVisit}</li>
							    			<li>이용예정시간: ${resDto.resTime}</li>
							    			<li>예약지점: ${resDto.borName}</li>
							    			<li>예약인원: ${resDto.resCount}</li>
							    		</ol>
							    	</div>
								    <div class="text-center">
							    		<h4 class="lottemartdream">예약시간에 맞추어 방문해주시기를 바랍니다.</h4>
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
			<%@include file="../common/Footer.jsp" %>
			<%@include file="../common/Board.jsp" %>
			<%@include file="../common/Joinscript.jsp" %>
		</div>
	</body>
</html>