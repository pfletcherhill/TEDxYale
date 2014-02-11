$(document).ready(function() {

  // set the date we're counting down to
  var target_date = new Date("Feb 11, 2014 EST").getTime();

  // variables for time units
  var days, hours, minutes, seconds, string;

  // update the tag with id "countdown" every 1 second
  setInterval(function () {
    // get tag element
    var countdown = $('#js-countdown');
    
    if (countdown) {
      // find the amount of "seconds" between now and target
      var current_date = new Date().getTime();
      var seconds_left = (target_date - current_date) / 1000;

      // do some time calculations
      days = ("0" + parseInt(seconds_left / 86400)).slice(-2);
      seconds_left = seconds_left % 86400;

      hours = ("0" + parseInt(seconds_left / 3600)).slice(-2);
      seconds_left = seconds_left % 3600;

      minutes = ("0" + parseInt(seconds_left / 60)).slice(-2);
      seconds = ("0" + parseInt(seconds_left % 60)).slice(-2);

      // format countdown string + set tag value
      string = days + ":" + hours + ":" + minutes + ":" + seconds;
      countdown.html(string);
    }
  }, 1000);
      
})