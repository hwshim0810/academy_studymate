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
		<form:form method="POST" commandName="qnaDto" action="qnaWrite">
			<div>
				<label for="title">제목</label><br>
				<form:input path="boqTitle" />
				<form:errors path="boqTitle" />
			</div>
			<br>
			<div>
				<label for="boq_content">내용</label><br>
				<form:textarea path="boqContent" />
			</div>
			<br>
			<input type="submit">

		</form:form>
	</div>
	
<script type="text/javascript">

</script>
</body>
</html>