$(function() {
	$("#memPass").keyup(function() {
		var chk = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_0123456789\~!@#$%^&*()_+| ";
        var length = 0;
		var memPass = $("#memPass").val();
		  
        for (var i = 0; i < memPass.length; i++){
               if (chk.indexOf(memPass.charAt(i)) >= 0 ) {
					length++;
               } else {
					length += 2;
               }
          }
         $("#lengthmsg").html("패스워드길이: " + length);
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
			
			$.post('/studymate/isAbleId', 'memId=' + data, function(temp) {
				var result = temp.searchResult;
				
				if (result == 'OK') {
					$.confirm({
						type: 'green',
					    title: '사용가능',
					    content: '사용가능한 아이디입니다.',
					    buttons: {
					        사용하기: {
					        	btnClass: 'btn-green',
					        	action : function () {
					        		$("#memId").val(data);
					        	}
					        },
					        돌아가기: function () {
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
	
	var context = '/studymate/';
	var title = $('#boardtitle_client').val();
	$('.boardtitle').html(
			'<h1 class="htag normal w300 subsize">' + title + '</h1>'
			+ '<div class="pull-right"><ol class="breadcrumb">' 
			+ '<li><a href="'+ context + '">Home</a></li>'
			+ '<li class="active">' + title + '</li>'
			+ '</ol></div>'
			+ '<br><br><hr>');		
});