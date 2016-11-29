#===========================
#== Controlador Principal ==
#===========================
get '/' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    erb :index
  else
   erb :login 
  end
end

post "/login" do
  @user = User.find_by(email:params[:email])
  if @user
    if params[:password] == @user.password
      session[:user_id] = @user.id
      redirect to "/"
    else
      redirect to "/error/la contraseña es incorrecta"
    end
  else
    redirect to "/error/el usuario no existe"
  end 
end

get "/error/:error" do
"<h1>Ocurrió un error</h1>
<h3>Probablemente: #{params[:error]}</h3>"

end
get "/logout" do 
  session.clear
  redirect to "/"
end

#===========================
#== Controlador Principal ==
#===========================