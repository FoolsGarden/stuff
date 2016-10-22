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
    return erb :makepost, layout: false
  else
    return nil
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
    post = Post.find(params[:post_id])
    data ="<div class='panel panel-primary'>
            <div class='panel-heading'>
              <h3 class='panel-title'>
                #{post.title}
              <h3>
            </div>
            <div class='panel-body'>
              #{post.body}
            </div>
          </div>"
  else
    data = "Ocurró un error"
  end
  return data
end
# Editar un post existente.
post '/post/edit' do
  id=nil
  params.each{|x,y| id = x}
  if id
    @post = Post.find(id.to_i)
    data = erb :editpost, layout: false            
  else
    data="Error"
  end
  return data
end
post '/post/edit/confirm' do
  post=Post.find(params[:id])
  if post
    post.update(title:params[:title],body:params[:post])
  end
  @posts = Post.all
  erb :allposts, layout: false
end
# Eliminar un post existente.
post '/post/delete' do
  id=nil
  params.each{|x,y| id = x}
  if id
    if Post.exists?(id)
       Post.destroy(id)
    end
  end
  @posts = Post.all
  erb :allposts, layout: false
end

post '/post/delete/:id' do
  
end

#==========================
#== Controlador De Posts ==
#==========================

















