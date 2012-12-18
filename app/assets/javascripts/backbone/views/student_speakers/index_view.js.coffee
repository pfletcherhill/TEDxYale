TEDxYale.Views.StudentSpeakers ||= {}

class TEDxYale.Views.StudentSpeakers.IndexView extends Backbone.View
  
  template: JST["backbone/templates/student_speakers/index"]
  listTemplate: JST["backbone/templates/student_speakers/list"]
  videoTemplate: JST["backbone/templates/student_speakers/video"]
  leaderTemplate: JST["backbone/templates/student_speakers/leader"]
  
  el: 'body'
  
  initialize: ->
    @speakers = @options.collection
    @render()
  
  renderSpeakersList: ->
    for model in @speakers.models
      $("ul.students_list").append(@listTemplate( model.toJSON() ))
  
  renderVideos: ->  
    for model in @speakers.models
      url = model.get('youtube').split("=")[1]
      model.set( youtube: url)
      $("#student_videos").append(@videoTemplate( model.toJSON() ))
 
  renderVoting: ->
    speakers = _.sortBy(@speakers.models, (model) -> return -model.get('votes') )
    speakers = _.first(speakers, 3)
    $("#leaderboard").html("")
    for model, i in speakers
      model.set rank: i+1
      $("#leaderboard").append(@leaderTemplate( model.toJSON() ))
  
  renderUserIcon: =>
    votes = TEDxYale.user.get('votes')
    @$(".user_icon").html(votes)
    if TEDxYale.user.get('admin') == 'a'
      @$(".dropdown_menu .votes_left").html(votes + ' votes made')
    else
      @$(".dropdown_menu .votes_left").html(votes + ' votes left')
      
  renderVotes: (id) =>
    @speakers.fetch success: (speakers) =>
      @speakers = speakers
      @renderVoting()
      TEDxYale.user.fetchVotesCount().then @renderUserIcon
      for model in speakers.models
        votes = model.get('votes')
        $(".student_video[data-id=#{model.id}] .student_votes span").html("#{votes} votes")
      
  setupWaypoints: ->
    $(".students_menu").waypoint({ offset: 100 })
  
  scroll: (id) ->
    $(@el).stop().scrollTo($(".student_video[data-id=#{id}]"), 500, {offset: -100})
        
  render: ->
    $("#students").html(@template())
    @renderSpeakersList()
    @renderVideos()
    @renderVoting()
    @setupWaypoints()
  
  events:
    'click .play' : 'openVideo'
    'click .fb_login' : 'login'
    'click button#vote' : 'vote'
    'waypoint.reached .students_menu' : 'setMenu'
  
  login: (event) ->
    FB.login ((response) ->
      if response.authResponse
        window.location = '/facebook?fb_id=' + response.authResponse.userID + '&token=' + response.authResponse.accessToken
      else
        console.log "User cancelled login or did not fully authorize."
      ), scope: 'email'
     
  setMenu: (event, direction) ->
    if direction == 'down'
      $(".students_menu").addClass 'fixed'
    else if direction == 'up'
      $(".students_menu").removeClass 'fixed'
 
  vote: (event) ->
    unless TEDxYale.user.id
      @login()
    else
      id = $(event.target).data('id')
      TEDxYale.user.voteFor(id).then @renderVotes
      
  openVideo: (event) ->
    youtube = $(event.target).data('youtube')
    $(event.target).parent().html('<iframe width="400" height="225" src="http://www.youtube.com/embed/' + youtube + '?rel=0&autoplay=1&showinfo=0" frameborder="0" allowfullscreen></iframe>')
