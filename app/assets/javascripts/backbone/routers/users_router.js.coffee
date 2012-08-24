class TEDxYale.Routers.Router extends Backbone.Router
  initialize: (options) ->
    @users = new TEDxYale.Collections.UsersCollection()
    @users.reset options.users

  routes:
    ".*"        : "newUser"

  newUser: ->
    @view = new TEDxYale.Views.Users.NewView(collection: @users)
    $("#user_form").html(@view.render().el)