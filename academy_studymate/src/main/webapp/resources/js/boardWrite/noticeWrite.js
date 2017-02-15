$(function() {
	$("#btnreg").bind('click', function() {
		submitContents();
	});
	$("#btnup").bind('click', function() {
		submitContents();
	});
});

var oEditors = [];
		
		nhn.husky.EZCreator.createInIFrame({
		    oAppRef: oEditors,
		    elPlaceHolder: "bonContent",
		    sSkinURI: "/studymate/resources/smartEdit/SmartEditor2Skin.html",
		    fCreator: "createSEditor2",
		    htParams: {
		    	//bUseToolbar : true,    // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	    	    bUseVerticalResizer : false,  // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	    	    bUseModeChanger : false   // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		    }
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