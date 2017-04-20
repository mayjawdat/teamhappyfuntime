class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :full_name, null: false
      t.string :password_digest, null: false
      t.string :phone
      t.string :email
      t.boolean :is_mentor, null: false, default: false

      t.timestamps(null: false)
    end
  end
end
