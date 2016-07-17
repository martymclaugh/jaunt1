post '/posts/:post_id/upvotes/new' do
  @user = User.find(session[:user_id]) 
  @vote = Upvote.create(value: 1, user_id: session[:user_id], post_id: params[:post_id])
  p "$" * 100 
  p params[:post_id]
  redirect "/users/#{@user.id}"
end

post '/posts/:post_id/downvotes/new' do
  @user = User.find(session[:user_id]) 
  p "$" * 100 
  p params[:post_id]
  @vote = Downvote.create(value: 1, user_id: session[:user_id], post_id: params[:post_id])
  p @vote
  redirect "/users/#{@user.id}"
end