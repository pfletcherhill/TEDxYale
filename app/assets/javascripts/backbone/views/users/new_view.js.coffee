TEDxYale.Views.Users ||= {}

class TEDxYale.Views.Users.NewView extends Backbone.View
  template: JST["backbone/templates/users/new"]
  editTemplate: JST["backbone/templates/users/edit"]
  confirmTemplate: JST["backbone/templates/users/confirm"]

  events:
    "submit #new-user": "save"
    "submit #update-user": "update"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()
    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @$("form#new-user input.register").addClass 'loading'
    @$("form#new-user input").attr('disabled',true)
    @model.unset("errors")
    @collection.create(@model.toJSON(),
      success: (user) =>
        @model = user
        @setupAddInfo()
      error: (user, jqXHR) =>
        @$("form#new-user input").attr('disabled',false)
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )
  
  update: (event) ->
    event.preventDefault()
    event.stopPropagation()
    @$("form#update-user input.register").addClass 'loading'
    params = 
      affiliation: @$('form#update-user input.affiliation').val()
      year: @$('form#update-user input.year').val()
    @model.save(params,
      success : (user) =>
        @model = user
        @finishForm()
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    @$("form#new-user").backboneLink(@model)
    return this
    
  setupAddInfo: =>
    $("form#new-user input.register").removeClass('loading').addClass('confirmed').val("Signed Up")
    @$("form#update-user").backboneLink(@model)
    $(@el).append(@editTemplate( @model.toJSON() ))
    @$(".add_info").delay(200).addClass 'visible'
    @$(".add_info input:first").focus()
  
  finishForm: =>
    $("form#update-user input").attr('disabled',true)
    $("form#update-user input.register").removeClass('loading').addClass('confirmed').val("Added Info")
    $(@el).append(@confirmTemplate( @model.toJSON() ))
    @$(".add_info input:last").focus()