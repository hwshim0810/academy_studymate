<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="./Head.jsp" %>
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
			
			<div id="myCarousel" class="carousel slide hidden-xs" data-ride="carousel">
			    <!-- Indicators -->
			    <ol class="carousel-indicators">
			      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			      <li data-target="#myCarousel" data-slide-to="1"></li>
			    </ol>
			
			    <!-- Wrapper for slides -->
			    <div class="carousel-inner" role="listbox">
			      <div class="item active">
			        <img src="https://placehold.it/1200x400?text=IMAGE" alt="Image">     
			      </div>
			
			      <div class="item">
			        <img src="https://placehold.it/1200x400?text=Another Image Maybe" alt="Image">     
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
				<div class="col-xs-12 col-sm-6 home_cell">
					<div class="simple_banner_wrap" data-type="vslide" data-interval="3000">
						<ul>
							<li><img src="https://placehold.it/1200x400?text=Another Image Maybe" alt="Image"></li>
							<li><img src="https://placehold.it/1200x400?text=Another Image Maybe" alt="Image"></li>
						</ul>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 home_cell">
					<div class="tabbable-panel cell_high">
						<div class="tabbable-line">
							<ul class="nav nav-tabs ">
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
		<%@include file="loadscript/HomeScript.jsp" %>
		</div>
	</body>
</html>