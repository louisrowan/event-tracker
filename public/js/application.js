$(document).ready(function() {

  homeFormEnterListener();
  ticketInfoButtonListener();
  registrationButtonListener();

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
      $('#formy').toggle();



    })

    request.fail(function(response){
      console.log('request bad')
    })

  })
}


var ticketInfoButtonListener = function(){
  $('#extra').on('mouseover', '.ticket_info_button', function(event){
    console.log('mouseover')
    $(this).parent().siblings('.ticket_info_div').toggle();
  })
}

var registrationButtonListener = function(){
  $('#create_account_link').on('click', function(event){
    event.preventDefault();
    $('#registration_div').toggle();
    $('#dimmer_div').toggle();
  })
}
