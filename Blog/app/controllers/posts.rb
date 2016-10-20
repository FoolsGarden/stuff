#==========================
#== Controlador De Posts ==
#==========================

# Crear un post nuevo
post '/make/post' do
  p post = Post.create(title:params[:title],body:params[:post])
  p "="*100
  p params
  if post
    params[:tags].each do |x,y|
      if y != ''
        tag = Tag.find_or_create_by(name: "#{y}") 
        Relation.create(post_id: post.id, tag_id: tag.id)
      end
    end
    post_tag = post.tags
    los_tags = ""
    post_tag.each do |tag|
      los_tags << "#{tag.name}, "
    end
    "To post: '#{post.title}' fue creado correctamente\n Y tus tags fueorn: #{los_tags.chomp} "
  else
    "Error al crear el post"
  end
end

# Mostrar todos los posts.
post '/all/posts' do
  @titles = Post.pluck(:title)
  @bodys = Post.pluck(:body)
  erb :allposts, layout: false
end
# Mostrar un post determinado.
# Editar un post existente.
# Eliminar un post existente.

#==========================
#== Controlador De Posts ==
#==========================

















