# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $(".users > .user").click ->
    if $(".user").hasClass "open"
      $(this).animate({"height":"-=50px"}, 300).removeClass "open"
    else
      $(this).animate({"height":"+=50px"}, 300).addClass "open"