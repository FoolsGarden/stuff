enable :sessions

get '/' do
  erb :index
end

post '/'do 
 erb :index
end

get '/login' do
  if params[:accion] == "Login"
    @variable="Inicia Sesion"
    erb :login
  else
    @variable="Registrate"
    erb :login
  end
end
post'/login' do
  if params[:accion] == "login"
    user = User.authenticate(params[:email],params[:password])
  elsif params[:accion] == "reg"
    user = User.create(name:params[:name],email:params[:email],password:params[:password])
  end
  if user != nil
    session[:user] ||= user.name
    redirect "/user?name=#{user.name}"
  elsif params[:accion] == "login"
    redirect '/login?accion=login'
  else
    redirect '/login?accion=reg'
  end
end

get '/user'do 
  if session[:user]!=nil
  @name = params[:name].upcase
  erb :user
  else
    erb :index
  end
end
get '/logout' do
  session[:user] = nil
  erb :index
end