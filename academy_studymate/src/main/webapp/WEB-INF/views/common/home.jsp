<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="./Head.jsp" %>
		<link rel="stylesheet" href="<c:url value='/resources/css/mypage.css' />" />
	</head>
	<body>
		<div class="wrapper">
			<c:choose>
				<c:when test="${not empty sessionScope.memId}">
					<%@include file="./Header_afterIn.jsp"%>
				</c:when>
				<c:otherwise>
					<%@include file="./Header.jsp"%>
				</c:otherwise>
			</c:choose>
			
			<div id="myCarousel" class="carousel slide boxshadow" data-ride="carousel">
			    <!-- Indicators 
			    <ol class="carousel-indicators">
			      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			      <li data-target="#myCarousel" data-slide-to="1"></li>
			    </ol>-->
			    <!-- Wrapper for slides -->
			    <div class="carousel-inner hidden-xs" role="listbox">
			      <div class="item active">
			        <img src="${pageContext.request.contextPath}/resources/img/idx_main1.jpg" alt="메인배너"> 
	                <div class="carousel-caption lottemartdream normal w250">
			            <h2 class="pull-right">편안한 분위기의 열람실을 이용해보세요.</h2>
			        </div>      
			      </div>
			      
			     <div class="item banner1">
			        <img src="${pageContext.request.contextPath}/resources/img/idx_main2.jpg" alt="메인배너"> 
	                <div class="carousel-caption lottemartdream normal w250">
			            <h2 class="pull-right">Studymate에서 일시적인 사무공간을 지원해드립니다!</h2>
			        </div>      
			      </div>
			      
    			  <div class="item banner1">
			        <img src="${pageContext.request.contextPath}/resources/img/idx_main3.jpg" alt="메인배너"> 
	                <div class="carousel-caption lottemartdream normal w250">
			            <h2 class="pull-right">다양한 크기의 부스가 준비되어있습니다.</h2>
			        </div>      
			      </div>
			      
        		  <div class="item banner1">
			        <img src="${pageContext.request.contextPath}/resources/img/idx_main4.jpg" alt="메인배너"> 
	                <div class="carousel-caption lottemartdream normal w250">
			            <h2 class="pull-right">오픈스터디룸에서 여러분의 작업에 자극을 받아보세요.</h2>
			        </div>      
			      </div>
			      
			    </div>
			
			    <!-- Left and right controls -->
			    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
			      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			      <span class="sr-only">이전배너</span>
			    </a>
			    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
			      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			      <span class="sr-only">다음배너</span>
			    </a>
		</div>
		<div class="body center_align">
			<div class="row">
				<section class="col-xs-12 col-sm-6 home_cell">
					<div id="myCarousel" class="carousel slide boxshadow" data-ride="carousel">
						<div class="carousel-inner" role="listbox">
						     <div class="item active">
						        <a href="${pageContext.request.contextPath}/roomList/1">
						        	<img class="mini_banner" src="${pageContext.request.contextPath}/resources/img/main.jpg" alt="지점소개배너">
						        </a> 
				                <div class="carousel-caption lottemartdream normal w250">
						            	<h3 class="pull-right">
						            		<a class="acolor" href="${pageContext.request.contextPath}/roomList/1">Studymate지점소개</a>
						            	</h3>
						        </div>      
						      </div>
					      
						    <c:forEach var="roomDto" items="${roomList }">
						      <div class="item">
						      	<a href="${pageContext.request.contextPath}/roomRead/1-${roomDto.borNum}">
									<img class="mini_banner" id="read_mainimg" alt="지점이미지" src="${pageContext.request.contextPath}/resources/roomImg/${roomDto.borMain}" style="height: 309px;">
								</a>
								 <div class="carousel-caption lottemartdream normal w250">
						            	<h3 class="pull-right">
						            		<a class="acolor" href="${pageContext.request.contextPath}/roomRead/1-${roomDto.borNum}">${roomDto.borName}</a>
						            	</h3>
						            	<p class="pull-right">
						            		<a class="acolor" href="${pageContext.request.contextPath}/roomRead/1-${roomDto.borNum}">${roomDto.borIntro}</a>
						            	</p>
						        </div>
							 </div>
							</c:forEach>
				     	 </div>
					
					</div>
				</section>
				<div class="col-xs-12 col-sm-6 home_cell">
					<div class="tabbable-panel cell_high boxshadow">
						<div class="tabbable-line">
							<ul class="nav nav-tabs lottemartdream">
								<li class="active">
									<a href="#noticeList" data-toggle="tab">공지사항</a>
								</li>
								<li>
									<a href="#reviewList" data-toggle="tab">지점후기</a>
								</li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="noticeList">
									<div class="row">
										<c:forEach var="item" items="${noticeList}">
											<c:url value="/noticeRead/1-${item.bonNum}" var="readUrl">
												<c:param name="update" value="n" />
												<c:if test="${not empty keyField && not empty keyWord}">
													<c:param name="keyField" value="${keyField}" />
													<c:param name="keyWord" value="${keyWord}" />
												</c:if>
											</c:url>
											<div class="col-xs-12 lighter lottemartdream main_list"><a href="${readUrl}">${item.bonTitle}</a></div>
										</c:forEach>
									</div>
								</div>
								<div class="tab-pane" id="reviewList">
									<div class="row">
										<c:forEach var="item" items="${reviewList}">
											<c:url value="/reviewRead/1-${item.borvNum}" var="readUrl">
												<c:param name="update" value="n" />
												<c:if test="${not empty keyField && not empty keyWord}">
													<c:param name="keyField" value="${keyField}" />
													<c:param name="keyWord" value="${keyWord}" />
												</c:if>
											</c:url>
											<div class="col-xs-12 lighter lottemartdream main_list"><a href="${readUrl}">${item.borvTitle}</a></div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<%@include file="./Footer.jsp" %>
		</div>
	</body>
</html>