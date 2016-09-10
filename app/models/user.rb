class User < ActiveRecord::Base
  has_secure_password

  validates :password, presence: true
  validates :username, presence: true
  validates :email_address, presence: true
end
