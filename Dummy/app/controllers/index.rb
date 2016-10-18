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

post '/user' do 
  p params
  if params[:accion] == "login"
    p "entre"
   p user = User.authenticate(params[:email],params[:password])
    if  user
      p @name=user.name
      erb :user
    end
  elsif params[:accion] == "reg"
    user = User.create(name:params[:name],email:params[:email],password:params[:password])
    if  user
      @name=user.name
      erb :user
    end
  end
end