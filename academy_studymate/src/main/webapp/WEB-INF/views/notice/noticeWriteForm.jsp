<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/smartEdit/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
				<form:textarea path="bonContent" rows="10" cols="100" id="bonContent"/>
			</div>
			<br>
			<button onclick="submitContents()">입력</button>

		</form:form>
	</div>
	<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "bonContent",
	    sSkinURI: "<%=request.getContextPath()%>/resources/smartEdit/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	});
	function submitContents(elClickedObj) {
	    // 에디터의 내용이 textarea에 적용된다.
	    oEditors.getById["bonContent"].exec("UPDATE_CONTENTS_FIELD", []);
	 
	    // 에디터의 내용에 대한 값 검증은 이곳에서
	    // document.getElementById("ir1").value를 이용해서 처리한다.
	 
    	var comments = $('#bonContent').val();
		var objReplace = new RegExp(); 
		objReplace = /[<][^>]*[>]|(&nbsp;*)|(\s*)|(\n*)/gi; 
		comments = comments.replace(objReplace, "");
	
		$('#bonContent').val($("#bonContent").val().replace(unescape("%uFEFF"), ""));
	    try {
	        elClickedObj.form.submit();
	    } catch(e) {} }
</script>
</body>
</html>