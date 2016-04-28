// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$(document).on("hidden.bs.modal", function(e) {
	$(e.target).removeData("bs.modal").find(".modal-content").empty();  
});

var main = function() {
	$('.product').hover(function() {
		$(this).hide(1)
	});
	
	$('.current').mouseleave(function() {
		$('.product').show(1);
	}); 

};
 

//$(document).on("shown.bs.modal", function() {
//	$('.lg').hover(function() {
//		var currentSlide = $('.active-slide')
//		var nextSlide = currentSlide.next();
		
//		currentSlide.fadeOut(600).removeClass('active-slide');
//		nextSlide.fadeIn(600).addClass('active-slide');
		

//});


//	$('.arrow-next').click(function(event) {
//		var currentSlide = $('.active-slide')
//		var nextSlide = currentSlide.next();

//		if(nextSlide.length === 0) {
//			nextSlide = $('.jp').first();
//		}

//		currentSlide.fadeOut(600).removeClass('active-slide');
//		nextSlide.fadeIn(600).addClass('active-slide');
		
//		});
		
//	$('.arrow-prev').click(function() {
//    	var currentSlide = $('.active-slide');
//    	var prevSlide = currentSlide.prev();
//
//		if(prevSlide.length === 0) {
//      		prevSlide = $('.jp').last();
//		}

// 	currentSlide.fadeOut(600).removeClass('active-slide');
//    prevSlide.fadeIn(600).addClass('active-slide');
 		
// 		});
	//	$('.lgcurrent').show().fadeIn(500).addClass('active')
	//	$('.lg').hide().fadeOut(500)
//		});

//	var target = $(b.target);
//	$('.arrow-next').click(function() {
//	target.removeData("bs.modal")
//	.find(".modal-content").html(".lg").hide(10)
//		$('.lgcurrent').show(10)
//});

//$('.lg').mouseleave(function() {
//	$(this).hide(100)
//	$('.lg').show()
//});

//});


$(document).ready(main);