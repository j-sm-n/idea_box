class User < ActiveRecord::Base
  has_secure_password

  validates :password, presence: true
  validates :username, presence: true,
                       uniqueness: true
  validates :email_address, presence: true

  enum role: %w(default admin)
end
