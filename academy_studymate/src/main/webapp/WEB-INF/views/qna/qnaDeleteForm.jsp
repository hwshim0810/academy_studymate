<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>삭제</title>
	</head>
	<body>
		<form action="/studymate/qnaDelete" id="delForm" method="post">
			<input type="hidden" name="boqGroupnum" value="${param.gNum}">
			<input type="hidden"  name="boqNum" value="${param.boqNum}">
			<input type="hidden"  name="currentPage" value="${param.currentPage}">
		</form>
		<script type="text/javascript">
			if (confirm("글을 삭제하시겠습니까?") == true) {
				document.getElementById('delForm').submit();
			} else {
				history.back();
			} 
		</script>
	</body>
</html>