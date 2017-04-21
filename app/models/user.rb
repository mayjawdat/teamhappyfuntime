class User < ApplicationRecord
  has_secure_password
  validates :username, :full_name, :password_digest,  presence: true
  validates :is_mentor, inclusion: [true, false]

end
