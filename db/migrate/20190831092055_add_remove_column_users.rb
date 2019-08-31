class AddRemoveColumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthdate_year,  :integer , null: false
    add_column :users, :birthdate_month, :integer , null: false
    add_column :users, :birthdate_day ,  :integer , null: false
    add_column :users, :phone_number ,   :integer , null: false , unique: true
    
    remove_column :users, :name,      :string
    remove_column :users, :birthdate, :string

  end
end
