class CreateUsersSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :users_skills do |t|
      t.references :skills
      t.references :users

      t.timestamps
    end
  end
end
