<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="../common/Head.jsp" %>
	</head>
	<body>
		<%@include file="../common/Header.jsp" %>
		<div class="body_top">
		</div>
		<div class="body center_align">
			<div class="boardtitle lottemartdream"></div>
			<div class="pull-left count">
				<span>총 ${totalCount}건 ${currentPage}페이지</span>
			</div>
			<div class="pull-right">
				<ol class="breadcrumb">
				  <li><a href="/studymate">Home</a></li>
				  <li class="active">공지사항</li>
				</ol>
			</div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="hidden-xs hidden-sm">번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${noticeList}">
						<c:url value="/noticeRead/${currentPage}-${item.bonNum}" var="readUrl">
							<c:param name="update" value="n" />
							<c:param name="keyField" value="${keyField}" />
							<c:param name="keyWord" value="${keyWord}" />
						</c:url>
						<tr>
							<td class="table_center hidden-xs">${item.bonNum}</td>
							<td class="table_center"><a href="${readUrl}">${item.bonTitle}</a></td>
							<td class="table_center">${item.bonRegdate}</td>
							<td class="table_center">${item.bonReadcount}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5" align="center">${pageHtml}</td>
					</tr>
				</tfoot>
			</table>
			<div class="searchdiv">
				<form class="form-inline" id="searchform">
					<div class="form-group row col-sm-6 col-md-6 col-lg-6">
						<div class="col-xs-4 col-sm-3 col-md-3 col-lg-3 field">
							<label for="sel1" class="sr-only">검색 범위</label>
							<select class="form-control" id="keyField" name="keyField">
								<option value="titleNcontent">제목+내용</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
							</select>
						</div>
						<div class="col-xs-5 col-sm-6 col-md-6 col-lg-6">
							<label class="sr-only">검색 내용:</label>
							<input type="text" class="form-control" id="keyWord" name="keyWord">
						</div>
						<div class="col-xs-1 col-sm-2 col-md-2 col-lg-2">
							<button class="btn btn-default" id="btnsearch">검색</button>
						</div>
					</div>
				</form>
			</div>
			<br>
			<div class="btndiv">
				<div class="pull-right">
					<button class="btn btn-success btn-font" id="btnwrite">글쓰기</button>
				</div>
				<div class="pull-left">
					<button class="btn btn-primary btn-font" id="btnlist">목록</button>
				</div>
			</div>
		</div>
		<input type="hidden" id="boardtitle" value="공지사항">
		<input type="hidden" id="boardid" value="notice">
		<%@include file="../common/Footer.jsp" %>
		<%@include file="../common/Board.jsp" %>
	</body>
</html>