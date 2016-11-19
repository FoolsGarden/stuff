class TwitterUser < ActiveRecord::Base
  has_many :tweets
  # def update?
  #   twDB = self.tweets.first.body
  #   twWEB = CLIENT.get_all_tweets(self.name).first.text
  #   twDB == twWEB
  # end
  # Remember to create a migration!
end
