class Url < ActiveRecord::Base
  @@url = "00"
  include ActiveModel::Validations
  before_create :create_short_url
  before_create :count
  validates :long_url, uniqueness: true
  validate :Good_url

  def create_short_url
    self.short_url = @@url + ('a'..'z').to_a.shuffle[0..2].join("")
  end

  def get_long_url
    self.click_count += 1
    self.save
    self.long_url 
  end

  def count
    self.click_count = 0
  end

  def Good_url
    if !long_url.match('http://')  && !long_url.match('https://')
      errors.add(:long_url,"invalid url") 
    end
  end
end
