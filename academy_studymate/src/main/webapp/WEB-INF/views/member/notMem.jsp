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
			alert('아이디나 비밀번호를 확인해주세요.');
			//location.href = '${pageContext.request.contextPath}/login';
			history.back();
		</script>
	</body>
</html>