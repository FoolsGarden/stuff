get '/' do
  @abuelita = abuelita(params[:abuelita]) if params[:abuelita]
  erb :index
  # Visita app/views/index.erb
end

post '/abuelita' do
  user_input=params[:user_input]

  if request.xhr?
  # respond to Ajax request
    abuelita(user_input)
  else
  # respond to normal request
    redirect to("/?abuelita=#{user_input}")
  end
end

def abuelita(texto)
  if  texto=="BYE TQM"
    "BYE"
  elsif texto==texto.upcase
    'NO, NO DESDE 1983'
  else
    'HUH?! NO TE ESCUCHO, HIJO!'
  end
end

