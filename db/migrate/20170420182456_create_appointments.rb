class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.datetime  :start_time
      t.datetime  :end_time
      t.references  :student, class_name: 'User'
      t.references  :mentor, class_name: 'User'
      t.text  :feedback_on_mentor
      t.text  :feedback_on_student
      t.integer :rating_on_mentor
      t.integer :rating_on_student
      t.boolean :cancelled

      t.timestamps
    end
  end
end
