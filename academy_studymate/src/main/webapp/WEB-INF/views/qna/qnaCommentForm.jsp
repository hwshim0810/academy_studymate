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
		<form:form method="POST" commandName="qnaDto" action="qnaComment">
			<div>
				<label for="title">제목</label><br>
				<input type="hidden"  value="${qnaDto.boqNum}">
				<input type="hidden" name="boqGroupnum" value="${qnaDto.boqGroupnum}">
				<form:input path="boqTitle" value="${qnaDto.boqTitle}" />
				<form:errors path="boqTitle" />
			</div>
			<br>
			<div>
				<label for="boqContent">내용</label><br>
				<form:textarea path="boqContent" value="${qnaDto.boqContent}" />
			</div>
			<br>
			<input type="submit">

		</form:form>
	</div>
	
<script type="text/javascript">

</script>
</body>
</html>