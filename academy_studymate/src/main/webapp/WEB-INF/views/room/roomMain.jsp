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
						<th width="20%">글 쓴이</th>
						<th width="30%">글 적은 날</th>
						<th width="10%">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${roomList}">
						<c:url value="/roomRead/${currentPage}-${item.borNum}" var="readUrl">
							<c:param name="keyField" value="${keyField}" />
							<c:param name="keyWord" value="${keyWord}" />
							<c:param name="update" value="n" />
						</c:url>
						<tr>
							<td>${item.borNum}</td>
							<td><a href="${readUrl}">${item.borName}</a></td>
							<td></td>
							<td>${item.borRegdate}</td>
							<td>${item.borReadcount}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5" align="center">${pageHtml}</td>
					</tr>
				</tfoot>
			</table>
			<button onclick="location.href='<%=request.getContextPath()%>/roomWrite">글쓰기</button>
			<button onclick="location.href='roomList'">전체글</button>
		</div>
	</div>
</body>
</html>
