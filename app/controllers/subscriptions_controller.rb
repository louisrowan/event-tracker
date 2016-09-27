post '/subscriptions' do
  event = Event.find(params[:event_id])
  current_user.events << event
  if request.xhr?
    status 200
  else
    redirect '/'
  end
end
