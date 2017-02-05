<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>writeForm</title>
</head>
<body>
	<form id="multiform" action="<%=request.getContextPath()%>/roomWrite" method="POST" enctype="multipart/form-data">
		<div>
			<input type="file" name="file" />
		</div>
		<input type="submit" value="업로드">
	</form>
</body>
</html>