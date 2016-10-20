class Post < ActiveRecord::Base
  has_many :relations
  has_many :tags, through: :relations
  validates :body, :presence => true
  validates :title, :presence => true
  # Remember to create a migration!
end
