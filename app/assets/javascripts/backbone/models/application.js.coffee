class TEDxYale.Models.Application extends Backbone.Model

  defaults:
    name: null
    email: null
    affiliation: null
    year: null
    bio: null
    experiences: null
    events_team: false
    finance_team: false
    community_team: false
  
  sendAppEmail: ->
    console.log @
    $.ajax
      type: "POST"
      dataType: "json"
      url: "/app_email/" + @get('id')
  
class TEDxYale.Collections.ApplicationsCollection extends Backbone.Collection
  model: TEDxYale.Models.Application
  url: '/applications'