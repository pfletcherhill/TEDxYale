TEDxYale.Views.Conference ||= {}

class TEDxYale.Views.Conference.IndexView extends Backbone.View
  
  template: JST["backbone/templates/conference/index"]
  speakerTemplate: JST["backbone/templates/conference/speaker"]
  emptyTemplate: JST["backbone/templates/conference/blank_speaker"]
  lightboxTemplate: JST["backbone/templates/conference/lightbox"]
  
  el: '#conference'
  
  initialize: ->
    @speakers = @options.collection
    @render()
    
  renderSpeakers: ->
    for speaker in @speakers.models
      if speaker.get('public')
        if speaker.get('crop')
          crop = speaker.get('crop')
        else
          crop = "0 -50px"
        $("#speakers-container").append( @speakerTemplate( speaker: speaker, crop: crop ))
      else
        numb = Math.floor((100)*Math.random())+150
        color = "rgba(#{numb}, #{numb}, #{numb}, 1)"
        $("#speakers-container").append( @emptyTemplate(color: color))
  
  calculateDivPosition: ->
    width = $(".reserve-ticket button").width() / 2 + 11
    height = $(".reserve-ticket button").height() / 2 + 11
    left = $(".reserve-ticket button").offset().left - $(window).scrollLeft() + width
    top = $(".reserve-ticket button").offset().top - $(window).scrollTop() + height
    @divLeft = left
    @divTop = top
    
  render: ->
    $(@el).html(@template())
    @renderSpeakers()
    @calculateDivPosition()
    return this
    
  events:
    "mousemove" : "setBackground"
    "click #lightbox #background" : "hideLightbox"
    "click #lightbox .close" : "hideLightbox"
    "click .conference-speaker" : "openLightbox"
  
  setBackground: (event) ->
    @calculateDivPosition()
    left = event.clientX
    top = event.clientY
    diffX = Math.abs(@divLeft - left)
    diffY = Math.abs(@divTop - top)
    length = Math.sqrt( diffX*diffX + diffY*diffY )
    length = Math.round( length )
    position = 150 - (length / 10)
    if position < 100
      position = 100
    $(".tickets").css({"background-size": position + "%"}, 100)
  
  openLightbox: (event) ->
    id = $(event.target).data('id')
    if id
      speaker = @speakers.get(id)
      $('#lightbox-container').html( @lightboxTemplate( speaker.toJSON() ))
      $('#lightbox').removeClass 'hidden'
  
  hideLightbox: (event) ->
    $("#lightbox").addClass 'hidden'
    