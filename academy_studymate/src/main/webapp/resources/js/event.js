$(function() {
	var now = new Date();
    var year= now.getFullYear();
    var month = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
    var today = year + '-' + month + '-' + day;
	
	$('input[name="boeDaterange"]').daterangepicker({
        minDate: today,
        locale: {
            format: 'YYYY/MM/DD'
        }
    });
	
	$("#btnevent").bind('click', function() {
		var boeNum = $("#boeNum").val();
		var memId = $("#memId").val();
		
		if (memId == '') {
			if (confirm("회원전용 서비스입니다.\n로그인하시겠습니까?") == true) {
				location.href = "/studymate/loginForm";
			}
			return false;
		}
		
		$.post('/studymate/joinEvent', { memId: memId, boeNum: boeNum }, function(resultMap) {
			var result = resultMap.eventResult;
			
			if (result == 'OK') {
				alert('응모되었습니다.');
			} else {
				alert('이미 응모하셨습니다.');
			}
		});
	});
	
});