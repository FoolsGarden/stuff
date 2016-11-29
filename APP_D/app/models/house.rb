class House < ActiveRecord::Base
  belongs_to :building
  # Remember to create a migration!
end
