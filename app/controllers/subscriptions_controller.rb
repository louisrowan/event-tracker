post '/subscriptions' do
  event = Event.find(params[:event_id])
  current_user.events << event
  redirect '/'
end
