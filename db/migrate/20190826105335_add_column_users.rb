class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :image, :string, null: false, unique: true
    add_column :users, :nickname, :string, null: false
    add_column :users, :birthdate, :string, null: false
    add_column :users, :profile, :text
  end
end
