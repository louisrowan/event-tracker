get '/sessions/new' do
end

post '/sessions' do\
  puts "in sessions post"
  p params
  @user = User.authenticate(params[:session])
  if @user
    session[:id] = @user.id
    erb :'/users/show'
  else
    redirect '/'
  end
end

delete '/sessions/:id' do
  session[:id] = nil
  redirect '/'
end
