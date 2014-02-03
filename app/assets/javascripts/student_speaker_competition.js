$(document).ready(function() {
  
  // Check hash
  // if (window.location.href.indexOf('#') > -1 && 
  //       (window.location.href.indexOf('student_speaker_competition') > -1 ||
  //       window.location.href.indexOf('2014') > -1)) {
  //         
  //     // Router
  //     var hash = location.hash.substring(1);
  //     if (hash == 'become_a_speaker') {
  //       adjustHtml('.speaker-field', '.nominate-field', hash, 0);
  //     } else {
  //       adjustHtml('.nominate-field', '.speaker-field', hash, 0);
  //     }
  //   }
  
  // Shows/hide correct elements
  // Changes hash
  function adjustHtml(show, hide, hash, transition) {
    $('.buttons button[data-show="' + show + '"]').addClass('active');
    clearMessage();
    $('.secondary').slideDown(transition + 200);
    $(show).slideDown(transition);
    $(hide).slideUp(transition);
    location.hash = hash;
    
    if (hash == 'become_a_speaker') {
      $('#cycle-id').val(applicationCycleIds[0]);
    } else if (hash == 'nominate_a_friend') {
      $('#cycle-id').val(applicationCycleIds[1]);
    }
  }
  
  function renderMessage(text, type) {
    $('.message').removeClass().addClass("message " + type);
    $('.message .wrapper').text(text).show();
    $('.message').slideDown(200);
    $('html, body').animate({ scrollTop: 680 }, 200);
  }
  
  function clearMessage() {
    $('.message .wrapper').text('')
    $('.message').hide();
  }
  
  function clearForm() {
    $('input:text, textarea', '.comp-application form').val('');
  }
  
  // Toggle applications
  $('.buttons button').click(function(event) {
    var el = $(event.target);
    $('.buttons button').removeClass('active');
    el.addClass('active');
    adjustHtml(el.data('show'), el.data('hide'), el.data('link'), 0);
  });
  
  // Success callback
  $('.comp-application form').on('ajax:success', function() {
    $('.secondary').hide();
    clearForm();
    var message = "Success! Thank you for ";
    if (location.hash == '#become_a_speaker') {
      message += "applying to speak. We will be in touch soon. ";
      message += "In the meantime, if you have any questions, don't hesitate to contact us at curator@tedxyale.com";
    } else {
      message += "your nomination. We will be in touch with him/her shortly.";
    }
    renderMessage(message, 'success');
  });
  
  // Failure callback
  $('.comp-application form').on('ajax:error', function() {
    renderMessage("Whoops, we encountered an error! Please make sure the form is filled out and correct.", 'error')
  })
  
  // Load video
  var sources = [
    "https://s3.amazonaws.com/TEDxYale/mp4s/cody.mp4",
    "https://s3.amazonaws.com/TEDxYale/mp4s/clemantine.mp4",
    "https://s3.amazonaws.com/TEDxYale/mp4s/eddy.mp4",
    "https://s3.amazonaws.com/TEDxYale/mp4s/sam.mp4",
    "https://s3.amazonaws.com/TEDxYale/mp4s/dj.mp4"
  ];
  
  var video = $('#video-background');
  if (video[0] && video[0].canPlayType && video[0].canPlayType('video/mp4')) {
    $('source', video).attr('src', sources[Math.floor(Math.random()*(sources.length))]);
    video.load();
  }
  
});  