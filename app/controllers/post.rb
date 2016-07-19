post '/posts/new' do
  @post = Post.create(user_id: session[:user_id], text: params[:post])
  redirect "/profile"
  @votes = @post.upvotes.count - @post.downvotes.count
end
