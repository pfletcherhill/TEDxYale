# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $(".next_line").click ->
    if $("input.validates").val() != ''
      $(this).hide()
      $('input').css('border','1px solid #dadada')
      $(".password").fadeIn(300)
      $(".register").show().animate({"top":"82px"}, 250)
    else
      $("input.validates").css("border-color","#e60000")