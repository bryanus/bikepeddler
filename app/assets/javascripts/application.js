// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require jquery-fileupload/basic
//= require bootstrap
//= require shadowbox
//= require_tree .


$(document).ready(function(){
	//show or hide price field div depending on selected category id
	
	$("#post_adtype").change(function(){
	var adtype = $("#post_adtype").val();
		switch(adtype) {
			case "1":
				$("#price-field").hide(300);
				break;
			case "2":
				$("#price-field").hide(300);
				break;
			default:
				$("#price-field").show(300);
				break;
		}
	});

});	
