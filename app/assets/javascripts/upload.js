$(document).ready(function(){
	$('#imageupload').fileupload({
		dataType: "script",
		start: function() {
			$('#view-listing').hide();
      $('#progress').show();
		},
		progress: function (e, data) {
        var progress = parseInt(data.loaded / data.total * 90, 10);
        $('#progress .bar').css(
            'width',
            progress + '%'
        );
    },
    done: function(e, data){
    	$('#progress').hide();
    	$('#progress .bar').css(
            'width', 0
        );
    	$('#view-listing').show();
    }
	});

	$("#upload-button").on("click",function(e){
		e.preventDefault();
		$("#image_image").click();
	})
	
});
	
		