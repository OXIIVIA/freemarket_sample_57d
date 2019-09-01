class AddColumnToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :address_last_name, :string , null: false
    add_column :addresses, :address_first_name, :string , null: false
    add_column :addresses, :address_last_name_kana,  :string , null: false
    add_column :addresses, :address_first_name_kana, :string , null: false
    add_column :addresses, :address_number,       :string , null: false
    add_column :addresses, :address_prefecture,   :integer , null: false, default: 0
    add_column :addresses, :address_city,         :string , null: false
    add_column :addresses, :address_block,        :string , null: false
    add_column :addresses, :address_building,     :string 
    add_column :addresses, :address_phone_number, :integer
  end
end
