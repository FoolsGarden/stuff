get '/' do
  erb :index
end

get '/:new_word' do

end

post '/new_word' do
  # redirect to ("/#{params[:user_word]}")
  @new_word = params[:user_word].upcase
  @resp=Word.anagrams(params[:user_word].chomp.downcase.split("").sort.join(""),params[:user_word])
  erb :word
end