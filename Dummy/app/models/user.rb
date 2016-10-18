class User < ActiveRecord::Base
  validates :email, :format => { :with => /\A[^@]+@([^@\.]+\.)+[^@\.]{2,}\z/,:message => "email like ejemplo@mail.com" }
  validates :email, uniqueness: true
  # Remember to create a migration!
  # ej. User.authenticate('fernando@codea.mx', 'qwerty')
  def self.authenticate(email, password)
    if self.exists?(email:email)
      user = self.find_by(email: email)
      if password == user.password
        p "*" * 50
        user
      else
        nil
      end
    end
    # si el email y el password corresponden a un usuario valido, regresa el usuario
    # de otra manera regresa nil
  end

end
