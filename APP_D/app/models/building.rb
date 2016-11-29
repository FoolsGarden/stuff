class Building < ActiveRecord::Base
  has_many :houses
  # Remember to create a migration!
end
