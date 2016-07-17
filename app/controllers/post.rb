post '/posts/new' do
  @post = Post.create(user_id: session[:user_id], text: params[:twit])
  redirect "/users"
@votes = @post.upvotes.count - @post.downvotes.count
end
