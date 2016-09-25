$(document).ready(function() {

  homeFormEnterListener();

});


var homeFormEnterListener = function(){
  $('#formy').on('submit', function(e){
    e.preventDefault();
    console.log('in form listener')

    var homeForm = $(this)
    var url = homeForm.attr('action')
    var method = homeForm.attr('method')
    var data = homeForm.serialize();
    console.log('url = ' + url + ' and method = ' + method)
    console.log(data)

    var request = $.ajax({
      url: url,
      type: method,
      data: data
    })

    request.done(function(response){
      console.log('request good')
      console.log(response)
      $('#extra').html(response)
      $('#formy').toggle();



    })

    request.fail(function(response){
      console.log('request bad')
    })

  })
}
