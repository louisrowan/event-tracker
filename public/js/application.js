$(document).ready(function() {

  homeFormEnterListener();
  ticketInfoButtonListener();
  registrationButtonListener();
  cancelTicketInfoListener();
  imgHoverListener();
  subscribeButtonListener();
  unSubscribeButtonListener();
  loginButtonListener();

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
      $('.list_content_div').html(response)
      $('#formy')[0].reset();
    })

    request.fail(function(response){
      console.log('request bad')
    })

  })
}


var ticketInfoButtonListener = function(){
  $('.list_content_div').on('click', '.ticket_info_button', function(event){
    console.log('mouseover')
    $(this).parent().siblings('.ticket_info_div').toggle();
    $('#dimmer_div').toggle();
    $('html, body').css({
    'overflow': 'hidden'
    // 'height': '100%'
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
  $('.list_content_div').on('click', '.ticket_cancel', function(){
    $(this).parent().hide();
    console.log(this)
    $('#dimmer_div').toggle();
    $('html, body').css({
    'overflow': 'auto'
    // 'height': 'auto'
});
  })
}

var imgHoverListener = function(){
  $('.list_content_div').on('mouseover', '.event_div', function(){
    $(this).children('img').css('opacity', '1')
  })
}

var subscribeButtonListener = function(){
  $('.list_content_div').on('submit', '.subscribe_button_form', function(event){
    event.preventDefault();
    console.log('in subscribe listener')
    var subscribeForm = $(this)

    var subscribeURL = $(this).attr('action')
    var subscribeType = $(this).attr('method')
    var data = $(this).serialize();
    console.log(subscribeURL + subscribeType + data)

    var request = $.ajax({
      url: subscribeURL,
      type: subscribeType,
      data: data
    })

    request.done(function(response){
      subscribeForm.children('button').html('Subscribed')
      subscribeForm.children('button').css('color', 'red')
    })

    request.fail(function(response){
      console.log(response)
      console.log('subscribe fail')
      alert('You are already subscribed to this event')
    })

  })
}

var unSubscribeButtonListener = function(){
  $('.list_content_div').on('submit', '.un_subscribe_button_form', function(event){
    event.preventDefault();

    var unSubForm = $(this)

    var url = unSubForm.attr('action')
    var type = unSubForm.children('.unsub_hidden_input').attr('value')
    var data = unSubForm.serialize();

    var request = $.ajax({
      url: url,
      type: type,
      data: data
    })

    request.done(function(response){
      console.log('success')
      unSubForm.children('button').remove();
      unSubForm.append('Subscription Canceled')
    })

    request.fail(function(response){
      console.log('fail')
    })

  } )

}


var loginButtonListener = function(){
  $('#login_td').on('click', function(){
    console.log('in login form div')
    $('.login_form').toggle();
  })
}
