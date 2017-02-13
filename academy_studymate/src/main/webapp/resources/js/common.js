$(function () {
	var context = '/studymate/';
	var boardid = $('#boardid').val();
	var title_client = $('#boardtitle_client').val();
	var client_page = $("#client_page").val();
	var title = $('#boardtitle').val();
	var subtitle = $('#boardsubtitle').val();
	var totalcount = $('#boardtotal').val();
	var currentpage = $('#boardpage').val();
	var infomsg = $('#boardinfo').val();
	
	
	if (title != undefined) {
		$('#infodiv').html('<h1>' + title + '</h1><p>' + infomsg + '</p>');
		$(".boardmaintitle").html(
				'<h1 class="htag normal w300 subsize">'	+ title + '</h1>'
				+ '<div class="pull-left count"><span>총 ' + totalcount + '건 현재 '	+ currentpage + ' 페이지</span></div>'
				+ '<div class="pull-right"><ol class="breadcrumb">' 
				+ '<li><a href="/studymate">Home</a></li>'
				+ '<li class="active">' + title + '</li>'
				+ '</ol></div>'
				+ '<br><br><hr>');
	} else {
		$('#infodiv').html('<h1>' + title_client + '</h1><p>' + infomsg + '</p>');
		$(".boardmaintitle").html(
				'<h1 class="htag normal w300 subsize">'	+ title_client + '</h1>'
				+ '<div class="pull-left count"><span>총 ' + totalcount + '건 현재 '	+ currentpage + ' 페이지</span></div>'
				+ '<div class="pull-right"><ol class="breadcrumb">' 
				+ '<li><a href="/studymate">Home</a></li>'
				+ '<li class="active">' + title_client + '</li>'
				+ '</ol></div>'
				+ '<br><br><hr>');
	}
	
	if (title_client == undefined && subtitle != undefined) { // 관리자 서브타이틀존재
		$(".boardtitle").html(
				'<h1 class="htag normal w300 subsize">' + title + '</h1>'
				+ '<div class="pull-right"><ol class="breadcrumb">' 
				+ '<li><a href="' + context +'">Home</a></li>'
				+ '<li><a href="' + context + boardid + 'List/1">' + title + '</a></li>'
				+ '<li class="active">' + subtitle + '</li>'
				+ '</ol></div>'
				+ '<br><br><hr>');
	} else if (title_client == undefined) { //관리자 서브타이틀 없음
		$(".boardtitle").html(
				'<h1 class="htag normal w300 subsize">' + title + '</h1>'
				+ '<div class="pull-right"><ol class="breadcrumb">' 
				+ '<li><a href="'+ context + '">Home</a></li>'
				+ '<li class="active">' + title + '</li>'
				+ '</ol></div>'
				+ '<br><br><hr>');
	} else if (subtitle != undefined) { // 클라이언트 서브타이틀 있음
		$(".boardtitle").html(
				'<h1 class="htag normal w300 subsize">' + title_client + '</h1>'
				+ '<div class="pull-right"><ol class="breadcrumb">' 
				+ '<li><a href="' + context +'">Home</a></li>'
				+ '<li><a href="' + client_page + '">' + title_client + '</a></li>'
				+ '<li class="active">' + subtitle + '</li>'
				+ '</ol></div>'
				+ '<br><br><hr>');
	} else {
		$(".boardtitle").html(
				'<h1 class="htag normal w300 subsize">' + title_client + '</h1>'
				+ '<div class="pull-right"><ol class="breadcrumb">' 
				+ '<li><a href="'+ context + '">Home</a></li>'
				+ '<li class="active">' + title_client + '</li>'
				+ '</ol></div>'
				+ '<br><br><hr>');
	}
	

});