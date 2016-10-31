enable :sessions

get '/' do
  erb :index
end

post '/user' do
  @pl1 = User.find_by(name: params[:Player1])
  @pl2 = User.find_by(name: params[:Player2])
  unless @pl1
    @pl1 = User.create(name: params[:Player1])
  end
  unless @pl2
    @pl2 = User.create(name: params[:Player2])
  end
  session[:p1_id] = @pl1.id
  session[:p2_id] = @pl2.id
  session[:round] = 1
  @score = [0,0]
  session[:score]=@score
  erb :game , layout: false
end

post '/next/game' do
  @pl1 = User.find(session[:p1_id])
  @pl2 = User.find(session[:p2_id])
  winner = 0
  params.each{|x,y| winner=x.to_i}
  if winner == 1
    winner = session[:p1_id]
    session[:score][0]+=1
  elsif winner == 2 
    winner = session[:p2_id]
    session[:score][1]+=1
  end
  @score = session[:score]
  round = Round.create(ronda:session[:p2_id],winner:winner)
  if round
    Relation.create(user_id:@pl1.id,round_id:round.id)
    Relation.create(user_id:@pl2.id,round_id:round.id)
  end
  
  erb :game , layout: false
end