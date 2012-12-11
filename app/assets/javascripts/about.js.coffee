# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#Hash changes
if window.location.href.indexOf('#') > -1 && window.location.href.indexOf('about') > -1
  hash = location.hash.substring(1)
  jQuery ->
    $('body').stop().scrollTo($('.section.' + hash), 700, {offset: -135})

jQuery ->
  #Clicking menu items scrolls body to appropriate section
  $('.left ul li.mission').click ->
    $('body').stop().scrollTo($('.section.mission'), 500, {offset: -135})
  $('.left ul li.team').click -> 
    $('body').stop().scrollTo($('.section.team'), 500, {offset: -135})
  $('.left ul li.advisors').click ->
    $('body').stop().scrollTo($('.section.advisors'), 500, {offset: -135})
  $('.left ul li.partnership').click -> 
    $('body').stop().scrollTo($('.section.partnership'), 500, {offset: -135})
  $('.left ul li.tedx').click -> 
    $('body').stop().scrollTo($('.section.tedx'), 500, {offset: -135})
  $('.left ul li.ted').click -> 
    $('body').stop().scrollTo($('.section.ted'), 500, {offset: -135})
  
  #Scrolling past section highlights appropriate
  $('.section.team').waypoint (event, direction) ->
    $('.left ul li').removeClass 'active'
    $('.section').removeClass 'current'
    if direction == 'down'
      $('.left ul li.team').addClass 'active'
      $('.section.team').addClass 'current'
      location.hash = '#team'
    else 
      $('.left ul li.mission').addClass 'active'
      $('.section.mission').addClass 'current'
      location.hash = '#mission'
  
  $('.section.advisors').waypoint (event, direction) ->
    $('.left ul li').removeClass 'active'
    $('.section').removeClass 'current'
    if direction == 'down'
      $('.left ul li.advisors').addClass 'active'
      $('.section.advisors').addClass 'current'
      location.hash = '#advisors'
    else 
      $('.left ul li.team').addClass 'active'
      $('.section.team').addClass 'current'
      location.hash = '#team'
          
  $('.section.partnership').waypoint (event, direction) ->
    $('.left ul li').removeClass 'active'
    $('.section').removeClass 'current'
    if direction == 'down'
      $('.left ul li.partnership').addClass 'active'
      $('.section.partnership').addClass 'current'
      location.hash = '#partnership'
    else 
      $('.left ul li.advisors').addClass 'active'
      $('.section.advisors').addClass 'current'
      location.hash = '#advisors'
  
  $('.section.tedx').waypoint (event, direction) ->
    $('.left ul li').removeClass 'active'
    $('.section').removeClass 'current'
    if direction == 'down'
      $('.left ul li.tedx').addClass 'active'
      $('.section.tedx').addClass 'current'
      location.hash = '#tedx'
    else 
      $('.left ul li.partnership').addClass 'active'
      $('.section.partnership').addClass 'current'
      location.hash = '#partnership'

  $('.section.ted').waypoint (event, direction) ->
    $('.left ul li').removeClass 'active'
    $('.section').removeClass 'current'
    if direction == 'down'
      $('.left ul li.ted').addClass 'active'
      $('.section.ted').addClass 'current'
      location.hash = '#ted'
    else 
      $('.left ul li.tedx').addClass 'active'
      $('.section.tedx').addClass 'current' 
      location.hash = '#tedx'
