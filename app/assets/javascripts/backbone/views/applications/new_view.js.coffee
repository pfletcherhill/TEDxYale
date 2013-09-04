TEDxYale.Views.Applications ||= {}

class TEDxYale.Views.Applications.New extends Backbone.View
  template: JST["backbone/templates/applications/index"]
  generalQuestionsTemplate: JST["backbone/templates/applications/general_questions"]
  roleQuestionsTemplate: JST["backbone/templates/applications/role_questions"]
  
  el: "#application"
  
  initialize: (options) ->
    @render(options)
  
  renderQuestions: (questions) ->
    generals = new Backbone.Collection(questions).where({application_role_id: null})
    $(".form-questions").html(@generalQuestionsTemplate(questions: generals))

  renderRoles: (roles, questions) ->
    questions = new Backbone.Collection(questions)
    for role in roles
      $(".form-roles").append(@roleQuestionsTemplate(role: role, questions: questions.where({application_role_id: role.id})))
    
  render: (options) ->
    @options = options
    $(@el).html(@template())
    @renderQuestions(options.applicationCycle.application_questions)
    @renderRoles(options.roles, options.applicationCycle.application_questions)
    @$("#application-form").backboneLink(@model)
    return this
  
  renderError: (message) ->
    $("#application-form .error").html(message)
    $("#application-form .error").slideDown(100)
  
  saveQuestions: (application) ->
    $(".question").each ->
      if $("textarea", this).val().length > 0
        answer = new Backbone.Model({
          application_question_id: $(this).data("id"),
          application_id: application.id,
          content: $("textarea", this).val()
        })
        answer.url = "/application_answers"
        answer.save null
    
  events:
    'click .toggle-form-role' : 'toggleFormRole'
    'submit form' : 'save'
    'click button.submit' : 'save'
    
  toggleFormRole: (event) ->
    $div = $(".form-role-questions", $(event.target).closest(".form-role"))
    if $div.is(":hidden")
      $div.slideDown(100)
    else
      $div.slideUp(100)
  
  save: (event) ->
    event.preventDefault()
    if confirm "Are you sure?"
      $("#application-form .error").hide()
      @$("#application-form button").html("<span>☺</span> Processing App...")
      @model.url = '/applications'
      @model.save({application_cycle_id: @options.applicationCycle.id},
        success: (application) =>
          @saveQuestions(application)
          $(window).scrollTop(0)
          @$(".panel").html("<div class='message'>Congratulations! Your application has been submitted! We will be in touch shortly.</div>")
        error: =>
          @renderError("We were unable to process your application! Please make sure all fields are filled out then re-submit.")
          @$("#application-form button").html("<span>☺</span> Apply for TEDxYale")
      )