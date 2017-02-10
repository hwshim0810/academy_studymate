$(function() {
	$("#btnsiteout").bind('click', function() {
		$.confirm({
			type: 'red',
		    title: '회원탈퇴',
		    content: '주의사항을 읽어보셨습니까?.',
		    buttons: {
		        탈퇴: {
		        	btnClass: 'btn-red',
		        	keys: ['enter'],
		        	action : function () {
		        		$('#siteoutForm').submit();
		        	}
		        },
		        돌아가기: function () {
		        	keys: ['esc']
		        }
		    }
		});
	});
	
	$("#btnclientUpdate").bind('click', function() {
		var memId = $("#memId").val();
		var oldPass = $("#oldPass").val();
		
		$.post('/studymate/isRightPass', { memId : memId, oldPass : oldPass } , function(resultMap) {
			var result = resultMap.searchResult;
			
			if (result == 'OK') {
				$("#memForm").submit();
			} else {
				$.alert({
					buttons: {
						tryAgain: {
				            text: '돌아가기',
				            btnClass: 'btn-red',
				            keys: ['enter','esc'],
				            action: function(){
				            }
						}
					},
					title: '확인',
				    type: 'red',
				    content: '비밀번호를 확인해주십시오.'
				});
				return false;
			}
		});
	});
	
	$("#memPass").keyup(function() {
		var chk = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_0123456789\~!@#$%^&*()_+| ";
        var length = 0;
		var memPass = $("#memPass").val();
		var memPassConfirm = $('#memPassConfirm').val();
		
		if (memPass != memPassConfirm) {
			$("#passMsg").html("<span class='label label-danger pull-right'>비밀번호가 일치하지 않습니다.</span>")
		} else {
			$("#passMsg").html("<span class='label label-success pull-right'>비밀번호가 일치합니다.</span>")
		}
		  
        for (var i = 0; i < memPass.length; i++){
               if (chk.indexOf(memPass.charAt(i)) >= 0 ) {
					length++;
               } else {
					length += 2;
               }
          }
		if (length >= 6) {
			$("#lengthmsg").html('<span class="label label-success pull-left" >패스워드길이: ' + length + ' </span>');
		} else {
			$("#lengthmsg").html('<span class="label label-danger pull-left" >패스워드길이: ' + length + ' </span>');
		}
	});
	
	$("#memPassConfirm").keyup(function() {
		var memPass = $("#memPass").val();
		var memPassConfirm = $('#memPassConfirm').val();
		
		if (memPass != memPassConfirm) {
			$("#passMsg").html("<span class='label label-danger pull-right'>비밀번호가 일치하지 않습니다.</span>")
		} else {
			$("#passMsg").html("<span class='label label-success pull-right'>비밀번호가 일치합니다.</span>")
		}
	});
	
	
});