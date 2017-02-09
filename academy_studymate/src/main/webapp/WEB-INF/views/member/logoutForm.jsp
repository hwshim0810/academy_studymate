<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>로그아웃</title>
	</head>
	<body>
		<script type="text/javascript">
			if (confirm("로그아웃 하시겠습니까?") == true) {
				location.href = '${pageContext.request.contextPath}/logout';
			} else {
				history.back();
			} 
		</script>
	</body>
</html>