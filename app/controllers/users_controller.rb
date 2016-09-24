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
end

get '/users/:id/edit' do
end

put '/users/:id' do
end

delete '/users/:id' do
end
