<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>삭제</title>
	</head>
	<body>
		<form action="${pageContext.request.contextPath}/reserveDelete" id="delForm" method="post">
			<input type="hidden"  name="resNum" value="${resNum}">
			<input type="hidden"  name="currentPage" value="${currentPage}">
		</form>
		<script type="text/javascript">
			if (confirm("예약을 취소하시겠습니까?") == true) {
				document.getElementById('delForm').submit();
			} else {
				history.back();
			} 
		</script>
	</body>
</html>