class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name,          null: false
      t.integer :postage,       null: false
      t.integer :price,         null: false
      t.text    :description,   null: false
      t.string  :status,        null: false
      t.string  :shipping_date, null: false
      t.references :address,    foreign_key: true
      t.references :category,   foreign_key: true

      t.timestamps
    end
  end
end
