#=======================================================================
get '/' do
  if logged_in? 
    erb :index
  else
    erb :login
  end
end
#=======================================================================
post '/fetch' do 
  if current_user.user_exists?(params[:user])
     redirect "/#{params[:user]}"
  else
     nil 
  end
end
#=======================================================================
get '/:handle' do
  @user = TwitterUser.find_or_create_by(name:params[:handle])
  if @user
    if @user.tweets.empty? || ! @user.update?(current_user)
      @user.update!(current_user)      
    end
      @tweets = @user.tweets
  end
  erb :tweets , layout: false
end
#=======================================================================
post '/tweet' do
  tweet = params[:tweet]
  if tweet 
    current_user.tweet("#{tweet.text}")
    return "<p style='color:green'>#{params[:tweet]}</p>"
  else
    return nil
  end
    # Recibe el input del usuario

    # Crea el tweet utilizando la API de Twitter

    # Regresa al usuario el tweet o un mensaje de EXITO o ERROR
end
#=======================================================================
get '/sign_in' do
  # El método `request_token` es uno de los helpers
  # Esto lleva al usuario a una página de twitter donde sera atentificado con sus credenciales
  redirect request_token.authorize_url(:oauth_callback => "http://#{host_and_port}/auth")
  # Cuando el usuario otorga sus credenciales es redirigido a la callback_url 
  # Dentro de params twitter regresa un 'request_token' llamado 'oauth_verifier'
end
#=======================================================================
get '/auth' do
  @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
  session.delete(:request_token)
  user = User.find_by(name:@access_token.params[:screen_name])
  unless user
    user = User.create(name:@access_token.params[:screen_name],token:@access_token.params[:oauth_token],secret_token:@access_token.params[:oauth_token_secret])
  end
  twitter_current_user = TwitterUser.find_or_create_by(name:@access_token.params[:screen_name])
  session[:user_id] = user.id    
  session[:twitter_user_id] = twitter_current_user.id    
  erb :index
end

  # Para el signout no olvides borrar el hash de session
#=======================================================================

