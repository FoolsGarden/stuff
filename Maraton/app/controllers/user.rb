#=========================
#==Control de sesiones ===
#=========================
post '/sign/up' do 
  if User.create(name:params[:name],email:params[:email],password:params[:pwd],total_rounds:0,total_score:0).valid?
    @user = User.last
    session[:user_id] ||= @user.id
    return erb :user, layout: false
  else
    return nil  
  end
end
post '/sign/in' do 
  @user = User.authenticate(params[:email],params[:pwd])
  if @user
    session[:user_id] ||= @user.id
    return erb :user, layout: false
  else
    return nil  
  end
end

post '/sign/out' do
  session.clear
  redirect '/'
end

#================================
#==Termina Control de sesiones ==
#================================