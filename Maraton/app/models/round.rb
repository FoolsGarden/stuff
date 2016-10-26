class Round < ActiveRecord::Base
  def finish?
    if self.right + self.wrong < 5
      return true
    else
      return false
    end
  end
  def one_right
    self.right+=1
    self.save!
  end
  def one_wrong
    self.wrong+=1
    self.save!
  end
  # Remember to create a migration!
end
