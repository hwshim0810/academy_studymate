<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>확인</title>
	</head>
	<body>
		<script type="text/javascript">
			if (confirm("회원전용서비스입니다.\n로그인하시겠습니까?") == true) {
				location.href = '/studymate/loginForm';
			} else {
				history.back();
			} 
		</script>
	</body>
</html>