<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>삭제</title>
	</head>
	<body>
		<script type="text/javascript">
			alert('댓글이 있는 글은 삭제불가능합니다.');
			location.href = '${pageContext.request.contextPath}/reviewRead/${currentPage}-${borvNum}?update=y';
		</script>
	</body>
</html>