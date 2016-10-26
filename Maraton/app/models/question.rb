class Question < ActiveRecord::Base
  # Remember to create a migration!
  def self.give_question(deck)
    question = Question.where(deck:deck)
    question.sample
  end
end
