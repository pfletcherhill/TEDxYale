# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $(".videos .video").hover(
    ->
      $('.info', this).fadeIn(300)
      $('.image').css('z-index','5')
      $('.image', this).css('z-index', '10')
      $('.image .play_cover', this).animate({'opacity':'0.3'}, 300)
      $('.image .play', this).show()
    ->
      $('.info', this).stop().fadeOut(300)
      $('.image .play_cover', this).css('opacity','0')
      $('.image .play', this).hide()
    )
  $(".videos .video").click ->
      playerWidth = $(window).width()
      playerHeight = playerWidth * 506 / 900
      code = $(this).attr('code')
      $(".player").animate({"height":playerHeight}, 500)
      $("body").delay(300).scrollTo(160, 200)
      $(".player").html('<iframe width=' + playerWidth + ' height=' + playerHeight + ' src="http://www.youtube.com/embed/' + code + '?rel=0&autoplay=1&showinfo=0" frameborder="0" allowfullscreen ></iframe>')
    