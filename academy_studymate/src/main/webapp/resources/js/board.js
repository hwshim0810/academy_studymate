$(function() {
	var context = '/studymate/';
	var boardid = $('#boardid').val();
	var updateid = $('#boardupdate').val();
	var deleteid = $('#boarddelete').val();
	var realdelid = $('#realdelete').val();
	var commentid = $("#boardcomment").val();

	$("#btnlist").bind('click', function() {
		location.href = context + boardid + 'List/1';
	});
	
	$("#btnwrite").bind('click', function() {
		location.href = context + boardid + 'Write';
	});
	
	$("#btnreg").bind('click', function() {
		submitContents();
	});

//	$(".btn-read").bind('click', function() {
//		var action = this.prop("id");
//		location.href = context + boardid + action + updateid;
//	});
	$("#btnupdate").bind('click', function() {
		location.href = updateid;
	});
	
	$("#btndelete").bind('click', function() {
		location.href = deleteid;
	});
	
	$('#btnreal').bind('click', function() {
		location.href = context + boardid + 'RealDel' + realdelid;
	});
	
	$("#btnback").bind('click', function() {
		document.referrer&&-1!=document.referrer.indexOf("studymate")?history.back():location.href="/main";
	});
	
	$("#btncomment").bind('click', function() {
		location.href = commentid;
	});
	
	$("#btnreply").bind('click', function() {
		$("#replyform").submit();
	});

	$(".btnrepdel").bind('click', function() {
		var currentPage = $("#currentPage").val();
		var borvNum = $("input[name=borvNum]").val();
		var repNum = $("#repNum").val();
		
		$.post('/studymate/revReplyDelete', {currentPage : currentPage, borvNum : borvNum, repNum : repNum} , function(resultMap) {
			location.href = resultMap.result;
		});
	});
	
	$("#btnsearch").bind('click', function() {
		$("#searchform").submit();
	});
	
	$("#btnres").bind('click', function() {
		$("#resForm").submit();
	});
	
	$("#btnres_unselect").bind('click', function() {
		var borNum = $("#borselect").val();
		
		$.post('/studymate/getBorName', 'borNum=' + borNum, function(temp) {
			var result = temp.searchResult;
			$("#roomName").val(result);
			console.log('borName:' + result);
			$("#resForm").submit();
		});
	});
	
	$("#btnaddr").bind('click', function() {
		execDaumPostcode();
	});
	
	$("#btntoindex").bind('click', function() {
		location.href = context;
	});
	
	$("#btntologin").bind('click', function() {
		location.href = context + 'login';
	});
	
	$("#btntojoin").bind('click', function() {
		location.href = context + 'memberWrite';
	});
	
	$("#btntomypage").bind('click', function() {
		location.href = context + 'memberMypage';
	});
	
	$("#btnlogin").bind('click', function() {
		$("#loginForm").submit();
	});
	
	 $('.date').datepicker({
		  prevText: '이전 달',
		  nextText: '다음 달',
		  monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		  dayNames: ['일','월','화','수','목','금','토'],
		  dayNamesShort: ['일','월','화','수','목','금','토'],
		  dayNamesMin: ['일','월','화','수','목','금','토'],
		  dateFormat: 'yy-mm-dd',
		  showMonthAfterYear: true,
		  yearSuffix: '년',
		  maxDate:'+30d',
	      showButtonPanel: true,
	      minDate: 0, //오늘이후 선택불가
	      closeText: 'Clear', // 내용클리어버튼
	      onClose: function(dateText, inst) {
	        if ($(window.event.srcElement).hasClass('ui-datepicker-close')) {
	          document.getElementById(this.id).value = '';
	        }
	      }
	 });
	 
	 $('.birthdate').datepicker({
		  prevText: '이전 달',
		  nextText: '다음 달',
		  monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		  dayNames: ['일','월','화','수','목','금','토'],
		  dayNamesShort: ['일','월','화','수','목','금','토'],
		  dayNamesMin: ['일','월','화','수','목','금','토'],
		  dateFormat: 'yy-mm-dd',
		  showMonthAfterYear: true,
	      changeMonth: true,
	      changeYear: true,
		  yearSuffix: '년',
		  maxDate:'+30d',
	      showButtonPanel: true,
	      closeText: 'Clear', // 내용클리어버튼
	      onClose: function(dateText, inst) {
	        if ($(window.event.srcElement).hasClass('ui-datepicker-close')) {
	          document.getElementById(this.id).value = '';
	        }
	      }
	 });
	
	 $('#resVisit').timepicker({
		    timeFormat: 'h:mm p',
		    interval: 30,
		    minTime: '7',
		    maxTime: '9:00pm',
		    defaultTime: '7',
		    startTime: '7:00',
		    dynamic: false,
		    dropdown: true,
		    scrollbar: true
		});
	
    $("input[name=keyWord]").keypress(function(key) {
        if (key.keyCode == 13) {
        	key.preventDefault();
	        $("#btnsearch").click();
	    }
	});
    
    //use jQuery MultiFile Plugin 
    $('#multiform input[name=main]').MultiFile({
        max: 1, 
        accept: 'jpg|png|gif',
        maxfile: 3024, //각 파일 최대 업로드 크기
        maxsize: 3024,  //전체 파일 최대 업로드 크기
        STRING: {
            remove : "제거", //이미지사용가능
            duplicate : "$file 은 이미 선택된 파일입니다.", 
            denied : "$ext 는(은) 업로드 할수 없는 파일확장자입니다.",
            selected:'$file 을 선택했습니다.', 
            toomuch: "업로드할 수 있는 최대크기를 초과하였습니다.($size)", 
            toomany: "업로드할 수 있는 최대 갯수는 $max개 입니다.",
            toobig: "$file 은 크기가 매우 큽니다. (max $size)"
        },
        list:"#filelist" //파일목록을 출력
    });
    
    //use jQuery MultiFile Plugin 
    $('#multiform input[name=sub]').MultiFile({
        max: 2, //업로드 최대 파일 갯수 (지정하지 않으면 무한대)
        accept: 'jpg|png|gif', //허용할 확장자(지정하지 않으면 모든 확장자 허용)
        maxfile: 3024, //각 파일 최대 업로드 크기
        maxsize: 6048,  //전체 파일 최대 업로드 크기
        STRING: { //Multi-lingual support : 메시지 수정 가능
            remove : "제거", //추가한 파일 제거 문구, 이미태그를 사용하면 이미지사용가능
            duplicate : "$file 은 이미 선택된 파일입니다.", 
            denied : "$ext 는(은) 업로드 할수 없는 파일확장자입니다.",
            selected:'$file 을 선택했습니다.', 
            toomuch: "업로드할 수 있는 최대크기를 초과하였습니다.($size)", 
            toomany: "업로드할 수 있는 최대 갯수는 $max개 입니다.",
            toobig: "$file 은 크기가 매우 큽니다. (max $size)"
        },
        list:"#sublist" //파일목록을 출력할 요소 지정가능
    });
	
	$(document).on("click", ".rppaging",function(event) {
		// 클릭한 대상의 아이디를 리플 페이지로 사용
		var id = event.target.id;
		$("#replyPage").val(id);
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
	
	//폼전송 : 해당폼의 submit 이벤트가 발생했을경우 실행  
    $('#replyform').ajaxForm ({
       cache: false,
       dataType:"json",
       //보내기전 validation check가 필요할경우
       beforeSubmit: function (data, frm, opt) {
    	   var repContent = $('#replyform input[name=repContent]').val().trim();
    	   if (repContent == '') {
    		   alert('내용을 입력해주십시오');
    		   return false;
    	   }
           return true;
       },
       success: function(data, statusText){
           output(data);
       },
       error: function(e){
           alert("에러발생!!");
           console.log(e);
       }                               
	});
    
    $(".room_thumb").mouseover(function() {
    	var src = $(this).attr('src');
    	$("#read_mainimg").attr('src', src);
    });
    
    // 추천
    $("#like").bind('click', function() {
    	var studymateLike = $.cookie("studymateLike");
    	var borvNum = $("#replyBorv").val();
    	if (studymateLike == undefined || studymateLike != borvNum) {
    		$.cookie('studymateLike', borvNum, { expires: 1});
    		$.post('/studymate/updateLike', {borvNum : borvNum} , function() {
    			alert('추천하였습니다!');
    		});
    		return false;
    	} else {
    		alert('이미 추천하셨습니다.');
    		return false;
    	}
    });
	
});


//전달받은 정보를 가지고 화면에 보기 좋게 출력
function output(data) {
	var count = 0;
	$("#replyresult").html('');
	var memName = $("input[name=memName]").val();
	var memId = $("input[name=memId]").val();

	if (data.reviewReply && data.reviewReply.length != 0) {
		$.each (data.reviewReply, function(index, item) {
			count++;
			$("#replyresult").append('<tr class="rpRow" id="rp' + count +'">');
			$("#rp" + count).append('<td>' + item.memName);
			$("#rp" + count).append('<td>' + item.repContent);
			$("#rp" + count).append('<td>' + item.repRegdate);
			if (memId == 'admin' || item.memName == memName) {
				$("#rp" + count).append('<td><button class="btn btn-danger btn-font pull-right btnrepdel">삭제</button>');
			} else {
				$("#rp" + count).append('<td>');
			}
		});
		$("#tfoot").html('');
		$("#tfoot").append('<tr id="tfpaging">');
		$("#tfpaging").append('<td id="tftd" colspan="4" align="center">');
		$("#tftd").append(data.replyPaging);
		$("#replyBorv").val(data.borvNum);
	}

    //$('#multiform')[0].reset();  //폼 초기화(리셋);
    //$('#multiform').resetForm();   //위코드와 동일 (jQuery.Form 플러그인 메서드)
    $('#replyform').clearForm(); //(jQuery.Form 플러그인 메서드)
     
    //IE에서 폼 리셋후 input[type=file] 초기화 안되는 문제. 
    //(파일이름은 지워지지만 files 프로퍼티에는 파일정보 남아있음.)
    /* if(/(MSIE|Trident)/.test(navigator.userAgent)) {
    	//ie 일때 input[type=file] init.
    	$("#multiform input[type=file]").each(function(index){
    		$(this).replaceWith($(this).clone(true));
    	});
    } */
}

function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $('#addr').val(fullAddr);

            // 커서를 상세주소 필드로 이동한다.
           $('#detailaddr').focus();
        }
    }).open();
}