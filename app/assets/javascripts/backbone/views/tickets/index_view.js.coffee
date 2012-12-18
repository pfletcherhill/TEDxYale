TEDxYale.Views.Tickets ||= {}

class TEDxYale.Views.Tickets.IndexView extends Backbone.View
  
  template: JST["backbone/templates/tickets/index"]
  
  el: '#ticket-form'
  
  initialize: ->
    Stripe.setPublishableKey(TEDxYale.stripeKey)
    @render()
  
  renderUserInformation: ->
    if TEDxYale.user
      $("input[name='name']").val(TEDxYale.user.get('name'))
      $("input[name='email']").val(TEDxYale.user.get('email'))
        
  render: ->
    $(@el).html( @template() )
    @renderUserInformation()
  
  stripeResponseHandler: (status, response) ->
    if response.error
      $(".payment-errors").text response.error.message
      $(".submit-button").removeAttr "disabled"
      $(".submit-button").html("Submit Payment →")
    else
      form$ = $("#payment-form")
      token = response["id"]
      form$.append "<input type='hidden' name='stripeToken' value='" + token + "'/>"
      form$.get(0).submit()
  
  events:
    "submit #payment-form" : "submitForm"
  
  submitForm: (event) ->
    event.preventDefault()
    $(".submit-button").html("Processing...")
    $(".submit-button").attr "disabled", "disabled"
    if $("input[name='name']").val() && $("input[name='email']").val()
      Stripe.createToken
        number: $(".card-number").val()
        cvc: $(".card-cvc").val()
        exp_month: $(".card-expiry-month").val()
        exp_year: $(".card-expiry-year").val()
      , @stripeResponseHandler
      false
    else
      $(".payment-errors").text 'Please supply a valid name and email.'
      $(".submit-button").removeAttr "disabled"
      $(".submit-button").html("Submit Payment →")