get '/profile' do
	@user = User.find(session[:id])
	@feed = []
	@user.following.each {|user| user.posts.each{|post|  @feed << post}}
	@user.posts.each {|post| @feed << post}
	@feed_posts = @feed.sort_by { |obj| obj.created_at }
  if logged_in?
  	erb :'users/profile'
  else
  	@login_error = "*You need to login first"
    erb :index
  end

end

get '/users/:user_id' do
	@user = User.find(params[:user_id])
	p @user
	@online_user = User.find(session[:id])
	if @user.id == @online_user.id
		redirect '/profile'
	else
		erb :'users/index'
	end
end

