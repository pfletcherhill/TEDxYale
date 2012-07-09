# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $(".videos .video").hover(
    ->
      $('.image').css('z-index','5')
      $('.image', this).css('z-index', '10')
      $('.image .play_cover', this).animate({'opacity':'0.3'}, 300)
      $('.image .play', this).show()
      $('.info .title', this).show(200);
    ->
      $('.image .play_cover', this).stop().css('opacity','0')
      $('.image .play', this).hide()
      $('.info .title', this).hide(200)
    )
  $(".player .player_container").hover(
    ->$('.player_container .close').fadeIn(300)
    ->$('.player_container .close').fadeOut(300)
    )
  $(".close").click ->
    $(".player_container").html('')
    
  $(".videos .video").click ->
    code = $(this).attr('code')
    $(".player").show().animate({"height":"562px"}, 500)
    $("body").delay(300).scrollTo(140, 200)
    $(".player_container").html('<iframe width=1000 height=562 src="http://www.youtube.com/embed/' + code + '?rel=0&autoplay=1&showinfo=0" frameborder="0" allowfullscreen ></iframe>')
    $(".player_container").append('<div class="close"></div>')
    