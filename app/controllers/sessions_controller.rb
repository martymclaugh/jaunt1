get '/' do
  erb :index
end


post '/users/:id' do
  # User.find(users: params[:id])
end


post '/' do
  if params[:password1] == params[:password2]
    user = User.create(username: params[:username], password: params[:password2])
    if user
      login(user)
      redirect '/users/:id'
    end
  else
    @error = "Passwords don't match"
    erb :index
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end


post '/' do
  if User.authenticate(params[:username], params[:password])
    login(user)
    redirect '/users/:id'
  else

  end
end
