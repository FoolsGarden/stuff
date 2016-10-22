#=========================
#== Controlador De Tags ==
#=========================

#Mostrar todos los posts con cierto Tag.
post '/all/tags' do
  p @tags = Tag.all
  erb :findtags, layout: false
end
post '/tag/find/post' do
  id=nil
  params.each{|x,y| id = x}
  if id
    tag = Tag.find(id.to_i)
    posts = tag.posts
    data=""
    posts.each do |x|
      data << "<div class='panel panel-primary'>
                <div class='panel-heading'>
                  <h3 class='panel-title'>
                      #{x.title}
                  <h3>
                </div>
                <div class='panel-body'>
                  #{x.body}
                </div>
              </div>"
    end
    return data
  else
    return "Lo sentimos, ocurrió un error"
  end
end

#=========================
#== Controlador De Tags ==
#=========================