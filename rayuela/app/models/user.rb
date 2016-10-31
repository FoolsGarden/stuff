class User < ActiveRecord::Base
  has_many :relations
  has_many :rounds, through: :relations
  validates :name, uniqueness: true
  # Remember to create a migration!
end
