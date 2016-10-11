get '/' do
  @abuelita = params[:abuelita]
  erb :index
  # Visita app/views/index.erb
end

post '/abuelita' do
  @abuelita = params[:user_input]
  if  user_input=="BYE TQM"
    redirect to("/?abuelita= NO, NO DESDE 1983")
  elsif user_input==user_input.upcase
    redirect to('/')
  else
    redirect to("/?abuelita= HUH?! NO TE ESCUCHO, HIJO!")
  end
end

