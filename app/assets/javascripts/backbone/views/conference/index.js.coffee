TEDxYale.Views.Conference ||= {}

class TEDxYale.Views.Conference.IndexView extends Backbone.View
  
  template: JST["backbone/templates/conference/index"]
  speakerTemplate: JST["backbone/templates/conference/speaker"]
  emptyTemplate: JST["backbone/templates/conference/blank_speaker"]
  
  el: '#conference'
  
  initialize: ->
    @speakers = @options.collection
    @render()
    
  renderSpeakers: ->
    for speaker in @speakers.models
      if speaker.get('public')
        $("#speakers-container").append( @speakerTemplate( speaker.toJSON() ))
      else
        $("#speakers-container").append( @emptyTemplate())
  
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
    