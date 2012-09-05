TEDxYale.Views.Applications ||= {}

class TEDxYale.Views.Applications.NewView extends Backbone.View
  template: JST["backbone/templates/applications/index"]
  basicTemplate: JST["backbone/templates/applications/basic"]
  teamsTemplate: JST["backbone/templates/applications/teams"]
  experienceTemplate: JST["backbone/templates/applications/experience"]
  
  initialize: ->
    @user = new TEDxYale.Models.User
    @model = new TEDxYale.Models.Application
  
  render: ->
    $(@el).html(@template(@model.toJSON() ))
    @renderBasic()
    return this
  
  events:
    'click button.basic' : 'renderBasic'
    'click button.teams' : 'renderTeams'
    'click button.experience' : 'renderExperience'
    'click .team.events' : 'addEvents'
    'click .team.finance' : 'addFinance'
    'click .team.community' : 'addCommunity'
    'click .team.events.selected' : 'removeSelectedEvents'
    'click .team.finance.selected' : 'removeSelectedFinance'
    'click .team.community.selected' : 'removeSelectedCommunity'
    'submit form' : 'save'
  
  pointer: (top) ->
    @$("#pointer").css('top',top + 'px')
  renderBasic: ->
    @$('.panel').html(@basicTemplate())
    @$('form').backboneLink(@model)
    @$('form input.name').val(@model.get('name'))
    @$('form input.email').val(@model.get('email'))
    @$('form input.affiliation').val(@model.get('affiliation'))
    @$('form input.year').val(@model.get('year'))
    @$('form textarea.bio').val(@model.get('bio'))
    @pointer('5')
  
  renderTeams: ->
    @$('.panel').html(@teamsTemplate())
    @$('form').backboneLink(@model)
    @$('.team.events').addClass 'selected' if @model.get('events_team')
    @$('.team.finance').addClass 'selected' if @model.get('finance_team')
    @$('.team.community').addClass 'selected' if @model.get('community_team')
    @pointer('44')
  
  renderExperience: ->
    @$('.panel').html(@experienceTemplate())
    @$('form').backboneLink(@model)
    @$('form textarea.experiences').val(@model.get('experiences'))
    @pointer('83')
    
  addEvents: ->
    @$(".team.events").addClass 'selected'
    @model.set events_team: true
  
  addFinance: ->
    @$(".team.finance").addClass 'selected'
    @model.set finance_team: true
    
  addCommunity: ->
    @$(".team.community").addClass 'selected'  
    @model.set community_team: true
  
  removeSelectedEvents: (event) ->
    if $(event.target).hasClass 'team'
      $(event.target).removeClass 'selected'
    else
      $(event.target).parents('.team').removeClass 'selected'
    @model.set events_team: false
  
  removeSelectedFinance: (event) ->
    if $(event.target).hasClass 'team'
      $(event.target).removeClass 'selected'
    else
      $(event.target).parents('.team').removeClass 'selected'
    @model.set finance_team: false
  
  removeSelectedCommunity: (event) ->
    if $(event.target).hasClass 'team'
      $(event.target).removeClass 'selected'
    else
      $(event.target).parents('.team').removeClass 'selected'
    @model.set community_team: false
  
  save: (event) ->
    event.preventDefault()
    @$("form button").html("Processing...").addClass 'loading'
    @model.url = '/applications'
    @model.save(null,
      success: (application) =>
        @model.sendAppEmail()
        @finishApplication(application)
    )
  
  finishApplication: (app) ->
    @$(".application").html('<div class="message">Thanks for applying, <b>' + app.get('name') + '</b>!</div>')