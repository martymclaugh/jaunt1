post '/users' do
  if User.authenticate(params[:username], params[:password])
    login(user)
    redirect '/users'
  elsif params[:password1] == params[:password2]
    user = User.create(username: params[:username], full_name: params[:full_name], email: params[:email], password: params[:password2])
    if user
      login(user)
      redirect '/users'
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


