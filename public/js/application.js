$(document).ready(function() {

  homeFormEnterListener();
  ticketInfoButtonListener();
  registrationButtonListener();
  cancelTicketInfoListener();
  imgHoverListener();

});


var homeFormEnterListener = function(){
  $('#formy').on('submit', function(e){
    e.preventDefault();

    var homeForm = $(this)
    var url = homeForm.attr('action')
    var method = homeForm.attr('method')
    var data = homeForm.serialize();

    var request = $.ajax({
      url: url,
      type: method,
      data: data
    })

    request.done(function(response){
      $('#extra').html(response)
      $('#formy')[0].reset();



    })

    request.fail(function(response){
      console.log('request bad')
    })

  })
}


var ticketInfoButtonListener = function(){
  $('#extra').on('click', '.ticket_info_button', function(event){
    console.log('mouseover')
    $(this).parent().siblings('.ticket_info_div').toggle();
    $('#dimmer_div').toggle();
    $('html, body').css({
    'overflow': 'hidden',
    'height': '100%'
});
  })
}

var registrationButtonListener = function(){
  $('#create_account_link').on('click', function(event){
    event.preventDefault();
    $('#registration_div').toggle();
    $('#dimmer_div').toggle();
  })
}

var cancelTicketInfoListener = function(){
  $('#extra').on('click', '.ticket_cancel', function(){
    $(this).parent().hide();
    console.log(this)
    $('#dimmer_div').toggle();
    $('html, body').css({
    'overflow': 'auto',
    'height': 'auto'
});
  })
}

var imgHoverListener = function(){
  $('#extra').on('mouseover', '.event_div', function(){
    console.log('hovering')
    $(this).children('img').css('opacity', '1')
  })
}
