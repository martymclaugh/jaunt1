get '/profile' do
	@user = User.find(session[:user_id])
  if logged_in?
  	erb :'users/profile'
  else
  	@login_error = "*You need to login first"
    erb :index
  end

end

get '/users/:user_id' do
	@user = User.find(params[:user_id])
	@online_user = User.find(session[:user_id])
	if @user.id == @online_user.id
		redirect '/profile'
	else
		erb :'users/index'
	end
end

