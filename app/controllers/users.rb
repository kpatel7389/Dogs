get '/users/new' do
  erb :'/users/new'
end

post '/users/new' do
  @user = User.new(params[:user])
  @user.password = params[:password]
  # p @user
  if @user.save
    session[:user_id] = @user.id
    redirect '/images'
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/:id/show' do
  @user = User.find_by(id: params[:id])
  erb :'/users/show'
end
