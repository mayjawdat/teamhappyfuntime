class Appointment < ApplicationRecord
  # belongs_to  :student, class_name: 'User'
  belongs_to  :mentor, class_name: 'User'

  def display?
    !self.cancelled
  end

  def completed?
    self.end_time < DateTime.now
  end
end
