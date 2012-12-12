class TEDxYale.Models.User extends Backbone.Model
  paramRoot: 'user'

  defaults:
    name: null
    email: null
  
  voteFor: (id) ->
    $.ajax
      type: 'POST'
      dataType: 'json'
      url: '/users/' + @id + '/vote/' + id
      success: (data) ->
        console.log data 
      error: ->
        alert 'No more votes!'
  
  fetchVotesCount: ->
    $.ajax
      type: 'GET'
      dataType: 'json'
      url: '/me/votes_count'
      success: (data) =>
        @set votes: data
        
class TEDxYale.Collections.UsersCollection extends Backbone.Collection
  model: TEDxYale.Models.User
  url: '/users'
