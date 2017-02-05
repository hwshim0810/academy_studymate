<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function member_update(){
	location.href="noticeUpdate?bonNum=${noticeDto.bonNum}&currentPage=${currentPage}&update=yes";
}
function member_delete(){
	location.href="<%=request.getContextPath()%>/roomDelete/${currentPage}?borNum=${roomDto.borNum}";
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보</title>
</head>
<body>
<h1>정보</h1>

<table width="400">
	<tr>
		<th width="150">글쓴이</th><td width="250"></td>
	</tr>
	<tr>
		<th>작성일</th><td>${roomDto.borRegdate}</td>
	</tr>
	<tr>
		<th>제목</th><td>${roomDto.borName}</td>
	</tr>
	<tr>
		<th>내용</th><td>${roomDto.borNewFilename}</td>
	</tr>
	<tr>
		<th>조회수</th><td>${roomDto.borReadcount}</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" value="수정" onclick="member_update()"/>
			<input type="button" value="삭제" onclick="member_delete()"/>
			<!--<c:choose>
				<c:when test="${sessionScope.GRADE == 'ADMIN' }">
					<input type="button" value="회원 목록" onclick="location.href='list.htm'"/>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>-->
			<c:url value="/roomList/${currentPage}" var="listUrl">
				<c:param name="keyField" value="${keyField}" />
				<c:param name="keyWord" value="${keyWord}" />
			</c:url>
			<a href="${listUrl}">글목록</a>
		</td>
	</tr>
	
</table>
</body>
</html>