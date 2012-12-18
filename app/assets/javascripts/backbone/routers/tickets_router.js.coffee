class TEDxYale.Routers.TicketsRouter extends Backbone.Router
  
  initialize: (options) ->
    TEDxYale.user = new TEDxYale.Models.User
    TEDxYale.user.set options.currentUser
    TEDxYale.stripeKey = options.stripeKey

  routes:
    ".*"        : "index"

  index: ->
    @view = new TEDxYale.Views.Tickets.IndexView()