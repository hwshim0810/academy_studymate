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
	
	$(document).on("click", ".respaging",function(event) {
		// 클릭한 대상의 아이디를 예약 페이지로 사용
		var id = event.target.id;
		$("#resPage").val(id);
		$("#pagingform").submit();
	});
	
    $('#pagingform').ajaxForm ({
        cache: false,
        dataType:"json",
        //보내기전 validation check가 필요할경우
        beforeSubmit: function (data, frm, opt) {
        	return true;
        },
        success: function(data, statusText){
            output(data); //받은 정보를 화면 출력하는 함수 호출
        },
        error: function(e){
            alert("에러발생!!");
            console.log(e);
        }                               
 	});
});

//전달받은 정보를 가지고 화면에 보기 좋게 출력
function output(data) {
	var count = 0;
	$("#resResult").html('');

	if (data.resList && data.resList.length != 0) {
		$.each (data.resList, function(index, item) {
			count++;
			$("#resResult").append('<tr id="rp' + count +'">');
			$("#rp" + count).append('<td>' + item.resNum);
			$("#rp" + count).append('<td>' + item.memName);
			$("#rp" + count).append('<td>' + item.borName);
			$("#rp" + count).append('<td>' + item.resDate);
			$("#rp" + count).append('<td>' + item.resTime);
		});
		$("#tfoot").html('');
		$("#tfoot").append('<tr id="tfpaging">');
		$("#tfpaging").append('<td id="tftd" colspan="5" class="table_center">');
		$("#tftd").append(data.pageHtml);
	}

    //$('#multiform')[0].reset();  //폼 초기화(리셋);
    //$('#multiform').resetForm();   //위코드와 동일 (jQuery.Form 플러그인 메서드)
//    $('#replyform').clearForm(); //(jQuery.Form 플러그인 메서드)
     
    //IE에서 폼 리셋후 input[type=file] 초기화 안되는 문제. 
    //(파일이름은 지워지지만 files 프로퍼티에는 파일정보 남아있음.)
    /* if(/(MSIE|Trident)/.test(navigator.userAgent)) {
    	//ie 일때 input[type=file] init.
    	$("#multiform input[type=file]").each(function(index){
    		$(this).replaceWith($(this).clone(true));
    	});
    } */
}