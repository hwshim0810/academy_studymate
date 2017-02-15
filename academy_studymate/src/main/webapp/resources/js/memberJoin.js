$(function() {
	$("#btnfindid").bind('click', function() {
		$("#findIdForm").submit();
	});
	
	$("#btnfindpass").bind('click', function() {
		$("#findPassForm").submit();
	});
	
    $("input[name=memPass]").keypress(function(key) {
        if (key.keyCode == 13) {
        	key.preventDefault();
	        $("#btnlogin").click();
	    }
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
	
	
	$("#btnid").click(function() {
		$.MessageBox({
			  input    : true,
			  message  : "사용하실 아이디를 입력해주세요."
			}).done(function(data){
				
			data = data.trim();	
			var idReg = /^[a-zA-Z][A-Za-z0-9]{4,10}$/g;
			if (!data) {
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
				    title: '빈아이디',
				    type: 'red',
				    content: '아이디를 입력해 주십시오.'
				});
				return false;
			}

			
			if(!idReg.test(data)) {
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
					columnClass: 'col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1',
				    title: '양식에 맞지않음',
				    type: 'red',
				    content: '알파벳으로 시작/알파벳,숫자 혼용 5~11자 가능'
				});
				return false;
			}
			$.post('/studymate/isAbleId', 'memId=' + data, function(resultMap) {
				var result = resultMap.searchResult;
				
				if (result == 'OK') {
					$.confirm({
						type: 'green',
					    title: '사용가능',
					    content: '사용가능한 아이디입니다.',
					    buttons: {
					        사용하기: {
					        	btnClass: 'btn-green',
					        	keys: ['enter'],
					        	action : function () {
					        		$("#memId").val(data);
					        	}
					        },
					        돌아가기: function () {
					        	keys: ['esc']
					        }
					    }
					});
					return false;
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
						title: '사용불가',
					    type: 'red',
					    content: '이미 존재하는 아이디입니다.'
					});
					return false;
				}
			});
		});
	});
	
	// 쿠키를 이용한 아이디 저장
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var userInputId = $.cookie("userInputId");
    $("input[name='memId']").val(userInputId); 
     
    if ($("input[name='memId']").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#saveId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#saveId").change(function() { // 체크박스에 변화가 있다면,
        if ($("#saveId").is(":checked")) { // ID 저장하기 체크했을 때,
            var userInputId = $("input[name='memId']").val();
            $.cookie('userInputId', userInputId, { expires: 7 });// 7일 동안 쿠키 보관
        } else { // ID 저장하기 체크 해제 시,
        	$.removeCookie('userInputId');
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='memId']").keyup(function() { // ID 입력 칸에 ID를 입력할 때,
        if ($("#saveId").is(":checked")) { // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='memId']").val();
            $.cookie('userInputId', userInputId, { expires: 7 }); // 7일 동안 쿠키 보관
        }
    });
    
    
});