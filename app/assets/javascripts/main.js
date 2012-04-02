$(document).ready(function () {
	$(".join_item").click(
		function() {
			$(".join_item").removeClass("selected");
			$(this).addClass("selected");
		});
	$("#comm_pr_item").click(
		function() {
			$(".join_item").css({"border-bottom":"none","height":"110px"});
			$(this).css({"border-bottom":"10px solid #0099FF","height":"100px"});
			$(".container").css("height","780px");
			$(".join_explanation").hide();
			$("body").scrollTo( {top:100, left:0}, 250);
			$(".join_app").show();
			$(".join_app_description").html("The Community and Public Relations Team will be responsible for the public face of TEDxYale through social media and community outreach initiatives.");
			$("#join_app_pos_1").css({"width":"225px","margin-left":"0px"});
			$("#join_app_pos_2").css({"width":"225px","margin-right":"10px"});
			$("#join_app_pos_3").css({"width":"225px","margin-right":"10px"});
			$("#join_app_pos_4").css({"width":"225px","margin-right":"0px"});
			$("#join_app_pos_5").css("width","0px");
			$(".pos_title").css({"border-bottom":"2px solid #0099FF","color":"#0099FF"});
			$("#pos_1_title").html("EXECUTIVE DIRECTOR");
			$("#pos_1_description").html("You will be fully accountable for your team and should have domain expertise. You will be responsible for weekly team meetings with other execs and the curators. This is a significant commitment. (Please note you can be the executive director as well as fill other positions on the team).");
			$("#pos_2_title").html("SOCIAL MEDIA DIRECTOR");
			$("#pos_2_description").html("You will be in charge of the upkeep and visibility of the Twitter and Facebook page as well as in charge of a weekly Tumblr blog entry by curating and developing content. You will also be responsible for the community newsletters.");
			$("#pos_3_title").html("MARKETING DIRECTOR");
			$("#pos_3_description").html("You will be in charge of event campaigns and ensuring a TEDxYale presence at Yale events such as Bulldog Days. You will be responsible for coming up with creative and innovative marketing strategies to build the name of TEDxYale.");
			$("#pos_4_title").html("SOCIAL DIRECTOR");
			$("#pos_4_description").html("You will be responsible for TEDx community events such as coordinating trips to other TEDx conferences and TEDxYale team building activities.");
			$("#pos_5_title").html("");
			$("#pos_5_description").html("");
			$(".join_app_button").removeClass("button_design").removeClass("button_events").removeClass("button_finance").removeClass("button_production").addClass("button_comm").html("Apply for a Position on the Community & PR Team");
			$(".join_app_button_link").attr("href", "/join/community_pr");
		});
	$("#design_branding_item").click(
		function() {
			$(".join_item").css({"border-bottom":"none","height":"110px"});
			$(this).css({"border-bottom":"10px solid #00CC66","height":"100px"});
			$(".container").css("height","780px");
			$(".join_explanation").hide();
			$("body").scrollTo( {top:100, left:0}, 250);
			$(".join_app").show();
			$(".join_app_description").html("The Design and Branding Team will be in charge of the upkeep and expansion of the unified, visionary and unique image of TEDxYale.");
			$("#join_app_pos_1").css({"width":"307px","margin-left":"0px"});
			$("#join_app_pos_2").css({"width":"306px","margin-right":"10px"});
			$("#join_app_pos_3").css({"width":"307px","margin-right":"0px"});
			$("#join_app_pos_4").css("width","0px");
			$("#join_app_pos_5").css("width","0px");
			$(".pos_title").css({"border-bottom":"2px solid #00CC66","color":"#00CC66"});
			$("#pos_1_title").html("EXECUTIVE DIRECTOR");
			$("#pos_1_description").html("You will be fully accountable for your team and should have domain expertise. You will be responsible for weekly team meetings with other execs and the curators. This is a significant commitment. (Please note you can be the executive director as well as fill other positions on the team).");
			$("#pos_2_title").html("DEVELOPER");
			$("#pos_2_description").html("You will be in charge of tedxyale.com. This involves updating and developing the administrative, speaker and public website and the TEDxYale app. Experience in web development is required.");
			$("#pos_3_title").html("GRAPHIC DESIGNER");
			$("#pos_3_description").html("You will be in charge of designing conference materials, posters, marketing materials and web graphics. Experience with graphic design software is required.");
			$("#pos_4_title").html("");
			$("#pos_4_description").html("");
			$("#pos_5_title").html("");
			$("#pos_5_description").html("");
			$(".join_app_button").removeClass("button_comm").removeClass("button_events").removeClass("button_finance").removeClass("button_production").addClass("button_design").html("Apply for a Position on the Design & Branding Team");
			$(".join_app_button_link").attr("href", "/join/design");
		});
	$("#events_item").click(
		function() {
			$(".join_item").css({"border-bottom":"none","height":"110px"});
			$(this).css({"border-bottom":"10px solid #FFCC00","height":"100px"});
			$(".container").css("height","780px");
			$(".join_explanation").hide();
			$("body").scrollTo( {top:100, left:0}, 250);
			$(".join_app").show();
			$(".join_app_description").html("The Events Team will be responsible for the organisation and execution of all TEDxYale events, including TEDxYale 2013, Salons and Livestreams.");
			$("#join_app_pos_1").css({"width":"225px","margin-left":"0px"});
			$("#join_app_pos_2").css({"width":"225px","margin-right":"10px"});
			$("#join_app_pos_3").css({"width":"225px","margin-right":"10px"});
			$("#join_app_pos_4").css({"width":"225px","margin-right":"0px"});
			$("#join_app_pos_5").css("width","0px");
			$(".pos_title").css({"border-bottom":"2px solid #FFCC00","color":"#FFCC00"});
			$("#pos_1_title").html("EXECUTIVE DIRECTOR");
			$("#pos_1_description").html("You will be fully accountable for your team and should have domain expertise. You will be responsible for weekly team meetings with other execs and the curators. This is a significant commitment. (Please note you can be the executive director as well as fill other positions on the team).");
			$("#pos_2_title").html("CONFERENCE DIRECTOR");
			$("#pos_2_description").html("You will be responsible for non theatrical conference management including ticketing, food, registration and post conference activities. You will work closely with the curators to make sure that the non-theatrical aspects of the conference run smoothly.");
			$("#pos_3_title").html("SALONS DIRECTOR");
			$("#pos_3_description").html("You will be responsible for the selection of speakers and the organisation of all TEDxYale Salons.");
			$("#pos_4_title").html("SPEAKERS DIRECTOR");
			$("#pos_4_description").html("You will be responsible for organising logistics for the TEDxYale conference speakers, speaker training sessions and the planning and execution of the Student Speaker Competition. You will also be the point person for the conference speakers on the day of the conference.");
			$("#pos_5_title").html("");
			$("#pos_5_description").html("");
			$(".join_app_button").removeClass("button_comm").removeClass("button_comm").removeClass("button_finance").removeClass("button_production").addClass("button_events").html("Apply for a Position on the Events Team");
			$(".join_app_button_link").attr("href", "/join/events");
		});
	$("#finance_item").click(
		function() {
			$(".join_item").css({"border-bottom":"none","height":"110px"});
			$(this).css({"border-bottom":"10px solid #8F2400","height":"100px"});
			$(".container").css("height","780px");
			$(".join_explanation").hide();
			$("body").scrollTo( {top:100, left:0}, 250);
			$(".join_app").show();
			$(".join_app_description").html("The Finance Team will be responsible for all fiscal decisions regarding TEDxYale.");
			$("#join_app_pos_1").css({"width":"307px","margin-left":"0px"});
			$("#join_app_pos_2").css({"width":"306px","margin-right":"10px"});
			$("#join_app_pos_3").css({"width":"307px","margin-right":"0px"});
			$("#join_app_pos_4").css("width","0px");
			$("#join_app_pos_5").css("width","0px");
			$(".pos_title").css({"border-bottom":"2px solid #8F2400","color":"#8F2400"});
			$("#pos_1_title").html("EXECUTIVE DIRECTOR");
			$("#pos_1_description").html("You will be fully accountable for your team and should have domain expertise. You will be responsible for weekly team meetings with other execs and the curators. This is a significant commitment. (Please note you can be the executive director as well as fill other positions on the team).");
			$("#pos_2_title").html("FINANCE DIRECTOR");
			$("#pos_2_description").html("You will be responsible for filing taxes, keeping the books, invoicing and reimbursements for TEDxYale expenses. You will also be required to ensure 501c3 compliance. Experience handling large sums of money will be crucial.");
			$("#pos_3_title").html("FUNDRAISING DESIGNER");
			$("#pos_3_description").html("You will be responsible for sponsorship management and fundraising campaigns. You will work closely with the marketing director to raise money.");
			$("#pos_4_title").html("");
			$("#pos_4_description").html("");
			$("#pos_5_title").html("");
			$("#pos_5_description").html("");
			$(".join_app_button").removeClass("button_comm").removeClass("button_events").removeClass("button_design").removeClass("button_production").addClass("button_finance").html("Apply for a Position on the Finance Team");
			$(".join_app_button_link").attr("href", "/join/finance");
		});
	$("#production_item").click(
		function() {
			$(".join_item").css({"border-bottom":"none","height":"110px"});
			$(this).css({"border-bottom":"10px solid #9933FF","height":"100px"});
			$(".container").css("height","780px");
			$(".join_explanation").hide();
			$("body").scrollTo( {top:100, left:0}, 250);
			$(".join_app").show();
			$(".join_app_description").html("The Production Team will be responsible for the on-the-day technical smooth running of both TEDxYale 2013 and other TEDxYale events, such as Livestreams and Salons.");
			$("#join_app_pos_1").css({"width":"176px","margin-left":"0px"});
			$("#join_app_pos_2").css({"width":"176px","margin-right":"10px"});
			$("#join_app_pos_3").css({"width":"176px","margin-right":"10px"});
			$("#join_app_pos_4").css({"width":"176px","margin-right":"10px"});
			$("#join_app_pos_5").css({"width":"176px","margin-right":"0px"});
			$(".pos_title").css({"border-bottom":"2px solid #9933FF","color":"#9933FF"});
			$("#pos_1_title").html("STAGE MANAGER");
			$("#pos_1_description").html("You will be responsible for running TEDxYale as a theatrical event. This involves overseeing lights, sound, set and video. You will be responsible for weekly team meetings with other execs and the curators. This is a significant commitment.");
			$("#pos_2_title").html("SET DESIGNER");
			$("#pos_2_description").html("You will be responsible for building the set for TEDxYale 2013 and any other TEDxYale events where a set may be required.");
			$("#pos_3_title").html("LIGHTS & SOUND DIRECTOR");
			$("#pos_3_description").html("You will be responsible for coordinating the lights and sound for TEDxYale 2013 and any other TEDxYale events such as Salons.");
			$("#pos_4_title").html("VIDEO DIRECTOR");
			$("#pos_4_description").html("You will be responsible for managing the video recording and editing for TEDxYale 2013 and any other events such as Salons. Video equipment handling and Final Cut Pro experience is crucial.");
			$("#pos_5_title").html("PHOTOGRAPHER");
			$("#pos_5_description").html("You will be responsible for the photography of TEDxYale 2013 and any other events such as Salons. You will also update the TEDxYale Flickr account. Photoshop experience is crucial.");
			$(".join_app_button").removeClass("button_comm").removeClass("button_comm").removeClass("button_finance").removeClass("button_events").addClass("button_production").html("Apply for a Position on the Production Team");
			$(".join_app_button_link").attr("href", "/join/production");
		});
	$(".app_header_description_text").click(
		function() {
			if ($(".app_descriptions").hasClass("open")) {
				$(".app_descriptions").animate({"height":"0px"}, 300, function() {
					$(".app_descriptions").hide().removeClass("open");
				});
			}
			else {
				$(".app_descriptions").show().css("height","0px").animate({"height":"290px"}, 300, function() {
					$(".app_descriptions").addClass("open");
				});
			}
		});
	$("#app_header_description_text_comm").click(
		function() {
			$("#join_app_pos_1").css({"width":"225px","margin-left":"0px"});
			$("#join_app_pos_2").css({"width":"225px","margin-right":"10px"});
			$("#join_app_pos_3").css({"width":"225px","margin-right":"10px"});
			$("#join_app_pos_4").css({"width":"225px","margin-right":"0px"});
			$("#join_app_pos_5").css("width","0px");
			$(".pos_title").css({"border-bottom":"2px solid #0099FF","color":"#0099FF"});
		});
	$("#app_header_description_text_design").click(
		function() {
			$("#join_app_pos_1").css({"width":"307px","margin-left":"0px"});
			$("#join_app_pos_2").css({"width":"306px","margin-right":"10px"});
			$("#join_app_pos_3").css({"width":"307px","margin-right":"0px"});
			$("#join_app_pos_4").css("width","0px");
			$("#join_app_pos_5").css("width","0px");
			$(".pos_title").css({"border-bottom":"2px solid #00CC66","color":"#00CC66"});
		});
	$("#app_header_description_text_events").click(
		function() {
			$("#join_app_pos_1").css({"width":"225px","margin-left":"0px"});
			$("#join_app_pos_2").css({"width":"225px","margin-right":"10px"});
			$("#join_app_pos_3").css({"width":"225px","margin-right":"10px"});
			$("#join_app_pos_4").css({"width":"225px","margin-right":"0px"});
			$("#join_app_pos_5").css("width","0px");
			$(".pos_title").css({"border-bottom":"2px solid #FFCC00","color":"#FFCC00"});
		});
	$("#app_header_description_text_finance").click(
		function() {
			$("#join_app_pos_1").css({"width":"307px","margin-left":"0px"});
			$("#join_app_pos_2").css({"width":"306px","margin-right":"10px"});
			$("#join_app_pos_3").css({"width":"307px","margin-right":"0px"});
			$("#join_app_pos_4").css("width","0px");
			$("#join_app_pos_5").css("width","0px");
			$(".pos_title").css({"border-bottom":"2px solid #8F2400","color":"#8F2400"});
		});
	$("#app_header_description_text_production").click(
		function() {
			$("#join_app_pos_1").css({"width":"176px","margin-left":"0px"});
			$("#join_app_pos_2").css({"width":"176px","margin-right":"10px"});
			$("#join_app_pos_3").css({"width":"176px","margin-right":"10px"});
			$("#join_app_pos_4").css({"width":"176px","margin-right":"10px"});
			$("#join_app_pos_5").css({"width":"176px","margin-right":"0px"});
			$(".pos_title").css({"border-bottom":"2px solid #9933FF","color":"#9933FF"});
		});
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
	if ($(".error_explanation").html().length > 0) {
		$(".error_explanation").show().css("bottom","-55px").animate({"bottom":"0px"}, 300).delay(4000).animate({"bottom":"-55px"}, 300, function() {
			$(".error_explanation").hide();
		});
	}
	else if ($(".error_explanation").html().length = 0) {
		$(".error_explanation").hide();
	}
});