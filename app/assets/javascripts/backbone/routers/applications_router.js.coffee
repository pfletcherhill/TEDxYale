class TEDxYale.Routers.ApplicationsRouter extends Backbone.Router
  
  initialize: (options) ->
    options["model"] = new TEDxYale.Models.Application()
    @options = options

  routes:
    ".*"        : "newApplication"

  newApplication: ->
    @view = new TEDxYale.Views.Applications.New(@options)