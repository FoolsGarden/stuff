#=======================================================================
get '/' do
  erb :index
end
#=======================================================================
# post '/fetch' do 
#   if CLIENT.user_exists?(params[:user])
#      redirect "/#{params[:user]}"
#      #params[:user]
#   else
#      nil 
#   end
# end
#=======================================================================
# get '/:handle' do
#   @user = TwitterUser.find_or_create_by(name:params[:handle])
#   if @user
#     if @user.tweets.empty? || !@user.update?
#       Tweet.where(twitter_user_id:@user.id).destroy_all
#       tweets = CLIENT.get_all_tweets(params[:handle]).take(10)
#       tweets.each do |tweet|
#         tw = Tweet.create(twitter_user_id:@user.id,body:tweet.text)
#       end
#       @tweets = @user.tweets
#     else
#       @tweets = @user.tweets
#     end
#   end
#   erb :tweets , layout: false
# end
#=======================================================================
#  
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
  # Volvemos a mandar a twitter el 'request_token' a cambio de un 'access_token' 
  # Este 'access_token' lo utilizaremos para futuras comunicaciones.   
  @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
  # Despues de utilizar el 'request token' ya podemos borrarlo, porque no vuelve a servir. 
  session.delete(:request_token)
  # Aquí es donde deberás crear la cuenta del usuario y guardar usando el 'access_token' lo siguiente:
  # nombre, oauth_token y oauth_token_secret
  user = TwitterUser.find_by(name:@access_token.params[:screen_name])
  unless user
    user = TwitterUser.create(name:@access_token.params[:screen_name],token:@access_token.params[:oauth_token],secret_token:@access_token.params[:oauth_token_secret])
  end
  # No olvides crear su sesión 
  unless user
    session[:user_id] = user.id    
  end
  # :oauth_token
  # :oauth_token_secret
  # :user_id
  # :screen_name

   
end

  # Para el signout no olvides borrar el hash de session
#=======================================================================

