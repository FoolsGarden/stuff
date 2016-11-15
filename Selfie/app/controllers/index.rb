enable :sessions
#===========================
#== Controlador Principal ==
#===========================
get '/' do
  if session[:user_id]
    @user=User.find(session[:user_id])
    @photos = Photo.all
    erb :in 
  else
    erb :index
  end
end

post '/user/reg' do
  @user = User.new(name:params[:name],email:params[:email])
  @user.password=params[:password]
  if @user.save
    session[:user_id]=@user.id
    @photos = Photo.all
    return erb :in , layout: false
  else
    return erb :error , layout: false
  end
end

post '/user/ini' do
  @user = User.authenticate(params[:email],params[:password])
  if @user
    session[:user_id]=@user.id
    @photos = Photo.all
    return erb :in , layout: false
  else
    return erb :error , layout: false
  end
end

post '/upload' do
  @photo = Photo.new(params[:photo])
  @photo.save!
  redirect  '/' 
end

post '/user/mod' do
  p params
  @user = User.find(session[:user_id])
  @user.name = params[:name] if params[:name] != ""
  @user.email = params[:email] if params[:email] != ""
  @user.password = params[:password] if params[:password] != ""
  if @user.save
    @user = User.find(session[:user_id])
    return erb :in , layout: false
  else
    return erb :error , layout: false
  end
end

get '/user/out' do
  session.clear
  redirect  '/' 
end
#===========================
#== Controlador Principal ==
#===========================