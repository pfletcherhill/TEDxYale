class TEDxYale.Routers.CompetitionRouter extends Backbone.Router
  initialize: (options) ->
    @speakers = new TEDxYale.Collections.StudentSpeakers()
    TEDxYale.user = new TEDxYale.Models.User
    TEDxYale.user.set options.currentUser

  routes:
    ":id"       : "scrollTo"
    ".*"        : "index"

  index: ->
    @speakers.fetch success: (speakers) =>
      @view = new TEDxYale.Views.StudentSpeakers.IndexView(collection: speakers)
  
  scrollTo: (id) ->
    if @view
      @view.scroll(id)
    else
      @speakers.fetch success: (speakers) =>
        @view = new TEDxYale.Views.StudentSpeakers.IndexView(collection: speakers)
        @view.scroll(id)
      