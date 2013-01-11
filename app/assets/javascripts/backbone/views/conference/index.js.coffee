TEDxYale.Views.Conference ||= {}

class TEDxYale.Views.Conference.IndexView extends Backbone.View
  
  template: JST["backbone/templates/conference/index"]
  
  el: '#conference'
  
  initialize: ->
    @speakers = @options.collection
    console.log @speakers
    @render()
  
  render: ->
    $(@el).html(@template())
    return this