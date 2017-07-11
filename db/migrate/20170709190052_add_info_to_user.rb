class AddInfoToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :photo, :string
    add_column :users, :tel, :string
  end
end
