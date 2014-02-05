TEDxYale.Views.StudentSpeakers ||= {}

class TEDxYale.Views.StudentSpeakers.IndexView extends Backbone.View
  
  template: JST["backbone/templates/student_speakers/index"]
  playerTemplate: JST["backbone/templates/student_speakers/player"]
  listTemplate: JST["backbone/templates/student_speakers/list"]
  videoTemplate: JST["backbone/templates/student_speakers/video"]
  
  el: 'body'
  
  initialize: ->
    $("#students").html(@template())
  
  resetMenu: (type) ->
    $('#video-player').html('').slideUp(300)
    $("#student-videos").html('')
    $('.menu-item-link').removeClass 'selected'
    $('#' + type).addClass 'selected'
  
  embedYoutube: (url) ->
    url = url.split("=", 2)[1]
    width = 1000
    height = 563
    params = { allowScriptAccess: "always" };
    atts = { id: "player" };
    options = "enablejsapi=1&playerapiid=player&autohide=1&showinfo=0&autoplay=1&version=1&controls=2"
    swfobject.embedSWF("http://www.youtube.com/v/" + url + "?" + options, "player", width, height, "8", null, null, params, atts)
      
  renderVideo: (speaker) ->
    $(@el).stop().scrollTo(0, 300)
    $('#video-player').slideDown(300)
    $('#video-player').html(@playerTemplate(speaker.toJSON()))
    @embedYoutube(speaker.get('youtube'))
    
  renderVideos: (speakers, type) -> 
    for model, i in speakers.models
      model.set(rank: null)
      if type == "leaders"
        model.set(rank: i + 1)
      $("#student-videos").append(@videoTemplate(video: model.toJSON(), type: type))
  
  renderVotesLeft: ->
    votes = TEDxYale.user.get('votes_left')
    $('.menu-item-right span').html(votes)
      
  renderVotes: (id) ->
    @speakers.fetch success: (speakers) =>
      votes = speakers.get(id).get('votes')
      $('#speaker-menu b').html(votes)
      $('.student-video[data-id="' + id + '"] .votes').html(votes)
      TEDxYale.user.url = "/me"
      TEDxYale.user.fetch success: (user) =>
        @renderVotesLeft()
    
  render: (speakers, type) ->
    # Set globals (for use after voting)
    @speakers = speakers
    @type = type
    @renderVideos(speakers, type)
    @renderVotesLeft()
  
  events:
    'click .vote' : 'vote'
  
  vote: (event) ->
    id = $(event.target).data('id')
    $.ajax
      type: 'POST'
      dataType: 'json'
      url: '/users/' + TEDxYale.user.id + '/vote/' + id
      success: (data) =>
        @renderVotes(id)
      error: ->
        alert "You've already used your 10 votes!"
        