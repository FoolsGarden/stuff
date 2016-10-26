enable :sessions
#===========================
#== Controlador Deck ==
#===========================

post '/deck' do
  if session[:deck_id]
    @round = Round.find(session[:round_id])
    user = User.find(session[:user_id])
    user.one_round
    user.score(@round.right,@round.wrong)
    deck = nil
    params.each{|x,y| deck = x.to_i}
    session[:deck_id] = deck
    @deck = Deck.find(deck)
    @question = Question.give_question(@deck.id)
    session[:question_id] = @question.id
    @round=Round.create(user:session[:user_id],deck:@deck.id,right:0,wrong:0)
    session[:round_id] = @round.id
  else
    deck = nil
    params.each{|x,y| deck = x.to_i}
    session[:deck_id] = deck
    @deck = Deck.find(deck)
    @question = Question.give_question(@deck.id)
    session[:question_id] = @question.id
    @round=Round.create(user:session[:user_id],deck:@deck.id,right:0,wrong:0)
    session[:round_id] = @round.id
  end
  return erb :preg, layout: false
end

post '/next/question' do
  @round = Round.find(session[:round_id])
  if @round.finish?
    @deck = Deck.find(session[:deck_id])
    @question = Question.give_question(@deck.id)
    session[:question_id] = @question.id
    return erb :preg, layout: false
  else
    user = User.find(session[:user_id])
    user.one_round
    user.score(@round.right,@round.wrong)
    return erb :stad, layout: false
  end
end

post '/restart/game' do
  @deck = Deck.find(session[:deck_id])
  @question = Question.give_question(@deck.id)
  @round=Round.create(user:session[:user_id],deck:@deck.id,right:0,wrong:0)
  session[:round_id] = @round.id
 return erb :preg, layout: false
end

post '/right/question' do
  resp=""
  params.each do |x,y|
    resp = x
  end
  @round = Round.find(session[:round_id])
  if resp == Question.find(session[:question_id]).respuesta
    @round.one_right
    return "Correcto"
  else
    @round.one_wrong
    return nil
  end
end
#===========================
#== Controlador Deck ==
#===========================