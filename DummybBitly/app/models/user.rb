class User < ActiveRecord::Base
  validates :email, :format => { :with => /\A[^@]+@([^@\.]+\.)+[^@\.]{2,}\z/,:message => "email like ejemplo@mail.com" }
  validates :email, uniqueness: true
  # Remember to create a migration!
  # ej. User.authenticate('fernando@codea.mx', 'qwerty')
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

end
