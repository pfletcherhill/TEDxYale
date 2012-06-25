# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("a.registered").hover(
    ->$(this).html('<img src="/assets/unregister.png"/>Unregister')
    ->$(this).html('<img src="/assets/registered.png"/>Registered')
    )
    
  EventHeight = $(".all").height();
  $(".all").css("min-height",EventHeight + "px");
  
  $(".item.salons").click ->
    unless $(this).hasClass "selected"
      # if $(".conference").height() != "0px"
      #         $(".conference").animate({"opacity":"0"}, 200).animate({"height":"0px", "padding":"0px"}, 200);
      #       $(".salon").show().css({ "height":"130px", "padding":"15px 0px" }, 400).animate({"opacity":"1"}, 300);
      $(".conference").animate({"opacity":".3"}, 300);
      $(".event_cover.conference").show();
      $(".event_cover.salon").hide();
      $(".salon").animate({"opacity":"1"}, 300);
      $('.item').removeClass "selected"
      $(this).addClass "selected"
      
  $(".item.conferences").click ->
    unless $(this).hasClass "selected"
      # if $(".salon").height() != "0px"
      #         $(".salon").animate({"opacity":"0"}, 200).animate({"height":"0px","padding":"0px"}, 200);
      #       $(".conference").show().css({"height":"130px", "padding":"15px 0px"}).animate({"opacity":"1"}, 300);
      $(".salon").animate({"opacity":".3"}, 300);
      $(".event_cover.salon").show();
      $(".event_cover.conference").hide();
      $(".conference").animate({"opacity":"1"}, 300);
      $('.item').removeClass "selected"
      $(this).addClass "selected"
      
  $(".item.all_events").click ->
    unless $(this).hasClass "selected"
      # $(".event").show().css({"height":"130px", "padding":"15px 0px"}).animate({"opacity":"1"}, 300);
      $(".event").animate({"opacity":"1"}, 300);
      $(".event_cover").hide();
      $('.item').removeClass "selected"
      $(this).addClass "selected"
      
    
      