get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions/new' do
  @user = User.find_by(username: params[:username])
  # p "----------------"
  # p @user
  # p "----------------"
  if @user && @user.authenticate(params[:username], params[:password])
    session[:user_id] = @user.id
    redirect '/images'
  else
    @errors = ["Please enter a valid username and password"]
    erb :'sessions/new'
  end
end

get '/sessions/logout' do
  session.clear
  redirect '/'
end
