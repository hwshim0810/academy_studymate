<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>bbs</title>
</head>
<body>
	<div style="margin:auto; width:700px;">
		<!-- <div style="text-align:right;">
			<c:if test="${id==null}">
				<form action="/bbs/login.bbs">
					<input type="text" name="userName" placeholder="name">
					<input type="password" name="password" placeholder="pass">
					<input type="submit" value="Login">
				</form>
			</c:if>
			<c:if test="${id!=null}">
					${id}
					<button onclick="location.href='/bbs/index.bbs'">로그아웃</button>
			</c:if>
		</div> -->
		<br>
		<div style="margin:auto; width:700px;">
			<table border="1" width="100%">
				<thead>
					<tr>
						<th width="10%">글 번호</th>
						<th width="30%">글 제목</th>
						<th width="20%">리플수</th>
						<th width="30%">글 적은 날</th>
						<th width="10%">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${reviewList}">
						<c:url value="/reviewRead/${currentPage}-${item.borvNum}" var="readUrl">
							<c:param name="update" value="n" />
							<c:param name="keyField" value="${keyField}" />
							<c:param name="keyWord" value="${keyWord}" />
						</c:url>
						<tr>
							<td>${item.borvNum}</td>
							<td><a href="${readUrl}">${item.borvTitle}</a></td>
							<td>${item.borvReplycount}</td>
							<td>${item.borvRegdate}</td>
							<td>${item.borvReadcount}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5" align="center">${pageHtml}</td>
					</tr>
				</tfoot>
			</table>
			<button onclick="location.href='reviewWrite'">글쓰기</button>
			<button onclick="location.href='reviewList'">전체글</button>
		</div>
	</div>
</body>
</html>
