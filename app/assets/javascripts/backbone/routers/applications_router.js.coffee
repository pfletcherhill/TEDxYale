class TEDxYale.Routers.ApplicationsRouter extends Backbone.Router
  
  initialize: (options) ->
    options["model"] = new TEDxYale.Models.Application()
    @options = options

  routes:
    ".*"        : "newApplication"

  newApplication: ->
    console.log @options
    @view = new TEDxYale.Views.Applications.New(@options)