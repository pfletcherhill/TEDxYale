class TEDxYale.Routers.CompetitionRouter extends Backbone.Router
  initialize: (options) ->
    @speakers = new TEDxYale.Collections.StudentSpeakers()
    @speakers.url = "/student_speakers"
    @leaders = new TEDxYale.Collections.StudentSpeakers()
    @leaders.url = "/student_speaker_leaders"
    TEDxYale.user = new TEDxYale.Models.User(options.currentUser) unless TEDxYale.user
    @view = new TEDxYale.Views.StudentSpeakers.IndexView

  routes:
    #"leaders"   : "leaders"
    ":id"       : "show"
    ".*"        : "index"
    
  leaders: ->      
    @view.resetMenu("leaders")
    @leaders.fetch success: (speakers) =>
      @view.render(speakers, "leaders")
      
  index: ->      
    @view.resetMenu("all")
    @speakers.fetch success: (speakers) =>
      @view.render(speakers, "all")
  
  show: (id) ->
    speaker = @speakers.get(id)
    if !speaker && @speakers.length > 0
      window.location = "#"
    else if !speaker
      @speakers.fetch success: (speakers) =>
        @view.render(speakers, "all")
        @show(id)
    else
      @view.renderVideo(speaker)
      