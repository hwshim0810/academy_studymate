<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 보기: ${reviewDto.borvTitle}</title>
</head>
<body>
<div class="wrapper">	
	<table class="boardView">
		<tr>
			<td colspan="4"><h3>${reviewDto.borvTitle}</h3></td>
		</tr>
		<tr>
			<th>작성자</th>
			<th>조회수</th>
			<th>리플수</th>
			<th>작성일</th>
		</tr>
		<tr>
			<td>${reviewDto.borvTitle}</td>
			<td>${reviewDto.borvReadcount}</td>
			<td>${reviewDto.borvReplycount}</td>
			<td>${reviewDto.borvRegdate}</td>
		</tr>
		<tr>
			<th colspan="4">내용</th>
		</tr>
		<tr>
			<td colspan="4" align="left"><p>${reviewDto.borvContent}</p><br /><br /></td>
		</tr>		
	</table>
	<table class="commentView">
		<tr>
			<th colspan="2">댓글</th>
		</tr>		
		<c:forEach var="comment" items="${reviewReply}">
		<tr>
			<td class="writer">				
				<p>${comment.memName}
					<br /><a href="revReplyDelete/${currentPage}-${reviewDto.borvNum}-${comment.repNum}-y"><small>댓글 삭제</small></a>					
				</p>
			</td>
			<td class="content" align="left">
				<span class="date">${comment.repRegdate}</span>
				<p>${comment.repContent}</p>
			</td>
		</tr>
		</c:forEach>
		<tr>
			<td class="writer"><strong>댓글 쓰기</strong></td>
			<td class="content">
				<form id="comfrm" action="revReplyWrite/${currentPage}-y" method="post">
					<input type="hidden" id="keyField" name="keyField" value="${param.keyField}">
					<input type="hidden" id="keyWord" name="keyWord" value="${param.keyWord}">
					<input type="hidden" id="memName" name="memName" value="운영자" />
					<input type="hidden" id="memId" name="memId" value="admin" />
					<input type="hidden" id="borvNum" name="borvNum" value="${reviewDto.borvNum}" />
					<textarea id="repContent" name="repContent" class="commentForm"></textarea>
					<input type="submit" value="확인" class="commentBt" />
				</form>
			</td>
		</tr>
	</table>
	<br />
	<input type="button" value="삭제" class="writeBt" onclick="moveAction(1)" />
	<input type="button" value="수정" class="writeBt" onclick="moveAction(2)" />
	<input type="button" value="목록" class="writeBt" onclick="moveAction(3)" />
</div>
</body>
</html>