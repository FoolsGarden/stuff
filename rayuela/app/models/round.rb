class Round < ActiveRecord::Base
  has_many :relations
  has_many :users, through: :relations
  # Remember to create a migration!
end
