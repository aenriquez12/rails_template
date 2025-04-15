class User < ApplicationRecord
  has_secure_password
  
  validates :email_address, presence: true, uniqueness: true
  validates :password, presence: true
end
