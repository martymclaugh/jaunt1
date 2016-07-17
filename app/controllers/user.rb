get '/users' do
  @user = User.find(session[:user_id])
  erb :'users/index'
end

get '/users/:user_id' do
	@user = User.find(params[:user_id])
	erb :'users/index'
end