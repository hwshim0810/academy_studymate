$(function() {
	var context = '/studymate/';
	var boardid = $('#boardid').val();
	var updateid = $('#boardupdate').val();
	var deleteid = $('#boarddelete').val();
	var title = $('#boardtitle').val();
	
	$("#btnlist").bind('click', function() {
		location.href = context + boardid + 'List/1';
		return false;
	});
	
	$("#btnwrite").bind('click', function() {
		location.href = context + boardid + 'Write';
		return false;
	});
	
	$("#btnreg").bind('click', function() {
		submitContents();
	});
	
	$("#btnupdate").bind('click', function() {
		location.href = context + boardid + 'Update' + updateid;
	});
	
	$("#btndelete").bind('click', function() {
		location.href = context + boardid + 'Delete' + deleteid;
	});
	
	$("#btnback").bind('click', function() {
		document.referrer&&-1!=document.referrer.indexOf("studymate")?history.back():location.href="/main";
	});
	
	$("#btncomment").bind('click', function() {
		location.href = context + boardid + 'Comment' + updateid;
	});
	
	$("#btnsearch").bind('click', function() {
		$("#searchform").submit();
	});
	
    $("input[name=keyWord]").keypress(function(key) {
        if (key.keyCode == 13) {
        	key.preventDefault();
	        $("#btnsearch").click();
	    }
	});
	
	$(".boardtitle").html('<h1 class="htag normal w300 subsize">' + title + '</h1><hr>');
});