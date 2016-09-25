get '/users' do
end

get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  puts "in /user post"
  p params[:user]
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
  p current_user.events
  event = Event.find(params[:id])
  current_user.events << event
  p current_user.events
  redirect '/'
end

delete '/users/:id' do
end
