class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.boolean :postage, :boolean, null: false
      t.integer :price, null: false
      t.string :condition, null: false
      t.string :size, null: false
      t.integer :group_id, null: false,foreign_key: true
      t.integer :saler_id, null: false,foreign_key: true
      t.integer :buyer_id, null: false,foreign_key: true
      t.integer :brand_id, null: false,foreign_key: true
      t.timestamps
    end
  end
end
