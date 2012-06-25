# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  
  $(".add_attended").click ->
    if $(this).hasClass "open"
      $(".add_event").animate({"height":"0px"}, 200)
      $(this).removeClass "open"
    else  
      $(".add_event").animate({"height":"25px"}, 200)
      $(this).addClass "open"