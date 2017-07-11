class CreateUsersSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :users_skills do |t|
      t.integer :user_id
      t.integer :skill_id

      t.timestamps
    end
  end
end
