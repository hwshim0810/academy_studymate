<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>삭제</title>
	</head>
	<body>
		<form action="${pageContext.request.contextPath}/eventDelete" id="delForm" method="post">
			<input type="hidden"  name="boeNum" value="${boeNum}" />
			<input type="hidden" name="currentPage" value="${currentPage}" />
		</form>
		<script type="text/javascript">
			if (confirm("글을 삭제하시겠습니까?") == true) {
				console.log(document.getElementById('delForm'));
				document.getElementById('delForm').submit();
			} else {
				history.back();
			} 
		</script>
	</body>
</html>