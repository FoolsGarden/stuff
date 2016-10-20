require 'uri'
get '/' do
erb :index
end

post '/urls' do
  if params
    Url.create!(long_url:params[:long_url])
    long = Url.pluck(:long_url)
    short = Url.pluck(:short_url)
    count = Url.pluck(:click_count)
    @urls = []
    i = 0
    long.each do |url|  
      aux = URI(url)
      @urls << [aux.host, short[i], count[i]]
      i += 1
    end
    @bu=true
  end
    erb :index
end

post '/short_url' do
  if params
    p params[:short_url]
    url = Url.find_by(short_url: params[:short_url])
    redirect to (url.get_long_url)
  else
    erb :index
  end
end

