class CreatePersonals < ActiveRecord::Migration[5.2]
  def change
    create_table :personals do |t|
      t.string  :p_address_number
      t.integer :p_address_prefecture,  default: 0
      t.string  :p_address_city
      t.string  :p_address_block
      t.string  :p_address_building

      t.timestamps null: false
    end
  end
end
