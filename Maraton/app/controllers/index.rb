enable :sessions
#===========================
#== Controlador Principal ==
#===========================
get '/' do
  session.clear
  erb :index
end

#===========================
#== Controlador Principal ==
#===========================
