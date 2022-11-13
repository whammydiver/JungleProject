class User < ApplicationRecord

  has_secure_password

  PASSWORD_REQUIREMENTS = /\A 
    (?=.{8,})
    (?=.*\d)
    (?=.*[a-z])
    (?=.*[A-Z])
  /x

  validates :password, format: PASSWORD_REQUIREMENTS
  validates_uniqueness_of :email

  def self.authenticate_with_credentials(email, password)
    @user = User.where(email: email).first
    if password = BCrypt::Password.new(@user.password_digest)
      return @user
    else
      nil
    end
  end

end
