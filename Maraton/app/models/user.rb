class User < ActiveRecord::Base
  validates :email, uniqueness: true

  def self.authenticate(email, password)
    if self.exists?(email:email)
      user = self.find_by(email: email)
      if password == user.password
        user
      else
        nil
      end
    end
  end
  def one_round
    self.total_rounds+=1
    self.save
  end
  def score(right,wrong)
    self.total_score = right - wrong
    self.save
  end

end
