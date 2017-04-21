class CreateUsersSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :users_skills do |t|
      t.references :skill
      t.references :user

      t.timestamps
    end
  end
end
