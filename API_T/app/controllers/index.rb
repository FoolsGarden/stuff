get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  erb :index
end

post '/fetch' do 
  if CLIENT.user_exists?(params[:user])
    redirect "/#{params[:user]}"
  else
    "Error"  
  end
end
get '/:handle' do
  @user = TwitterUser.find_or_create_by(name:params[:handle])
  if @user
    if @user.tweets.empty?
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




