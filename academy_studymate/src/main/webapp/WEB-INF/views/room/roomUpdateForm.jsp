<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정</title>
<!--  --<script type="text/javascript">
	function board_update(){
		if(document.updateform.title.value==""){
			alert("제목을 입력해주세요");
			document.updateform.title.focus();
		}else if(document.updateform.content.value==""){
			alert("내용을 입력해주세요");
			document.updateform.content.focus();
		}else{
			document.updateform.submit(); //전송
		}
	}
</script>-->
</head>
<body>
<h1>수정</h1>
<form name = "updateform" action="noticeUpdate?bonNum=${noticeDto.bonNum}&currentPage=${currentPage}" method="post">
<table width="400">
	<tr>
		<th width="150">글쓴이</th>
		<td width="250">
			<input type="hidden" name="bon_num" value="${noticeDto.bonNum}"/>
		</td>
	</tr>
	<tr>
		<th>작성일</th><td>${noticeDto.bonRegdate}</td>
	</tr>
	<tr>
		<th>조회수</th><td>${noticeDto.bonReadcount}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>
			<input type="text" name="bonTitle" maxlength="20" size="20" value="${noticeDto.bonTitle}"/>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<input type="text" name="bonContent" maxlength="20" size="20" value="${noticeDto.bonContent}"/>
		</td>
	</tr>
	<tr>
		<td>
			<button type="submit">수정</button>
		</td>
	</tr>
</table>
	<button onclick="history.back()">돌아가기</button>
	<!--<c:choose>
		<c:when test="${sessionScope.GRADE == 'ADMIN' }">
			<input type="button" value="회원 목록" onclick="location.href='list.htm'"/>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>-->
	<a href='noticelist?currentPage=${currentPage }&keyField=${keyField }&keyWord=${keyWord}'>글목록</a>
</form>
</body>
</html>