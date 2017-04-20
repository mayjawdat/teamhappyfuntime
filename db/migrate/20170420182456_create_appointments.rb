class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.datetime  :start_time, null: false
      t.datetime  :end_time, null: false
      t.references  :student, class_name: 'User'
      t.references  :mentor, class_name: 'User'
      t.text  :feedback_on_mentor
      t.text  :feedback_on_student
      t.integer :rating_on_mentor
      t.integer :rating_on_student
      t.boolean :cancelled

      t.timestamps(null: false)
    end
  end
end
