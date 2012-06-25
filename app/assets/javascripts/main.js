$(document).ready(function () {
	$(".join_item").click(
		function() {
			$(".join_item").removeClass("selected");
			$(this).addClass("selected");
		});
	if ($(".join_explanation").html()) {
	  if ($(".join_explanation").html().length < 50 && $(".join_explanation").html().length > 0) {
  		$(".join_explanation").show().css("bottom","-55px").animate({"bottom":"0px"}, 300).delay(2000).animate({"bottom":"-55px"}, 300, function() {
  			$(".join_explanation").hide();
  		});
  	}
  	else if ($(".join_explanation").html().length > 50) {
  		$(".join_explanation").show().css("bottom","-55px").animate({"bottom":"0px"}, 300).delay(5000).animate({"bottom":"-55px"}, 300, function() {
  			$(".join_explanation").hide();
  		});
  	}
  	else if ($(".join_explanation").html().length = 0) {
  		$(".join_explanation").hide();
  	}
  }
  if ($(".error_explanation").html()) {
	  if ($(".error_explanation").html().length > 0) {
  		$(".error_explanation").show().css("bottom","-55px").animate({"bottom":"0px"}, 300).delay(4000).animate({"bottom":"-55px"}, 300, function() {
  			$(".error_explanation").hide();
  		});
  	}
  	else if ($(".error_explanation").html().length = 0) {
  		$(".error_explanation").hide();
  	}
  }
	$(".registration_user").click( 
		function() {
			$(this).animate({"height":"210px"}, 100);
			//$("active.registration_user_check-in").show();
		});
});