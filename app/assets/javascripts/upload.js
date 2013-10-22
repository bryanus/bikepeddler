$(document).ready(function(){
	$('.progress').hide();
	
	$('#imageupload').fileupload({
		dataType: "script",
		// start: function() {
  //     $('.progress').hide();
		// },
		progress: function (e, data) {
        var progress = parseInt(data.loaded / data.total * 90, 10);
        $('.progress').show( "slow" );
        $('.progress-bar-success').css(
            'width',
            progress + '%'
        );
    },
    done: function(e, data){
    	$('.progress').hide( "slow" );
    	$('.progress-bar-success').css(
            'width', 0
        );

    }
	});

	$("#upload-button").on("click",function(e){
		e.preventDefault();
		$("#image_image").click();
	})
	
});
	
		