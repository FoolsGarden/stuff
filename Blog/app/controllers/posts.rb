#==========================
#== Controlador De Posts ==
#==========================

# Crear un post nuevo
post '/make/post' do
  post = Post.create(title:params[:title],body:params[:post])
  if post
    params[:tags].each do |x,y|
      if y != ''
        tag = Tag.find_or_create_by(name: "#{y}") 
        Relation.create(post_id: post.id, tag_id: tag.id)
      end
    end
    return true
  else
    return false
  end
end

# Mostrar todos los posts.
post '/all/posts' do
  @posts = Post.all
  erb :allposts, layout: false
end

# Mostrar un post determinado.
post '/find/post' do
  if Post.exists?(params[:post_id])
    @post = Post.find(params[:post_id])
  end
  erb :findpost, layout: false
end
# Editar un post existente.
get '/post/edit/:id' do
  @post=Post.find(params[:id])
  erb :editpost
end
post '/post/edit/:id' do
  post=Post.find(params[:id])
  if post
    post.update(title:params[:title],body:params[:post])
    "Edición correcta de #{post.title}"
  else
    "Algo occurío mal"
  end
end
# Eliminar un post existente.
get '/post/delete/:id' do
  @post=Post.find(params[:id])
  erb :deletepost
end
post '/post/delete/:id' do
  if Post.exists?(params[:id])
    Post.destroy(params[:id])
    "El post fue eliminado"
  else
    "Algo occurío mal"
  end
end

#==========================
#== Controlador De Posts ==
#==========================

















