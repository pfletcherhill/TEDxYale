# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  if $(".menu_right")
    if $(".menu_right").hasClass "no_list"
      $(".item").hide()
      $(".return").show()
    if $(".menu_right").hasClass "has_list"
      $(".return").hide()