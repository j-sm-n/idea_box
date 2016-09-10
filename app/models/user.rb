class User < ActiveRecord::Base
  has_secure_password

  validates :password, presence: true
  validates :username, presence: true,
                       uniqueness: true
  validates :email_address, presence: true

  has_many :ideas 

  enum role: %w(default admin)
end
