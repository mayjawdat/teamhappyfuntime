class User < ApplicationRecord
  has_secure_password
  validates :username, :full_name, :password_digest,  presence: true
  validates :is_mentor, inclusion: [true, false]
  validates :phone, presence: true, unless: ->(user){user.email.present?}
  validates :email, presence: true, unless: ->(user){user.phone.present?}
  
  has_many :users_skills
  has_many :skills, through: :users_skills

end
