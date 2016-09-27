post '/subscriptions' do
  event = Event.find(params[:event_id])

  if subscription_invalid?(event)
    puts "INVALID"
    if request.xhr?
      status 402
    else
      @errors = ['You are already subscribed to this channel']
      erb :index
    end
  else
    puts "VALID"
    current_user.events << event
    if request.xhr?
      status 200
    else
      redirect '/'
    end
  end
end
