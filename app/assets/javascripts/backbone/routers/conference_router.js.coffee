class TEDxYale.Routers.ConferenceRouter extends Backbone.Router
  initialize: (options) ->
    TEDxYale.user = new TEDxYale.Models.User
    TEDxYale.user.set options.currentUser
    @speakers = new TEDxYale.Collections.Speakers()
    @speakers.url = "/events/2013/speakers"
    @speakers.fetch success: (speakers) =>
      console.log speakers
      @view = new TEDxYale.Views.Conference.IndexView(collection: speakers)

  routes:
    ".*"        : "index"

  index: ->
    console.log 'index'