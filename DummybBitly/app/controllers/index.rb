#===============================
#====== Control principal ======
#===============================
enable :sessions
require_relative 'urls.rb'
require_relative 'sesiones.rb'
#Manda a la pagina principal
#Manda a la pagina de usuario si hay sesión activa
get '/' do
  if session[:id]
    redirect '/user'
  else
    @short = session[:short] if session[:short]
    erb :index
  end
end
#Manda a la pagina principal sin mostrar nada en el url
post '/'do 
  if session[:id]
    redirect '/user'
  else
    erb :index
  end
end

#===============================
#== Termian Control Principal ==
#===============================




































