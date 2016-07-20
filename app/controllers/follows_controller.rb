get '/users/:user_id/follower' do	
	@user = User.find(params[:user_id])
	@followers = @user.follower
	erb :"/users/followers/show"
end

get '/users/:user_id/following' do	
	@user = User.find(params[:user_id])
	@followings = @user.following
	erb :"/users/followings/show"
end

post '/users/:user_id/follow' do
	@user = User.find(params[:user_id])
	@following_id = @user.id
	@follower_id = session[:id]
	if @follower_id == @following_id
		@follow_error = "*You can't follow yourself."
		erb :"/users/index"
	else
		follow = Follow.create(follower_id: @follower_id, following_id: @following_id)
		redirect "/users/#{@user.id}"
	end
end

post '/users/:user_id/unfollow' do
	@user = User.find(params[:user_id])
	@follower_id = session[:id]
	p @follower_id
	Follow.find_by(following_id: @user.id, follower_id: @follower_id).destroy
	redirect "/users/#{@user.id}"
end

  # def unfollow(other_user)
  #   following.find_by(following_id: other_user.id).destroy
  # end