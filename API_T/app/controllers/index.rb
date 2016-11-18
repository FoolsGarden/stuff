#=======================================================================
get '/' do
  erb :index
end
#=======================================================================
post '/fetch' do 
  if CLIENT.user_exists?(params[:user])
     redirect "/#{params[:user]}"
     #params[:user]
  else
     nil 
  end
end
#=======================================================================
get '/:handle' do
  @user = TwitterUser.find_or_create_by(name:params[:handle])
  if @user
    if @user.tweets.empty? || !@user.update?
      Tweet.where(twitter_user_id:@user.id).destroy_all
      tweets = CLIENT.get_all_tweets(params[:handle]).take(10)
      tweets.each do |tweet|
        tw = Tweet.create(twitter_user_id:@user.id,body:tweet.text)
      end
      @tweets = @user.tweets
    else
      @tweets = @user.tweets
    end
  end
  erb :tweets , layout: false
end
#=======================================================================
post '/tweet' do
  tweet = params[:tweet]
  if tweet 
    CLIENT.update("#{tweet}")
    tweet_web = CLIENT.get_all_tweets("molacfar").first.text
    if tweet == tweet_web
      return "<p style='color:green'>#{params[:tweet]}</p>"
    else
      return nil  
    end
  else
    return nil
  end
    # Recibe el input del usuario

    # Crea el tweet utilizando la API de Twitter

    # Regresa al usuario el tweet o un mensaje de EXITO o ERROR
end
#=======================================================================


