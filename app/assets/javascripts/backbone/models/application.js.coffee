class TEDxYale.Models.Application extends Backbone.Model

  defaults:
    name: null
    email: null
    affiliation: null
    year: null
    major: null
    hometown: null
  
  sendAppEmail: ->
    $.ajax
      type: "POST"
      dataType: "json"
      url: "/app_email/" + @get('id')
  
class TEDxYale.Collections.ApplicationsCollection extends Backbone.Collection
  model: TEDxYale.Models.Application
  url: '/applications'