# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $(".user_fb.fb_login").click( ->
      FB.login ((response) ->
        if response.authResponse
          window.location = '/facebook?fb_id=' + response.authResponse.userID + '&token=' + response.authResponse.accessToken
        else
          console.log "User cancelled login or did not fully authorize."
        ), scope: 'email'
    )