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
			alert('비밀번호가 틀렸습니다.');
			//location.href = '${pageContext.request.contextPath}/login';
			history.back();
		</script>
	</body>
</html>