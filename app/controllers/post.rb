post '/posts' do
  @post = Post.create(user_id: session[:user_id], text: params[:twit])
  redirect "/users"
end
