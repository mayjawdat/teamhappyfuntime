class Appointment < ApplicationRecord
  belongs_to  :student
  belongs_to  :mentor
end
