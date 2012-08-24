class TEDxYale.Models.User extends Backbone.Model
  paramRoot: 'user'

  defaults:
    name: null
    email: null

class TEDxYale.Collections.UsersCollection extends Backbone.Collection
  model: TEDxYale.Models.User
  url: '/users'
