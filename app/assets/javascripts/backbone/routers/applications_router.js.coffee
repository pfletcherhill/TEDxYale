class TEDxYale.Routers.ApplicationsRouter extends Backbone.Router
  initialize: (options) ->
    @application = new TEDxYale.Models.Application()

  routes:
    ".*"        : "newApplication"

  newApplication: ->
    @view = new TEDxYale.Views.Applications.NewView(model: @application)