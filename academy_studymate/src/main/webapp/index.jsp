<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="WEB-INF/views/common/Head.jsp" %>
	</head>
	<body>
		<%@include file="WEB-INF/views/common/Header.jsp" %>
		
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
		    <!-- Indicators -->
		    <ol class="carousel-indicators">
		      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		      <li data-target="#myCarousel" data-slide-to="1"></li>
		    </ol>
		
		    <!-- Wrapper for slides -->
		    <div class="carousel-inner" role="listbox">
		      <div class="item active">
		        <img src="https://placehold.it/1200x400?text=IMAGE" alt="Image">
		        <div class="carousel-caption">
		          <h3>Sell $</h3>
		          <p>Money Money.</p>
		        </div>      
		      </div>
		
		      <div class="item">
		        <img src="https://placehold.it/1200x400?text=Another Image Maybe" alt="Image">
		        <div class="carousel-caption">
		          <h3>More Sell $</h3>
		          <p>Lorem ipsum...</p>
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
		
		<div align="center">
			<h1>인덱스 페이지</h1>
			<a href='noticelist/1'>공지</a>
			<a href='qnalist/1'>Qna</a>
			<a href='roomList/1'>Room</a>
			<a href="reviewList/1">Review</a>
		</div>
		</div>
		<%@include file="WEB-INF/views/common/Footer.jsp" %>
	</body>
</html>
