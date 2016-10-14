get '/' do
  @abuelita = params[:abuelita]
  erb :index
  # Visita app/views/index.erb
end

post '/aux' do
  p "entre a post aux"
end

post '/abuelita' do
  user_input=params[:user_input]
  if request.xhr?
  # respond to Ajax request
    p "ajax request"
    if  user_input=="BYE TQM"
      return ""
    elsif user_input==user_input.upcase
      return "Tu Abuelita dice: NO, NO DESDE 1983"
    else
      return "Tu Abuelita dice: HUH?! NO TE ESCUCHO, HIJO!"
    end
  else
  # respond to normal request
    if  user_input=="BYE TQM"
      redirect to("/")
    elsif user_input==user_input.upcase
      redirect to('/?abuelita= NO, NO DESDE 1983')
    else
      redirect to("/?abuelita= HUH?! NO TE ESCUCHO, HIJO!")
    end
  end
end

