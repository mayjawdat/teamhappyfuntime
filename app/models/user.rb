class User < ApplicationRecord
  has_secure_password
  validates :username, :full_name, :password_digest,  presence: true

end
