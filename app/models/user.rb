class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
