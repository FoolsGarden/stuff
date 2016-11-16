get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  @comments = Comment.all
  erb :index
end

post '/save/comment' do
  comment = Comment.create(body:params[:comment_text],author:params[:comment_author])
  if comment
   return "Comment successfully saved"
  else
    return nil
  end
end