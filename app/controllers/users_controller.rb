get '/users' do
end

get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  if params[:user][:password] == ""
    @errors = 'password too short'
    return erb :'/users/new'
  end
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    erb :'/users/show'
  else
    erb :'/users/new'
  end
end

get '/users/:id' do
  @list = List.create
  @list.events = current_user.events
  erb :'/users/show'
end

get '/users/:id/edit' do
end

put '/users/:id' do
  event = Event.find(params[:event_id])
  current_user.events << event
  redirect '/'
end

delete '/users/:id' do
end
