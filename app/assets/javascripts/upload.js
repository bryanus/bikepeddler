$(document).ready(function(){
	$('#imageupload').fileupload({
		dataType: "script",
		progress: function (e, data) {
        var progress = parseInt(data.loaded / data.total * 100, 10);
        $('#progress .bar').css(
            'width',
            progress + '%'
        );
        console.log(progress);
    }
	});
	
});
	
		