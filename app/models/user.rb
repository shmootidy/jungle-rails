class User < ActiveRecord::Base

  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :first_name, :last_name, presence: true
  validates :password, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email)

    if user.authenticate(password)
      user
    else
      nil
    end
  end

end
