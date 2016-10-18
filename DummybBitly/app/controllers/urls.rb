#=========================
#===== Control Urls ======
#=========================
#metodo que guarda el url y da un short url
post '/urls' do
  if Url.create!(long_url:params[:long_url]).valid?
    url = Url.last
    session[:short] = "short/" + url.short_url
    if session[:id]
      url.user_id = session[:id].to_i
      url.save 
      redirect '/user'  
    else
      redirect '/'
    end
  else
    @error = "Ocurrió un ERROR, verifica que el URL se valido"
    erb :error
  end
end
#metodo que envia al parametro que se manada
get '/short/:short_url' do
  url = Url.find_by(short_url: params[:short_url])
  if url 
    redirect to (url.get_long_url)
  else
    @error="La pagina no existe"
    erb :error
  end
end
#metodo que hace un arreglo con los short url y el count click
def urls(this_id)
  id = Url.pluck(:user_id)
  short = Url.pluck(:short_url)
  click = Url.pluck(:click_count)
  urls = []
  i = 0
  id.each do |this|
  urls << ["short/"+short[i],click[i]] if this == this_id
    i+=1
  end
  urls
end

#=========================
#==Termina Control Urls ==
#=========================





