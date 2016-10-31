class Relation < ActiveRecord::Base
    belongs_to :user
    belongs_to :round
  # Remember to create a migration!
end
