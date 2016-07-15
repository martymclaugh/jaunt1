get '/users' do
  @user = User.find(session[:user_id])
  erb :'users/index'
end

post '/users' do
  @post = Post.create(user_id: session[:user_id], text: params[:twit])
  redirect '/users'
end
