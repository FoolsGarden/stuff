#=========================
#==Control de sesiones ===
#=========================
#Manda a la pagina para hacer login 
get '/login' do
  if session[:id]
    redirect '/user'
  else
    @variable="Inicia Sesion"
    erb :login
  end
end
#Manda a la pagina para registrarse
get '/reg' do
  if session[:id]
    redirect '/user'
  else
    @variable="Registrate"
    erb :login
  end
end
#Intenta hacer login y mandarlo a su perfil
post'/login' do
   if session[:id]
    redirect '/user'
  else
    user = User.authenticate(params[:email],params[:password])
    go_user(user)
  end
end
#Intenta registrar al usuario y lo manda a su perfil
post '/reg' do 
  if User.create(name:params[:name],email:params[:email],password:params[:password]).valid?
    redirect '/login'
  else
    @error="Error en el registro"
    erb :error
  end
end
#manda a un usuario a su sesión
get '/user'do 
  if session[:id]
    @name = session[:name].upcase
    @urls=urls(session[:id].to_i)
    erb :user
  else
    @error="No hay una sesión activa"
    erb :error
  end
end
#metodo de logout
get '/logout' do
  session.clear
  redirect '/'
end
#metodo para iniciar sesión
def go_user(user)
  if user != nil
    session[:id] ||= user.id
    session[:name] ||= user.name
    session[:email] ||= user.email
    redirect "/user?#{user.name.upcase}"
  else
    @error="El email o la contraseña son incorrectos"
    erb :error
  end
end
#================================
#==Termina Control de sesiones ==
#================================