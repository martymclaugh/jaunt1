post '/register' do
  if params[:password1] == params[:password2]
    user = User.create(username: params[:username], full_name: params[:full_name], email: params[:email], password: params[:password2])
    if user
      login(user)
      redirect '/users'
    end
  else
    @register_error = "*Passwords don't match"
    erb :index
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

post '/login' do
  user = User.authenticate(params[:username], params[:password])
  if user
    login(user)
    redirect '/users'
  else
    @login_error = "*Wrong username or password"
    erb :index
  end
end
