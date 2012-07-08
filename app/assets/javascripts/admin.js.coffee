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
              <div class="align_right">#{@user.name}</div>
            </div>
            <div class='item'>
              <div class="left">Email:</div>
              <div class="align_right">#{@user.email}</div>
            </div>
            <div class="item">
              <div class="left">Type:</div>
              <div class="align_right type"></div>
            </div>
            <div class='item'>
              <div class="left">Affiliation:</div>
              <div class="align_right">#{@user.affiliation}</div>
            </div>
            <div class='item'>
              <div class="left">Year:</div>
              <div class="align_right">#{@user.year}</div>
            </div>
            <div class="item">
              <div class="left">Events:</div>
              <div class="align_right">#{@user.events}</div>
            </div>
            """
          )
          if @user.admin == 'a'
            $(".align_right.type").html("Admin")
          else
            $(".align_right.type").html("
              User <a href='/promote?user_id=#{@user.id}'>(Promote)</a>
            ")
            
  #Set list height
  listHeight = $(window).height() - 310
  $(".right .list").height(listHeight + 'px')
  
  $(".item.speakers span").click ->
    $(this).hide()
    $(".item.speakers .new_speaker").show()
  
  #Add speaker post
  ## $(".item.speakers span.add_speaker").click ->
  #     name = $('.item.speakers input.name').val()
  #     console.log name
  #     bio = $('.item.speakers textarea.bio').val()
  #     console.log bio
  #     twitter = $('.item.speakers input.twitter').val()
  #     console.log twitter
  #     eventId = $('.item.speakers .event_id').val()
  #     console.log eventId
  #     $.ajax
  #       url: '/speakers'
  #       type: 'POST'
  #       dataType: 'json'
  #       data:
  #         name: { source : name }
  #         bio: { source : bio }
  #         twitter: { source : twitter }
  #         event_id: { source : eventId }
  #       success: (@speaker) =>
  #         console.log @speaker.id
    
  #Set container height    
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