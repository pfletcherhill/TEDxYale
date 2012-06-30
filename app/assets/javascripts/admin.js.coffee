# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $(".index > .user").click ->
    
    if $(this).hasClass "open"
    else
      $(".user").removeClass 'open'
      $(".close").hide()
      $(this).addClass "open"
      $(this).children().show()
      
      user_id = $(this).data('id')
    
      $(".detail").html ("loading...")
    
      $.ajax
        url: '/users/' + user_id
        type: 'GET'
        dataType: 'json'
        success: (@user)=>
          $(".detail").html (
            """
            <div class='item'>
              <div class="left">Name:</div>
              <div class="right">#{@user.name}</div>
            </div>
            <div class='item'>
              <div class="left">Email:</div>
              <div class="right">#{@user.email}</div>
            </div>
            <div class="item">
              <div class="left">Type:</div>
              <div class="right type"></div>
            </div>
            <div class='item'>
              <div class="left">Affiliation:</div>
              <div class="right">#{@user.affiliation}</div>
            </div>
            <div class='item'>
              <div class="left">Year:</div>
              <div class="right">#{@user.year}</div>
            </div>
            <div class="item">
              <div class="left">Events:</div>
              <div class="right">#{@user.events}</div>
            </div>
            """
          )
          if @user.admin == 'a'
            $(".right.type").html("Admin")
          else
            $(".right.type").html("
              User <a href='/promote?user_id=#{@user.id}'>(Promote)</a>
            ")
      
  ContainerHeight = $(".admin_container").height()
  $(".detail").css('height', ContainerHeight)    
  
  if $(".admin_container").hasClass "events"
    $(".item.events").addClass "selected"
    $(".title").css('border-bottom','0px')
  if $(".admin_container").hasClass "users"
    $(".item.users").addClass "selected"
    $(".item.events").css('border-bottom','0px')
  if $(".admin_container").hasClass "finance"
    $(".item.finance").addClass "selected"
    $(".item.users").css('border-bottom','0px')
  if $(".admin_container").hasClass "tv"
    $(".item.tv").addClass "selected"
    $(".item.finance").css('border-bottom','0px')