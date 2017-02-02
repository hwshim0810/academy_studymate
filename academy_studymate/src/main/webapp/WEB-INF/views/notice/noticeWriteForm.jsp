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
	<div style="margin:auto; width:300px; text-align:center;">
		<form:form method="POST" commandName="noticeDto" action="noticeWrite">
			<div>
				<label for="title">제목</label><br>
				<form:input path="bonTitle" />
				<form:errors path="bonTitle" />
			</div>
			<br>
			<div>
				<label for="bon_content">내용</label><br>
				<form:textarea path="bonContent"/>
			</div>
			<br>
			<input type="submit">

		</form:form>
	</div>
</body>
</html>