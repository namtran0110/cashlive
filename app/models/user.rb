class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :password_digest
  validates :username, uniqueness: true

end
