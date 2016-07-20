post '/posts/:post_id/upvotes/new' do
	@user = User.find(session[:id])
  @online_user = User.find(session[:id]) 
  @post = Post.find(params[:post_id])
  # if @post.upvotes.includes(:user_id).where(user_id: @online_user.id)
  # 	@vote_error = "*you already upvoted this post"
  # 	erb :"/users/index"
  # 	redirect "/users/#{@post.user_id}"
  # else
  	@vote = Upvote.create(value: 1, user_id: current_user.id, post_id: params[:post_id])
  	redirect "/users/#{@post.user_id}"
  # end
end

post '/posts/:post_id/downvotes/new' do
	@user = User.find(session[:id])
  @online_user = User.find(session[:id]) 
  @post = Post.find(params[:post_id])
  # if @post.downvotes.includes(:user_id).where(user_id: @online_user.id)
  # 	@vote_error = "*you already downvoted this post"
  # 	erb :"/users/index"
  # else
 	@vote = Downvote.create(value: 1, user_id: current_user.id, post_id: params[:post_id])
  	redirect "/users/#{@post.user_id}"
  # end
end
