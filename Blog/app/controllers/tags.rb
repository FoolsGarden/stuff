#=========================
#== Controlador De Tags ==
#=========================

#Mostrar todos los posts con cierto Tag.
post '/all/tags' do
  p @tags = Tag.all
  erb :findtags, layout: false
end
get '/tag/find/post/:id' do
  @tag = Tag.find(params[:id])
  @posts = @tag.posts
  erb :findtags
end

#=========================
#== Controlador De Tags ==
#=========================