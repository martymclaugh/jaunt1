get '/users/:user_id/follower' do	
	@user = User.find(params[:user_id])
	@followers = @user.follower
	erb :"/users/follower/show"
end

get '/users/:user_id/following' do	
	@user = User.find(params[:user_id])
	@followings = @user.following
	erb :"/users/following/show"
end